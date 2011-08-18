#tag Class
Class NSSearchField
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSSearchField"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  SetDelegate
		  raiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    soft declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    return class_addMethod(class_id, Cocoa.NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMenuItem(title as String)
		  #if targetCocoa
		    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    declare function copy lib CocoaLib selector "copy" (obj_id as Ptr) as Ptr
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as CFStringRef, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    declare sub setTarget lib CocoaLib selector "setTarget:" (obj_id as Ptr, target_id as Ptr)
		    
		    dim items() as Ptr
		    
		    dim enumerator as Ptr = objectEnumerator(itemArray(searchMenuTemplate(self)))
		    do
		      dim ref as Ptr = nextObject(enumerator)
		      if ref <> nil then
		        items.Append copy(ref)
		      else
		        exit
		      end if
		    loop
		    
		    dim newItem as Ptr = initWithTitle(alloc(Cocoa.NSClassFromString("NSMenuItem")), title, Cocoa.NSSelectorFromString("menuAction:"), "")
		    setTarget(newItem, self.GetDelegate)
		    items.Append newItem
		    
		    SetMenu items
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchcontrolTextDidChange(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.TextChanged new NSNotification(notification)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchcontrolTextDidEndEditing(id as Ptr, sel as Ptr, notification as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.EditEnded new NSNotification(notification)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DispatchcontrolTextShouldEndEditing(id as Ptr, sel as Ptr, cntl as Ptr, fieldEditor as Ptr) As Boolean
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      //control:textShouldEndEditing returns false to cancel the edit, but we want to return true to cancel edit.
		      return not obj.EditCancel(new NSText(fieldEditor))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchMenuAction(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSSearchField = NSSearchField(w.Value)
		    if obj <> nil then
		      obj.MenuAction new NSMenuItem(sender)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EditCancel(fieldEditor as NSText) As Boolean
		  return raiseEvent EditCancel(fieldEditor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EditEnded(notification as NSNotification)
		  raiseEvent EditEnded(notification)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if targetCocoa
		    soft declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    soft declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append new Tuple("menuAction:", AddressOf DispatchMenuAction, "v@:@")
		    methodList.Append new Tuple("controlTextDidEndEditing:", AddressOf DispatchcontrolTextDidEndEditing, "v@:@")
		    methodList.Append new Tuple("textShouldEndEditing:", AddressOf DispatchcontrolTextShouldEndEditing, "B@:@@")
		    methodList.Append new Tuple("controlTextDidChange:", AddressOf DispatchcontrolTextDidChange, "v@:@")
		    
		    dim methodsAdded as Boolean
		    for each item as Tuple in methodList
		      methodsAdded = methodsAdded and AddInstanceMethod(newClassId, item(0), item(1), item(2))
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MakeRecentSearchesMenuItems() As Ptr()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:action:keyEquivalent:" (obj_id as Ptr, title as CFStringRef, action as Ptr, keyEquiv as CFStringRef) as Ptr
		    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
		    declare function separatorItem lib CocoaLib selector "separatorItem" (class_id as Ptr) as Ptr
		    
		    
		    dim L() as Ptr
		    
		    dim NSMenuItemClassPtr as Ptr = Cocoa.NSClassFromString("NSMenuItem")
		    
		    dim RecentSearchesTitleItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), RecentSearchesLocalizedText, nil, "")
		    setTag RecentSearchesTitleItem, NSSearchFieldRecentsTitleMenuItemTag
		    L.Append RecentSearchesTitleItem
		    
		    dim item as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), "Item", nil, "")
		    setTag item, NSSearchFieldRecentsMenuItemTag
		    L.Append item
		    
		    dim NoRecentSearchesTitleItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), NoRecentSearchesLocalizedText, nil, "")
		    setTag NoRecentSearchesTitleItem, NSSearchFieldNoRecentsMenuItemTag
		    L.Append NoRecentSearchesTitleItem
		    
		    L.Append separatorItem(NSMenuItemClassPtr)
		    
		    dim clearItem as Ptr = initWithTitle(alloc(NSMenuItemClassPtr), ClearSearchesLocalizedText, nil, "")
		    setTag clearItem, NSSearchFieldClearRecentsMenuItemTag
		    L.Append clearItem
		    
		    dim clearSepItem as Ptr = separatorItem(NSMenuItemClassPtr)
		    setTag clearSepItem, NSSearchFieldClearRecentsMenuItemTag
		    L.Append clearSepItem
		    
		    return L
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MenuAction(item as NSMenuItem)
		  raiseEvent MenuAction item
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecentsAutosaveName() As String
		  #if targetCocoa
		    declare function recentsAutosaveName lib CocoaLib selector "recentsAutosaveName" (obj_id as Ptr) as CFStringRef
		    
		    return recentsAutosaveName(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecentsAutosaveName(assigns value as String)
		  #if targetCocoa
		    declare sub setRecentsAutosaveName lib CocoaLib selector "setRecentsAutosaveName:" (obj_id as Ptr, value as CFStringRef)
		    
		    setRecentsAutosaveName(self, value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecentSearches() As String()
		  #if targetCocoa
		    declare function recentSearches lib CocoaLib selector "recentSearches" (obj_id as Ptr) as Ptr
		    
		    dim L() as String
		    
		    dim recentsArrayPtr as Ptr = recentSearches(self)
		    if recentsArrayPtr = nil then
		      return L
		    end if
		    dim recentsArray as new CFArray(recentsArrayPtr, not CFType.hasOwnership)
		    for i as Integer = 0 to recentsArray.Count - 1
		      dim recentSearch as CFString = CFString(recentsArray.Value(i))
		      recentSearch.Retain
		      L.Append recentSearch
		    next
		    
		    return L
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecentSearches(assigns value() as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  #if targetCocoa
		    declare sub selectText lib CocoaLib selector "selectText:" (obj_id as Ptr, sender as Ptr)
		    
		    selectText(self, self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetMenu(items() as Ptr)
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:" (obj_id as Ptr, title as CFStringRef) as Ptr
		    declare sub addItem lib CocoaLib selector "addItem:" (obj_id as Ptr, item as Ptr)
		    declare sub setSearchMenuTemplate lib CocoaLib selector "setSearchMenuTemplate:" (obj_id as Ptr, menu as Ptr)
		    
		    dim menuRef as Ptr = initWithTitle(alloc(Cocoa.NSClassFromString("NSMenu")), "")
		    for each item as Ptr in items
		      addItem(menuRef, item)
		    next
		    
		    setSearchMenuTemplate(self, menuRef)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRecentSearches() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRecentSearches(assigns value as Boolean)
		  #if targetCocoa
		    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
		    declare function itemArray lib CocoaLib selector "itemArray" (obj_id as Ptr) as Ptr
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    declare function nextObject lib CocoaLib selector "nextObject" (obj_id as Ptr) as Ptr
		    declare function tag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
		    declare function copy lib CocoaLib selector "copy" (obj_id as Ptr) as Ptr
		    
		    dim items() as Ptr
		    
		    if value then
		      for each item as Ptr in MakeRecentSearchesMenuItems
		        items.Append item
		      next
		    end if
		    
		    dim tag_skip_list() as Integer = Array(NSSearchFieldRecentsTitleMenuItemTag, NSSearchFieldRecentsMenuItemTag, NSSearchFieldClearRecentsMenuItemTag, NSSearchFieldNoRecentsMenuItemTag)
		    
		    dim enumerator as Ptr = objectEnumerator(itemArray(searchMenuTemplate(self)))
		    do
		      dim ref as Ptr = nextObject(enumerator)
		      if ref <> nil then
		        if tag_skip_list.IndexOf(tag(ref)) = -1 then
		          items.Append copy(ref)
		        end if
		      else
		        exit
		      end if
		    loop
		    
		    SetMenu items
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TextChanged(notification as NSNotification)
		  raiseEvent TextChanged(notification)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EditCancel(fieldEditor as NSText) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EditEnded(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuAction(item as NSMenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged(notification as NSNotification)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function maximumRecents lib CocoaLib selector "maximumRecents" (obj_id as Ptr) as Integer
			    
			    return maximumRecents(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setMaximumRecents lib CocoaLib selector "setMaximumRecents:" (obj_id as Ptr, value as Integer)
			    
			    setMaximumRecents(self, value)
			  #endif
			End Set
		#tag EndSetter
		MaxRecentSearches As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function placeholderString lib CocoaLib selector "placeholderString" (obj_id as Ptr) as CFStringRef
			    
			    return placeholderString(self.Cell)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setPlaceholderString lib CocoaLib selector "setPlaceholderString:" (obj_id as Ptr, value as CFStringRef)
			    
			    setPlaceholderString(self.Cell, value)
			  #endif
			End Set
		#tag EndSetter
		PlaceholderText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function sendsSearchStringImmediately lib CocoaLib selector "sendsSearchStringImmediately" (obj_id as Ptr) as Boolean
			    
			    if self <> nil then
			      return sendsSearchStringImmediately(self.Cell)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setSendsSearchStringImmediately lib CocoaLib selector "setSendsSearchStringImmediately:" (obj_id as Ptr, value as Boolean)
			    
			    if self <> nil then
			      setSendsSearchStringImmediately(self.Cell, value)
			    else
			      //to be implemented if this property is exposed in IDE.
			    end if
			  #endif
			End Set
		#tag EndSetter
		SendSearchStringImmediately As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function sendsWholeSearchString lib CocoaLib selector "sendsWholeSearchString" (obj_id as Ptr) as Boolean
			    
			    if self <> nil then
			      return sendsWholeSearchString(self.Cell)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setSendsWholeSearchString lib CocoaLib selector "setSendsWholeSearchString:" (obj_id as Ptr, value as Boolean)
			    
			    if self <> nil then
			      setSendsWholeSearchString(self.Cell, value)
			    else
			      //to be implemented if this property is exposed in IDE.
			    end if
			  #endif
			End Set
		#tag EndSetter
		SendWholeSearchString As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
			    
			    return searchMenuTemplate(self) <> nil
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if self.id = nil then
			    return
			  end if
			  
			  #if targetCocoa
			    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
			    declare function initWithTitle lib CocoaLib selector "initWithTitle:" (obj_id as Ptr, title as CFStringRef) as Ptr
			    declare sub setSearchMenuTemplate lib CocoaLib selector "setSearchMenuTemplate:" (obj_id as Ptr, menu as Ptr)
			    declare function searchMenuTemplate lib CocoaLib selector "searchMenuTemplate" (obj_id as Ptr) as Ptr
			    declare sub setAutoenablesItems lib CocoaLib selector "setAutoenablesItems:" (obj_id as Ptr, flag as Boolean)
			    
			    if value then
			      if searchMenuTemplate(self) = nil then
			        dim menuRef as Ptr = initWithTitle(alloc(Cocoa.NSClassFromString("NSMenu")), "")
			        'setAutoenablesItems(menuRef, true)
			        setSearchMenuTemplate self,  menuRef
			      else
			        //menu already exists
			      end if
			    else
			      setSearchMenuTemplate self, nil
			    end if
			  #endif
			End Set
		#tag EndSetter
		ShowMenu As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = ClearSearchesLocalizedText, Type = String, Dynamic = True, Default = \"Clear", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Clear"
	#tag EndConstant

	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSSearchFieldDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NoRecentSearchesLocalizedText, Type = String, Dynamic = True, Default = \"No Recent Searches", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"No Recent Searches"
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldClearRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldNoRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1003", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldRecentsMenuItemTag, Type = Double, Dynamic = False, Default = \"1001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSSearchFieldRecentsTitleMenuItemTag, Type = Double, Dynamic = False, Default = \"1000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = RecentSearchesLocalizedText, Type = String, Dynamic = True, Default = \"Recent Searches", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Recent Searches"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxRecentSearches"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlaceholderText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendSearchStringImmediately"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendWholeSearchString"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowMenu"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
