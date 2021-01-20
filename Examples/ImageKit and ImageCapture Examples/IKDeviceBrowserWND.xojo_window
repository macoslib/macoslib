#tag Window
Begin Window IKDeviceBrowserWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   572
   ImplicitInstance=   True
   LiveResize      =   "True"
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
   Resizeable      =   False
   Title           =   "Scanners and Cameras"
   Visible         =   True
   Width           =   684
   Begin IKDeviceBrowserView IKLB
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      displaysLocalCameras=   False
      displaysLocalScanners=   False
      displaysNetworkCameras=   False
      displaysNetworkScanners=   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   267
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      mode            =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   115
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   377
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open…"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   308
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   390
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu ShowAsPOP
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Table\rOutline\rIcons"
      Italic          =   False
      Left            =   428
      ListIndex       =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   262
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Local scanners"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   140
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   242
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   402
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   116
      Transparent     =   False
      Underline       =   False
      Value           =   "Search:"
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox CheckBox2
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Local cameras/iPhones"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   160
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   242
   End
   Begin CheckBox CheckBox3
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Network scanners"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   181
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   242
   End
   Begin CheckBox CheckBox4
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Network cameras"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   201
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   242
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   400
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   238
      Transparent     =   False
      Underline       =   False
      Value           =   "Show as:"
      Visible         =   True
      Width           =   100
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   103
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Value           =   "The following uses ImageKit (Mac OS X 10.6+) to find the connected scanners, multifunction devices, cameras, iPod or iPhones connected to your computer just like ImageCapture.app does.\r\rWhen opening a device, you can transfer pictures and/or movies to the computer.\r\rNOTE that ImageKit is easy to use and provides a localized UI for most operations. It is based on ImageCaptureCore (IC... objects) which is more powerful but much more difficult to use and does not provide any UI."
      Visible         =   True
      Width           =   661
   End
   Begin PopupMenu TransferPOP
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "For each device, you can choose whether you want that the scan/pictures are written as files to the disk or transferred directly to your application as a MemoryBlock (one for each file)."
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "File\rIn memory"
      Italic          =   False
      Left            =   428
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   317
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "For each device, you can choose whether you want that the scan/pictures are written as files to the disk or transferred directly to your application as a MemoryBlock (one for each file)."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   402
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   292
      Transparent     =   False
      Underline       =   False
      Value           =   "Scan/download as:"
      Visible         =   True
      Width           =   198
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Info"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   390
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox CheckBox6
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show control bar"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   390
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   138
   End
   Begin Separator Separator2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   5
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   445
      Transparent     =   False
      Visible         =   True
      Width           =   662
   End
   Begin Label Label6
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   107
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   16
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   456
      Transparent     =   False
      Underline       =   False
      Value           =   "UNDOCUMENTED FEATURES:\r\rA control bar can be displayed at the bottom of the control, as in the ImageCapture.app application. Its main feature here would be to show/hide the settings for the selected item.\r\rNote that, as it is not documented, such feature might cause your application to be rejected by the MAS. If you want that feature to be completely disabled, set the constant IKDeviceBrowserView.DisableUndocumentedFeatures to true."
      Visible         =   True
      Width           =   661
   End
   Begin Line Line1
      BorderWidth     =   1.0
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "16"
      TabPanelIndex   =   0
      TabStop         =   "True"
      Transparent     =   False
      Visible         =   True
      X1              =   19.0
      X2              =   19.0
      Y1              =   412.0
      Y2              =   444.0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		browser As ICDeviceBrowser
	#tag EndProperty

	#tag Property, Flags = &h0
		w As IKScannerWND
	#tag EndProperty

	#tag Property, Flags = &h0
		w2 As IKCameraDownloadWND
	#tag EndProperty


#tag EndWindowCode

#tag Events IKLB
	#tag Event
		Sub Open()
		  me.displaysLocalCameras = true
		  me.displaysLocalScanners = true
		  me.mode = 1
		  me.Invalidate
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(newSelection as ICDevice)
		  
		  DReport   "Selection changed"
		  
		  #pragma unused newSelection
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  //
		  #pragma unused X
		  #pragma unused Y
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  //
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //
		  #pragma unused Key
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  //
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  //
		  #pragma unused base
		  #pragma unused x
		  #pragma unused y
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  //
		  #pragma unused hitItem
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  
		  dim sel as Ptr = IKLB.SelectedDevice
		  
		  if Cocoa.InheritsFromClass( sel, "ICScannerDevice" ) then
		    
		    w = new IKScannerWND
		    w.IKScannerDeviceView1.ScannerDevice = new ICScannerDevice( sel, false )
		    w.IKScannerDeviceView1.TransferMode = TransferPOP.ListIndex
		    
		    w.Show
		    
		    w = nil
		    
		  elseif Cocoa.InheritsFromClass( sel, "ICCameraDevice" ) then
		    
		    w2 = new IKCameraDownloadWND
		    w2.IKView.CameraDevice = new ICCameraDevice( sel, false )
		    w2.IKView.TransferMode = TransferPOP.ListIndex
		    
		    w2.Show
		    
		    w2 = nil
		  else
		    beep
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShowAsPOP
	#tag Event
		Sub Change()
		  
		  IKLB.mode = me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  
		  IKLB.displaysLocalScanners = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub Action()
		  
		  IKLB.displaysLocalCameras = me.value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox3
	#tag Event
		Sub Action()
		  
		  IKLB.displaysNetworkScanners = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox4
	#tag Event
		Sub Action()
		  
		  IKLB.displaysNetworkCameras = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  
		  dim p as Ptr = IKLB.SelectedDevice
		  
		  dim icd as ICDevice = new ICDevice( p, false )
		  
		  DReportTitled  "Information for device:", icd.Name
		  DReport  "Capabilities:", icd.Capabilities
		  DReport  "Connection type:", icd.transportType
		  DReport  "Has open connection:", icd.HasOpenSession
		  DReport  "Persistent ID:", icd.PersistentIDString
		  DReport  "UUID:", icd.UUIDString
		  DReport  "Serial number:", icd.serialNumberString
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox6
	#tag Event
		Sub Action()
		  
		  IKLB.SetHidesExtrasContainer   NOT (me.Value)
		End Sub
	#tag EndEvent
#tag EndEvents
