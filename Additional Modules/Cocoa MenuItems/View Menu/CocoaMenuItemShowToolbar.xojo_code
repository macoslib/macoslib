#tag Class
Protected Class CocoaMenuItemShowToolbar
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleToolbarShown:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    declare function toolbar lib CocoaLib selector "toolbar" (obj_id as Ptr) as Ptr
		    declare function isVisible lib CocoaLib selector "isVisible" (obj_id as Ptr) as Boolean
		    
		    if isVisible(toolbar(target)) then
		      self.Text = LocalizedTextHide
		    else
		      self.Text = LocalizedTextShow
		    end if
		    
		  #else
		    #pragma unused target
		  #endif
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedTextHide, Type = String, Dynamic = True, Default = \"Hide Toolbar", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Hide Toolbar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Symbolleiste ausblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x84\xE3\x83\xBC\xE3\x83\xAB\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE9\x9A\xA0\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Masquer la barre d\'outils"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nascondi la barra strumenti"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\x9F\xE0\xA7\x81\xE0\xA6\xB2\xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\xB0 \xE0\xA6\x86\xE0\xA7\x9C\xE0\xA6\xBE\xE0\xA6\xB2 \xE0\xA6\x95\xE0\xA6\xB0\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verberg knoppenbalk"
	#tag EndConstant

	#tag Constant, Name = LocalizedTextShow, Type = String, Dynamic = True, Default = \"Show Toolbar", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Toolbar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Symbolleiste einblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x84\xE3\x83\xBC\xE3\x83\xAB\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher la barre d\'outils"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra la barra strumenti"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\x9F\xE0\xA7\x81\xE0\xA6\xB2\xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\xB0 \xE0\xA6\xAA\xE0\xA7\x8D\xE0\xA6\xB0\xE0\xA6\xA6\xE0\xA6\xB0\xE0\xA7\x8D\xE0\xA6\xB6\xE0\xA6\xA8 \xE0\xA6\x95\xE0\xA6\xB0\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon knoppenbalk"
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
