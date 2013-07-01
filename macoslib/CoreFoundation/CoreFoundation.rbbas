#tag Module
Module CoreFoundation
	#tag Method, Flags = &h1
		Protected Function AvailableEncodings() As TextEncoding()
		  #if TargetMacOS
		    dim m as MemoryBlock
		    dim i as Integer
		    dim encodingList(-1) as TextEncoding
		    
		    Const kCFStringEncodingInvalidId = &hffffffff
		    
		    Declare Function CFStringGetListOfAvailableEncodings Lib CarbonLib () as Ptr
		    
		    m = CFStringGetListOfAvailableEncodings
		    
		    If m <> Nil then
		      i = 0
		      While m.Long(i) <> kCFStringEncodingInvalidId
		        encodingList.Append Encodings.GetFromCode(m.Long(i))
		        i = i + 4
		      Wend
		    Else
		      //
		    End if
		    Return encodingList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bundle() As CFBundle
		  return CFBundle.NewCFBundleFromID(BundleID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFBoolean(b as Boolean) As CFBoolean
		  if b then
		    return CFBoolean.GetTrue
		  end if
		  return CFBoolean.GetFalse
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFConstant(name as String) As CFStringRef
		  // To be used to look up kCF... constants only!
		  
		  return CoreFoundation.Bundle.StringPointerRetained(name)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function CFCopyTypeIDDescription Lib CarbonLib (type_id as UInt32) As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CFDate(d as Date) As CFDate
		  return new CFDate(d)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CFGetTypeID Lib CarbonLib (cf as Ptr) As UInt32
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CFNumber(dbl as Double) As CFNumber
		  return new CFNumber(dbl)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFNumber(int_64 as Int64) As CFNumber
		  return new CFNumber(int_64)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFNumber(int_32 as Integer) As CFNumber
		  return new CFNumber(int_32)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFRangeMake(loc as Int32, len as Int32) As CFRange
		  dim r as CFRange
		  r.location = loc
		  r.length = len
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFSocketNativeHandle(handle as Integer) As CFSocketNativeHandle
		  dim h as CFSocketNativeHandle
		  h.handle = handle
		  return h
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFString(str as String) As CFString
		  return str
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CFStringGetTypeID Lib CarbonLib () As Uint32
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CFTypeFromVariant(theValue as Variant) As CFType
		  // Transform a simple RB variant into a CFType
		  
		  #if TargetMacOS
		    if theValue=nil then
		      return   new CFNull
		    end if
		    
		    if theValue.IsArray then
		      return   CFArray.CreateFromObjectsArray( theValue )
		    end if
		    
		    select case theValue.Type
		    case  Variant.TypeInteger, Variant.TypeLong, Variant.TypeDouble, Variant.TypeSingle
		      Return   new CFNumber( theValue )
		      
		    case  Variant.TypeDate
		      Return  new CFDate( theValue.DateValue )
		      
		    case  Variant.TypeBoolean
		      if theValue.BooleanValue then
		        return   CFBoolean.GetTrue
		      else
		        return  CFBoolean.GetFalse
		      end if
		      
		    case  Variant.TypeString
		      return  new CFString( theValue )
		      
		    case  Variant.TypeObject
		      if theValue isa Dictionary then  //Dictionary
		        return  CFDictionary.CreateFromDictionary( Dictionary( theValue ))
		        
		      elseif theValue isa MemoryBlock then  //MemoryBlock
		        return  new CFData( MemoryBlock( theValue ))
		        
		      elseif theValue isa CFType then  //Already a CFTYpe
		        return   CFType( theValue )
		      end if
		      
		    end select
		    
		    raise  new TypeMismatchException
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFURL(f as FolderItem) As CFURL
		  return new CFURL(f)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFURL(url as String) As CFURL
		  return new CFURL(url)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function CFURLCopyResourcePropertyForKey Lib CarbonLib (url as Ptr, key as CFStringRef, ByRef propertyValueTypeRefPtr as Ptr, ByRef errorRef as Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CFURLCreateWithFileSystemPath Lib CarbonLib (allocator as Ptr, filePath as CFStringRef, pathStyle as Integer, isDirectory as Boolean) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function Clone(Extends propertyList as CFPropertyList, mutability as Integer) As CFPropertyList
		  // mutability: kCFPropertyListImmutable, kCFPropertyListMutableContainers, kCFPropertyListMutableContainersAndLeaves
		  
		  dim pList as CFType
		  
		  #if TargetMacOS
		    Declare Function CFPropertyListCreateDeepCopy Lib CarbonLib (allocator as Integer, propertyList as Ptr, mutabilityOption as Integer) as Ptr
		    
		    dim ref as Ptr
		    ref = CFPropertyListCreateDeepCopy(0, propertyList.Reference, mutability)
		    If ref <> nil then
		      pList = CFType.NewObject(ref, true, mutability)
		    End if
		  #endif
		  
		  return CFPropertyList(pList)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ConvertDateToCFAbsoluteTime(d as date) As double
		  
		  #if TargetMacOS
		    dim delta as double
		    
		    const kCFAbsoluteTimeIntervalSince1904 = "kCFAbsoluteTimeIntervalSince1904"
		    
		    dim p as Ptr = Carbon.Bundle.DataPointerNotRetained( kCFAbsoluteTimeIntervalSince1904 )
		    if p <> nil then
		      delta = p.Double( 0 )
		    else
		      raise new macoslibException( "Could not retrieve constant ""kCFAbsoluteTimeIntervalSince1904"" from Carbon bundle" )
		    end if
		    
		    return   d.TotalSeconds + delta
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid(extends propertyList as CFPropertyList, listFormat as Integer) As Boolean
		  // listFormat: kCFPropertyListOpenStepFormat, kCFPropertyListXMLFormat_v1_0, kCFPropertyListBinaryFormat_v1_0
		  
		  #if TargetMacOS
		    // Introduced in MacOS X 10.2.
		    Declare Function CFPropertyListIsValid Lib CarbonLib (cf as Ptr, fmt as Integer) as Boolean
		    
		    return CFPropertyListIsValid(propertyList.Reference, listFormat)
		    
		  #else
		    #pragma unused propertyList
		    #pragma unused listFormat
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function kCFAllocatorNull() As Ptr
		  //kCFAllocatorNull does not resolve to nil.
		  
		  #if targetMacOS
		    dim b as CFBundle = CoreFoundation.Bundle
		    dim p as Ptr = b.DataPointerNotRetained("kCFAllocatorNull")
		    if p <> nil then
		      return p.Ptr(0)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewCFPropertyList(theXML as CFData, mutability as Integer, ByRef errorMessageOut as String) As CFPropertyList
		  // mutability: kCFPropertyListImmutable, kCFPropertyListMutableContainers, kCFPropertyListMutableContainersAndLeaves
		  // Note: Returns nil if the xml data is not a valid property list
		  
		  dim pList as CFType
		  
		  #if TargetMacOS
		    declare function CFPropertyListCreateFromXMLData Lib CarbonLib (allocator as Ptr, xmlData as Ptr, mutabilityOptions as Integer, ByRef errMsg as CFStringRef) as Ptr
		    
		    dim theRef as Ptr
		    
		    dim strRef as CFStringRef
		    theRef = CFPropertyListCreateFromXMLData (nil, theXML, mutability, strRef)
		    if theRef <> nil then
		      pList = CFType.NewObject(theRef, true, mutability)
		      errorMessageOut = ""
		    else
		      errorMessageOut = strRef
		    end if
		  #else
		    errorMessageOut = "not supported on this platform"
		  #endif
		  
		  return CFPropertyList(pList)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewCFPropertyList(openedStream as CFReadStream, mutability as Integer, ByRef formatOut as Integer, ByRef errorMessageOut as String) As CFPropertyList
		  // mutability: kCFPropertyListImmutable, kCFPropertyListMutableContainers, kCFPropertyListMutableContainersAndLeaves
		  // Note: Returns nil if the xml data is not a valid property list
		  
		  dim pList as CFType
		  
		  #if TargetMacOS
		    declare function CFPropertyListCreateFromStream Lib CarbonLib (allocator as Ptr, readStream as Ptr, streamLen as Integer, mutabilityOptions as Integer, ByRef format as Integer, ByRef errMsg as CFStringRef) as Ptr
		    
		    dim theRef as Ptr
		    dim strRef as CFStringRef
		    theRef = CFPropertyListCreateFromStream (nil, openedStream.Reference, 0, mutability, formatOut, strRef)
		    if theRef <> nil then
		      pList = CFType.NewObject(theRef, true, mutability)
		      errorMessageOut = ""
		    else
		      errorMessageOut = strRef
		    end if
		  #else
		    errorMessageOut = "not supported on this platform"
		  #endif
		  
		  return CFPropertyList(pList)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewCFPropertyList(theXML as String, mutability as Integer, ByRef errorMessageOut as String) As CFPropertyList
		  #if TargetMacOS
		    return NewCFPropertyList(new CFData(theXML), mutability, errorMessageOut)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotRetainedStringValue(p as Ptr) As String
		  #if targetMacOS
		    if p = nil then
		      return ""
		    end if
		    
		    if CFGetTypeID(p) <> CFStringGetTypeID then
		      dim e as new TypeMismatchException
		      e.Message = "CFTypeRef &h" + Hex(Integer(p)) + " has unexpected type " + CFCopyTypeIDDescription(CFGetTypeID(p)) + "."
		      raise e
		    end if
		    
		    soft declare function CFStringGetLength lib CarbonLib (cf as Ptr) as Integer
		    soft declare function CFStringGetMaximumSizeForEncoding lib CarbonLib (length as Integer, enc as Integer) as Integer
		    soft declare function CFStringGetCString lib CarbonLib (theString as Ptr, buffer as Ptr, bufferSize as Integer, enc as Integer) as Boolean
		    
		    dim maxSize as Integer = CFStringGetMaximumSizeForEncoding(CFStringGetLength(p), kCFStringEncodingUTF8)
		    if maxSize <= 0 then
		      return ""
		    end if
		    
		    dim buffer as new MemoryBlock(1 + maxSize)
		    if CFStringGetCString(p, buffer, buffer.Size, kCFStringEncodingUTF8) then
		      return DefineEncoding(buffer.CString(0), Encodings.UTF8)
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pTestAssert(b as Boolean, msg as String = "")
		  #if DebugBuild
		    if not b then
		      break
		      #if TargetHasGUI
		        MsgBox "Test in in CoreFoundation module failed: "+EndOfLine+EndOfLine+msg
		      #else
		        Print "Test in CoreFoundation module failed: "+msg
		      #endif
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub Release Lib framework Alias "CFRelease" (cf as Ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function RetainedStringValue(p as Ptr) As String
		  #if targetMacOS
		    declare function CFRetain lib CarbonLib (cf as Ptr) as Ptr
		    
		    if p <> nil then
		      return NotRetainedStringValue(CFRetain(p))
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub StringAppendCString Lib framework Alias "CFStringAppendCString" (theString as Ptr, cStr as CString, encoding as Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function StringCreateMutable Lib framework Alias "CFStringCreateMutable" (alloc as Ptr, maxLength as Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function StringGetLength Lib framework Alias "CFStringGetLength" (cf as Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function StringGetMaximumSizeForEncoding Lib framework Alias "CFStringGetMaximumSizeForEncoding" (length as Integer, enc as Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub StringNormalize Lib framework Alias "CFStringNormalize" (theString as Ptr, theForm as Integer)
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Attributes( hidden ) Protected Sub TestSelf()
		  // This is an incomplete set of tests to make sure nothing got screwed up too much
		  
		  #if DebugBuild
		    
		    // Flip the switches for the tests below here.
		    // Use true and FALSE as values to help distinguish easily.
		    const kTestCFArray = true
		    const kTestCFNumber = true
		    const kTestCFString = true
		    const kTestCFBoolean = true
		    const kTestCFPreferences = true
		    const kTestCFURL = true
		    const kTestCFDate = true
		    const kTestCFTimeZone = true
		    const kTestCFStream = true
		    const kTestCFBundleAndCFPropertyList = FALSE
		    'const kTestCFSocket = FALSE
		    
		    // Check our app's Bundle Identifier
		    dim myBundleID as String = CFBundle.Application.Identifier
		    pTestAssert myBundleID = "com.declaresub.macoslib"
		    
		    // Test creating new bundles
		    dim s as String
		    s = CFBundle.NewCFBundleFromID(BundleID).Identifier
		    pTestAssert s = BundleID
		    
		    dim cft as CFType
		    
		    if kTestCFArray then
		      dim vals() as CFString
		      vals.Append "a"
		      vals.Append "b"
		      dim arr as new CFArray(vals)
		      dim p as Ptr = arr.Reference
		      arr = CFArray(CFType.NewObject(p, false, kCFPropertyListImmutable)) // here the ref needs to be retained
		      p = arr.Reference
		      arr = new CFArray(p, false) // here the ref needs to be retained
		      pTestAssert arr.CFValue(1).Equals(new CFString("b"))
		    end // at this point the CFString objects should all get deallocated
		    
		    // Test CFNumber operations
		    if kTestCFNumber then
		      dim cf1, cf2 as CFNumber
		      cf1 = new CFNumber(1)
		      pTestAssert cf2 is nil
		      cf2 = new CFNumber(nil,false)
		      pTestAssert not (cf2 is nil)
		      pTestAssert cf2=nil
		      cf2 = new CFNumber(0)
		      pTestAssert (cf2 <> nil)
		      pTestAssert cf1.IntegerValue > cf2.IntegerValue
		      pTestAssert cf1.DoubleValue = 1
		      pTestAssert cf1.Equals(new CFNumber(1.0))
		      pTestAssert cf1 > cf2
		      pTestAssert not( cf1 = cf2 )
		      pTestAssert not( cf1 < cf2 )
		      cf2 = 5
		      pTestAssert cf2.IntegerValue = 5
		      cf2 = 5.1
		      pTestAssert cf2.DoubleValue = 5.1
		      cf1 = cf2
		      pTestAssert cf1 is cf2
		    end
		    
		    // Test CFString operations
		    if kTestCFString then
		      dim s1 as CFString = "z"
		      dim s2 as CFString = "a"
		      pTestAssert s2 < s1
		      pTestAssert s2 < "b"
		      pTestAssert s1 > "y"
		      pTestAssert s1 = "Z"
		      s1 = new CFString( nil, CFType.HasOwnership )
		      pTestAssert s2 < s1
		      pTestAssert s1 = nil
		      pTestAssert s1 < "a"
		    end if
		    
		    // Test CFBoolean operations
		    if kTestCFBoolean then
		      dim cfbF as new CFBoolean( False )
		      dim cfbT as CFBoolean = true
		      pTestAssert cfbT = true
		      pTestAssert cfbT <> false
		      pTestAssert cfbT
		      pTestAssert not( cfbF.BooleanValue )
		      pTestAssert cfbT <> cfbF
		      dim cfbN as CFBoolean // nil
		      pTestAssert cfbT <> cfbN
		    end if
		    
		    // Test the CFPreferences functionality
		    if kTestCFPreferences then
		      dim cf1 as CFNumber
		      dim prefs as CFPreferences
		      dim prefKeys() as String = prefs.Keys
		      for each key as String in prefKeys
		        dim desc as String = CFType(prefs.Value(key)).Description
		        #pragma unused desc
		      next
		      cf1 = CFNumber(prefs.Value("RunCount"))
		      dim runCount as Integer
		      if cf1 <> nil then
		        runCount = cf1.IntegerValue
		      end if
		      cf1 = new CFNumber (runCount + 1)
		      prefs.Value("RunCount") = cf1
		      call prefs.Sync // this writes back the changes to the prefs we made here
		      cft = CFType(prefs.Value("RunCount"))
		      pTestAssert cf1.Equals(CFType(prefs.Value("RunCount")))
		    end
		    
		    // Test CFURL
		    if kTestCFURL then
		      dim url as new CFURL(SpecialFolder.System)
		      pTestAssert url.Scheme = "file"
		      pTestAssert url.NetLocation = "localhost"
		      pTestAssert url.StringValue = "file://localhost"+url.Path+"/"
		      pTestAssert url.Name.StringValue = SpecialFolder.System.Name
		      pTestAssert url.IsAlias.VariantValue = SpecialFolder.System.Alias
		      pTestAssert url.IsDirectory = true
		      url = new CFURL( SpecialFolder.Temporary.Child( "SomethingThatDoesn'tExist" ) )
		      pTestAssert url.FileSize is nil
		    end
		    
		    // Test CFDate
		    if kTestCFDate then
		      dim d1 as new Date
		      dim d2 as new Date
		      dim d3 as date
		      d2.TotalSeconds = d1.TotalSeconds - 5
		      dim cfd1 as new CFDate( d1 )
		      dim cfd2 as CFDate = d2
		      pTestAssert cfd1 > cfd2
		      pTestAssert( ( cfd1 - cfd2 ) = 5. )
		      pTestAssert cfd1 = d1
		      pTestAssert cfd1 > d3
		      cfd1 = nil
		      pTestAssert cfd1 = nil
		    end if
		    
		    // Test CFTimeZone
		    if kTestCFTimeZone then
		      dim zonenames() as String = CFTimeZone.NameList()
		      dim tzone as new CFTimeZone(zonenames(1))
		      pTestAssert tzone.Name = zonenames(1)
		    end
		    
		    // Test CFStreams
		    if kTestCFStream then
		      dim reader as CFReadStream
		      'dim writer as CFWriteStream
		      reader = new CFReadStream("12345")
		      pTestAssert reader.Status = 0
		      pTestAssert reader.Open()
		      pTestAssert reader.Read(3,s)
		      pTestAssert s = "123"
		      pTestAssert not reader.IsAtEnd
		      pTestAssert reader.Read(3,s)
		      pTestAssert s = "45"
		      pTestAssert reader.IsAtEnd
		      pTestAssert reader.Read(3,s)
		      pTestAssert reader.IsOpen
		      reader.Close()
		      pTestAssert not reader.IsOpen
		      pTestAssert not reader.Open()
		      pTestAssert not reader.IsOpen
		      ' not usable due to bug(?) in OS 10.5:
		      'if CFStream.NewBoundPair (reader, writer) then
		      'pTestAssert reader.Open
		      'pTestAssert writer.Open
		      'pTestAssert writer.IsReady
		      'pTestAssert not reader.HasDataAvailable
		      'pTestAssert writer.Write("abcd") = 4
		      'pTestAssert reader.HasDataAvailable
		      'pTestAssert reader.Read(4,s)
		      'pTestAssert s = "abcd"
		      'end if
		    end if
		    
		    // Test CFBundle and CFPropertyList
		    if kTestCFBundleAndCFPropertyList then
		      // get this app's Info.plist contents via CFBundle.InfoDictionary
		      dim bndl as CFBundle = CFBundle.Application
		      dim infodict as CFDictionary = bndl.InfoDictionary
		      pTestAssert not CFPropertyList(infodict).IsValid(kCFPropertyListXMLFormat_v1_0) // it's a CFDictionary but not a true CFPropertyList
		      pTestAssert infodict.Value(CFString("CFBundleIdentifier")) = bndl.InfoDictionaryValue("CFBundleIdentifier")
		      // get this app's Info.plist contents again, this time by locating the file directly and opening it
		      dim url as new CFURL (bndl.URL, "Contents/Info.plist") // create the path to the plist file by hand
		      dim cfStr as CFString = CFString("CFBundleInfoPlistURL")
		      dim url2 as CFURL = CFURL(infodict.Value(cfStr)) // get the same path by asking our App Bundle's info dictionary
		      pTestAssert url.StringValue = url2.StringValue, url.StringValue+" <> "+url2.StringValue
		      dim rs as new CFReadStream (url) // read the plist file directly
		      pTestAssert rs.Open
		      // read the plist file into a mutable CFPropertyList instance
		      dim format as Integer, errorMessage as String
		      dim plist as CFPropertyList = NewCFPropertyList (rs, kCFPropertyListMutableContainersAndLeaves, format, errorMessage)
		      pTestAssert errorMessage="", errorMessage
		      pTestAssert plist.IsValid (format)
		      // get the xml representation of the plist dictionary, then recreate another mutable CFPropertyList instance from it
		      dim xml as String
		      xml = plist.XMLValue
		      plist = NewCFPropertyList (xml, kCFPropertyListMutableContainersAndLeaves, errorMessage)
		      pTestAssert errorMessage="", errorMessage
		      pTestAssert plist.XMLValue = xml // make sure the two are identical in their xml representation
		      // add a new element to the plist
		      CFMutableDictionary(plist).Value(CFString("_AddedKVP_")) = CFString("test value")
		      pTestAssert plist.XMLValue <> xml
		      // write the plist back to a new temp file
		      dim tmpFile as FolderItem = GetTemporaryFolderItem()
		      dim url3 as new CFURL (tmpFile)
		      dim ws as new CFWriteStream(url3)
		      pTestAssert ws.Open
		      pTestAssert plist.Write (ws, kCFPropertyListBinaryFormat_v1_0, errorMessage) // this should write a binary plist but it actually writes an xml one. Odd
		      ws.Close
		      // read the temp file back and see if it contains our added value
		      rs = new CFReadStream (url3)
		      pTestAssert rs.Open
		      pTestAssert rs.Read(99999, s)
		      pTestAssert s.InStr("test value") > 0
		      tmpFile.Delete
		    end
		    
		    '// Test CFSocket (TCP/IP)
		    '#if kTestCFSocket then
		    '// (TT 6 Dec 09) this is not working - at least not when reading and writing within same process
		    'declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		    'declare sub CFReadStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		    'declare sub CFWriteStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		    '
		    'dim serverSocket, clientSocket as CFSocket
		    'dim serverReader, clientReader as CFReadStream
		    'dim serverWriter, clientWriter as CFWriteStream
		    '
		    'dim myAddr as CFData = CFSocket.IP4Address("localhost", 26214)
		    '
		    '// set up the server streams
		    'serverSocket = new CFSocket (CFSocket.PF_INET, CFSocket.SOCK_STREAM, CFSocket.IPPROTO_TCP, CFSocket.kAcceptCallBack)
		    'pTestAssert serverSocket.Bind(myAddr), "bind" // -> listen on socket
		    '
		    '// set up the client streams
		    'CFStream.NewBoundPairFromHostAddress ("localhost", 26214, clientReader, clientWriter)
		    '
		    'pTestAssert clientReader.Open
		    'pTestAssert clientWriter.Open
		    '
		    'CFWriteStreamScheduleWithRunLoop (clientWriter, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		    '
		    'App.DoEvents
		    '
		    'dim n as Integer = clientWriter.Write("start")
		    'pTestAssert n = 5
		    '
		    'do
		    'App.DoEvents
		    'if serverSocket.HasConnected and serverReader = nil then
		    'CFStream.NewBoundPairFromNativeSocket (serverSocket.NativeHandle, serverReader, serverWriter)
		    '
		    'CFReadStreamScheduleWithRunLoop (serverReader, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		    '
		    'pTestAssert serverReader.Open
		    'pTestAssert serverWriter.Open
		    '
		    'App.DoEvents
		    '
		    'pTestAssert clientWriter.Write("hello") = 5
		    'end
		    'if serverReader <> nil and serverReader.HasDataAvailable then
		    'if serverReader.Read(4,s) then
		    'break
		    'end if
		    'end if
		    'loop
		    '
		    'break
		    '#endif
		    '
		    '// Test CFSockets (Unix Domain Sockets)
		    '#if kTestCFSocket then
		    '// (TT 6 Dec 09) this is not working - at least not when reading and writing within same process
		    'declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		    'declare sub CFReadStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		    'declare sub CFWriteStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		    '
		    'dim serverSocket, clientSocket as CFSocket
		    'dim serverReader, clientReader as CFReadStream
		    'dim serverWriter, clientWriter as CFWriteStream
		    '
		    'dim path as String = "/var/tmp/cftest_socket_file"
		    'dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		    'f.Delete
		    'pTestAssert not f.Exists
		    '
		    'dim ssig as new CFSocketSignature (path)
		    'serverSocket = new CFSocket (ssig, CFSocket.kNoCallBack, false)
		    'pTestAssert not serverSocket.IsNULL
		    'pTestAssert serverSocket.IsValid
		    'pTestAssert f.Exists
		    '
		    ''pTestAssert serverSocket.Bind(ssig.address), "bind" // -> listen on socket
		    '
		    'clientSocket = new CFSocket (ssig, CFSocket.kNoCallBack, true)
		    'pTestAssert not clientSocket.IsNULL
		    'pTestAssert clientSocket.IsValid
		    '
		    ''not working: CFStream.NewBoundPairFromSocket ssig, reader, writer
		    'CFStream.NewBoundPairFromNativeSocket (clientSocket.NativeHandle, clientReader, clientWriter)
		    'CFStream.NewBoundPairFromNativeSocket (serverSocket.NativeHandle, serverReader, serverWriter)
		    '
		    'CFReadStreamScheduleWithRunLoop (serverReader, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		    'CFWriteStreamScheduleWithRunLoop (clientWriter, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		    '
		    'pTestAssert serverReader.Open
		    'pTestAssert clientWriter.Open
		    '
		    'App.DoEvents
		    'pTestAssert not serverReader.HasDataAvailable
		    ''pTestAssert clientWriter.IsReady
		    'pTestAssert clientWriter.Write("abcd") = 4
		    'App.DoEvents
		    'pTestAssert serverReader.HasDataAvailable
		    'pTestAssert serverReader.Read(4,s)
		    'pTestAssert s = "abcd"
		    '
		    'f.Delete
		    'pTestAssert not f.Exists
		    '#endif
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub TimerActionDelegate()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function Version() As Double
		  // Returns the version of the CoreFoundation framework
		  
		  #if targetMacOS
		    const kCFCoreFoundationVersionNumber = "kCFCoreFoundationVersionNumber"
		    
		    dim p as Ptr = CFBundle.NewCFBundleFromID(CoreFoundation.BundleID).DataPointerNotRetained(kCFCoreFoundationVersionNumber)
		    if p <> nil then
		      return p.Double(0)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Write(extends propertyList as CFPropertyList, openedWriteStream as CFWriteStream, format as Integer, ByRef errorMessageOut as String) As Boolean
		  #if TargetMacOS
		    
		    static newFunctionNeedsCheck as boolean = true
		    static newFunctionIsAvailable as boolean
		    if newFunctionNeedsCheck then
		      newFunctionIsAvailable = System.IsFunctionAvailable( "CFPropertyListWrite", CarbonLib )
		      newFunctionNeedsCheck = false
		    end if
		    
		    dim strRef as CFStringRef
		    dim written as Integer
		    if newFunctionIsAvailable then
		      // Introduced in MacOS X 10.6.
		      soft declare function CFPropertyListWrite lib CarbonLib (propertyList as Ptr, stream as Ptr, format as Integer, options as UInt32, ByRef errMsg as CFStringRef) as Integer
		      written = _
		      CFPropertyListWrite (propertyList.Reference, openedWriteStream.Reference, format, 0, strRef)
		    else
		      // Introduced in MacOS X 10.2 (deprecated, use CFPropertyListWrite instead)
		      declare function CFPropertyListWriteToStream lib CarbonLib (propertyList as Ptr, stream as Ptr, format as Integer, ByRef errMsg as CFStringRef) as Integer
		      written = _
		      CFPropertyListWriteToStream (propertyList.Reference, openedWriteStream.Reference, format, strRef)
		    end if
		    errorMessageOut = strRef
		    if errorMessageOut = "" then
		      // success
		      return written > 0
		    end if
		    
		  #else
		    errorMessageOut = "not supported on this platform"
		    
		    #pragma unused propertyList
		    #pragma unused openedWriteStream
		    #pragma unused format
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XMLValue(extends propertyList as CFPropertyList) As String
		  #if TargetMacOS
		    
		    static newFunctionNeedsCheck as boolean = true
		    static newFunctionIsAvailable as boolean
		    if newFunctionNeedsCheck then
		      newFunctionIsAvailable = System.IsFunctionAvailable( "CFPropertyListCreateData", CarbonLib )
		      newFunctionNeedsCheck = false
		    end if
		    
		    dim xmlDataRef as Ptr
		    if newFunctionIsAvailable then
		      
		      // Introduced in MacOS X 10.6.
		      soft declare function CFPropertyListCreateData lib CarbonLib _
		      ( allocator as Ptr, propertyList as Ptr, format as Integer, options as UInt32, ByRef err as Ptr ) as Ptr
		      
		      dim err as Ptr
		      xmlDataRef = CFPropertyListCreateData( nil, propertyList.Reference, kCFPropertyListXMLFormat_v1_0, 0, err )
		      if err <> nil then
		        raise new CFError( err, CFType.HasOwnership )
		      end if
		      
		    else
		      
		      // Introduced in MacOS X 10.2 (deprecated, use CFPropertyListCreateData instead).
		      declare function CFPropertyListCreateXMLData lib CarbonLib (allocator as Ptr, propertyList as Ptr) as Ptr
		      
		      xmlDataRef = CFPropertyListCreateXMLData(nil, propertyList.Reference)
		      
		    end if
		    
		    if xmlDataRef = nil then
		      return ""
		    else
		      dim xmlData as new CFData( xmlDataRef, CFType.HasOwnership )
		      return DefineEncoding(xmlData.Data, Encodings.UTF8)
		    end if
		    
		  #else
		    #pragma unused propertyList
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		CFType and its subclasses are wrappers for Mac OS's CoreFoundation classes, which encompass
		numbers, strings, arrays, dictionaries and a few more common types. The CoreGraphics module
		also makes use of, and extends, these classes.
		
		As a first time user, start looking at CFPreferences to read/write your app's ".plist" prefs file,
		and at CFBundle, using its Application() method to get to your app bundle's folders (those
		hidden in your app package).
		
		Important: If you are adding or modifying new functionality using Declare statements,
		make sure you understand the reference counting rules. Read the "Memory Management"
		note in the CFType class for a start.
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote

	#tag Note, Name = Comparing values
		There are three ways to compare objects of CFType and their subclasses:
		
		1. As they're objects, one may want to see if two RB variables identify the same
		   RB object, or if one is nil. To test this, use the "is" operator, e.g.:
		
		     if cfDict.Value(x) is nil then ... // tests if a dictionary entry exists
		
		2. As they reference a CoreFoundation object managed by OS X, one can test
		   if two RB objects reference the same CF object. Use the "="operator for this
		   (this is achieved by the Operator_Compare() function in the CFType class):
		
		     if cfArray.Value(i) = item then ... // test if item is already in the array
		
		   A special case is the NULL CF reference. To test if a CF class identifies
		   no CF object, you can use the IsNULL function.
		
		3. Finally, all CF objects refer to data (unless IsNULL() returns true). To access
		   that data, you need to retrieve it explicitly (exception: CFStrings can be
		   automatically coerced into Strings and vice versa).
		   In general, to check if two separate CF objects are equal, use the
		   Equals() function:
		
		     if cfNum1.Equals (cfNum2) then ... // test if their values are equal
		
		   Additionally, to order two CFNumber values, you cannot use "<" and
		   ">" on the CF objects but must compare their explicit values instead:
		
		     if n1.IntegerValue > n2.IntegerValue then ... // number compare
	#tag EndNote

	#tag Note, Name = NULL references (nil ptrs)
		New rule implemented on 23 Dec 08:
		
		If a CF... class gets constructed from a nil reference, it will still be created
		(as a CFType whose IsNULL() function returns true).
		That way, you can always expect that a function that returns CF type values
		will get you an existing object and not nil. To test if the reference is nil,
		call the IsNULL() member function.
		Note, however, that CFDictionary.Value and CFPreferences.Value may still
		return nil if the given key does not exist in the dictionary or prefs.
	#tag EndNote


	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.CoreFoundation", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = framework, Type = String, Dynamic = False, Default = \"CoreFoundation.framework", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCFCompareAnchored, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareBackwards, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareCaseInsensitive, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareDiacriticInsensitive, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareForcedOrdering, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareLikeFinder, Type = Double, Dynamic = False, Default = \"881", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareLocalized, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareNonliteral, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareNumerically, Type = Double, Dynamic = False, Default = \"64", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFCompareWidthInsensitive, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListBinaryFormat_v1_0, Type = Double, Dynamic = False, Default = \"200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListImmutable, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListMutableContainers, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListMutableContainersAndLeaves, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListOpenStepFormat, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFPropertyListXMLFormat_v1_0, Type = Double, Dynamic = False, Default = \"100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringEncodingUTF8, Type = Double, Dynamic = False, Default = \"&h08000100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Name, Type = String, Dynamic = False, Default = \"CoreFoundation.framework", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StringNormalizationFormC, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StringNormalizationFormD, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StringNormalizationFormKC, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StringNormalizationFormKD, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = CFRange, Flags = &h0
		location as Int32
		length as Int32
	#tag EndStructure

	#tag Structure, Name = CFSocketContext, Flags = &h0
		version as Int32
		  info as Integer
		  retainFunc as Ptr
		  releaseFunc as Ptr
		copyDescFunc as Ptr
	#tag EndStructure

	#tag Structure, Name = CFSocketNativeHandle, Flags = &h0
		handle As Int32
	#tag EndStructure

	#tag Structure, Name = UInt32, Flags = &h0
		opaque as UInt32
	#tag EndStructure


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
