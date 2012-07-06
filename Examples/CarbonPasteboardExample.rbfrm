#tag Window
Begin Window CarbonPasteboardExample
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   600
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
   Title           =   "Carbon Pasteboard"
   Visible         =   True
   Width           =   512
   Begin Listbox TypesList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
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
      Height          =   335
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
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
      TextSize        =   10
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
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   187
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
      LockTop         =   False
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
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   393
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
   Begin Label ClipboardIDText
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
      Left            =   348
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   144
   End
   Begin Timer Timer1
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   -54
      LockedInPosition=   False
      Mode            =   2
      Period          =   200
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -18
      Visible         =   True
      Width           =   32
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
		  self.pboard = CarbonPasteboard.Clipboard
		  
		  reload
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub addItemToList(itemNumber as Integer)
		  dim id as Ptr = pboard.ItemIdentifier(itemNumber)
		  
		  dim types() as String = pboard.ItemFlavors (id)
		  
		  if types = nil then
		    TypesList.AddRow "<Error: "+Str(pboard.LastError)+">"
		  else
		    dim prevType as String
		    for i as integer = 0 to types.Ubound
		      dim type as String = types(i)
		      TypesList.AddRow type
		      TypesList.CellTag (TypesList.LastIndex,0) = type
		      TypesList.Cell (TypesList.LastIndex, 1) = flagsToText (pboard.ItemFlavorFlags (id, type))
		      TypesList.RowTag (TypesList.LastIndex) = id
		      prevType = type
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function flagsToText(flags as UInt32) As String
		  dim s() as String
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorSenderOnly) then
		    s.Append "SenderOnly"
		  end if
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorNotSaved) then
		    s.Append "NotSaved"
		  end if
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorPromised) then
		    s.Append "Promised"
		  end if
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorRequestOnly) then
		    s.Append "RequestOnly"
		  end if
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorSenderTranslated) then
		    s.Append "SenderTranslated"
		  end if
		  if 0 <> (flags and CarbonPasteboard.kPasteboardFlavorSystemTranslated) then
		    s.Append "SystemTranslated"
		  end if
		  return Join (s, ",")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshTypeValue()
		  // updates the TypeValue field with the selected type's content
		  
		  dim selectedIndex as Integer = TypesList.ListIndex
		  
		  if selectedIndex < 0 then
		    TypeValue.Text = ""
		  else
		    dim type as Variant = TypesList.CellTag (selectedIndex, 0)
		    if type.IsNull then
		      // probably the folder
		    else
		      dim id as Ptr = TypesList.RowTag(selectedIndex)
		      dim mb as MemoryBlock = self.pboard.ItemFlavorData (id, type.StringValue)
		      if mb <> nil then
		        dim s as String = mb
		        if s.Len > 1000 then
		          s = s.Left (1000) + " [...]"
		        end
		        TypeValue.Text = s
		      else
		        TypeValue.Text = "<Error: "+Str(pboard.LastError)+">"
		      end
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reload()
		  // rebuilds the types list
		  
		  TypeValue.Text = ""
		  TypesList.DeleteAllRows
		  
		  dim url as CFURL = pboard.PasteLocation()
		  if url <> nil then
		    TypesList.AddRow url.StringValue
		  end if
		  
		  for i as integer = 1 to self.pboard.ItemCount
		    TypesList.AddFolder "Item "+Str(i)
		    TypesList.RowTag (TypesList.LastIndex) = i
		    TypesList.Expanded (TypesList.LastIndex) = true
		  next
		  
		  dim now as new Date
		  ClipboardIDText.Text = Str(mLastChangeCount) + " ("+now.LongTime+")"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateIfChanged()
		  // checks if clipboard has changed, and refreshes our UI then
		  
		  dim changed, isOwn as Boolean
		  self.pboard.Synchronize (changed, isOwn)
		  
		  if changed then
		    mLastChangeCount = mLastChangeCount + 1
		    reload
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLastChangeCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pboard As CarbonPasteboard
	#tag EndProperty


#tag EndWindowCode

#tag Events TypesList
	#tag Event
		Sub Change()
		  refreshTypeValue
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  addItemToList me.RowTag(row)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RefreshButton
	#tag Event
		Sub Action()
		  reload
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
