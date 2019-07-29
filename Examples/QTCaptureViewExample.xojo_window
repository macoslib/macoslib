#tag Window
Begin Window QTCaptureViewExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
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
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      Backdrop        =   0
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
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PopupMenu PopupMenu1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   40
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   208
   End
   Begin PushButton PushButton1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Play"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   263
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   False
      Underline       =   False
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
		  
		  #pragma unused X
		  #pragma unused Y
		  
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
