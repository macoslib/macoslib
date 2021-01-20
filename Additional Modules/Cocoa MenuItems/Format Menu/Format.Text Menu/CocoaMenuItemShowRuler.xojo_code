#tag Class
Protected Class CocoaMenuItemShowRuler
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "toggleRuler:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    if target = nil then
		      return
		    end if
		    
		    if respondsToSelector(target, Cocoa.NSSelectorFromString("isRulerVisible")) then
		      if isRulerVisible(target) then
		        self.Text = LocalizedTextHide
		      else
		        self.Text = LocalizedTextShow
		      end if
		    else
		      //I wouldn't expect this to happen, but just in case...
		      self.Text = LocalizedTextShow
		    end if
		    
		  #else
		    #pragma unused target
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedTextHide, Type = String, Dynamic = True, Default = \"Hide Ruler", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Hide Ruler"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lineal ausblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\xAB\xE3\x83\xBC\xE3\x83\xA9\xE3\x82\x92\xE9\x9A\xA0\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Masquer les r\xC3\xA8gles"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nascondi righello"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verberg liniaal"
	#tag EndConstant

	#tag Constant, Name = LocalizedTextShow, Type = String, Dynamic = True, Default = \"Show Ruler", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Show Ruler"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lineal einblenden"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\xAB\xE3\x83\xBC\xE3\x83\xA9\xE3\x82\x92\xE8\xA1\xA8\xE7\xA4\xBA"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher les r\xC3\xA8gles"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra righello"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Toon liniaal"
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
