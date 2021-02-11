#tag Class
Protected Class CocoaMenuItemCheckSpellingWhileTyping
Inherits CocoaMenuItemToggle
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleContinuousSpellChecking:"
		End Function
	#tag EndEvent

	#tag Event
		Function TestMethodName() As String
		  return "isContinuousSpellCheckingEnabled"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Check Spelling While Typing", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Check Spelling While Typing"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hrend der Texteingabe pr\xC3\xBCfen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x85\xA5\xE5\x8A\x9B\xE4\xB8\xAD\xE3\x81\xAB\xE3\x82\xB9\xE3\x83\x9A\xE3\x83\xAB\xE3\x83\x81\xE3\x82\xA7\xE3\x83\x83\xE3\x82\xAF"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V\xC3\xA9rifier l\'orthographe lors de la frappe"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Controlla ortografia mentre scrivo"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Controleer spelling tijdens typen"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="HasCheckMark"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Shortcut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
