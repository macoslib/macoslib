#tag Class
Protected Class WindowMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  #if targetCocoa
		    declare function sendAction lib CocoaLib selector "sendAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Boolean
		    
		    return sendAction(NSApp, self.ActionSelector, nil, nil)
		  #endif
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  if not self.localizedTextSet then
		    self.Text = self.LocalizedText(raiseEvent CommandID)
		    self.localizedTextSet = true
		  end if
		  
		  self.Enabled = self.ShouldEnable
		  
		  raiseEvent EnableMenu
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ActionSelector() As Ptr
		  #if targetCocoa
		    declare function NSSelectorFromString lib CocoaLib (aSelectorName as CFStringRef) as Ptr
		    return NSSelectorFromString(raiseEvent ActionSelectorName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocalizedText(commandID as OSType) As String
		  #if targetMacOS
		    if commandID = "" then
		      return ""
		    end if
		    
		    //note that CreateStandardWindowMenu is not available to 64-bit apps.
		    soft declare function CreateStandardWindowMenu Lib CarbonFramework (inOptions as Integer, ByRef outMenu as Integer) as Integer
		    
		    dim theMenu as Integer
		    dim OSError as Integer = CreateStandardWindowMenu(0, theMenu)
		    if OSError <> 0 or theMenu = 0 then
		      return ""
		    end if
		    
		    soft declare function GetIndMenuItemWithCommandID Lib CarbonFramework (inMenu as Integer, inCommandID as OSType, inItemIndex as Integer, outMenu as Integer, ByRef outIndex as UInt16) as Integer
		    Const Null = 0
		    dim theIndex as Uint16
		    
		    OSError = GetIndMenuItemWithCommandID(theMenu, commandID, 1, Null, theIndex)
		    
		    soft declare function CopyMenuItemTextAsCFString Lib CarbonFramework (inMenu as Integer, inItem as UInt16, ByRef outString as CFStringRef) as Integer
		    dim menuItemText as CFStringRef
		    OSError = CopyMenuItemTextAsCFString(theMenu, theIndex, menuItemText)
		    
		    soft declare sub CFRelease lib CarbonFramework (cf as Integer)
		    CFRelease theMenu
		    theMenu = 0
		    
		    return menuItemText
		  #endif
		  
		exception fnf as FunctionNotFoundException
		  //this should not happen
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function NSApp() As Ptr
		  #if targetCocoa
		    declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		    declare function sharedApplication lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		    
		    return sharedApplication(NSClassFromString("NSApplication"))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShouldEnable() As Boolean
		  #if targetCocoa
		    declare function targetForAction lib CocoaLib selector "targetForAction:to:from:" (id as Ptr, anAction as Ptr, aTarget as Ptr, sender as Ptr) as Ptr
		    
		    return (targetForAction(NSApp, self.ActionSelector, nil, nil) <> nil)
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ActionSelectorName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CommandID() As OSType
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EnableMenu()
	#tag EndHook


	#tag Property, Flags = &h21
		Private localizedTextSet As Boolean
	#tag EndProperty


	#tag Constant, Name = CarbonFramework, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Private
	#tag EndConstant


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
