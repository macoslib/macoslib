#tag Class
Protected Class MacDatePicker
Inherits Canvas
	#tag Event
		Sub Open()
		  dim v as Variant = me
		  ObjectMap.Value(v.Hash) = me
		  
		  me.ControlRef = me.CreateControl
		  
		  RegisterCarbonEventHandlerForWindow me.ParentWindow
		  RegisterCarbonEventHandlerForUserFocus
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  raiseEvent Close
		  
		  dim v as Variant = me
		  if ObjectMap.HasKey(v.Hash) then
		    ObjectMap.Remove v.Hash
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  me.ControlEnabled = me.Enabled
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CreateControl() As Ptr
		  #if targetMacOS
		    soft declare function CreateClockControl lib CarbonLib (window as WindowPtr, ByRef boundsRect as MacRect, clockType as UInt16, clockFlags as UInt32, ByRef outControl as Ptr) as Int32
		    
		    
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
		  dim char() as String = SplitB(x, "")
		  return ((AscB(char(0))*256 + AscB(char(1)))*256 + AscB(char(2)))*256 + AscB(char(3))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ForwardCarbonEventToObject(EventHandlerCallRef as Ptr, EventRef as Ptr, UserData as Integer) As Integer
		  dim v as Variant = ObjectMap.Lookup(UserData, nil)
		  
		  if v = nil then
		    return eventNotHandledErr
		  end if
		  dim theObject as MacDatePicker = v
		  return theObject.HandleCarbonEvent(EventHandlerCallRef, EventRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleCarbonEvent(EventHandlerCallRef As Ptr, EventRef As Ptr) As Integer
		  soft declare function GetEventClass lib CarbonLib (inEvent as Ptr) as OSType
		  soft declare function GetEventKind lib CarbonLib (inEvent as Ptr) as UInt32
		  
		  dim eventClass as String = GetEventClass(EventRef)
		  dim eventKind as UInt32 = GetEventKind(EventRef)
		  select case eventClass
		  case kEventClassMouse
		    select case eventKind
		    case kEventMouseDown
		      soft declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as CGPoint) as Integer
		      
		      //check coordinates to see if it's one of mine
		      
		      dim hiPoint as CGPoint
		      dim OSError as Integer = GetEventParameter(EventRef, kEventParamWindowMouseLocation, typeHIPoint, nil, CGPoint.Size, nil, hiPoint)
		      
		      soft declare function HIViewConvertPoint lib CarbonLib (ByRef ioPoint as CGPoint, inSourceView as Ptr, inDestView as Ptr) as Integer
		      
		      OSError = HIViewConvertPoint(hiPoint, nil, me.ContentViewRef)
		      if CGRectContainsPoint(CGRectMake(me.Left, me.Top, me.Width, me.Height), hiPoint) <> 0 then
		        soft declare function HIViewClick lib CarbonLib (inView as Ptr, inEvent as Ptr) as Integer
		        
		        dim clickError as Integer = HIViewClick(me.ControlRef, EventRef)
		        return noErr
		        
		      else
		        if not me.ParentWindow.Composite then
		          soft declare function SetKeyboardFocus lib CarbonLib (inWindow as WindowPtr, inControl as Ptr, inPart as Int16) as Int16
		          dim theError as Int16 = SetKeyboardFocus(me.ParentWindow, me.ControlRef, kControlNoPart)
		          if theError <> noErr then
		            break
		          end if
		        end if
		        return eventNotHandledErr
		      end if
		      
		    else
		      return eventNotHandledErr
		    end select
		    
		  case kEventClassTextInput
		    soft declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as UInt16) as Integer
		    
		    select case eventKind
		    case kEventTextInputUnicodeForKeyEvent
		      dim code as UInt16
		      dim OSError as Integer = GetEventParameter(EventRef, kEventParamTextInputSendText, typeUnicodeText, nil, 2, nil, code)
		      if OSError <> 0 then
		        return eventNotHandledErr
		      end if
		      if IsTab(ConvertEncoding(Encodings.UTF16.Chr(code), Encodings.UTF8)) then
		        soft declare function HIViewAdvanceFocus lib CarbonLib (inRootForFocus as Ptr, inModifiers as Integer) as Integer
		        dim osstatus as Integer = HIViewAdvanceFocus(me.ContentViewRef, Modifiers(Keyboard.CommandKey, KeyBoard.ShiftKey, Keyboard.OptionKey, Keyboard.ControlKey))
		        return noErr
		        
		      else
		        return eventNotHandledErr
		      end if
		    else
		      return eventNotHandledErr
		    end select
		  else
		    return eventNotHandledErr
		  end select
		  
		  
		  
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
		  
		  Soft Declare Function CFBundleGetBundleWithIdentifier lib CarbonLib (bundleID as CFStringRef) as Integer
		  
		  dim carbonBundle as Integer = CFBundleGetBundleWithIdentifier("com.apple.Carbon")
		  
		  Soft Declare Function CFBundleGetDataPointerForName lib CarbonLib (bundle as Integer, symbolName as CFStringRef) as Ptr
		  dim contentViewID as Ptr = CFBundleGetDataPointerForName(carbonBundle, "kHIViewWindowContentID")
		  if contentViewID = nil then
		    return nil
		  end if
		  
		  Soft Declare Function HIViewFindByID lib CarbonLib (inStartView as Ptr, signature as Integer, id as Integer, byRef outControl as Ptr) as Integer
		  
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
		Private Function RootView() As Ptr
		  soft declare function HIViewGetRoot lib CarbonLib (inWindow as WindowPtr) as Ptr
		  
		  dim w as Window = me.ParentWindow
		  if w = nil then
		    return nil
		  end if
		  
		  return HIViewGetRoot(w)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandlerForWindow(w as Window)
		  if w = nil then
		    return
		  end if
		  
		  #pragma StackOverflowChecking False
		  
		  soft declare function InstallEventHandler lib CarbonLib (inTarget as Ptr, inHandler as Ptr, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		  
		  //inTarget
		  soft declare function GetWindowEventTarget lib CarbonLib (inObject as WindowPtr) as Ptr
		  
		  dim eventTarget as Ptr = GetWindowEventTarget(w)
		  if eventTarget = nil then
		    return
		  end if
		  
		  //inHandler
		  soft declare function NewEventHandlerUPP lib CarbonLib (userRoutine as Ptr) as Ptr
		  
		  static CallbackUPP as Ptr = NewEventHandlerUPP(AddressOf ForwardCarbonEventToObject)
		  
		  //events
		  dim eventList(0) as EventTypeSpec
		  eventList(0).eventClass = OSTypeToUInt32(kEventClassMouse)
		  eventList(0).eventKind = kEventMouseDown
		  
		  //inUserData
		  dim v as Variant = me
		  
		  //handlerRef
		  //I don't want it returned
		  
		  dim OSError as Integer = InstallEventHandler(eventTarget, CallbackUPP, 1 + UBound(eventList), eventList.CArray, v.Hash, Nil)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterCarbonEventHandlerForUserFocus()
		  #pragma StackOverflowChecking False
		  
		  soft declare function InstallEventHandler lib CarbonLib (inTarget as Ptr, inHandler as Ptr, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		  
		  //inTarget
		  soft declare function GetUserFocusEventTarget lib CarbonLib () as Ptr
		  
		  dim eventTarget as Ptr = GetUserFocusEventTarget()
		  if eventTarget = nil then
		    return
		  end if
		  
		  //inHandler
		  soft declare function NewEventHandlerUPP lib CarbonLib (userRoutine as Ptr) as Ptr
		  
		  static CallbackUPP as Ptr = NewEventHandlerUPP(AddressOf ForwardCarbonEventToObject)
		  
		  //events
		  dim eventList(0) as EventTypeSpec
		  eventList(0).eventClass = OSTypeToUInt32(kEventClassTextInput)
		  eventList(0).eventKind = kEventTextInputUnicodeForKeyEvent
		  
		  //inUserData
		  dim v as Variant = me
		  
		  //handlerRef
		  //I don't want it returned
		  
		  dim OSError as Integer = InstallEventHandler(eventTarget, CallbackUPP, 1 + UBound(eventList), eventList.CArray, v.Hash, Nil)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsTab(key as String) As Boolean
		  static Tab as String = Encodings.UTF8.Chr(9)
		  return (key = Tab)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook


	#tag Property, Flags = &h21
		Private ControlRef As Ptr
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

	#tag Property, Flags = &h21
		Private InitialType As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			if me.ControlRef = nil then
			return false
			end if
			
			#if targetMacOS
			soft declare function HIViewIsVisible lib CarbonLib (inView as Ptr) as Boolean
			
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
			if w.Composite then
			soft declare function HIViewSetVisible lib CarbonLib (inView as Ptr, visible as Boolean) as Integer
			
			dim OSError as Integer = HIViewSetVisible(me.ControlRef, value)
			else
			soft declare function SetControlVisibility lib CarbonLib (inControl as Ptr, inIsVisible as Boolean, inDoDraw as Boolean) as Integer
			
			dim OSError as Integer = SetControlVisibility(me.ControlRef, value, true)
			end if
			#endif
			End Set
		#tag EndSetter
		Private ControlVisible As Boolean
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
			if w.Composite then
			soft declare function HIViewSetEnabled lib CarbonLib (inView as Ptr, inSetEnabled as Boolean) as Integer
			
			dim OSError as Integer = HIViewSetEnabled(me.ControlRef, value)
			
			else
			if me.Enabled then
			soft declare function EnableControl lib CarbonLib (inControl as Ptr) as Integer
			
			dim OSError as Integer = EnableControl(me.ControlRef)
			
			else
			soft declare function DisableControl lib CarbonLib (inControl as Ptr) as Integer
			
			dim OSError as Integer = DisableControl(me.ControlRef)
			end if
			end if
			#endif
			End Set
		#tag EndSetter
		Private ControlEnabled As Boolean
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
			if isLeopard then
			soft declare function GetControlData lib CarbonLib (theControl as Ptr, inPart as Int16, inTagName as OSType, inBufferSize as Integer, ByRef inBuffer as Double, ByRef outActualSize as Integer) as Int16
			
			dim absTime as Double
			dim actualSize as Integer
			dim OSErr as Int16 = GetControlData(me.ControlRef, kControlNoPart, kControlClockAbsoluteTimeTag, 8, absTime, actualSize)
			
			dim CFAbsoluteTimeEpoch as new Date
			CFAbsoluteTimeEpoch.GMTOffset = 0.0
			CFAbsoluteTimeEpoch.Year = 2001
			CFAbsoluteTimeEpoch.Month = 1
			CFAbsoluteTimeEpoch.Day = 1
			CFAbsoluteTimeEpoch.Hour = 0
			CFAbsoluteTimeEpoch.Minute = 0
			CFAbsoluteTimeEpoch.Second = 0
			
			dim d as new Date
			d.TotalSeconds = absTime + CFAbsoluteTimeEpoch.TotalSeconds + 3600.0*d.GMTOffset
			return d
			
			
			else
			soft declare function GetControlData lib CarbonLib (theControl as Ptr, inPart as Int16, inTagName as OSType, inBufferSize as Integer, ByRef inBuffer as LongDateRec, ByRef outActualSize as Integer) as Int16
			
			dim theRec as LongDateRec
			dim actualSize as Integer
			dim OSErr as Int16 = GetControlData(me.ControlRef, kControlNoPart, kControlClockLongDateTag, LongDateRec.Size, theRec, actualSize)
			
			dim d as new Date
			d.Year = theRec.year
			d.Month = theRec.month
			d.Day = theRec.day
			d.Hour = theRec.hour
			d.Minute = theRec.minute
			d.second = theRec.second
			
			return d
			end if
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
			End Set
		#tag EndSetter
		Value As Date
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

	#tag Property, Flags = &h21
		Private InitialFlags As Integer = 1
	#tag EndProperty


	#tag Constant, Name = TypeHourMinute, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeHourMinuteSecond, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMonthDayYear, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMonthYear, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kControlClockLongDateTag, Type = String, Dynamic = False, Default = \"date", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockAbsoluteTimeTag, Type = String, Dynamic = False, Default = \"abst", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockIsDisplayOnly, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kControlClockIsLive, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
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
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
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
			Name="LockTop"
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
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="UseFocusRing"
			Group="Appearance"
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
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Behavior"
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
				"0 - "
				"1 - "
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Live"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
