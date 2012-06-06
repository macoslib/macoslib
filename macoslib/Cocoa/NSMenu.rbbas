#tag Class
Class NSMenu
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Append(newMenuItem as NSMenuItem)
		  #if TargetMacOS
		    declare sub addItem lib CocoaLib selector "addItem:" (id as Ptr, item as Ptr)
		    
		    addItem   me.id, newMenuItem.id
		    newMenuItem.Enabled = true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(RSMenu as MenuItem)
		  //This method is really basic and adapted only to local menus without submenus
		  
		  #if TargetMacOS
		    dim mi as NSMenuItem
		    
		    me.Constructor( RSMenu.Text )
		    
		    for i as integer=0 to RSMenu.Count - 1
		      mi = NSMenuItem.CreateFromMenuItem( RSMenu.Item( i ) )
		      mi.Enabled = true
		      me.Append   mi
		    next
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(title as String = "")
		  #if targetCocoa
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:" (obj_id as Ptr, title as CFStringRef) as Ptr
		    
		    dim menuRef as Ptr = initWithTitle(Allocate("NSMenu"), title)
		    self.Constructor(menuRef, NSObject.hasOwnership)
		    
		    me.SetAutoEnable   false
		  #else
		    #pragma unused title
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(itemIndex as integer) As NSMenuItem
		  #if TargetMacOS
		    declare function itemAtIndex lib CocoaLib selector "itemAtIndex:" (id as Ptr, idx as integer) as Ptr
		    
		    dim p as Ptr = itemAtIndex( me.id, itemIndex )
		    
		    if p<>nil then
		      return   new NSMenuItem( p, false )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAutoEnable(YesNo as Boolean)
		  #if TargetMacOS
		    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:" (id as Ptr, value as Boolean)
		    
		    setAutoenablesItems   me.id, YesNo
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function numberOfItems lib CocoaLib selector "numberOfItems" ( id as Ptr ) as integer
			    
			    return  numberOfItems( me.id )
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
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
End Class
#tag EndClass
