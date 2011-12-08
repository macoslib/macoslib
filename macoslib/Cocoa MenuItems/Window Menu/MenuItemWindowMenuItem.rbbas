#tag Class
Protected Class MenuItemWindowMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  #if targetCocoa
		    declare sub makeKeyAndOrderFront lib CocoaLib selector "makeKeyAndOrderFront:" (obj_id as Ptr, sender as Ptr)
		    
		    //sender could be this menu Item.
		    makeKeyAndOrderFront(self.Tag, nil)
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  #if targetCocoa
		    //I use these functions so that I can just work with the window ids stored in the Tag property
		    //instead of having to hang on to or compute a window reference.
		    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as Ptr
		    declare function isKeyWindow lib CocoaLib selector "isKeyWindow" (obj_id as Ptr) as Boolean
		    declare function isMiniaturized lib CocoaLib selector "isMiniaturized" (obj_id as Ptr) as Boolean
		    
		    
		    if isMiniaturized(self.Tag) then
		      //get NSMenuItem reference for menuitem.
		      dim nsitem as Ptr = self.NSMenuItem
		      http://stackoverflow.com/questions/3426374/how-do-you-specify-to-display-a-diamond-in-a-nsmenuitem-minimized-window-indica
		      
		      declare function _NSGetThemeImage lib CocoaLib (num as Integer) as Ptr
		      declare sub setState lib CocoaLib selector "setState:" (obj_id as Ptr, value as Integer)
		      declare sub setOnStateImage lib CocoaLib selector "setOnStateImage:" (obj_id as Ptr, itemImage as Ptr)
		      const NSOnState = 1
		      declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, itemImage as Ptr)
		      
		      
		      dim p as Ptr = _NSGetThemeImage(155)
		      setImage(nsitem, _NSGetThemeImage(155))
		      setState(nsitem, NSOnState)
		    end if
		  #endif
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
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
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
