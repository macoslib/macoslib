#tag Class
Protected Class CocoaMenuItemRedo
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "redo:"
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu(target as Ptr)
		  #if targetCocoa
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    declare function undoManager lib CocoaLib selector "undoManager" (obj_id as Ptr) as Ptr
		    declare function canRedo lib CocoaLib selector "canRedo" (obj_id as Ptr) as Boolean
		    
		    if respondsToSelector(target, Cocoa.NSSelectorFromString("undoManager")) then
		      dim undoMgr as Ptr = undoManager(target)
		      self.Enabled = canRedo(undoMgr)
		    else
		      self.Enabled = false
		    end if
		    
		  #else
		    #pragma unused target
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Redo", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Redo"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wiederholen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x82\x84\xE3\x82\x8A\xE7\x9B\xB4\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9tablir"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Ripristina"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAA\xE0\xA7\x81\xE0\xA6\xA8\xE0\xA6\xB0\xE0\xA6\xBE\xE0\xA7\x9F \xE0\xA6\x95\xE0\xA6\xB0\xE0\xA6\xBE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Opnieuw"
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
