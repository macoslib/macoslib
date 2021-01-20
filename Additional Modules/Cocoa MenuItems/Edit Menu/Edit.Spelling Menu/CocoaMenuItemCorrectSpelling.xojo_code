#tag Class
Protected Class CocoaMenuItemCorrectSpelling
Inherits CocoaMenuItemToggle
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleAutomaticSpellingCorrection:"
		End Function
	#tag EndEvent

	#tag Event
		Function TestMethodName() As String
		  return "isAutomaticSpellingCorrectionEnabled"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Correct Spelling Automatically", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Correct Spelling Automatically"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Rechtschreibung automatisch pr\xC3\xBCfen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xB9\xE3\x83\x9A\xE3\x83\xAB\xE3\x82\x92\xE8\x87\xAA\xE5\x8B\x95\xE7\x9A\x84\xE3\x81\xAB\xE4\xBF\xAE\xE6\xAD\xA3"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Corriger l\'orthographe automatiquement"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Correggi automaticamente ortografia"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Corrigeer spelling automatisch"
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
