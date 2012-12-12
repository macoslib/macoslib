#tag Class
Protected Class MacDatePicker
Inherits Canvas
	#tag Event
		Sub Close()
		  raiseEvent Close
		  
		  '+++ we need to destroy the object here, TT believes!
		  
		  dim v as Variant = me
		  if ObjectMap.HasKey(v.Hash) then
		    ObjectMap.Remove v.Hash
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  if suppressEvents = 0 then
		    SetKbdFocus true
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  if suppressEvents = 0 then
		    SetKbdFocus false
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim v as Variant = me
		  ObjectMap.Value(v.Hash) = me
		  
		  me.ControlRef = me.CreateControl
		  
		  RegisterCarbonEventHandlers
		  
		  me.AcceptFocus = true // necessary so we can receive and maintain proper focus
		  
		  me.ControlEnabled = me.Enabled
		  me.ControlVisible = me.Visible
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  me.ControlEnabled = me.Enabled
		  
		  #if targetMacOS
		    declare sub MoveControl lib CarbonLib (ControlRef as Ptr, h as Int16, v as Int16)
		    
		    MoveControl me.ControlRef, me.LocalLeft, me.LocalTop
		  #endif
		  
		  #pragma unused g
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function CFAbsoluteTimeEpoch() As Date
		  dim epoch as new Date
		  epoch.GMTOffset = 0.0
		  epoch.Year = 2001
		  epoch.Month = 1
		  epoch.Day = 1
		  epoch.Hour = 0
		  epoch.Minute = 0
		  epoch.Second = 0
		  return epoch
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ContentViewRef() As Ptr
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
		  
		  declare Function CFBundleGetBundleWithIdentifier lib CarbonLib (bundleID as CFStringRef) as Integer
		  
		  dim carbonBundle as Integer = CFBundleGetBundleWithIdentifier(Carbon.BundleID)
		  
		  declare Function CFBundleGetDataPointerForName lib CarbonLib (bundle as Integer, symbolName as CFStringRef) as Ptr
		  dim contentViewID as Ptr = CFBundleGetDataPointerForName(carbonBundle, "kHIViewWindowContentID")
		  if contentViewID = nil then
		    return nil
		  end if
		  
		  declare Function HIViewFindByID lib CarbonLib (inStartView as Ptr, signature as Integer, id as Integer, byRef outControl as Ptr) as Integer
		  
		  dim theViewRef as Ptr
		  dim OSError as Integer = HIViewFindByID(me.RootView, contentViewID.Integer(0), contentViewID.Integer(4), theViewRef)
		  If OSError <> 0 then
		    break
		    theViewRef = nil
		  End if
		  Return theViewRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateControl() As Ptr
		  #if targetMacOS
		    declare function CreateClockControl lib CarbonLib (window as WindowPtr, ByRef boundsRect as MacRect, clockType as UInt16, clockFlags as UInt32, ByRef outControl as Ptr) as Int32
		    
		    dim bounds as MacRect
		    bounds.top = me.LocalTop
		    bounds.left = me.LocalLeft
		    bounds.bottom = bounds.Top + me.Height
		    bounds.right = bounds.left + me.Width
		    dim p as Ptr
		    dim OSError as Integer = CreateClockControl(me.ParentWindow, bounds, me.InitialType, me.InitialFlags, p)
		    if OSError = noErr then
		      return p
		    else
		      break
		      return nil
		    end if
		  #endif
		  
		  
		  'typedef UInt16 ControlClockType;
		  'enum {
		  'kControlClockTypeHourMinute = 0,
		  'kControlClockTypeHourMinuteSecond = 1,
		  'kControlClockTypeMonthDayYear = 2,
		  'kControlClockTypeMonthYear = 3
		  '};
		  
		  
		  'typedef UInt32 ControlClockFlags;
		  'enum {
		  'kControlClockFlagStandard = 0,
		  'kControlClockNoFlags = 0,
		  'kControlClockFlagDisplayOnly = 1,
		  'kControlClockIsDisplayOnly = 1,
		  'kControlClockFlagLive = 2,
		  'kControlClockIsLive = 2
		  '};
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ForwardCarbonEventToObject(EventHandlerCallRef as Ptr, EventRef as Ptr, UserData as Integer) As Integer
		  dim v as Object = ObjectMap.Lookup(UserData, nil)
		  if v = nil then
		    return eventNotHandledErr
		  end if
		  return MacDatePicker(v).HandleCarbonEvent(EventHandlerCallRef, EventRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleCarbonEvent(EventHandlerCallRef As Ptr, EventRef As Ptr) As Integer
		  declare function GetEventClass lib CarbonLib (inEvent as Ptr) as OSType
		  declare function GetEventKind lib CarbonLib (inEvent as Ptr) as UInt32
		  
		  if not me.Visible or not me.Enabled then
		    return eventNotHandledErr
		  end if
		  
		  dim err as Integer
		  
		  dim eventClass as String = GetEventClass(EventRef)
		  dim eventKind as UInt32 = GetEventKind(EventRef)
		  
		  select case eventClass
		    
		  case kEventClassMouse
		    if eventKind = kEventMouseDown then
		      declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as CGPoint) as Integer
		      declare function HIViewConvertPoint lib CarbonLib (ByRef ioPoint as CGPoint, inSourceView as Ptr, inDestView as Ptr) as Integer
		      declare function HIViewClick lib CarbonLib (inView as Ptr, inEvent as Ptr) as Integer
		      
		      // check coordinates to see if the click targeted our control
		      dim hiPoint as CGPoint
		      err = GetEventParameter(EventRef, kEventParamWindowMouseLocation, typeHIPoint, nil, CGPoint.Size, nil, hiPoint)
		      err = HIViewConvertPoint(hiPoint, nil, me.ContentViewRef)
		      if CGRectContainsPoint(CGRectMake(me.Left, me.Top, me.Width, me.Height), hiPoint) <> 0 then
		        err = HIViewClick(me.ControlRef, EventRef)
		        return noErr
		      else
		        if not me.ParentWindow.Composite then
		          declare function SetKeyboardFocus lib CarbonLib (inWindow as WindowPtr, inControl as Ptr, inPart as Int16) as Int16
		          err = SetKeyboardFocus(me.ParentWindow, me.ControlRef, kControlNoPart)
		          if err = noErr then
		            return noErr
		          end if
		          break // odd, an error occured
		        end if
		      end if
		    end if
		    
		  case kEventClassTextInput
		    
		    if true or HasFocus then
		      if eventKind = kEventTextInputUnicodeForKeyEvent then
		        declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as UInt16) as Integer
		        declare function GetCurrentEventKeyModifiers lib CarbonLib () as UInt32
		        
		        dim code as UInt16
		        err = GetEventParameter(EventRef, kEventParamTextInputSendText, typeUnicodeText, nil, 2, nil, code)
		        if err = 0 and code = 9 then // Tab key? (no need to mess with encodings here because we already requested to get the code as unicode)
		          declare function HIViewAdvanceFocus lib CarbonLib (inRootForFocus as Ptr, inModifiers as Integer) as Integer
		          me.AcceptFocus = false // so that that our superclass (Canvas) isn't getting the focus
		          err = HIViewAdvanceFocus(me.ContentViewRef, GetCurrentEventKeyModifiers())
		          me.AcceptFocus = true
		          return noErr
		        end if
		      end if
		    end if
		    
		  case kEventClassControl
		    if eventKind = kEventControlSetFocusPart then
		      declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as Int16) as Integer
		      declare function SendEventToEventTarget lib CarbonLib (eventRef as Ptr, target as Ptr) as Integer
		      declare function GetControlEventTarget lib CarbonLib (ctrlRef as Ptr) as Ptr
		      declare function GetUserFocusEventTarget lib CarbonLib () as Ptr
		      declare function GetKeyboardFocus lib CarbonLib (windowRef as WindowPtr, ByRef ctrlRef as Ptr) as Integer
		      declare function HIViewSubtreeContainsFocus lib CarbonLib (ref as Ptr) as Boolean
		      
		      dim part as Int16
		      call GetEventParameter(EventRef, kEventParamControlPart, typeControlPartCode, nil, 2, nil, part)
		      
		      if suppressEvents = 0 then
		        suppressEvents = 1
		        err = SendEventToEventTarget (EventRef, GetControlEventTarget(me.ControlRef))
		        suppressEvents = 0
		        if err <> 0 then break
		        
		        if part <> 0 then
		          suppressEvents = suppressEvents + 1
		          'super.SetFocus
		          suppressEvents = suppressEvents - 1
		        end
		        
		        return noErr
		        
		      end
		      
		    end
		    
		  end select
		  
		  return eventNotHandledErr
		  
		  #pragma unused EventHandlerCallRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocalLeft() As Integer
		  dim w as Window = me.Window
		  if w isA ContainerControl then
		    return w.Left + me.Left
		  else
		    return me.Left
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LocalTop() As Integer
		  dim w as Window = me.Window
		  if w isA ContainerControl then
		    return w.Top + me.Top
		  else
		    return me.Top
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Modifiers(commandKey as Boolean, shiftKey as Boolean, optionKey as Boolean, controlKey as Boolean) As UInt16
		  dim theResult as UInt16
		  if commandKey then
		    theResult = theResult or ShiftLeft(1, Carbon.cmdKeyBit)
		  end if
		  if shiftKey then
		    theResult = theResult or ShiftLeft(1, Carbon.shiftKeyBit)
		  end if
		  if optionKey then
		    theResult = theResult or ShiftLeft(1, Carbon.optionKeyBit)
		  end if
		  if controlKey then
		    theResult = theResult or ShiftLeft(1, Carbon.controlKeyBit)
		  end if
		  
		  return theResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function OSTypeToUInt32(x as OSType) As UInt32
		  dim d as MemoryBlock = x // Due to bug <feedback://showreport?report_id=16190> we must not use SplitB
		  d.LittleEndian = false
		  return d.UInt32Value(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParentWindow() As Window
		  dim w as Window = me.Window
		  do
		    if w IsA ContainerControl then
		      w = ContainerControl(w).Window
		    else
		      exit
		    end if
		  loop
		  return w
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandler(eventTarget as Ptr, eventClasses() as UInt32, eventKinds() as Integer)
		  if eventTarget <> nil then
		    declare function NewEventHandlerUPP lib CarbonLib (userRoutine as Ptr) as Ptr
		    declare function InstallEventHandler lib CarbonLib (inTarget as Ptr, inHandler as Ptr, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		    
		    static CallbackUPP as Ptr = NewEventHandlerUPP(AddressOf ForwardCarbonEventToObject)
		    
		    dim eventList() as EventTypeSpec
		    redim eventList(eventClasses.Ubound)
		    for i as Integer = 0 to eventClasses.Ubound
		      eventList(i).eventClass = eventClasses(i)
		      eventList(i).eventKind = eventKinds(i)
		    next
		    
		    dim v as Variant = me // inUserData
		    dim err as Integer
		    
		    err = InstallEventHandler(eventTarget, CallbackUPP, 1 + UBound(eventList), eventList.CArray, v.Hash, Nil)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandlers()
		  declare function GetUserFocusEventTarget lib CarbonLib () as Ptr
		  declare function GetWindowEventTarget lib CarbonLib (windowRef as WindowPtr) as Ptr
		  declare function GetControlEventTarget lib CarbonLib (ctrlRef as Ptr) as Ptr
		  
		  dim targetWin as Ptr = GetWindowEventTarget(me.ParentWindow)
		  dim targetCtrl as Ptr = GetControlEventTarget(me.ControlRef)
		  dim targetFocus as Ptr = GetUserFocusEventTarget()
		  
		  if targetWin = nil or targetCtrl = nil or targetFocus = nil then
		    return
		  end if
		  
		  RegisterCarbonEventHandler targetFocus, Array(OSTypeToUInt32(kEventClassTextInput)), Array(kEventTextInputUnicodeForKeyEvent)
		  RegisterCarbonEventHandler targetWin, Array(OSTypeToUInt32(kEventClassMouse)), Array(kEventMouseDown)
		  RegisterCarbonEventHandler targetCtrl, Array(OSTypeToUInt32(kEventClassControl)), Array(kEventControlSetFocusPart)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RootView() As Ptr
		  declare function HIViewGetRoot lib CarbonLib (inWindow as WindowPtr) as Ptr
		  
		  dim w as Window = me.ParentWindow
		  if w = nil then
		    return nil
		  end if
		  
		  return HIViewGetRoot(w)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  SetKbdFocus true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetKbdFocus(gained as Boolean)
		  dim err as Integer
		  if me.Visible and me.Enabled then
		    if gained then
		      declare function SetKeyboardFocus lib CarbonLib (inWindow as WindowPtr, inControl as Ptr, inPart as Int16) as Integer
		      dim part as Integer
		      part = -1
		      err = SetKeyboardFocus(me.ParentWindow, me.ControlRef, part)
		      super.SetFocus
		    else
		      declare sub ClearKeyboardFocus lib CarbonLib (window as WindowPtr)
		      declare sub HIViewAdvanceFocus lib CarbonLib (view as WindowPtr, modifiers as Integer)
		      'ClearKeyboardFocus me.ParentWindow
		    end if
		  end if
		End Sub
	#tag EndMethod


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
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h21
		#tag Setter
			Set
			  if me.ControlRef = nil then
			    return
			  end if
			  
			  
			  #if targetMacOS
			    dim w as Window = me.ParentWindow
			    if w is nil then
			      return
			    end if
			    dim OSError as Integer
			    if w.Composite then
			      soft declare function HIViewSetEnabled lib CarbonLib (inView as Ptr, inSetEnabled as Boolean) as Integer // available in 10.4 and later only!
			      
			      // if you want to use this on OS 10.3 or earlier, you need to set the window's Composite property to false
			      OSError = HIViewSetEnabled(me.ControlRef, value)
			      
			    else
			      if me.Enabled then
			        declare function EnableControl lib CarbonLib (inControl as Ptr) as Integer
			        
			        OSError = EnableControl(me.ControlRef)
			        
			      else
			        declare function DisableControl lib CarbonLib (inControl as Ptr) as Integer
			        
			        OSError = DisableControl(me.ControlRef)
			      end if
			    end if
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private ControlEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ControlRef As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if me.ControlRef = nil then
			    return false
			  end if
			  
			  #if targetMacOS
			    declare function HIViewIsVisible lib CarbonLib (inView as Ptr) as Boolean
			    
			    return HIViewIsVisible(me.ControlRef)
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if me.ControlRef = nil then
			    return
			  end if
			  
			  #if targetMacOS
			    dim w as Window = me.ParentWindow
			    if w is nil then
			      return
			    end if
			    dim OSError as Integer
			    if w.Composite then
			      declare function HIViewSetVisible lib CarbonLib (inView as Ptr, visible as Boolean) as Integer
			      
			      OSError = HIViewSetVisible(me.ControlRef, value)
			    else
			      declare function SetControlVisibility lib CarbonLib (inControl as Ptr, inIsVisible as Boolean, inDoDraw as Boolean) as Integer
			      
			      OSError = SetControlVisibility(me.ControlRef, value, true)
			    end if
			    
			    // Keep the compiler from complaining
			    #pragma unused OSError
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private ControlVisible As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private HasFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialFlags As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InitialType As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ((me.InitialFlags and kControlClockIsLive) = kControlClockIsLive)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> me.Live then
			    me.InitialFlags = me.InitialFlags xor kControlClockIsLive
			  end if
			End Set
		#tag EndSetter
		Live As Boolean
	#tag EndComputedProperty

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
			  return ((me.InitialFlags and kControlClockIsDisplayOnly) = kControlClockIsDisplayOnly)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> me.ReadOnly then
			    me.InitialFlags = me.InitialFlags xor kControlClockIsDisplayOnly
			  end if
			  
			  
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private suppressEvents As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.InitialType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if me.ControlRef <> nil then
			    
			  else
			    me.InitialType = value
			  end if
			End Set
		#tag EndSetter
		Type As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.ControlRef = nil then
			    dim d as new Date
			    d.TotalSeconds = 0
			    return d
			  end if
			  
			  #if targetMacOS
			    dim OSErr as Int16
			    if isLeopard then
			      declare function GetControlData lib CarbonLib (theControl as Ptr, inPart as Int16, inTagName as OSType, inBufferSize as Integer, ByRef inBuffer as Double, ByRef outActualSize as Integer) as Int16
			      
			      dim absTime as Double
			      dim actualSize as Integer
			      OSErr = GetControlData(me.ControlRef, kControlNoPart, kControlClockAbsoluteTimeTag, sizeOfCFAbsoluteTime, absTime, actualSize)
			      
			      dim d as new Date
			      d.TotalSeconds = absTime + CFAbsoluteTimeEpoch.TotalSeconds + 3600.0*d.GMTOffset
			      return d
			      
			      
			    else
			      declare function GetControlData lib CarbonLib (theControl as Ptr, inPart as Int16, inTagName as OSType, inBufferSize as Integer, ByRef inBuffer as LongDateRec, ByRef outActualSize as Integer) as Int16
			      
			      dim theRec as LongDateRec
			      dim actualSize as Integer
			      OSErr = GetControlData(me.ControlRef, kControlNoPart, kControlClockLongDateTag, LongDateRec.Size, theRec, actualSize)
			      
			      dim d as new Date
			      d.Year = theRec.year
			      d.Month = theRec.month
			      d.Day = theRec.day
			      d.Hour = theRec.hour
			      d.Minute = theRec.minute
			      d.second = theRec.second
			      
			      return d
			    end if
			    
			    #pragma unused OSErr
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'OSErr SetControlData (
			  'ControlRef inControl,
			  'ControlPartCode inPart,
			  'ResType inTagName,
			  'Size inSize,
			  'const void *inData
			  ');
			  
			  #if targetMacOS
			    if me.ControlRef = nil then
			      return
			    end if
			    
			    if value is nil then
			      return
			    end if
			    
			    soft declare function SetControlData lib CarbonLib (inControl as Ptr, inPart as Int16, inTagName as OSType, inSize as Integer, ByRef inData as Double) as Int16
			    
			    dim abstime as Double = value.TotalSeconds - CFAbsoluteTimeEpoch.TotalSeconds - 3600.0*value.GMTOffset
			    
			    dim oserr as Int16 = SetControlData(me.ControlRef, kControlNoPart, kControlClockAbsoluteTimeTag, sizeOfCFAbsoluteTime, abstime)
			    //The control needs to be told to redraw following the set.
			    me.Invalidate
			    
			    // Keep the compiler from complaining
			    #pragma unused oserr
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Value As Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Canvas(me).Visible
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.ControlVisible = value
			  Canvas(me).Visible = value
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = kControlClockAbsoluteTimeTag, Type = String, Dynamic = False, Default = \"abst", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockIsDisplayOnly, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockIsLive, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockLongDateTag, Type = String, Dynamic = False, Default = \"date", Scope = Private
	#tag EndConstant

	#tag Constant, Name = sizeOfCFAbsoluteTime, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TypeHourMinute, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeHourMinuteSecond, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMonthDayYear, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMonthYear, Type = Double, Dynamic = False, Default = \"3", Scope = Public
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
			Name="Backdrop"
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Group="Behavior"
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
			Name="Live"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - HourMinute"
				"1 - HourMinuteSecond"
				"2 - MonthDayYear"
				"3 - MonthYear"
			#tag EndEnumValues
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
