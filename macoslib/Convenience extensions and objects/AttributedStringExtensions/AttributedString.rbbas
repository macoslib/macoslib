#tag Class
Class AttributedString
Inherits NSAttributedString
	#tag Method, Flags = &h0
		Sub Constructor(fromNSAttributedString as NSAttributedString)
		  //# Create an AttributedString from its Cocoa counterpart
		  
		  #if TargetMacOS
		    if Cocoa.InheritsFromClass( fromNSAttributedString, "NSMutableAttributedString" ) then
		      Mutable = true
		    end if
		    
		    me._id = fromNSAttributedString.id
		    NSbacking = fromNSAttributedString
		    selection = Cocoa.NSMakeRange( 0, 0 )
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			//# The underlying NSAttributedString handle (same as "id" )
		#tag EndNote
		#tag Getter
			Get
			  //# Handle of the object
			  
			  return Integer( _id )
			End Get
		#tag EndGetter
		Handle As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return _id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Mutable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NSbacking As NSObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private selection As NSRange
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    return   selection.length
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    selection.length = value
			  #endif
			End Set
		#tag EndSetter
		Private SelLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    return   selection.location
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    selection.location = value
			  #endif
			End Set
		#tag EndSetter
		Private SelStart As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _id As Ptr
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			Type="integer"
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
