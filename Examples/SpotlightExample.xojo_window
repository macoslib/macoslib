#tag Window
Begin Window SpotlightExample
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
   Resizeable      =   False
   Title           =   "Spotlight"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      BehaviorIndex   =   0
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   297
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   2147483648
      InitialParent   =   ""
      InitialValue    =   " "
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton SearchButton
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField EditField1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF
      BehaviorIndex   =   2
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   252
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   319
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   160
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      BehaviorIndex   =   3
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   17
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Search for files whose names contain"
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   323
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   242
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      BehaviorIndex   =   4
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Left            =   6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   352
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin Timer SearchTimer
      BehaviorIndex   =   5
      Enabled         =   True
      Index           =   2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label StatusText
      AutoDeactivate  =   True
      BehaviorIndex   =   6
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   348
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   378
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function QueryString(filename as String) As String
		  return Replace("kMDItemFSName=""%s""wc", "%s", filename)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Query As MDQuery
	#tag EndProperty


#tag EndWindowCode

