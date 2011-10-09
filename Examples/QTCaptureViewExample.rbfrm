#tag Window
Begin Window QTCaptureViewExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "QTCaptureView"
   Visible         =   True
   Width           =   600
   Begin QTKit.QTCaptureView QTCaptureView1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   323
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   57
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   40
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   208
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Play"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   263
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   15
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events QTCaptureView1
	#tag Event
		Sub Close()
		  dim currentSession as QTCaptureSession = QTCaptureView1.CaptureSession
		  if currentSession <> nil and currentSession.IsRunning then
		    currentSession.StopRunning
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  PopupMenu1.DeleteAllRows
		  
		  dim devices() as QTCaptureDevice = QTCaptureDevice.InputDevices
		  for each device as QTCaptureDevice in devices
		    if device.HasMediaType(QTMedia.TypeVideo) then
		      PopupMenu1.AddRow device.DisplayName
		      PopupMenu1.RowTag(PopupMenu1.ListCount - 1) = device
		    end if
		  next
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  PushButton1.Enabled = (me.ListIndex > -1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  const Stop = "Stop"
		  const Play = "Play"
		  
		  dim currentSession as QTCaptureSession = QTCaptureView1.CaptureSession
		  if currentSession <> nil then
		    if currentSession.IsRunning then
		      currentSession.StopRunning
		      me.Caption = Play
		    else
		      currentSession.StartRunning
		      me.Caption = Stop
		    end if
		  else
		    dim device as QTCaptureDevice = PopupMenu1.RowTag(PopupMenu1.ListIndex)
		    device.Open
		    dim deviceInput as new QTCaptureDeviceInput(device)
		    dim newSession as new QTCaptureSession
		    newSession.AddInput deviceInput
		    newSession.StartRunning
		    QTCaptureView1.CaptureSession = newSession
		    me.Caption = Stop
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
