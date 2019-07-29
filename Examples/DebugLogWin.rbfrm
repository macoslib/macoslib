#tag Window
Begin Window DebugLogWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "3"
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   231
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   "0"
   Resizable       =   True
   Resizeable      =   "True"
   SystemUIVisible =   True
   Title           =   "Log"
   Type            =   "3"
   Visible         =   True
   Width           =   376
   Begin Listbox theList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   False
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   False
      Border          =   False
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontal=   "0"
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   False
      HasHeader       =   False
      HasHeading      =   False
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   204
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionRequired=   False
      SelectionType   =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   27
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   376
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton markBut
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Mark"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton clearBut
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   109
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Transparent     =   False
      Underline       =   False
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
