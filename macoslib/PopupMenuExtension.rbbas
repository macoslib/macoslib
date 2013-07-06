#tag Module
Protected Module PopupMenuExtension
	#tag Method, Flags = &h0
		Sub AddNewRow(extends p as PopupMenu, Name as String, Tag as Variant = Nil, Ico as Picture = Nil)
		  //# Convenience extension to quickly add a new popupmenu row with a row tag and row picture.
		  
		  p.AddRow Name
		  if Tag <> nil then p.RowTag( p.ListCount - 1 ) = Tag
		  if Ico <> nil then p.Icon(   p.ListCount - 1 ) = NSImage.CreateFromPicture( Ico )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Icon(extends p as PopupMenu, index as Integer, assigns value as NSImage)
		  #if targetMacOS
		    declare function menu lib CocoaLib selector "menu" (obj_id as Integer) as Ptr
		    declare function itemAtIndex lib CocoaLib selector "itemAtIndex:" (obj_id as Ptr, index as Integer) as Ptr
		    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, menuImage as Ptr)
		    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, aSize as Cocoa.NSSize)
		    
		    dim m as Ptr = menu(p.Handle)
		    dim item as Ptr = itemAtIndex(m, index)
		    dim icon as NSImage = value.Copy
		    
		    dim size as Cocoa.NSSize
		    const MenuIconSize = 16
		    size.Width = MenuIconSize
		    size.Height = MenuIconSize
		    setSize(icon, size)
		    
		    setImage(item, icon)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PullsDown(extends p as PopupMenu) As Boolean
		  //# Returns a Boolean value indicating the behavior of the control's menu.
		  
		  #if TargetCocoa then
		    declare function pullsDown lib CocoaLib selector "pullsDown" (obj_id as Integer) as Boolean
		    
		    return pullsDown(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PullsDown(extends p as PopupMenu, assigns Value as Boolean)
		  //# Sets whether the PopupMenu behaves as a pull-down or pop-up menu.
		  
		  #if TargetCocoa then
		    declare sub setPullsDown lib CocoaLib selector "setPullsDown:" (obj_id as Integer, inFlag as Boolean)
		    
		    setPullsDown(p.Handle, Value)
		  #else
		    #pragma Unused p
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(extends p as PopupMenu, Title as String)
		  //# Removes the item with the specified title from the menu.
		  
		  #if TargetCocoa then
		    declare sub removeItemWithTitle lib CocoaLib selector "removeItemWithTitle:" (obj_id as Integer, inTitle as CFStringRef)
		    
		    removeItemWithTitle(p.Handle, Title)
		  #else
		    #pragma Unused p
		    #pragma Unused Title
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
End Module
#tag EndModule
