#tag Class
Class NSAlert
Inherits NSObject
	#tag Method, Flags = &h0
		Function AddButtonWithTitle(buttonTitle as NSString) As NSButton
		  
		  #if TargetMacOS then
		    declare function addButtonWithTitle lib CocoaLib selector "addButtonWithTitle:" (obj_id as Ptr, buttonTitle as CFStringRef) as Ptr
		    
		    return New NSButton( addButtonWithTitle(self, buttonTitle) )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSAlert")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSAlert"))))
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(error as NSError)
		  
		  #if TargetCocoa then
		    declare function alertWithError lib CocoaLib selector "alertWithError:" (obj_id as Ptr, error as Ptr) as Ptr
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    Super.Constructor( alertWithError( Cocoa.NSClassFromString("NSAlert"), errorRef ), not hasOwnership )
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(MessageText as NSString)
		  #if targetMacOS
		    super.Constructor(Initialize(Allocate(Cocoa.NSClassFromString("NSAlert"))))
		    
		    self.MessageText = MessageText
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(messageTitle as NSString, informativeText as NSString, defaultButtonTitle as NSString = Nil, alternateButtonTitle as NSString = Nil, otherButtonTitle as NSString = Nil)
		  
		  #if TargetCocoa then
		    declare function alertWithMessage lib CocoaLib selector "alertWithMessageText:defaultButton:alternateButton:otherButton:informativeTextWithFormat:" (obj_id as Ptr, messageTitle as Ptr, defaultButtonTitle as Ptr, alternateButtonTitle as Ptr, otherButtonTitle as Ptr, informativeText as Ptr) as Ptr
		    
		    dim messageTitleRef, informativeTextRef, defaultButtonTitleRef, alternateButtonTitleRef, otherButtonTitleRef as Ptr
		    
		    if messageTitle <> nil then
		      messageTitleRef = messageTitle
		    end if
		    
		    if informativeText <> nil then
		      informativeTextRef = informativeText
		    end if
		    
		    if defaultButtonTitle <> nil then
		      defaultButtonTitleRef = defaultButtonTitle
		    end if
		    
		    if alternateButtonTitle <> nil then
		      alternateButtonTitleRef = alternateButtonTitle
		    end if
		    
		    if otherButtonTitle <> nil then
		      otherButtonTitleRef = otherButtonTitle
		    end if
		    
		    Super.Constructor( alertWithMessage( Cocoa.NSClassFromString("NSAlert"), messageTitleRef, defaultButtonTitleRef, alternateButtonTitleRef, otherButtonTitleRef, informativeTextRef ), not hasOwnership )
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_alertDidEnd(id as Ptr, sel as Ptr, alert as Ptr, returnCode as Integer, contextInfo as Ptr) As Boolean
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  'dim dict as Dictionary = CocoaDelegateMap
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSAlert = NSAlert(w.Value)
		    if obj <> nil then
		      obj.HandleAlertDidEnd(new NSAlert(alert), returnCode, contextInfo)
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_alertShowHelp(id as Ptr, sel as Ptr, alert as Ptr) As Boolean
		  #pragma unused sel
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSAlert = NSAlert(w.Value)
		    if obj <> nil then
		      return obj.HandleAlertShowHelp(new NSAlert(alert))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  
		  #if TargetMacOS then
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAlertDidEnd(alert as NSAlert, returnCode as Integer, contextInfo as Ptr)
		  RaiseEvent AlertDidEnd( alert, returnCode, contextInfo )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleAlertShowHelp(alert as NSAlert) As Boolean
		  
		  return RaiseEvent AlertShowHelp( alert )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if TargetMacOS then
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      raise new ObjCException
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append "alertShowHelp:" : FPtr( AddressOf delegate_alertShowHelp ) : "B@:@"
		    methodList.Append "alertDidEnd:returnCode:contextInfo:" : FPtr( AddressOf delegate_alertDidEnd ) : "v@:@i@"
		    
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      if NOT class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2)) then
		        Raise new ObjCException
		      end if
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      dim e as new ObjCException
		      e.Message = CurrentMethodName + ". Couldn't create delegate"
		      raise  e
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunModal()
		  
		  #if TargetCocoa then
		    declare sub runModal lib CocoaLib selector "runModal" (obj_id as Ptr)
		    
		    runModal( self )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunModal() As Integer
		  
		  #if TargetCocoa then
		    declare function runModal lib CocoaLib selector "runModal" (obj_id as Ptr) as Integer
		    
		    return runModal( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunSheet(w as Window, contextInfo as ptr = Nil)
		  
		  #if TargetCocoa then
		    declare sub runSheet lib CocoaLib selector "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:" (obj_id as Ptr, windowRef as WindowPtr, modalDelegate as Ptr, alertDidEndSelector as Ptr, contextInfo as Ptr)
		    
		    dim windowRef as WindowPtr
		    if w <> nil then
		      windowRef = w
		    end if
		    
		    runSheet self, windowRef, self.GetDelegate, Cocoa.NSSelectorFromString( "alertDidEnd:returnCode:contextInfo:" ), contextInfo
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  
		  #if TargetMacOS then
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


	#tag Hook, Flags = &h0
		Event AlertDidEnd(alert as NSAlert, returnCode as Integer, contextInfo as Ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AlertShowHelp(alert as NSAlert) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getAccessoryView lib CocoaLib selector "accessoryView" (obj_id as Ptr) as Ptr
			    
			    return new NSView( getAccessoryView(self) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setAccessoryView lib CocoaLib selector "setAccessoryView:" (obj_id as Ptr, value as Ptr)
			    
			    Dim ViewRef as Ptr
			    If value <> nil then
			      ViewRef = value
			    End If
			    
			    setAccessoryView self, ViewRef
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AccessoryView As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getAlertStyle lib CocoaLib selector "alertStyle" (obj_id as Ptr) as Style
			    
			    return getAlertStyle( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setAlertStyle lib cocoalib selector "setAlertStyle:" (obj_id as Ptr, value as Style)
			    
			    setAlertStyle self, value
			  #endif
			End Set
		#tag EndSetter
		AlertStyle As Style
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getButtons lib CocoaLib selector "buttons" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( getButtons(self) )
			  #endif
			End Get
		#tag EndGetter
		Buttons As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getHelpAnchor lib CocoaLib selector "helpAnchor" (obj_id as Ptr) as CFStringRef
			    
			    return getHelpAnchor( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setHelpAnchor lib CocoaLib selector "setHelpAnchor:" (obj_id as Ptr, value as CFStringRef)
			    
			    setHelpAnchor self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		HelpAnchor As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getIcon lib CocoaLib selector "icon" (obj_id as Ptr) as Ptr
			    
			    return New NSImage( getIcon(self) )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setIcon lib CocoaLib selector "setIcon:" (obj_id as Ptr, icon as Ptr)
			    
			    setIcon self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		Icon As NSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getInformativeText lib CocoaLib selector "informativeText" (obj_id as Ptr) as CFStringRef
			    
			    return getInformativeText(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setInformativeText lib CocoaLib selector "setInformativeText:" (obj_id as Ptr, value as CFStringRef)
			    
			    setInformativeText self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		InformativeText As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getMessageText lib CocoaLib selector "messageText" (obj_id as Ptr) as CFStringRef
			    
			    return getMessageText(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS then
			    declare sub setMessageText lib CocoaLib selector "setMessageText:" (obj_id as Ptr, value as CFStringRef)
			    
			    setMessageText self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		MessageText As NSString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function showsHelp lib CocoaLib selector "showsHelp" (obj_id as Ptr) as Boolean
			    
			    return showsHelp(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setShowsHelp lib CocoaLib selector "setShowsHelp:" (obj_id as Ptr, value as Boolean)
			    
			    setShowsHelp self, value
			  #endif
			End Set
		#tag EndSetter
		ShowsHelp As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function showsSuppressionButton lib CocoaLib selector "showsSuppressionButton" (obj_id as Ptr) as Boolean
			    
			    return showsSuppressionButton( self )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setShowsSuppressionButton lib CocoaLib selector "setShowsSuppressionButton:" (obj_id as Ptr, value as Boolean)
			    
			    setShowsSuppressionButton self, value
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		ShowsSuppressionButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getSuppressionButton lib CocoaLib selector "suppressionButton" (obj_id as Ptr) as Ptr
			    
			    return New NSButton( getSuppressionButton(self) )
			  #endif
			End Get
		#tag EndGetter
		SuppressionButton As NSButton
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getWindow lib CocoaLib selector "window" (obj_id as Ptr) as Ptr
			    
			    return New NSWindow( getWindow(self) )
			  #endif
			End Get
		#tag EndGetter
		Window As NSWindow
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSAlert", Scope = Private
	#tag EndConstant


	#tag Enum, Name = Style, Type = Integer, Flags = &h0
		Warning
		  Informational
		Critical
	#tag EndEnum


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
			Type="Integer"
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
			Name="ShowsHelp"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowsSuppressionButton"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
