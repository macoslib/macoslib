#tag Class
Class NSWrapperForObject
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(v as variant)
		  me.m_id = NSObject.Initialize( NSObject.Allocate( "NSObject" ))
		  
		  RBObject = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  RBObject
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		RBObject As variant
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
