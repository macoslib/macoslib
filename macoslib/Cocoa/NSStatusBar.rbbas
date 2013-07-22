#tag Class
Class NSStatusBar
Inherits NSObject
	#tag Method, Flags = &h0
		Function CreateStatusItem(length as Single, actionHandler as NSStatusItem.ActionDelegate) As NSStatusItem
		  
		  #if TargetMacOS
		    declare function statusItemWithLength lib CocoaLib selector "statusItemWithLength:" (obj_id as Ptr, length as Single) as Ptr
		    
		    dim itemRef as Ptr = statusItemWithLength(self, length)
		    if itemRef <> nil then
		      return new NSStatusItem(itemRef, actionHandler)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused length
		    #pragma unused actionHandler
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVertical() As Boolean
		  
		  #if TargetMacOS
		    declare function isVertical lib CocoaLib selector "isVertical" (obj_id as Ptr) as Boolean
		    
		    return isVertical(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveStatusItem(item as NSStatusItem)
		  
		  #if TargetMacOS
		    declare sub removeStatusItem lib CocoaLib selector "removeStatusItem:" (obj_id as Ptr, item as Ptr)
		    
		    dim itemRef as Ptr
		    if item <> nil then
		      itemRef = item
		    end if
		    
		    removeStatusItem self, itemRef
		    
		  #else
		    #pragma unused item
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SystemStatusBar() As NSStatusBar
		  
		  #if TargetMacOS
		    declare function systemStatusBar lib CocoaLib selector "systemStatusBar" (obj_id as Ptr) as Ptr
		    
		    dim barRef as Ptr = systemStatusBar(Cocoa.NSClassFromString("NSStatusBar"))
		    if barRef <> nil then
		      return new NSStatusBar(barRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Thickness() As Single
		  
		  #if TargetMacOS
		    declare function thickness lib CocoaLib selector "thickness" (obj_id as Ptr) as Single
		    
		    return thickness(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = NSSquareStatusItemLength, Type = Double, Dynamic = False, Default = \"-2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSVariableStatusItemLength, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
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
