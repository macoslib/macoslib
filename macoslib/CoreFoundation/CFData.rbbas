#tag Class
Class CFData
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(theData as String)
		  #if targetMacOS
		    soft declare function CFDataCreate lib CarbonFramework (allocator as Ptr, bytes as CString, length as Integer) as Ptr
		    
		    me.Adopt CFDataCreate(nil, theData, theData.LenB), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Data() As MemoryBlock
		  #if targetMacOS
		    soft declare function CFDataGetLength lib CarbonFramework (theData as Ptr) as Integer
		    soft declare sub CFDataGetBytes lib CarbonFramework (theData as Ptr, range as CFRange, buffer as Ptr)
		    
		    if not me.IsNULL then
		      dim dataLength as Integer = CFDataGetLength(me.Reference)
		      if dataLength > 0 then
		        dim m as new MemoryBlock(dataLength)
		        dim range as CFRange = CFRangeMake(0, dataLength)
		        CFDataGetBytes me.Reference, range, m
		        return m
		      end if
		    end if
		  #endif
		  
		  return new MemoryBlock(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theData as MemoryBlock)
		  #if targetMacOS
		    soft declare function CFDataCreate lib CarbonFramework (allocator as Ptr, bytes as Ptr, length as Integer) as Ptr
		    
		    if not (theData is nil) then
		      me.Adopt CFDataCreate(nil, theData, theData.Size), true
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFDataGetTypeID lib CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFDataGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod


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
End Class
#tag EndClass
