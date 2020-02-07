#tag Window
Begin Window ImageTransformExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   293
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Image Transformations"
   Visible         =   True
   Width           =   521
   Begin PushButton PushButton1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Choose"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   421
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   253
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label StaticText1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You should be able to open an image file in any reasonable format, including .icns. This window will display the original image, plus disabled and selected versions of it."
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   222
      Transparent     =   False
      Underline       =   False
      Value           =   "You should be able to open an image file in any reasonable format, including .icns. This window will display the original image, plus disabled and selected versions of it."
      Visible         =   True
      Width           =   389
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   "False"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   False
      Backdrop        =   0
      BehaviorIndex   =   2
      DoubleBuffer    =   False
      Enabled         =   False
      EraseBackground =   True
      Height          =   203
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   False
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   481
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'RegisterCarbonEventHandlerForHIView
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Drawing it here, with the Button having its Default=true,
		  // it'll not work right due to repeated calls to this event in a wrong drawing state
		  // Drawing it from a control's Paint even works, however
		  
		  'if image <> nil then
		  'DrawImages g
		  'end if
		  
		  #pragma unused g
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


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
		  
		  dim carbonBundle as Integer = CFBundleGetBundleWithIdentifier(Carbon.BundleID)
		  
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
		Private Sub DrawImages(g as Graphics)
		  DrawImagesInContext new CGContextGraphicsPort(g)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawImagesInContext(context as CGContext)
		  if self.Image is nil then
		    return
		  end if
		  
		  dim w as Double = 10 + me.Image.Width
		  dim rect as CGRect = CGRectMake(10, 10, Image.Width, Image.Height)
		  context.DrawImage me.Image,              CGRectOffset (rect, w * 0, 0)
		  context.DrawImage me.ImageDisabled, CGRectOffset (rect, w * 1, 0)
		  context.DrawImage me.ImageSelected,  CGRectOffset (rect, w * 2, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ForwardCarbonEventToObject(EventHandlerCallRef as Ptr, EventRef as Ptr, UserData as Integer) As Integer
		  dim returnValue as Integer = eventNotHandledErr
		  for i as Integer = 0 to WindowCount - 1
		    dim w as Window = Window(i)
		    if w.Handle = UserData and w IsA ImageTransformExample then
		      returnValue = ImageTransformExample(w).HandleCarbonEvent(EventHandlerCallRef, EventRef)
		      exit
		    end if
		  next
		  return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleCarbonEvent(EventHandlerCallRef As Ptr, EventRef As Ptr) As Integer
		  soft declare function GetEventClass lib CarbonLib (inEvent as Ptr) as OSType
		  soft declare function GetEventKind lib CarbonLib (inEvent as Ptr) as UInt32
		  
		  soft declare function CallNextEventHandler lib CarbonLib (inCallRef as Ptr, inEvent as Ptr) as Integer
		  
		  
		  dim eventClass as String = GetEventClass(EventRef)
		  dim eventKind as UInt32 = GetEventKind(EventRef)
		  select case eventClass
		  case kEventClassControl
		    select case eventKind
		    case kEventControlDraw
		      dim f as Integer = CallNextEventHandler(EventHandlerCallRef, EventRef)
		      #pragma unused f
		      
		      soft declare function GetEventParameter lib CarbonLib (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as Ptr) as Integer
		      dim contextRef as Ptr
		      dim OSError as Integer = GetEventParameter(eventRef, kEventParamCGContextRef, typeCGContextRef, nil, 4, nil, contextRef)
		      if OSError <> noErr then
		        return eventNotHandledErr
		      end if
		      dim context as new CGContext(contextRef, false)
		      DrawImagesInContext context
		      return eventNotHandledErr
		      
		    else
		      return eventNotHandledErr
		    end select
		    
		    
		  else
		    return eventNotHandledErr
		  end select
		  
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
		Private Sub RegisterCarbonEventHandlerForHIView()
		  
		  #pragma StackOverflowChecking False
		  
		  soft declare function InstallEventHandler lib CarbonLib (inTarget as Ptr, inHandler as Integer, inNumTypes as Integer, inList as Ptr,  inUserData as Integer, handlerRef as Ptr) as Integer
		  
		  
		  soft declare function HIViewGetEventTarget lib CarbonLib (inView as Ptr) as Ptr
		  
		  dim eventTarget as Ptr = HIViewGetEventTarget(ContentViewRef)
		  if eventTarget = nil then
		    return
		  end if
		  
		  //inHandler
		  soft declare function NewEventHandlerUPP lib CarbonLib (userRoutine as Ptr) as Integer
		  
		  dim CallbackUPP as Integer = NewEventHandlerUPP(AddressOf ForwardCarbonEventToObject)
		  
		  //events
		  dim eventList(0) as EventTypeSpec
		  eventList(0).eventClass = OSTypeToUInt32(kEventClassControl)
		  eventList(0).eventKind = kEventControlDraw
		  
		  //inUserData
		  
		  
		  //handlerRef
		  //I don't want it returned
		  
		  dim OSError as Integer = InstallEventHandler(eventTarget, CallbackUPP, 1 + UBound(eventList), eventList.CArray, self.Handle, Nil)
		  
		  // Keep the compiler from complaining
		  #pragma unused OSError
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RootView() As Ptr
		  soft declare function HIViewGetRoot lib CarbonLib (inWindow as WindowPtr) as Ptr
		  
		  
		  
		  return HIViewGetRoot(self)
		End Function
	#tag EndMethod


	#tag Note, Name = Notes
		You should be able to open an image file in any reasonable format, including .icns.  
		The window will display the image, plus disabled and selected versions of the image.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Image As CGImage
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageDisabled As CGImage
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageSelected As CGImage
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim dlg as new OpenDialog
		  dlg.PromptText = "Choose an image file to display."
		  //probably we should assign some file types.
		  if dlg.ShowModalWithin(self) is nil then
		    return
		  end if
		  
		  dim source as new CGImageSource(new CFURL(dlg.Result.URLPath))
		  self.Image = source.Image(0)
		  self.ImageDisabled = self.Image.TransformDisabled
		  self.ImageSelected = self.Image.TransformSelected
		  self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // See note in Window's Paint event
		  
		  if image <> nil then
		    DrawImages g
		  end if
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
