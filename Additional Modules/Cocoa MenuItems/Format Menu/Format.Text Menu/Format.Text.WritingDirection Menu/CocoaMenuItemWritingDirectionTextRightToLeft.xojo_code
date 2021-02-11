#tag Class
Protected Class CocoaMenuItemWritingDirectionTextRightToLeft
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "makeTextWritingDirectionRightToLeft:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"\tRight to Left", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"\tRight to Left"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\tVon rechts nach links"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\t\xE5\x8F\xB3\xE3\x81\x8B\xE3\x82\x89\xE5\xB7\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\tDe droite \xC3\xA0 gauche"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"\tDa destra a sinistra"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xA1\xE0\xA6\xBE\xE0\xA6\x87\xE0\xA6\xA8 \xE0\xA6\xA5\xE0\xA7\x87\xE0\xA6\x95\xE0\xA7\x87 \xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\x81\xE0\xA6\xAE\xE0\xA7\x87"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"\tRights naar links"
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
