#tag Window
Begin Window DebugLogWin
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   231
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
   Title           =   "Log"
   Visible         =   True
   Width           =   376
   Begin Listbox theList
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      BehaviorIndex   =   0
      Bold            =   ""
      Border          =   False
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   204
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "SmallSystem"
      TextSize        =   0
      Top             =   27
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   376
      _ScrollWidth    =   -1
   End
   Begin PushButton markBut
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Mark"
      Default         =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      Top             =   3
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton clearBut
      AutoDeactivate  =   True
      BehaviorIndex   =   2
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Clear"
      Default         =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   109
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      Top             =   3
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  me.Top = Screen(0).Top + 50
		  me.Left = Screen(0).Width - me.Width - 60
		  
		  me.LineNumbers = true
		  me.TimeStamps = false
		  
		  me.setup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub add(s as String, addEOL as Boolean)
		  dim lines() as String = ReplaceLineEndings(s,EndOfLine).Split(EndOfLine)
		  
		  if addEOL then
		    // remove empty lines at end
		    while lines.Ubound > 0 and lines(lines.Ubound).LenB = 0
		      lines.Remove lines.Ubound
		    wend
		  end if
		  
		  for i as Integer = 0 to lines.Ubound
		    dim t as String
		    if me.LineNumbers then
		      t = Format(theList.ListCount+1,"#")
		    end if
		    theList.AddRow t
		    theList.Cell(theList.LastIndex, 1) = lines(i)
		  next
		  
		  // scroll down
		  theList.ScrollPosition = 9999999
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLine(s as String)
		  add s, true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setup()
		  if me.LineNumbers then
		    theList.Column(0).WidthActual = 40
		    theList.ColumnAlignment(0) = ListBox.AlignRight
		  else
		    theList.Column(0).WidthActual = 0
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private lineCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LineNumbers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeStamps As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events markBut
	#tag Event
		Sub Action()
		  add "-----", true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events clearBut
	#tag Event
		Sub Action()
		  theList.DeleteAllRows
		End Sub
	#tag EndEvent
#tag EndEvents
