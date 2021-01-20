#tag Class
Protected Class CustomAlert
Inherits NSAlert
	#tag Event
		Function AlertShowHelp(alert as NSAlert) As Boolean
		  // The delegate implements this method only to override the help-anchor lookup behavior.
		  #pragma Unused alert
		  
		  MsgBox "Summon the dialog's help system"
		  return true
		  
		  // return True when the delegate displayed help directly, False otherwise.
		  // When False and the alert has a help anchor (NSAlert.HelpAnchor), the application’s help manager displays help using the help anchor.
		End Function
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlertStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Style"
			EditorType="Enum"
			#tag EnumValues
				"0 - Warning"
				"1 - Informational"
				"2 - Critical"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsHelp"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsSuppressionButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
