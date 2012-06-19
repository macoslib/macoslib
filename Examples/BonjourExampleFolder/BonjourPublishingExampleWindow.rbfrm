#tag Window
Begin Window BonjourPublishingExampleWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.89e+2
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
   Resizeable      =   False
   Title           =   "Bonjour Example window"
   Visible         =   True
   Width           =   7.86e+2
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   67
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Before publishing a BonjourService, you should first create a Socket or a ServerSocket with a given port to accept connections from the outside. Then you can publish the Service so clients can find and connect to you.\r\rThe TXTRecord contains some data that the service requires. TXTRecords are usually private."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   741
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Service name:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin TextField NameTF
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   127
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "MacOSLibService"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   102
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   294
   End
   Begin TextField TypeTF
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   127
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "_macoslib._tcp"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   131
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   294
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Service type:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   132
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   430
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "incl. ._udp or ._tcp"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   132
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   130
   End
   Begin TextField DomainTF
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   127
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   163
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   294
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Domain:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   163
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label Label6
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   430
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Usually """", ""."" or ""local."""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   164
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   347
   End
   Begin TextField PortTF
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   127
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   50000
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   195
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   70
   End
   Begin Label Label7
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Port:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   196
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label Label8
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   209
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "The port number that the clients must connect to. This is mandatory."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   196
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   612
   End
   Begin PushButton PublishBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Publish Service"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   41
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   349
      Underline       =   ""
      Visible         =   True
      Width           =   156
   End
   Begin Label Label9
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Each TXT record is composed by ""name=value"""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "TXT Record:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   228
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label Label10
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   603
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      Text            =   "See IANA defined services"
      TextAlign       =   0
      TextColor       =   &h000000FF
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   132
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   174
   End
   Begin Label Label11
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Each TXT record is composed by ""name=value"""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      Text            =   "(optional)"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   248
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   "20%,80%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   100
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Label	Value"
      Italic          =   ""
      Left            =   127
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   229
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   639
      _ScrollWidth    =   -1
   End
   Begin PushButton ChangeTXTBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Change TXT Records"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   605
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   349
      Underline       =   ""
      Visible         =   True
      Width           =   156
   End
   Begin ProgressWheel PW1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   206
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   350
      Visible         =   False
      Width           =   16
   End
   Begin Cocoa.NSImageView IMG1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowCopyCutPaste=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   ""
      DoubleBuffer    =   ""
      Editable        =   ""
      Enabled         =   True
      EraseBackground =   ""
      FocusRingType   =   ""
      FrameStyle      =   ""
      Height          =   16
      HelpTag         =   ""
      ImageAlignment  =   ""
      ImageScaling    =   ""
      Index           =   -2147483648
      initAcceptFocus =   False
      initAlignment   =   0
      initAllowCopyCutPaste=   False
      initEditable    =   False
      initFocusRingType=   ""
      initFrameStyle  =   0
      InitialParent   =   ""
      initImage       =   ""
      initScaling     =   0
      initUseFocusRing=   False
      IsFlipped       =   ""
      Italic          =   ""
      Left            =   274
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0
      Top             =   349
      Underlined      =   ""
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   16
   End
   Begin Label Label12
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   296
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      Text            =   "Status"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   348
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   51
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub PublicationFailed(service as BonjourServiceForPublishing, errCode as integer, errDomain as integer)
		  
		  DReportError   "Publication error", errCode, errDomain
		  
		  IMG1.NativeImage = NSIMage.StatusUnavailable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PublicationStopped(service as BonjourServiceForPublishing)
		  PW1.Visible = false
		  PublishBTN.Caption = "Publish service"
		  PublishBTN.Enabled = true
		  IMG1.NativeImage = NSIMage.StatusNone
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PublicationSucceeded(service as BonjourServiceForPublishing)
		  
		  PW1.Visible = false
		  PublishBTN.Caption = "Stop service"
		  PublishBTN.Enabled = true
		  IMG1.NativeImage = NSIMage.StatusAvailable
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected myService As BonjourServiceForPublishing
	#tag EndProperty


#tag EndWindowCode

#tag Events PublishBTN
	#tag Event
		Sub Action()
		  
		  dim dict as Dictionary
		  
		  if PublishBTN.Caption = "Publish service" then //Start publishing
		    
		    'myService = BonjourModule.PublishService( nameTF.Text, typeTF.Text, DomainTF.Text, val( PortTF.Text ), dict )
		    
		    myService = new BonjourServiceForPublishing( nameTF.Text, TypeTF.Text, DomainTF.Text, val( PortTF.Text ) )
		    
		    AddHandler   myService.Published, AddressOf PublicationSucceeded
		    AddHandler   myService.PublishingError, AddressOf PublicationFailed
		    AddHandler   myService.StoppedPublishing, AddressOf PublicationStopped
		    
		    BonjourModule.PublishService   myService
		    
		    PW1.Visible = true
		    'PublishBTN.Enabled = false
		    PublishBTN.Caption = "Cancel"
		    IMG1.NativeImage = NSIMage.StatusPartiallyAvailable
		    
		  else //Stop publishing
		    PW1.Visible = true
		    PublishBTN.Enabled = false
		    IMG1.NativeImage = NSIMage.StatusPartiallyAvailable
		    
		    myService.StopPublishing
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label10
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  ShowURL   "http://www.dns-sd.org/ServiceTypes.html"
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events IMG1
	#tag Event
		Sub Open()
		  
		  me.NativeImage = NSImage.StatusNone
		End Sub
	#tag EndEvent
#tag EndEvents
