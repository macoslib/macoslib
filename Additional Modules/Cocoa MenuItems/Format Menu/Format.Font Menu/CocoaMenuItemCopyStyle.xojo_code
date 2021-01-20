#tag Class
Protected Class CocoaMenuItemCopyStyle
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "copyFont:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Copy Style", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Copy Style"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Stil kopieren"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\xB9\xE3\x82\xBF\xE3\x82\xA4\xE3\x83\xAB\xE3\x82\x92\xE3\x82\xB3\xE3\x83\x94\xE3\x83\xBC"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Copier le style"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Copia stile"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xB6\xE0\xA7\x88\xE0\xA6\xB2\xE0\xA7\x80 \xE0\xA6\x85\xE0\xA6\xA8\xE0\xA7\x81\xE0\xA6\xB2\xE0\xA6\xBF\xE0\xA6\xAA\xE0\xA6\xBF"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kopieer stijl"
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
			Visible=true
			Group="Behavior"
			InitialValue="#CocoaMenuItemCopyStyle"
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
