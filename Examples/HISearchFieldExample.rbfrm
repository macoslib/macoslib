#tag Window
Begin Window HISearchFieldExample
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1424556733
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "HISearchField Example"
   Visible         =   True
   Width           =   300
   Begin HISearchField HISearchField1
      AcceptFocus     =   True
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      CancelButton    =   True
      DescriptiveText =   "Enter something here"
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      SearchIcon      =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      Top             =   259
      UseFocusRing    =   False
      Visible         =   True
      Width           =   186
   End
   Begin TextField EditField1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   240
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
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
      Left            =   218
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   259
      Underline       =   ""
      Visible         =   True
      Width           =   73
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events HISearchField1
	#tag Event
		Sub Open()
		  dim m as new MacMenu
		  m.TextSize = 12
		  m.Append "Fruit"
		  m.Enabled(1) = false
		  m.Append "Apple"
		  m.Indent(2) = 1
		  m.Append "Grape"
		  m.Indent(3) = 1
		  m.Append "Orange"
		  m.Indent(4) = 1
		  m.Append "-"
		  m.Append "Vegetable"
		  m.Enabled(6) = false
		  m.Append "Carrot"
		  m.Indent(7) = 1
		  m.Append "Eggplant"
		  m.Indent(8) = 1
		  m.Append "Onion"
		  m.Indent(9) = 1
		  
		  m.Underline(9) = true
		  m.Italic(9) = true
		  m.Bold(9) = true
		  
		  me.Menu = m
		End Sub
	#tag EndEvent
	#tag Event
		Sub MenuItemSelected(m as MacMenu, index as Integer)
		  me.DescriptiveText = m.Text(index)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Cancel()
		  me.Text = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  EditField1.AppendText "GotFocus" + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  EditField1.AppendText "LostFocus" + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextAccepted()
		  EditField1.AppendText "Entered: " + me.Text + EndOfLine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim foo as String = HISearchField1.Text
		End Sub
	#tag EndEvent
#tag EndEvents
