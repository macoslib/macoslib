#tag Window
Begin Window NSPasteboardExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.25e+2
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
   Title           =   "NSPasteboard Example"
   Visible         =   True
   Width           =   5.12e+2
   Begin Listbox TypesList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
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
      Height          =   92
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   472
      _ScrollWidth    =   -1
   End
   Begin TextArea TypeValue
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   249
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   156
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   472
   End
   Begin PushButton RefreshButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Refresh"
      Default         =   ""
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
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  updateIfChanged
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.pboard = NSPasteboard.GeneralPboard
		  
		  reload
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub refreshTypeValue()
		  // updates the TypeValue field with the selected type's content
		  
		  dim selectedIndex as Integer = TypesList.ListIndex
		  
		  if selectedIndex < 0 then
		    TypeValue.Text = ""
		  else
		    TypeValue.Text = self.pboard.DataForType (TypesList.List (selectedIndex)).Data
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reload()
		  // rebuilds the types list
		  
		  dim types as NSArray = pboard.Types
		  
		  TypeValue.Text = ""
		  
		  TypesList.DeleteAllRows
		  for each type as String in types.StringValues
		    TypesList.AddRow type
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateIfChanged()
		  // checks if clipboard has changed, and refreshes our UI then
		  
		  dim changeCount as Integer = pboard.ChangeCount
		  
		  if mLastChangeCount <> changeCount then
		    mLastChangeCount = changeCount
		    reload
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLastChangeCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pboard As NSPasteboard
	#tag EndProperty


#tag EndWindowCode

#tag Events TypesList
	#tag Event
		Sub Change()
		  refreshTypeValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RefreshButton
	#tag Event
		Sub Action()
		  updateIfChanged
		End Sub
	#tag EndEvent
#tag EndEvents
