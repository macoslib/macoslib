#tag Module
Protected Module CFArrayExtension
	#tag Method, Flags = &h0
		Function CFStringRefValue(extends theArray as CFArray, index as Integer) As CFStringRef
		  #if targetMacOS
		    soft declare function CFGetTypeID lib CarbonLib (cf as Ptr) as UInt32
		    soft declare function CFStringGetTypeID lib CarbonLib () as UInt32
		    soft declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    
		    dim p as Ptr = theArray.Value(index)
		    if CFGetTypeID(p) = CFStringGetTypeID then
		      return CFRetain(p)
		    else
		      dim e as new TypeMismatchException
		      e.Message = "Value &h" + Hex(Integer(p)) + " at index " + Str(index) + " has unexpected type " + CFCopyTypeIDDescription(CFGetTypeID(p)) + "."
		      raise e
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFValue(extends theArray as CFArray, index as Integer) As CFType
		  #if TargetMacOS
		    return CFType.NewObject(theArray.Value(index), not CFType.hasOwnership, kCFPropertyListImmutable)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValues(extends theArray as CFArray) As String()
		  #if targetMacOS
		    dim L() as String
		    dim lastIndex as Integer = theArray.Count - 1
		    for index as Integer = 0 to lastIndex
		      L.Append theArray.CFStringRefValue(index)
		    next
		    return L
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = location
		This module sits outside the CoreFoundation module because a nested module cannot have global visibility, which should be necessary for
		the extension methods to work.
	#tag EndNote


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
