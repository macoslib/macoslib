#tag Class
Protected Class CocoaMenuItemShowSpelling
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "showGuessPanel:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Show Spelling and Grammar", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Spelling and Grammar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Rechtschreibung und Grammatik einblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xB9\xE3\x83\x9A\xE3\x83\xAB\xE3\x81\xA8\xE6\x96\x87\xE6\xB3\x95\xE3\x82\x92\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher grammaire et orthographe"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra ortografia e grammatica"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\xA8\xE0\xA6\xBE\xE0\xA6\xA8 \xE0\xA6\x93 \xE0\xA6\xAC\xE0\xA7\x8D\xE0\xA6\xAF\xE0\xA6\xBE\xE0\xA6\x95\xE0\xA6\xB0\xE0\xA6\xA3 \xE0\xA6\xAA\xE0\xA7\x8D\xE0\xA6\xB0\xE0\xA6\xA6\xE0\xA6\xB0\xE0\xA7\x8D\xE0\xA6\xB6\xE0\xA6\xA8"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon spelling en grammatica"
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
