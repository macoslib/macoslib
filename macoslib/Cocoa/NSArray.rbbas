	#tag Class
	Class NSArray
	Inherits CFArray
		#tag ViewBehavior
			#tag ViewProperty
				Name="Description"
				Group="Behavior"
				Type="String"
				EditorType="MultiLineEditor"
				InheritedFrom="CFType"
			#tag EndViewProperty
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
			#tag ViewProperty
				Name="Count"
				Group="Behavior"
				InitialValue="0"
				Type="Integer"
				InheritedFrom="CFArray"
			#tag EndViewProperty
		#tag EndViewBehavior
	End Class
	#tag EndClass
