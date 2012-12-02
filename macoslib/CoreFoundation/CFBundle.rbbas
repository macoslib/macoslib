#tag Class
Class CFBundle
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function Application() As CFBundle
		  // returns this app's main bundle
		  
		  static app as new CFBundle
		  return app
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFBundleGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // This default constructor creates the application's CFBundle
		  
		  #if TargetMacOS
		    soft declare function CFBundleGetMainBundle lib CarbonLib () as Ptr
		    
		    dim p as Ptr = CFBundleGetMainBundle
		    if p <> nil then
		      super.Constructor p, true
		      me.Retain
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataPointerNotRetained(symbolName as String) As Ptr
		  #if TargetMacOS
		    declare function CFBundleGetDataPointerForName lib CarbonLib (bundle as Ptr, symbolName as CFStringRef) as Ptr
		    
		    if not (self = nil) then
		      return CFBundleGetDataPointerForName(self, symbolName)
		    end if
		    
		  #else
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecutableFile() As CFURL
		  #if TargetMacOS
		    soft declare function CFBundleCopyExecutableURL lib CarbonLib (theBundle as Ptr) as Ptr
		    
		    if (self <> nil) then
		      return MakeCFURL(CFBundleCopyExecutableURL(self))
		    else
		      return nil
		    end if
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameworksDirectory() As CFURL
		  #if TargetMacOS
		    soft declare function CFBundleCopyPrivateFrameworksURL lib CarbonLib (theBundle as Ptr) as Ptr
		    
		    if (self <> nil) then
		      return MakeCFURL(CFBundleCopyPrivateFrameworksURL(self))
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionPointerForName(symbolName as String) As Ptr
		  #if TargetMacOS
		    declare function CFBundleGetFunctionPointerForName lib CarbonLib (bundle as Ptr, functionName as CFStringRef) as Ptr
		    
		    if (self <> nil) then
		      return CFBundleGetFunctionPointerForName(me.Reference, symbolName)
		    else
		      return nil
		    end if
		    
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionary() As CFDictionary
		  #if targetMacOS
		    soft declare function CFBundleGetInfoDictionary lib CarbonLib (bundle as Ptr) as Ptr
		    
		    if (self <> nil) then
		      return new CFDictionary(CFBundleGetInfoDictionary(me.Reference), not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoDictionaryValue(key as String) As CFType
		  #if targetMacOS
		    declare function CFBundleGetValueForInfoDictionaryKey lib CarbonLib (bundle as Ptr, key as CFStringRef) as Ptr
		    
		    if (self <> nil) then
		      dim valueRef as Ptr = CFBundleGetValueForInfoDictionaryKey(self, key)
		      if valueRef <> nil then
		        return CFType.NewObject(valueRef, not CFType.hasOwnership, kCFPropertyListImmutable)
		      else
		        return nil
		      end if
		      
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused key
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load() As Boolean
		  // MacOSLib min version is now 10.5 so calling the older method is no longer necessary.
		  // Will now raise an error to keep consistent with other function calls that return a CFError.
		  
		  #if TargetMacOS
		    if (self <> nil) then
		      dim ok as Boolean
		      
		      'if System.IsFunctionAvailable( "CFBundleLoadExecutableAndReturnError", CarbonLib ) then
		      
		      // only available in Mac OS X 10.5 and later:
		      declare function CFBundleLoadExecutableAndReturnError lib CarbonLib (theBundle as Ptr, ByRef errorOut as Ptr) as Boolean
		      
		      dim errorRef as Ptr
		      ok = CFBundleLoadExecutableAndReturnError (me.Reference, errorRef)
		      if errorRef <> nil then
		        raise new CFError( errorRef, CFType.HasOwnership )
		      end if
		      'else
		      '// this works in all OS X versions:
		      'declare function CFBundleLoadExecutable lib CarbonLib (theBundle as Ptr) as Boolean
		      '
		      'ok = CFBundleLoadExecutable (me.Reference)
		      'end if
		      return ok
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeCFURL(urlRef as Ptr, hasOwnership as Boolean = true) As CFURL
		  #if TargetMacOS
		    soft declare function CFBundleCopyExecutableURL lib CarbonLib (theBundle as Ptr) as Ptr
		    
		    if urlRef <> nil then
		      return new CFURL(urlRef, hasOwnership)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused urlRef
		    #pragma unused hasOwnership
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewCFBundleFromID(bundleIdentifier as String) As CFBundle
		  #if targetMacOS
		    soft declare function CFBundleGetBundleWithIdentifier lib CarbonLib (bundleID as CFStringRef) as Ptr
		    
		    return new CFBundle(CFBundleGetBundleWithIdentifier(bundleIdentifier), false)
		    
		  #else
		    #pragma unused bundleIdentifier
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewCFBundleFromURL(theURL as CFURL) As CFBundle
		  #if targetMacOS
		    if not (theURL is nil) then
		      soft declare function CFBundleCreate lib CarbonLib (allocator as Ptr, bundleURL as Ptr) as Ptr
		      
		      return new CFBundle(CFBundleCreate(nil, theURL.Reference), true)
		    end if
		    
		  #else
		    #pragma unused theURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewCFBundlesFromFolder(folderURL as CFURL) As CFArray
		  #if targetMacOS
		    if not (folderURL is nil) then
		      soft declare function CFBundleCreateBundlesFromDirectory lib CarbonLib (allocator as Ptr, folderURL as Ptr, bundleType as Ptr) as Ptr
		      
		      dim p as Ptr = CFBundleCreateBundlesFromDirectory(nil, folderURL.Reference, nil)
		      if p <> nil then
		        return new CFArray (p, true)
		      end if
		    end if
		    
		  #else
		    #pragma unused folderURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource(name as String, type as String, subDirectoryName as String) As CFURL
		  raise new RuntimeException // not available
		  'if not ( self = nil ) then
		  '#if targetMacOS
		  'soft declare function CFBundleCopyResourceURL lib CarbonLib (bundle as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyResourceURLInDirectory lib CarbonLib (bundleURL as Integer, resourceName as Integer, resourceType as Integer, subDirName as Integer) as Integer
		  'soft declare function CFBundleCopyBundleURL lib CarbonLib (bundle as Integer) as Integer
		  '
		  'dim theRef as Integer
		  'dim theURL as CFURL
		  'dim typeRef as Integer
		  'dim subDirRef as Integer
		  'dim urlRef as Integer
		  '
		  'If name Is Nil then
		  'Return Nil
		  'End if
		  'If type Is Nil then
		  'typeRef = 0
		  'Else
		  'typeRef = type
		  'End if
		  'If subDirectoryName Is Nil then
		  'subDirRef = 0
		  'Else
		  'subDirRef = subDirectoryName
		  'End if
		  '
		  'theRef = CFBundleCopyResourceURL(me, name, typeRef, subDirRef)
		  'CoreFoundation.CheckCFTypeRef theRef, "CFBundle", "Resource", "CFBundleCopyResourceURL"
		  'theURL = new CFURL(theRef)
		  '#endif
		  '
		  'Exception oops as CFTypeRefException
		  'theURL = Nil
		  '
		  'Finally
		  'CoreFoundation.Release theRef
		  'Return theURL
		  'End
		  
		  #pragma unused name
		  #pragma unused type
		  #pragma unused subDirectoryName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcesDirectory() As CFURL
		  #if TargetMacOS
		    soft declare function CFBundleCopyResourcesDirectoryURL lib CarbonLib (theBundle as Ptr) as Ptr
		    
		    if (self <> nil) then
		      return MakeCFURL(CFBundleCopyResourcesDirectoryURL(self))
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringPointerRetained(symbolName as String) As CFStringRef
		  #if TargetMacOS
		    soft declare function CFBundleGetDataPointerForName lib CarbonLib (bundle as Ptr, symbolName as CFStringRef) as Ptr
		    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    
		    if (self <> nil) then
		      dim p as Ptr = CFBundleGetDataPointerForName(me.Reference, symbolName)
		      if p <> nil then
		        return CFRetain (p.Ptr(0))
		      else
		        return ""
		      end if
		    else
		      return ""
		    end if
		    
		  #else
		    #pragma unused symbolName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportFilesDirectory() As CFURL
		  #if targetMacOS
		    declare function CFBundleCopySupportFilesDirectoryURL lib CarbonLib (bundle as Ptr) as Ptr
		    
		    if (self <> nil) then
		      return MakeCFURL(CFBundleCopySupportFilesDirectoryURL(self))
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    return   URL.Item
			  #endif
			End Get
		#tag EndGetter
		FolderItemValue As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CFBundleGetIdentifier lib CarbonLib (bundle as Ptr) as Ptr
			    
			    if (self <> nil) then
			      return RetainedStringValue(CFBundleGetIdentifier(self))
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    soft declare function CFBundleCopyBundleURL lib CarbonLib (bundle as Ptr) as Ptr
			    
			    if (self <> nil) then
			      dim theURL as new CFURL(CFBundleCopyBundleURL(me.Reference), true)
			      if not theURL.Equals(nil) then
			        return theURL
			      else
			        return nil
			      end if
			    end if
			  #endif
			End Get
		#tag EndGetter
		URL As CFURL
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
End Class
#tag EndClass
