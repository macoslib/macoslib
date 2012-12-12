#tag Class
Protected Class HISearchField
Inherits Canvas
	#tag Event
		Sub Close()
		  Close
		  
		  dim v as Variant = me
		  if ObjectMap.HasKey(v.Hash) then
		    ObjectMap.Remove v.Hash
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  // set focus to me?
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  declare function HandleControlClick Lib CarbonLib (inControl as Integer, inWhere as Integer, inModifiers as Integer, inAction as Integer) as Int16
		  
		  dim click as new MemoryBlock(4)
		  click.Short(0) = Y
		  click.Short(2) = X
		  dim OSErr as Int16 = HandleControlClick(me.HISearchFieldRef, click.Long(0), 0, 0)
		  #pragma unused OSErr
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim v as Variant = me
		  ObjectMap.Value(v.Hash) = me
		  
		  me.HISearchFieldRef = CreateSearchField
		  me.Text = mPresetText
		  me.CancelButton = mPresetCancelButton
		  me.EraseBackground = false
		  
		  me.RegisterCarbonEventHandler
		  
		  Declare Function HIViewAddSubview Lib CarbonLib (inParent as Integer, inNewChild as Integer) as Integer
		  
		  dim OSError as Integer = HIViewAddSubview(me.ContentViewRef, me.HISearchFieldRef)
		  
		  Declare Function HIViewSetFrame Lib CarbonLib (inView as Integer, inRect as Ptr) as Integer
		  
		  dim theBounds as new MemoryBlock(sizeOfHIRect)
		  theBounds.SingleValue(0) = me.Left
		  theBounds.SingleValue(4) = me.Top
		  theBounds.SingleValue(8) = me.Width
		  theBounds.SingleValue(12) = me.Height
		  
		  OSError = HIViewSetFrame(me.HISearchFieldRef, theBounds)
		  
		  
		  declare function HIViewSetVisible Lib CarbonLib (inView as Integer, inVisible as Boolean) as Integer
		  
		  
		  OSError = HIViewSetVisible(me.HISearchFieldRef, true)
		  
		  
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused g
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		  #if targetCarbon
		    
		    if self.HISearchFieldRef = 0 then
		      return
		    end if
		    
		    declare function HIViewSetFrame Lib CarbonLib (inView as Integer, inRect as Ptr) as Integer
		    
		    dim theBounds as new MemoryBlock(sizeOfHIRect)
		    theBounds.SingleValue(0) = me.Left
		    theBounds.SingleValue(4) = me.Top
		    theBounds.SingleValue(8) = me.Width
		    theBounds.SingleValue(12) = me.Height
		    
		    dim OSError as Integer = HIViewSetFrame(me.HISearchFieldRef, theBounds)
		    
		    declare function HIViewSetEnabled Lib CarbonLib (inView as Integer, inSetEnabled as Boolean) as Integer
		    
		    OSError = HIViewSetEnabled(me.HISearchFieldRef, me.Enabled)
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ContentViewRef() As Integer
		  'OSStatus HIViewFindByID (
		  'HIViewRef inStartView,
		  'HIViewID inID,
		  'HIViewRef * outControl
		  ');
		  '
		  'struct ControlID {
		  'OSType signature;
		  'SInt32 id;
		  '};
		  'typedef struct ControlID ControlID;
		  'typedef ControlID HIViewID;
		  
		  declare Function CFBundleGetBundleWithIdentifier Lib CarbonLib (bundleID as CFStringRef) as Integer
		  
		  dim CarbonBundle as Integer = CFBundleGetBundleWithIdentifier("com.apple.Carbon")
		  
		  declare Function CFBundleGetDataPointerForName Lib CarbonLib (bundle as Integer, symbolName as CFStringRef) as Ptr
		  dim contentViewID as Ptr = CFBundleGetDataPointerForName(CarbonBundle, "kHIViewWindowContentID")
		  if contentViewID = nil then
		    return 0
		  end if
		  
		  declare Function HIViewFindByID Lib CarbonLib (inStartView as Integer, signature as Integer, id as Integer, byRef outControl as Integer) as Integer
		  
		  dim theViewRef as Integer
		  dim OSError as Integer = HIViewFindByID(me.RootView, contentViewID.Integer(0), contentViewID.Integer(4), theViewRef)
		  If OSError <> 0 then
		    break
		    theViewRef = 0
		  End if
		  Return theViewRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSearchField() As Integer
		  #if TargetCarbon
		    declare Function HISearchFieldCreate Lib CarbonLib (inBounds as Ptr, inAttributes as Integer, inSearchMenu as Ptr, inDescriptiveText as CFStringRef, ByRef outRef as Integer) as Integer
		    
		    dim hiRect as new MemoryBlock(sizeOfHIRect)
		    hiRect.SingleValue(0) = me.Left
		    hiRect.SingleValue(4) = me.Top
		    hiRect.SingleValue(8) = me.Width
		    hiRect.SingleValue(12) = me.Height
		    dim hiAttributes as Integer
		    if mPresetSearchIcon then
		      hiAttributes = kHISearchFieldAttributesSearchIcon
		    end if
		    dim theSearchField as Integer
		    dim OSError as Integer = HISearchFieldCreate(hiRect, hiAttributes, nil, mPresetDescriptiveText, theSearchField)
		    If OSError <> 0 then
		      System.Log System.LogLevelError,  "HISearchFieldCreate failed with error " + Str(OSError) + "."
		      Return 0
		    End if
		    Return theSearchField
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ForwardCarbonEventToObject(EventHandlerCallRef as Integer, EventRef as Integer, UserData as Integer) As Integer
		  if not ObjectMap.HasKey(UserData) then
		    return eventNotHandledErr
		  end if
		  
		  if not ObjectMap.Value(UserData) isA HISearchField then
		    return eventNotHandledErr
		  end if
		  dim theObject as HISearchField = ObjectMap.Value(UserData)
		  return theObject.HandleCarbonEvent(EventHandlerCallRef, EventRef)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleCarbonEvent(EventHandlerCallRef As Integer, EventRef As Integer) As Integer
		  
		  #if targetCarbon
		    
		    declare Function GetEventClass Lib CarbonLib (inEvent as Integer) as OSType
		    declare Function GetEventKind Lib CarbonLib (inEvent as Integer) as UInt32
		    declare Function GetEventParameter Lib CarbonLib (inEvent as Integer, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, outData as Ptr) as Integer
		    declare Function SetEventParameter Lib CarbonLib (inEvent as Integer, inName as OSType, inType as OSType, inSize as Integer, inDataPtr as Ptr) as Integer
		    
		    dim eventClass as String = GetEventClass(EventRef)
		    dim eventKind as UInt32 = GetEventKind(EventRef)
		    Select Case eventClass
		    Case kEventClassControl
		      Select Case eventKind
		      Case kEventControlGetSizeConstraints
		        'dim minBounds as new MemoryBlock(sizeOfHISize)
		        'minBounds.SingleValue(0) = me.MinWidth
		        'minBounds.SingleValue(4) = 16
		        'dim OSError as Integer = SetEventParameter(EventRef, kEventParamMinimumSize, typeHISize, minBounds.Size, minBounds)
		        'dim maxBounds as new MemoryBlock(sizeOfHISize)
		        'maxBounds.SingleValue(0) = me.MaxWidth
		        'maxBounds.SingleValue(4) = 16
		        'OSError = SetEventParameter(EventRef, kEventParamMaximumSize, typeHISize, maxBounds.Size, maxBounds)
		        Return noErr
		        
		      Case kEventControlSetFocusPart
		        dim buffer as new MemoryBlock(sizeOfShort)
		        dim OSError as Integer = GetEventParameter(EventRef, kEventParamControlPart, typeControlPartCode, Nil, buffer.Size, Nil, buffer)
		        if OSError <> 0 then
		          return eventNotHandledErr
		        end if
		        
		        dim partCode as Integer = buffer.Short(0)
		        select case partCode
		        case kControlFocusNoPart
		          LostFocus
		        case kControlFocusNextPart
		          if me.HasFocus then
		            LostFocus
		          else
		            GotFocus
		          end if
		        case kControlFocusPreviousPart
		          if me.HasFocus then
		            LostFocus
		          else
		            GotFocus
		          end if
		          
		        case kControlEditTextPart  //user clicked in text area
		          if me.HasFocus then
		            //
		          else
		            GotFocus
		          end if
		        else
		          break
		        end select
		        
		        Return eventNotHandledErr
		        
		      Else
		        Return eventNotHandledErr
		      End Select
		      
		    Case kEventClassSearchField
		      Select Case eventKind
		      Case kEventSearchFieldCancelClicked
		        Cancel
		        Return noErr
		      Else
		        Return eventNotHandledErr
		      End Select
		      
		    Case kEventClassTextField
		      Select Case eventKind
		      Case kEventTextAccepted
		        TextAccepted
		        Return noErr
		        
		      Case kEventTextDidChange
		        raiseEvent TextChanged
		        return noErr
		        
		      Else
		        Return eventNotHandledErr
		      End Select
		      
		    Case kEventClassCommand
		      Select Case eventKind
		      Case kEventCommandProcess
		        dim buffer as new MemoryBlock(sizeOfHICommand)
		        dim OSError as Integer = GetEventParameter(EventRef, kEventParamDirectObject, typeHICommand, Nil, buffer.Size, Nil, buffer)
		        #pragma unused OSError
		        MenuItemSelected new MacMenu(buffer.Ptr(8)), buffer.Short(12)
		        Return noErr
		        
		      Else
		        Return eventNotHandledErr
		      End Select
		      
		    Case kEventClassMenu
		      Select Case eventKind
		      Case kEventMenuEnableItems
		        EnableMenuItems
		        Return noErr
		        
		      Else
		        Return eventNotHandledErr
		      End Select
		      
		      
		    Else
		      Return eventNotHandledErr
		    End Select
		    
		  #else
		    #pragma unused EventRef
		  #endif
		  
		  #pragma unused EventHandlerCallRef
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasFocus() As Boolean
		  declare function GetKeyboardFocus lib CarbonLib (inWindow as WindowPtr, ByRef outControl as Integer) as Short
		  
		  dim controlRef as Integer
		  dim OSErr as Short = GetKeyboardFocus(me.Window, controlRef)
		  if OSErr <> 0 then
		    return false
		  end if
		  
		  return controlRef = me.HISearchFieldRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Menu() As MacMenu
		  #if TargetCarbon
		    If me.HISearchFieldRef = 0 then
		      Return nil
		    End if
		    
		    declare Function HISearchFieldGetSearchMenu Lib CarbonLib (inSearchField as Integer, ByRef outSearchMenu as Ptr) as Integer
		    
		    dim menuRef as Ptr
		    dim OSError as Integer = HISearchFieldGetSearchMenu(me.HISearchFieldRef, menuRef)
		    Return new MacMenu(menuRef)
		    
		    #pragma unused OSError
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Menu(Assigns theMenu as MacMenu)
		  #if TargetCarbon
		    If me.HISearchFieldRef = 0 then
		      Return
		    End if
		    
		    declare Function HISearchFieldSetSearchMenu Lib CarbonLib (inSearchField as Integer, inSearchmenu as Ptr) as Integer
		    
		    dim OSError as Integer
		    If theMenu <> nil then
		      OSError = HISearchFieldSetSearchMenu(me.HISearchFieldRef, theMenu)
		      RegisterCarbonEventHandlerForMenu theMenu
		    Else
		      OSError = HISearchFieldSetSearchMenu(me.HISearchFieldRef, nil) //clears menu; carbon event handler is removed with menu
		    End if
		    
		    #pragma unused OSError
		  #else
		    #pragma unused theMenu
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function OSTypeToUInt(s as OSType) As UInt32
		  dim v as Variant = s
		  dim n as UInt32 = v.UInt32Value
		  return n
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandler()
		  If me.HISearchFieldRef = 0 then
		    Return
		  End if
		  
		  #Pragma StackOverflowChecking False
		  
		  declare Function InstallEventHandler Lib CarbonLib (inTarget as Integer, inHandler as Integer, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		  
		  //inTarget
		  declare Function HIObjectGetEventTarget Lib CarbonLib (inObject as Integer) as Integer
		  
		  dim eventTarget as Integer = HIObjectGetEventTarget(me.HISearchFieldRef)
		  If eventTarget = 0 then
		    Return
		  End if
		  
		  //inHandler
		  declare Function NewEventHandlerUPP Lib CarbonLib (userRoutine as Ptr) as Integer
		  
		  Static CallbackUPP as Integer = 0
		  If CallbackUPP = 0 then
		    dim m as MemoryBlock =  AddressOf ForwardCarbonEventToObject
		    If m is nil then
		      Return
		    End if
		    CallbackUPP = NewEventHandlerUPP(m)
		  End if
		  
		  //events
		  Const sizeOfEventTypeSpec = 8
		  Const EventCount  = 6
		  dim eventList as new MemoryBlock(EventCount*sizeOfEventTypeSpec)
		  eventList.UInt32Value(0) = OSTypeToUInt(kEventClassControl)
		  eventList.UInt32Value(4) = kEventControlGetSizeConstraints
		  eventList.UInt32Value(8) = OSTypeToUInt(kEventClassSearchField)
		  eventList.UInt32Value(12) = kEventSearchFieldCancelClicked
		  eventList.UInt32Value(16) = OSTypeToUInt(kEventClassTextField)
		  eventList.UInt32Value(20) = kEventTextAccepted
		  eventList.UInt32Value(24) = OSTypeToUInt(kEventClassControl)
		  eventList.UInt32Value(28) = kEventControlSetFocusPart
		  eventList.UInt32Value(32) = OSTypeToUInt(kEventClassControl)
		  eventList.UInt32Value(36) = kEventControlSetData
		  eventList.UInt32Value(40) = OSTypeToUInt(kEventClassTextField) //only good in OS 10.4
		  eventList.UInt32Value(44) = kEventTextDidChange
		  
		  //inUserData
		  dim v as Variant = me
		  
		  //handlerRef
		  //I don't want it returned
		  
		  dim OSError as Integer = InstallEventHandler(eventTarget, CallbackUPP, eventList.Size\sizeOfEventTypeSpec, eventList, v.Hash, Nil)
		  
		  // Keep the compiler from complaining
		  #pragma unused OSError
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandlerForMenu(theMenu as MacMenu)
		  #if TargetCarbon
		    If theMenu is nil then
		      Return
		    End if
		    
		    #Pragma StackOverflowChecking False
		    
		    declare Function InstallEventHandler Lib CarbonLib (inTarget as Integer, inHandler as Integer, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		    
		    //inTarget
		    declare Function HIObjectGetEventTarget Lib CarbonLib (inObject as Ptr) as Integer
		    
		    dim eventTarget as Integer = HIObjectGetEventTarget(theMenu)
		    If eventTarget = 0 then
		      Return
		    End if
		    
		    //inHandler
		    declare Function NewEventHandlerUPP Lib CarbonLib (userRoutine as Ptr) as Integer
		    
		    Static CallbackUPP as Integer = 0
		    If CallbackUPP = 0 then
		      dim m as MemoryBlock =  AddressOf ForwardCarbonEventToObject
		      If m is nil then
		        Return
		      End if
		      CallbackUPP = NewEventHandlerUPP(m)
		    End if
		    
		    //events
		    Const sizeOfEventTypeSpec = 8
		    Const EventCount  = 2
		    dim eventList as new MemoryBlock(EventCount*sizeOfEventTypeSpec)
		    eventList.UInt32Value(0) = OSTypeToUInt(kEventClassCommand)
		    eventList.UInt32Value(4) = kEventCommandProcess
		    eventList.UInt32Value(8) = OSTypeToUInt(kEventClassMenu)
		    eventList.UInt32Value(12) = kEventMenuEnableItems
		    
		    //inUserData
		    dim v as Variant = me
		    
		    //handlerRef
		    //I don't want it returned
		    
		    dim OSError as Integer = InstallEventHandler(eventTarget, CallbackUPP, eventList.Size\sizeOfEventTypeSpec, eventList, v.Hash, Nil)
		    #pragma unused OSError
		    
		  #else
		    #pragma unused theMenu
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RootView() As Integer
		  #if TargetCarbon
		    declare Function HIViewGetRoot Lib CarbonLib (inWindow as WindowPtr) as Integer
		    
		    If Window Is Nil then
		      Return 0
		    End if
		    
		    Return HIViewGetRoot(Window)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  #if targetCarbon
		    if self.Window = nil then
		      return
		    end if
		    
		    declare function SetKeyboardFocus lib CarbonLib (inWindow as WindowPtr, inControl as Integer, inPart as Int16) as Int16
		    
		    dim err as Int16 = SetKeyboardFocus(self.Window, self.HISearchFieldRef, kControlEditTextPart)
		    if err <> 0 then
		      break
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Cancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuItemSelected(m as MacMenu, index as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextAccepted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook


	#tag Note, Name = Read Me
		HISearchField 10/18/2006
		
		
		HISearchField implements the MacOS X HISearchField control
		for use in REALbasic applications.
		
		HISearchField requires the window's Composite property to be set to true.
		
		http://www.declareSub.com/
		charles@declareSub.com
		
		Everything that can be ©2006 Charles Yeomans
		You're free to use this control in your projects, and
		you're free to pay me if those projects are not freeware, especially
		if you would like some support.
		
		
		---------------------------
		10/18/2006
		
		This version now calls GetFocus and LostFocus event handlers correctly.  Thanks again to Erne.
		
		10/8/2006
		This version fixes some problems with menu item styles.  Thanks to Erne for pointing them out.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCarbon
			    If me.HISearchFieldRef = 0 then
			      Return false
			    End if
			    
			    declare Function HISearchFieldGetAttributes Lib CarbonLib (inSearchField as Integer, ByRef outAttributes as Integer) as Integer
			    
			    dim hiAttributes as Integer
			    dim OSError as Integer = HISearchFieldGetAttributes(me.HISearchFieldRef, hiAttributes)
			    Return Bitwise.BitAnd(hiAttributes, kHISearchFieldAttributesCancel) = kHISearchFieldAttributesCancel
			    
			    #pragma unused OSError
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    declare Function HISearchFieldChangeAttributes Lib CarbonLib (inSearchField as Integer, inAttributesToSet as Integer, inAttributesToClear as Integer) as Integer
			    
			    If me.HISearchFieldRef = 0 then
			      mPresetCancelButton = value
			      Return
			    End if
			    
			    dim OSError as Integer
			    If value then
			      OSError = HISearchFieldChangeAttributes(me.HISearchFieldRef, kHISearchFieldAttributesCancel, 0)
			    Else
			      OSError = HISearchFieldChangeAttributes(me.HISearchFieldRef, 0, kHISearchFieldAttributesCancel)
			    End if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		CancelButton As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCarbon
			    if me.HISearchFieldRef = 0 then
			      return ""
			    end If
			    
			    declare Function HISearchFieldCopyDescriptiveText lib CarbonLib (inSearchField as Integer, ByRef outDescription as CFStringRef) as integer
			    
			    dim description as CFStringRef
			    dim OSError as integer = HISearchFieldCopyDescriptiveText(me.HISearchFieldRef, description)
			    If OSError <> 0 then
			      Return ""
			    End if
			    
			    Return description
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    If me.HISearchFieldRef = 0 then
			      mPresetDescriptiveText = value
			      Return
			    End if
			    
			    declare Function HISearchFieldSetDescriptiveText Lib CarbonLib (inSearchField as Integer, inDescription as CFStringRef) as Integer
			    
			    dim OSError as Integer = HISearchFieldSetDescriptiveText(me.HISearchFieldRef, value)
			    
			    #pragma unused OSError
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DescriptiveText As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private HISearchFieldRef As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPresetCancelButton As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPresetDescriptiveText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPresetSearchIcon As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPresetText As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  static d as new Dictionary
			  return d
			End Get
		#tag EndGetter
		Private Shared ObjectMap As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCarbon
			    If me.HISearchFieldRef = 0 then
			      Return false
			    End if
			    
			    declare Function HISearchFieldGetAttributes Lib CarbonLib (inSearchField as Integer, ByRef outAttributes as Integer) as Integer
			    
			    dim hiAttributes as Integer
			    dim OSError as Integer = HISearchFieldGetAttributes(me.HISearchFieldRef, hiAttributes)
			    Return Bitwise.BitAnd(hiAttributes,kHISearchFieldAttributesSearchIcon) = kHISearchFieldAttributesSearchIcon
			    
			    #pragma unused OSError
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    declare Function HISearchFieldChangeAttributes Lib CarbonLib (inSearchField as Integer, inAttributesToSet as Integer, inAttributesToClear as Integer) as Integer
			    
			    If me.HISearchFieldRef = 0 then
			      mPresetSearchIcon = value
			      Return
			    End if
			    
			    dim OSError as Integer
			    If value then
			      OSError = HISearchFieldChangeAttributes(me.HISearchFieldRef, kHISearchFieldAttributesSearchIcon, 0)
			    Else
			      OSError = HISearchFieldChangeAttributes(me.HISearchFieldRef, 0, kHISearchFieldAttributesSearchIcon)
			    End if
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		SearchIcon As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCarbon
			    if me.HISearchFieldRef = 0 then
			      Return 0
			    End If
			    
			    declare Function GetControlDataSize Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, ByRef outMaxSize as Integer) as Short
			    declare Function GetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inBufferSize as Integer, inBuffer as Ptr, outActualSize as Ptr) as Short
			    
			    dim bufferSize as Integer
			    dim OSError as Integer = GetControlDataSize(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, bufferSize)
			    If bufferSize < 1 then
			      Return 0
			    End if
			    dim buffer as new MemoryBlock(bufferSize)
			    OSError = GetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, buffer.Size, buffer, Nil)
			    If OSError <> 0 then
			      Return 0
			    End if
			    Return buffer.Short(2) - buffer.Short(0)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    If me.HISearchFieldRef = 0 then
			      Return
			    End if
			    
			    declare Function SetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inSize as Integer, inBuffer as Ptr) as Short
			    
			    Const sizeOfControlEditTextSelectionRec = 4
			    dim buffer as new MemoryBlock(sizeOfControlEditTextSelectionRec)
			    buffer.Short(0) = me.SelStart
			    buffer.Short(2) = buffer.Short(0) + value
			    
			    dim OSError as Integer = SetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, sizeOfControlEditTextSelectionRec, buffer)
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		SelLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.HISearchFieldRef = 0 then
			    return 0
			  end if
			  
			  #if TargetCarbon
			    declare Function GetControlDataSize Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, ByRef outMaxSize as Integer) as Short
			    declare Function GetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inBufferSize as Integer, inBuffer as Ptr, outActualSize as Ptr) as Short
			    
			    dim bufferSize as Integer
			    dim OSError as Integer = GetControlDataSize(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, bufferSize)
			    If bufferSize < 1 then
			      Return 0
			    End if
			    dim buffer as new MemoryBlock(bufferSize)
			    OSError = GetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, buffer.Size, buffer, Nil)
			    If OSError <> 0 then
			      Return 0
			    End if
			    Return buffer.Short(0)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    If me.HISearchFieldRef = 0 then
			      Return
			    End if
			    
			    declare Function SetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inSize as Integer, inBuffer as Ptr) as Short
			    
			    Const sizeOfControlEditTextSelectionRec = 4
			    dim buffer as new MemoryBlock(sizeOfControlEditTextSelectionRec)
			    buffer.Short(0) = value
			    buffer.Short(2) = buffer.Short(0) + me.SelLength
			    
			    dim OSError as Integer = SetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextSelectionTag, sizeOfControlEditTextSelectionRec, buffer)
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		SelStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function GetControlDataSize Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, ByRef outMaxSize as Integer) as Short
			  declare Function GetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inBufferSize as Integer,ByRef inBuffer as CFStringRef, outActualSize as Ptr) as Short
			  
			  dim bufferSize as Integer
			  dim OSError as Integer = GetControlDataSize(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextCFStringTag, bufferSize)
			  If bufferSize < 1 then
			    Return ""
			  End if
			  dim buffer as CFStringRef
			  OSError = GetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextCFStringTag, bufferSize, buffer, Nil)
			  If OSError <> 0 then
			    Return ""
			  End if
			  
			  Return buffer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCarbon
			    declare Function SetControlData Lib CarbonLib (inControl as Integer, inPart as Short, inTagName as OSType, inSize as Integer, ByRef inBuffer as CFStringRef) as Short
			    declare Sub CFRelease Lib CarbonLib (cf as Integer)
			    
			    if me.HISearchFieldRef = 0 then
			      mPresetText = value
			      return
			    end
			    
			    dim cfValue as CFStringRef = value
			    dim OSError as Integer = SetControlData(me.HISearchFieldRef, kControlEditTextPart, kControlEditTextCFStringTag, 4, cfValue)
			    
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty


	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Mac Carbon PEF, Language = Default, Definition  = \"CarbonLib"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Carbon.framework"
	#tag EndConstant

	#tag Constant, Name = eventNotHandledErr, Type = Double, Dynamic = False, Default = \"-9874", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlEditTextCFStringTag, Type = String, Dynamic = False, Default = \"cfst", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlEditTextPart, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlEditTextSelectionTag, Type = String, Dynamic = False, Default = \"sele", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlEditTextTextTag, Type = String, Dynamic = False, Default = \"text", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlFocusNextPart, Type = Double, Dynamic = False, Default = \"-1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlFocusNoPart, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlFocusPreviousPart, Type = Double, Dynamic = False, Default = \"-2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventClassCommand, Type = String, Dynamic = False, Default = \"cmds", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventClassControl, Type = String, Dynamic = False, Default = \"cntl", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventClassMenu, Type = String, Dynamic = False, Default = \"menu", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventClassSearchField, Type = String, Dynamic = False, Default = \"srfd", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventClassTextField, Type = String, Dynamic = False, Default = \"txfd", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventCommandProcess, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventControlGetSizeConstraints, Type = Double, Dynamic = False, Default = \"105", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventControlSetData, Type = Double, Dynamic = False, Default = \"103", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventControlSetFocusPart, Type = Double, Dynamic = False, Default = \"7", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventMenuEnableItems, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventParamControlPart, Type = String, Dynamic = False, Default = \"cprt", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventParamDirectObject, Type = String, Dynamic = False, Default = \"----", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventSearchFieldCancelClicked, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventTextAccepted, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEventTextDidChange, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kHISearchFieldAttributesCancel, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kHISearchFieldAttributesSearchIcon, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = noErr, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfHICommand, Type = Double, Dynamic = False, Default = \"14", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfHIRect, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfHISize, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfShort, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = typeControlPartCode, Type = String, Dynamic = False, Default = \"cprt", Scope = Private
	#tag EndConstant

	#tag Constant, Name = typeHICommand, Type = String, Dynamic = False, Default = \"hcmd", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CancelButton"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DescriptiveText"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			InitialValue="False"
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
			InitialValue="False"
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
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchIcon"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelStart"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
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
