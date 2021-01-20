#tag Window
Begin Window NSPasteboardExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
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
   Resizeable      =   True
   Title           =   "NSPasteboard"
   Visible         =   True
   Width           =   512
   Begin Listbox TypesList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   335
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   472
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea TypeValue
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   187
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   393
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Value           =   ""
      Visible         =   True
      Width           =   472
   End
   Begin PushButton RefreshButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label ClipboardIDText
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
      Left            =   348
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Value           =   ""
      Visible         =   True
      Width           =   144
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  UpdateIfChanged
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.pboard = NSPasteboard.GeneralPasteboard
		  
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
		    dim s as String = self.pboard.DataForType (TypesList.CellTag (selectedIndex, 0)).Data
		    if s.Len > 1000 then
		      s = s.Left (1000) + " [...]"
		    end
		    TypeValue.Text = s
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reload()
		  // rebuilds the types list
		  
		  dim types() as String = pboard.Types
		  
		  'if types.Count mod 2 <> 0 then
		  '// we expect to always see pairs of equal values with different types
		  'break
		  'end if
		  
		  TypeValue.Text = ""
		  
		  TypesList.DeleteAllRows
		  
		  dim prevType as String
		  for i as integer = 0 to types.Ubound '-1
		    dim origType as String = types(i) 'types.CFStringRefValue(i)
		    dim type as String = origType
		    if type.InStr("CorePasteboardFlavorType") = 1 then
		      // get the hex code past this word
		      dim hexCode as String = type.NthField(" ",2)
		      if hexCode.Left(2) = "0x" then
		        dim mb as new MemoryBlock(4)
		        mb.LittleEndian = false
		        mb.UInt32Value(0) = Val("&h"+hexCode.Mid(3))
		        dim code as String = mb
		        type = "'" + code + "'"
		      end
		    end if
		    'if i mod 2 = 0 then
		    TypesList.AddRow type
		    TypesList.CellTag (TypesList.LastIndex,0) = origType
		    prevType = origType
		    'else
		    'TypesList.Cell (TypesList.LastIndex,1) = type
		    'TypesList.CellTag (TypesList.LastIndex,1) = origType
		    '
		    '// make sure the paired values match
		    'dim t1 as String = self.pboard.DataForType (prevType).Data
		    'dim t2 as String = self.pboard.DataForType (origType).Data
		    'if StrComp (t1, t2, 0) <> 0 then
		    'break
		    'end
		    'end
		  next
		  
		  dim now as new Date
		  ClipboardIDText.Text = Str(mLastChangeCount) + " ("+now.LongTime+")"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateIfChanged()
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
		  UpdateIfChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  self.UpdateIfChanged
		End Sub
	#tag EndEvent
#tag EndEvents
