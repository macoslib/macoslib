#tag Class
Protected Class ReportEvent
	#tag Method, Flags = &h0
		Sub Constructor(type as integer, FormatType as integer, RequiresUserInteraction as boolean, values() as variant)
		  
		  me.Type = type
		  me.FormatType = FormatType
		  me.RequiresUserInteraction = RequiresUserInteraction
		  me.Values = values
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FormatType As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RequiresUserInteraction As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		values() As variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="FormatType"
			Group="Behavior"
			Type="Integer"
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
			Name="RequiresUserInteraction"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
