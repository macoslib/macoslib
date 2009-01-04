#tag Module
Protected Module Carbon
	#tag Method, Flags = &h0
		Sub SpotlightSearch(searchTerm as String)
		  //opens a Spotlight search window and does the search using searchTerm
		  //if searchTerm = "", a search window is opened
		  
		  #if targetMacOS
		    soft declare function HISearchWindowShow lib "Carbon.framework" (inSearchString as CFStringRef, inOptions as UInt32) as Integer
		    
		    const kNilOptions = 0
		    dim OSError as Integer = HISearchWindowShow(searchTerm, kNilOptions)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAboutBox(name as String = "", version as String = "", copyright as String = "", description as String = "")
		  dim d as new CFMutableDictionary
		  
		  if name <> "" then
		    d.Value(CFString("HIAboutBoxName")) = CFString(name)
		  end if
		  if version <> "" then
		    d.Value(CFString("HIAboutBoxVersion")) = CFString(version)
		  end if
		  if copyright <> "" then
		    d.Value(CFString("HIAboutBoxCopyright")) = CFString(copyright)
		  end if
		  if description <> "" then
		    d.Value(CFString("HIAboutBoxDescription")) = CFString(description)
		  end if
		  
		  #if targetMacOS
		    soft declare function HIAboutBox lib CarbonFramework (inOptions as Ptr) as Integer
		    
		    dim OSError as Integer = HIAboutBox(d)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SystemUIMode(mode as UIMode, options as UIOptions)
		  #if targetMacOS
		    soft declare function SetSystemUIMode lib CarbonFramework (inMode as UIMode, inOptions as UIOptions) as Integer
		    
		    dim OSError as Integer = SetSystemUIMode(mode, options)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemUIMode() As UIMode
		  #if targetMacOS
		    soft declare sub GetSystemUIMode lib CarbonFramework (ByRef mode as UIMode, outOptions as Ptr)
		    
		    dim mode as UIMode
		    GetSystemUIMode mode, nil
		    return mode
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemUIOptions() As UIOptions
		  #if targetMacOS
		    soft declare sub GetSystemUIMode lib CarbonFramework (mode as Ptr, ByRef outOptions as UIOptions)
		    
		    dim options as UIOptions
		    GetSystemUIMode nil, options
		    return options
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLeopard() As Boolean
		  return SystemVersion >= "10.5"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetLanguages() As String()
		  soft declare function CFPreferencesCopyValue  lib "Carbon.framework" (key as CFStringRef, applicationID as CFStringRef, userName as CFStringRef, hostName as CFStringRef) as Ptr
		  
		  dim arrayRef as Ptr = CFPreferencesCopyValue("AppleLanguages", "kCFPreferencesAnyApplication", "kCFPreferencesCurrentUser", "kCFPreferencesAnyHost")
		  
		  soft declare function CFArrayGetCount lib CarbonFramework (theArray as Ptr) as Integer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTiger() As Boolean
		  return SystemVersion >= "10.4"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPanther() As Boolean
		  return SystemVersion >= "10.3"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadSystemVersion() As String
		  'dim url as CFURL = new CFArray
		  '
		  '
		  '
		  '
		  '#if targetMacOS
		  'soft declare function CFURLCreateWithFileSystemPath lib CarbonFramework (allocator as ptr, filePath as CFStringRef, pathStyle as Integer, isDirectory as Boolean) as Ptr
		  'soft declare function CFURLCreateDataAndPropertiesFromResource lib CarbonFramework (alloc as Ptr, url as Ptr, ByRef resourceData as Ptr, properties as Ptr, desiredProperties as Ptr, ByRef errorCode as Int32) as Boolean
		  '
		  'soft declare function CFPropertyListCreateFromXMLData lib CarbonFramework (allocator as Ptr, xmlData as Ptr, mutabilityOption as UInt32, errorString as Ptr) as Ptr
		  'soft declare sub CFRelease lib CarbonFramework (cf as Ptr)
		  '
		  '
		  'const SystemVersion = "/System/Library/CoreServices/SystemVersion.plist"
		  '
		  'dim url as Ptr = CFURLCreateWithFileSystemPath(nil, SystemVersion, kCFURLPOSIXPathStyle, false)
		  'if url = nil then
		  'return ""
		  'end if
		  '
		  'dim errorCode as Int32
		  'dim xmlData as Ptr
		  'if CFURLCreateDataAndPropertiesFromResource(nil, url, xmlData, nil, nil, errorCode) then
		  'CFRelease url
		  'url = nil
		  'else
		  'CFRelease url
		  'url = nil
		  'return ""
		  'end if
		  '
		  '
		  'const kCFPropertyListImmutable = 0
		  'dim pList as Ptr = CFPropertyListCreateFromXMLData(nil, xmlData, kCFPropertyListImmutable, nil)
		  'CFRelease xmlData
		  'if pList = nil then
		  'return ""
		  'end if
		  '
		  '//I expect the plist to be a CFDictionary
		  'soft declare function CFDictionaryGetTypeID lib CarbonFramework() as UInt32
		  'soft declare function CFGetTypeID lib CarbonFramework (cf as Ptr) as UInt32
		  '
		  'if CFGetTypeID(plist) <> CFDictionaryGetTypeID then
		  '//file format was changed....
		  'return ""
		  'end if
		  '
		  'soft declare function CFDictionaryGetValue lib CarbonFramework (theDict as Ptr, key as CFStringRef) as CFStringRef
		  '
		  'const ProductVersionKey = "ProductVersion"
		  'dim value as CFStringRef = CFDictionaryGetValue(pList, ProductVersionKey)
		  'if value <> "" then
		  'soft declare function CFRetain lib CarbonFramework (cf as CFStringRef) as Ptr
		  'call CFRetain(value)
		  'end if
		  '
		  'return value
		  '
		  '#endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemVersion() As String
		  static version as String = ReadSystemVersion
		  if version = "" then
		    version = GetSystemVersionFromGestalt
		  end if
		  return version
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSystemVersionFromGestalt() As String
		  dim sysVersion as Integer
		  if System.Gestalt("sysv", sysVersion) then
		    dim hex as String = Hex(systemVersion)
		    return LeftB(hex, 2) + "." + MidB(hex, 3, 1) + "." + MidB(hex, 4, 1)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  http://code.google.com/p/macoslib
		
	#tag EndNote


	#tag Constant, Name = CarbonFramework, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"CarbonLib", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CarbonBundleID, Type = String, Dynamic = False, Default = \"com.apple.Carbon", Scope = Public
	#tag EndConstant

	#tag Constant, Name = noErr, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNilOptions, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidID, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVariableLengthArray, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUnknownType, Type = String, Dynamic = False, Default = \"\?\?\?\?", Scope = Public
	#tag EndConstant

	#tag Constant, Name = activeFlagBit, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btnStateBit, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cmdKeyBit, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = shiftKeyBit, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = alphaLockBit, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = optionKeyBit, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = controlKeyBit, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightShiftKeyBit, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightOptionKeyBit, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = rightControlKeyBit, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant


	#tag Structure, Name = UTCDateTime, Flags = &h0
		highSeconds as UInt16
		  lowSeconds as UInt32
		fraction as UInt16
	#tag EndStructure

	#tag Structure, Name = MacRect, Flags = &h0
		top as Int16
		  left as Int16
		  bottom as Int16
		right as Int16
	#tag EndStructure

	#tag Structure, Name = MacPoint, Flags = &h0
		v as Int16
		h as Int16
	#tag EndStructure

	#tag Structure, Name = Str255, Flags = &h0
		length as Uint8
		data as String*255
	#tag EndStructure

	#tag Structure, Name = LongDateRec, Flags = &h0
		era as Int16
		  year as Int16
		  month as Int16
		  day as Int16
		  hour as Int16
		  minute as Int16
		  second as Int16
		  dayOfWeek as Int16
		  dayOfYear as Int16
		  weekOfYear as Int16
		  pm as Int16
		  res1 as Int16
		  res2 as Int16
		res3 as Int16
	#tag EndStructure


	#tag Enum, Name = UIMode, Flags = &h0
		Normal = 0
		  ContentSuppressed = 1
		  ContentHidden = 2
		  AllSuppressed = 4
		AllHidden = 3
	#tag EndEnum

	#tag Enum, Name = UIOptions, Flags = &h0
		AutoShowMenuBar = 1
		  DisableAppleMenu = 4
		  DisableProcessSwitch = 8
		  DisableForceQuit = 16
		  DisableSessionTerminate = 32
		DisableHide = 64
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
