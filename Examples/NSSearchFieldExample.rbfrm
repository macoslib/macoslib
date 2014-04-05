#tag Window
Begin Window NSSearchFieldExample
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
   Title           =   "NSSearchField"
   Visible         =   True
   Width           =   600
   Begin Cocoa.NSSearchField NSSearchField1
      AcceptFocus     =   True
      AcceptTabs      =   ""
      AllowsExpansionToolTips=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      DoubleValue     =   ""
      Enabled         =   True
      EraseBackground =   ""
      FloatValue      =   ""
      FocusRing       =   True
      Height          =   29
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   30
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      MaxRecentSearches=   ""
      Scope           =   0
      SendSearchStringImmediately=   ""
      SendWholeSearchString=   ""
      ShowMenu        =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   79
      Underlined      =   false
      UseFocusRing    =   False
      Visible         =   True
      Width           =   201
   End
   Begin TextField TextField1
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
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   30
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   127
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   201
   End
   Begin CheckBox SendWholeSearchCheckbox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Send whole search string"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   300
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   65
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   200
   End
   Begin CheckBox SendSearchNowBox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Send search string immediately"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   300
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   88
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   220
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Search"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   500
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
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
   Begin TextField TextField2
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
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   36
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   189
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   195
   End
   Begin CheckBox UseFocusRing
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Use focus ring"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   300
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   112
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   220
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events NSSearchField1
	#tag Event
		Sub MenuAction(item as NSMenuItem)
		  me.PlaceholderText = item.Title
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.TabStop = true
		  NSSearchField1.ShowMenu = true
		  NSSearchField1.AddMenuItem "Foo"
		  NSSearchField1.AddMenuSeparator
		  NSSearchField1.AddMenuItem "Bar"
		  
		  
		  NSSearchField1.PlaceholderText = "Placeholder Text"
		  
		  
		  //setting this name means that recent searches will be saved to user defaults under this name.
		  //the shared NSUserDefaults object is saved periodically.
		  NSSearchField1.RecentsAutosaveName = "NSSearchFieldExample.RecentSearches"
		  
		  NSSearchField1.ShowRecentSearches = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  TextField1.Text = me.StringValue
		  beep
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendWholeSearchCheckbox
	#tag Event
		Sub Open()
		  me.Value = NSSearchField1.SendWholeSearchString
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  NSSearchField1.SendWholeSearchString = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendSearchNowBox
	#tag Event
		Sub Action()
		  NSSearchField1.SendSearchStringImmediately = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Value = NSSearchField1.SendSearchStringImmediately
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  NSSearchField1.Search
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UseFocusRing
	#tag Event
		Sub Action()
		  NSSearchField1.FocusRing = me.Value
		  NSSearchField1.SetFocus // Refresh focus ring if field is already selected.
		End Sub
	#tag EndEvent
#tag EndEvents
