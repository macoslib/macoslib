#tag Class
Class NSMutableCharacterSet
Inherits NSCharacterSet
	#tag Method, Flags = &h0
		Sub AddCharactersInString(theString as CFStringRef)
		  #if TargetMacOS
		    declare sub addCharactersInString lib CocoaLib selector "addCharactersInString:" (id as Ptr, thestr as CFStringRef)
		    
		    addCharactersInString( me.id, theString )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    me.m_id = NSObject.Initialize( NSObject.Allocate( "NSMutableCharacterSet" ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormIntersectionWithCharacterSet(charSet as NSCharacterSet)
		  #if TargetMacOS
		    declare sub formIntersectionWithCharacterSet lib CocoaLib selector "formIntersectionWithCharacterSet:" (id as Ptr, chars as Ptr)
		    
		    formIntersectionWithCharacterSet   me.id, charSet.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormUnionWithCharacterSet(charSet as NSCharacterSet)
		  #if TargetMacOS
		    declare sub formUnionWithCharacterSet lib CocoaLib selector "formUnionWithCharacterSet:" (id as Ptr, chars as Ptr)
		    
		    formUnionWithCharacterSet   me.id, charSet.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCharactersInString(theString as CFStringRef)
		  #if TargetMacOS
		    declare sub removeCharactersInString lib CocoaLib selector "removeCharactersInString:" (id as Ptr, thestr as CFStringRef)
		    
		    removeCharactersInString( me.id, theString )
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
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
