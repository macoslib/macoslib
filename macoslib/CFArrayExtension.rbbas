#tag Module
Protected Module CFArrayExtension
	#tag Method, Flags = &h0
		Function CFStringRefValue(extends theArray as CFArray, index as Integer) As CFStringRef
		  #if targetMacOS
		    dim p as Ptr = theArray.Value(index)
		    if CFGetTypeID(p) = CFString.ClassID then
		      return CFStringRetain(p)
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


End Module
#tag EndModule
