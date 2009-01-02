#tag Class
Class CFString
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Operator_Convert(s as CFStringRef)
		  #if targetMacOS
		    // The use of CFRetain here provides a slick way to convert a REALbasic CFStringRef to a Ptr
		    // And the retaining is necessary as well, after all
		    soft declare function CFRetain lib CarbonFramework (cf as CFStringRef) as Ptr
		    
		    me.Adopt CFRetain(s), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As CFStringRef
		  #if targetMacOS
		    // The use of CFRetain here provides a slick way to convert a Ptr to CFStringRef
		    // And the retaining is necessary as well, after all
		    soft declare function CFRetain lib CarbonFramework (cf as Ptr) as CFStringRef
		    
		    if not me.IsNULL then
		      return CFRetain(me.Reference)
		    end
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFStringGetTypeID lib CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFStringGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(str as String)
		  me.Operator_Convert(str)
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		This is a wrapper for CFStringRef, useful in certain situations.
	#tag EndNote


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
