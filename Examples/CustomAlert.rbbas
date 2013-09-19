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
			Type="Integer"
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
			Name="ShowsHelp"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSAlert"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsSuppressionButton"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSAlert"
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
