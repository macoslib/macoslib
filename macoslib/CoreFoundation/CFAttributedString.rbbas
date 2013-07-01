#tag Class
Class CFAttributedString
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFAttributedStringGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String, withAttributes as CFDictionary = nil)
		  #if targetMacOS
		    declare function CFAttributedStringCreate lib CarbonLib (alloc as Ptr, str as CFStringRef, attr as Ptr) as Ptr
		    
		    dim attr as Ptr
		    if withAttributes <> nil then
		      attr = withAttributes.Reference
		    end if
		    
		    self.Constructor (CFAttributedStringCreate (nil, text, attr), hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString() As String
		  #if TargetMacOS
		    declare function CFAttributedStringGetString lib CarbonLib (hdl as Ptr) as CFStringRef
		    
		    return CFAttributedStringGetString (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As Integer
		  #if TargetMacOS
		    declare function CFAttributedStringGetLength lib CarbonLib (hdl as Ptr) as Integer
		    
		    return CFAttributedStringGetLength (self)
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
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
