#tag Window
Begin Window wndTest
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
   Title           =   "Experimental"
   Visible         =   True
   Width           =   600
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   229
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
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Tab 0\rTab 1\rTab 2\rTab 3\rTab 4\rTab 5"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Value           =   4
      Visible         =   True
      Width           =   560
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Untitled"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   500
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
      Top             =   360
      Underline       =   ""
      Visible         =   True
      Width           =   80
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
      InitialValue    =   "0\r1\r2\r3\r4\r5\r6"
      Italic          =   ""
      Left            =   37
      ListIndex       =   0
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
      Top             =   305
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.FullScreenAllowed = true
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  'TabPanel1.SelectFirstTabViewItem
		  MsgBox Str( self.ScalingFactor )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Change()
		  
		  Select case me.ListIndex
		  case 0
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSBottomTabsBezelBorder
		  case 1
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSLeftTabsBezelBorder
		  case 2
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSNoTabsBezelBorder
		  case 3
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSNoTabsLineBorder
		  case 4
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSNoTabsNoBorder
		  case 5
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSRightTabsBezelBorder
		  case 6
		    TabPanel1.Type = TabPanelExtension.NSTabViewType.NSTopTabsBezelBorder
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
