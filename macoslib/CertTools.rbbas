#tag Module
Protected Module CertTools
	#tag Method, Flags = &h1
		Protected Function DeviceGUID() As String
		  // The Mac's GUID is the MAC address from network interface "en0", see https://developer.apple.com/devcenter/mac/documents/validating.html
		  
		  #if true
		    // This version uses the CoreFoundation and IOKit classes from https://github.com/macoslib/macoslib
		    dim mac as String
		    mac = PrimaryMACAddress
		    dim bytes() as String = mac.Split(":")
		    if bytes.Ubound = 5 then
		      return HexBytesToData (bytes)
		    end if
		  #elseif true
		    // Use this code if you do use the MBS plugins
		    dim mac as String = SystemInformationMBS.MACAddressString
		    dim bytes() as String = mac.Split(":")
		    if bytes.Ubound = 5 then
		      return HexBytesToData (bytes)
		    end if
		  #elseif TargetMacOS
		    // Use this code if you do NOT use the MBS plugins nor the CoreFoundation and IOKit classes
		    dim sh as new Shell
		    sh.Execute "/sbin/ifconfig en0"
		    dim s as String
		    s = sh.Result
		    dim lines() as String
		    lines = ReplaceLineEndings(s,chr(13)).Split(chr(13))
		    for each line as String in lines
		      dim p as Integer
		      line = line.Trim
		      p = line.InStr("ether ")
		      if p = 1 then
		        dim mac as String = line.NthField(" ",2)
		        dim bytes() as String = mac.Split(":")
		        if bytes.Ubound = 5 then
		          return HexBytesToData (bytes)
		        end if
		      end if
		    next
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HexBytesToData(bytes() as String) As MemoryBlock
		  dim mb as new MemoryBlock(6)
		  for i as Integer = 0 to 5
		    mb.Byte(i) = Val("&h"+bytes(i))
		  next
		  return mb
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsValid(guid as String, receipt as Dictionary, bundleID as String) As Boolean
		  // Returns true if the given receipt (which comes from 'ReadReceipt') is valid
		  // for the given GUID (which is a unique code for a particular machine)
		  
		  #if TargetMacOS
		    declare sub SHA1 lib "/usr/lib/libcrypto.dylib" (d as Ptr, n as Int32, md as Ptr)
		    
		    if receipt <> nil then
		      dim input as MemoryBlock
		      input = guid + receipt.Value(Keys.kReceiptOpaqueValue) + receipt.Value(Keys.kReceiptBundleIdentiferData)
		      dim hash as new MemoryBlock(20) ' SHA_DIGEST_LENGTH
		      SHA1 (input, input.Size, hash)
		      dim hashFromReceipt as String = receipt.Value(Keys.kReceiptHash)
		      if StrComp (hash, hashFromReceipt, 0) = 0 then
		        return receipt.Value(Keys.kReceiptBundleIdentifer) = bundleID
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadReceipt(certFile as FolderItem) As Dictionary
		  // This function reads certain entries from the App's certification receipt file
		  
		  #if TargetMacOS
		    declare function d2i_PKCS7_fp lib "/usr/lib/libcrypto.dylib" (fp as Int32, p7 as Ptr) as Ptr
		    declare sub PKCS7_free lib "/usr/lib/libcrypto.dylib" (p7 as Ptr)
		    declare function OBJ_obj2nid lib "/usr/lib/libcrypto.dylib" (ASN1_OBJECT as Ptr) as Int32
		    declare function ASN1_get_object lib "/usr/lib/libcrypto.dylib" (ByRef pp as Ptr, ByRef plength as Int32, ByRef ptag as Int32, ByRef pclass as Int32, omax as Int32) as Int32
		    
		    dim result as Dictionary
		    
		    if certFile = nil then return nil
		    dim bs as BinaryStream
		    try
		      bs = BinaryStream.Open(certFile)
		    catch exc as RuntimeException
		      return nil
		    end
		    dim fp as Int32 = bs.Handle(BinaryStream.HandleTypeFilePointer)
		    if fp = 0 then return nil
		    dim p7 as Ptr = d2i_PKCS7_fp (fp, nil)
		    bs.Close
		    bs = nil
		    if p7 = nil then return nil
		    
		    // is it signed?
		    dim nid as Int32 = OBJ_obj2nid (p7.PKCS7.type)
		    if nid <> 22 then goto bail1
		    
		    // is data?
		    nid = OBJ_obj2nid (p7.PKCS7.d.PKCS7_SIGNED.contents.PKCS7.type)
		    if nid <> 21 then goto bail1
		    
		    dim octets as Ptr = p7.PKCS7.d.PKCS7_SIGNED.contents.PKCS7.d
		    dim p, e as Ptr
		    p = octets.ASN1_STRING.data
		    dim l as Integer = octets.ASN1_STRING.length
		    e = p + Ptr(l)
		    
		    dim res, type, xclass, length as Integer
		    
		    res = ASN1_get_object(p, length, type, xclass, e - p)
		    if type <> 17 then goto bail1 ' V_ASN1_SET
		    
		    result = new Dictionary
		    while p < e
		      call ASN1_get_object (p, length, type, xclass, e - p)
		      if type <> 16 then
		        exit ' V_ASN1_SEQUENCE
		      end
		      
		      dim seq_end as Ptr = p + Ptr(length)
		      
		      dim attr_type, attr_version as Integer
		      
		      // Attribute type
		      call ASN1_get_object (p, length, type, xclass, seq_end - p)
		      if type = 2 and length = 1 then ' V_ASN1_INTEGER
		        attr_type = p.Byte(0)
		      end
		      p = p + Ptr(length)
		      
		      // Attribute version
		      call ASN1_get_object (p, length, type, xclass, seq_end - p)
		      if type = 2 and length = 1 then ' V_ASN1_INTEGER
		        attr_version = p.Byte(0)
		      end
		      p = p + Ptr(length)
		      
		      // Only parse attributes we're interested in
		      if ATTRS(attr_type) > ATTRS.ATTR_START and ATTRS(attr_type) < ATTRS.ATTR_END then
		        dim key as Keys
		        
		        call ASN1_get_object (p, length, type, xclass, seq_end - p)
		        if type = 4 then ' V_ASN1_OCTET_STRING
		          // Bytes
		          if ATTRS(attr_type) = ATTRS.BUNDLE_ID or ATTRS(attr_type) = ATTRS.OPAQUE_VALUE or ATTRS(attr_type) = ATTRS.HASH then
		            select case ATTRS(attr_type)
		            case ATTRS.BUNDLE_ID
		              // This is included for hash generation
		              key = Keys.kReceiptBundleIdentiferData
		            case ATTRS.OPAQUE_VALUE
		              key = Keys.kReceiptOpaqueValue
		            case ATTRS.HASH
		              key = Keys.kReceiptHash
		            end select
		            dim mb as MemoryBlock = p
		            result.Value(key) = mb.StringValue(0, length)
		          end
		          
		          // Strings
		          if ATTRS(attr_type) = ATTRS.BUNDLE_ID or ATTRS(attr_type) = ATTRS.VERSION then
		            dim str_type, str_length as Integer
		            dim str_p as Ptr = p
		            call ASN1_get_object (str_p, str_length, str_type, xclass, seq_end - str_p)
		            if str_type = 12 then ' V_ASN1_UTF8STRING
		              dim mb as MemoryBlock = str_p
		              dim s as String = mb.StringValue(0,str_length).DefineEncoding(Encodings.UTF8)
		              select case ATTRS(attr_type)
		              case ATTRS.BUNDLE_ID
		                key = Keys.kReceiptBundleIdentifer
		              case ATTRS.VERSION
		                key = Keys.kReceiptVersion
		              end select
		              result.Value(key) = s
		            end
		          end
		        end
		        p = p + Ptr(length)
		        
		      end if
		      
		      // Skip any remaining fields in this SEQUENCE
		      while p < seq_end
		        call ASN1_get_object (p, length, type, xclass, seq_end - p)
		        p = p + Ptr(length)
		      wend
		      
		    wend
		    
		    bail1:
		    PKCS7_free (p7)
		    
		    return result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SelfTest()
		  // Call this function just to test whether the verification code works in general
		  
		  #if TargetMacOS
		    dim f as FolderItem
		    f = SpecialFolder.Temporary.Child("selftest-data")
		    BinaryStream.Create(f,true).Write(DecodeBase64(SampleReceipt))
		    dim d as Dictionary
		    d = ReadReceipt(f)
		    f.Delete
		    
		    if d = nil then raise new RuntimeException // selftest failed
		    
		    dim guid as String
		    
		    guid = DeviceGUID
		    if guid = "" then
		      MsgBox "Oops - no DeviceGUID on this computer?"
		    end if
		    
		    guid = HexBytesToData (Array("00", "17", "f2", "c4", "bc", "c0"))
		    
		    if not IsValid (guid, d, "com.example.sampleApp") then
		      raise new RuntimeException // selftest failed
		    end
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This module contains methods that help checking a receipt file
		as it's used with applications delivered by Apple's App Store.
		
		Original (i.e. up-to-date) sources are located here:
		  https://github.com/macoslib/macoslib
		
		Written by Thomas Tempelmann, 31 Oct 2010
		Last update: 25 Nov 2012 (Usage note updated to use AppStoreReceiptDirectory function on 10.7 and later)
	#tag EndNote

	#tag Note, Name = Usage
		SelfTest:
		
		  You may call CertTools.SelfTest from your App.Open event (or anywhere
		  else) in order to check if the code works right.
		
		IsValid:
		
		  Call CertTools.IsValid, passing the results from CertTools.DeviceGUID
		  and CertTools.ReadReceipt to it. If it returns false, this means that the
		  app was not certified to run on this particular computer (App Store apps
		  are certified per machine). In order to tell Mac OS X about this fact,
		  exit the app with the exit code 173, which should then lead to the user
		  being asked to re-certify this app for this computer (which will probably
		  ask the user for his iTunes login, then checking if he has purchased the
		  app from the store and thus is a valid user)
		
		ReadReceipt:
		
		  Pass the location of the receipt file, which gets stored (by the App Store
		  delivery code) inside your app in "Contents/_MASReceipt/".
		
		Example:
		
		  dim f as FolderItem
		  if IsLion then
		    f = NSBundle.MainBundle.AppStoreReceiptDirectory()
		  else
		    f = App.ExecutableFile.Parent.Parent // "Contents" folder
		    f = f.Child("_MASReceipt").Child("receipt") // this is where the App Store puts the receipt when "buying" an app
		  end
		  if not CertTools.IsValid (CertTools.DeviceGUID, CertTools.ReadReceipt(f), "put the App's Application Identifier here") then
		    declare sub exit_ lib "System" alias "exit" (code as Integer)
		    exit_ (173)
		  end
		
		Tips:
		
		  Be aware that a cracker might attempt to disable your checking code so that
		  he can make your app run on any computer, then distribute either the cracking
		  code or your app thru other channels.
		
		  In general, a good cracker will find ways to accomplish this, and you can't do
		  anything about it. So better accept this possibility right now.
		
		  However, here are some hints as to how to make it not too easy for a casual or
		  lazy cracker:
		
		  • Rename the module and its functions, possibly to names that do not hint at
		  their purpose. That makes it harder for a cracker to even find the functions
		  he needs to patch. (Note: the method and module names may appear in the
		  generated code, while local variables don't, so do not bother renaming the
		  variables - but to be sure better look at the generated code, e.g. with the "nm"
		  command line too.)
		
		  • In a similar way, avoid having the code that decides to exit the app be very close
		  to the call that calls IsValid. Instead, call the various functions in different places
		  so that a cracker has a hard time to find the place where the actual test of the receipt
		  takes place. For instance, he might start looking at the code that calls the exit
		  function, so make sure that's not the only place where an invalid receipt is acted
		  upon. Better to modify some other globals in your app after calling IsValid, and
		  use some effect of these globals later to decide whether to exit the app. That way,
		  the cracker can find the exit call, but that's long after your app has already gotten
		  into a state where it won't function any more. So the cracker would have to do a lot
		  of backtracing to find the code that actually makes the receipt check and decision
		  thereupon.
	#tag EndNote


	#tag Constant, Name = SampleReceipt, Type = String, Dynamic = False, Default = \"MIIOBQYJKoZIhvcNAQcCoIIN9jCCDfICAQExCzAJBgUrDgMCGgUAMIIBogYJKoZIhvcNAQcBoIIB\rkwSCAY8xggGLMAsCAQ4CAQEEAwIBATAMAgEKAgEBBAQWAjQrMAwCAQ0CAQEEBAICJxAwDQIBAQIB\rAQQFAgMS1ocwDgIBBAIBAQQGAgQAvGFOMA4CAQkCAQEEBgIEUTAwMjAOAgELAgEBBAYCBAU5f7Ew\rDwIBAwIBAQQHDAUxLjAuMjAcAgEFAgEBBBSt47vV2YqpqYj/QjKH9l+RMo2mWDAeAgEIAgEBBBYW\rFDIwMTAtMTAtMDdUMDM6NTc6MzVaMB4CAQwCAQEEFhYUMjAxMC0xMC0yMFQwMDo0OTowMlowHwIB\rAgIBAQQXDBVjb20uZXhhbXBsZS5TYW1wbGVBcHAwRQIBBwIBAQQ9meEu6yrksmfyITiofOrnivVP\rngMnOTSyzSHt8FZefsDD/RabEw5qY7JK8QvheidogEWA8+cRYtMwmsCGLTBKAgEGAgEBBEKEyS4P\rdjBT+E7IgQ3f8dhUKOk2B5AjdOMaD0oFBZA2NLAcjoI3UGUuY29t0HYYJxjvIoX0o38/tAwOQdos\rWVt/+NCgggsBMIICyTCCAjKgAwIBAgINMzOvEBAUrwABrwAAATANBgkqhkiG9w0BAQUFADB7MQsw\rCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNh\rdGlvbiBBdXRob3JpdHkxLzAtBgNVBAMTJkFwcGxlIEZhaXJQbGF5IENlcnRpZmljYXRpb24gQXV0\raG9yaXR5MB4XDTEwMTAxNDAwMDMxN1oXDTE1MTAxMzAwMDMxN1owbDELMAkGA1UEBhMCVVMxEzAR\rBgNVBAoTCkFwcGxlIEluYy4xFzAVBgNVBAsTDkFwcGxlIEZhaXJQbGF5MS8wLQYDVQQDEyZNYWNB\rcHBTdG9yZS4zMzMzQUYxMDEwMTRBRjAwMDFBRjAwMDAwMTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw\rgYkCgYEAtx8x/Hrjy0Kfg9eDxIb5K6JbznK821o6/BL1koKDZUAq7gZIMci9TXhRocVkfyorCVRI\rX5SR/5C630JxBV2fLE0+dP7XibiP6dpApigr1fHm2UjMPFtckPuJKl4KMktOksKsGzWT5TBKHjFa\rsIAWeIUSMuS53tTi8DwMOwXH7L0CAwEAAaNgMF4wDgYDVR0PAQH/BAQDAgO4MAwGA1UdEwEB/wQC\rMAAwHQYDVR0OBBYEFN0RgFNdNOQza7S4jKTa+TKilIisMB8GA1UdIwQYMBaAFPoN1BGRG+ayTh4G\rSZQR3WNiB1lkMA0GCSqGSIb3DQEBBQUAA4GBAE8jgTjxNaZ1AXREB384TWTp8yMVvO3DmRCmiLfP\rsOUUoQ5SpIIONyLbQfm21uGXJLs3ObnEJjVdUS8N/WRzkpBYMkT+cKRppT9wgjVaIaOJBSbBEFT+\rtT0tWi1xDZdWLiAS8LUjSEzoLUFp7Bh865Tp8mgmjq4zI/gkDP66GvAQMIIDcTCCAlmgAwIBAgIB\rETANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQG\rA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3Qg\rQ0EwHhcNMDcwMjE0MTkyMDQxWhcNMTIwMjE0MTkyMDQxWjB7MQswCQYDVQQGEwJVUzETMBEGA1UE\rChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxLzAt\rBgNVBAMTJkFwcGxlIEZhaXJQbGF5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIGfMA0GCSqGSIb3\rDQEBAQUAA4GNADCBiQKBgQCyZzxdKueP8nfP7zG80QT96p/QhimQCqP/ZErvafQKue/ExGPKOi0h\rPVKMI4kpqtsX3MsoxGnNciTCEMH0eB0xFsXm6hkdKjO+gKvcEUgGKh8OYYHNeZpdEvSEkMh89nib\rUvj68YhuEHL4XcuI7LZVFJekTQvBTydnmaaks9farQIDAQABo4GcMIGZMA4GA1UdDwEB/wQEAwIB\rhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBT6DdQRkRvmsk4eBkmUEd1jYgdZZDAfBgNVHSME\rGDAWgBQr0GlHlHYJ/vRrjS5ApvdHTX8IXjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vd3d3LmFw\rcGxlLmNvbS9hcHBsZWNhL3Jvb3QuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQDAoHP4Heoc0c3FhnWk\ru+tAxWotDP5b/G7BW9dIfUCpYS1LN3A47waRS68Rwh+V7ogzb19y6vbVdrVXWHHwPhDD1S67L6Y6\rc8IyZQpWBBYZmE0LeG3Qo3RkmFT0p9cdov8qw3kAspnn57vVBqLrSTNpZ0EBma1osNN69JXg/SSI\rKhDno2j/rXv62brxpX/Kk6LOAzcDZoWTBRsx9nWCky/T8No5Nz1f/rrNmnDABosi7qnOBG4kaTsW\rUqXA8sCuQ3CEuyGRQ8u7t+pbupPgt3eJ701WBDNdzlxZMafXO0VWEc2uy5sOoM/ck6jKxVh4AAXZ\rmavWXofqknM0VKOTGKSDMIIEuzCCA6OgAwIBAgIBAjANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQG\rEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBB\rdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3QgQ0EwHhcNMDYwNDI1MjE0MDM2WhcNMzUwMjA5\rMjE0MDM2WjBiMQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBw\rbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3QgQ0EwggEiMA0G\rCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDkkakJH5HbHkdQ6wXtXnmELes2oldMVeyLGYne+Uts\r9QerIjAC6Bg++FAJ039BqJj50cpmnCRrEdCju+QbKsMflZ56DKRHi1vUFjczy8QPTc4UadHJGXL1\rXQ7Vf1+b8iUDulWPTV0N8WQ1IxVLFVkds5T39pyez1C6wVhQZ48ItCD3y6wsIG9wtj8BMIy3Q88P\rnT3zK0koGsj+zrW5DtleHNbLPbU6rfQPDgCSC7EhFi501TwN22IWq6NxkkdTVcGvL0Gz+PvjcM3m\ro0xFfh9Ma1CWQYnEdGILEINBhzOKgbEwWOxaBDKMaLOPHd5lc/9nXmW8Sdh2nzMUZaF3lMktAgMB\rAAGjggF6MIIBdjAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUK9Bp\rR5R2Cf70a40uQKb3R01/CF4wHwYDVR0jBBgwFoAUK9BpR5R2Cf70a40uQKb3R01/CF4wggERBgNV\rHSAEggEIMIIBBDCCAQAGCSqGSIb3Y2QFATCB8jAqBggrBgEFBQcCARYeaHR0cHM6Ly93d3cuYXBw\rbGUuY29tL2FwcGxlY2EvMIHDBggrBgEFBQcCAjCBthqBs1JlbGlhbmNlIG9uIHRoaXMgY2VydGlm\raWNhdGUgYnkgYW55IHBhcnR5IGFzc3VtZXMgYWNjZXB0YW5jZSBvZiB0aGUgdGhlbiBhcHBsaWNh\rYmxlIHN0YW5kYXJkIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHVzZSwgY2VydGlmaWNhdGUgcG9s\raWN5IGFuZCBjZXJ0aWZpY2F0aW9uIHByYWN0aWNlIHN0YXRlbWVudHMuMA0GCSqGSIb3DQEBBQUA\rA4IBAQBcNplMLXi37Yyb3PN3m/J20ncwT8EfhYOFG5k9RzfyqZtAjizUsZAS2L70c5vu0mQPy3lP\rNNiiPvl4/2vIB+x9OYOLUyDTOMSxv5pPCmv/K/xZpwUJfBdAVhEedNO3iyM7R6PVbyTi69G3cN8P\rReEnyvFteO3ntRcXqNx+IjXKJdXZD9Zr1KIkIxH3oayPc4FgxhtbCS+SsvhESPBgOJ4V9T0mZyCK\rM2r3DYLP3uujL/lTaltkwGMzd/c6ByxW69oPIQ7aunMZT7XZNn/Bh1XZp5m5MkL72NVxnn6hUrcb\rvZNCJBIqxw8dtk2cXmPIS4AXUKqK1drk/NAJBzewdXUhMYIBMzCCAS8CAQEwgYwwezELMAkGA1UE\rBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRpb24g\rQXV0aG9yaXR5MS8wLQYDVQQDEyZBcHBsZSBGYWlyUGxheSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0\reQINMzOvEBAUrwABrwAAATAJBgUrDgMCGgUAMA0GCSqGSIb3DQEBAQUABIGAkXGoA0Hy6ykuNk/e\rfqEPHPTgZgMdIgCZMShXPlaIBJWlUEcitbneF+9ODCbrqyGM7esOu6HJDUl5K45b5Sy+SePLQ9Sq\rRcMTOqeLn9qCR/VMbkHIYjawZ9A+CuLLfvt9GXJxuFChWIrP5JZeGx8nasOXmj8MI8qoIiaQnDQq\rW8w\x3D", Scope = Private
	#tag EndConstant


	#tag Structure, Name = ASN1_STRING, Flags = &h21
		length as Int32
		  type as Int32
		  data as Ptr
		flags as Int32
	#tag EndStructure

	#tag Structure, Name = PKCS7, Flags = &h21
		asn1 as CString
		  length as Int32
		  state as Int32
		  detached as Int32
		  type as Ptr
		d as Ptr
	#tag EndStructure

	#tag Structure, Name = PKCS7_SIGNED, Flags = &h21
		version as Ptr
		  md_algs as Ptr
		  cert as Ptr
		  crl as Ptr
		  signer_info as Ptr
		contents as Ptr
	#tag EndStructure


	#tag Enum, Name = ATTRS, Type = Integer, Flags = &h21
		zero
		  ATTR_START
		  BUNDLE_ID
		  VERSION
		  OPAQUE_VALUE
		  HASH
		ATTR_END
	#tag EndEnum

	#tag Enum, Name = Keys, Type = Integer, Flags = &h1
		kReceiptBundleIdentifer
		  kReceiptBundleIdentiferData
		  kReceiptVersion
		  kReceiptOpaqueValue
		kReceiptHash
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
