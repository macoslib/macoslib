#tag Window
Begin Window NSColorWindow
   BackColor       =   16777215
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
   Title           =   "NSColors"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "*, 120"
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
      Height          =   353
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Color	 "
      Italic          =   ""
      Left            =   0
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
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row < me.ListCount then
		    if column = 1 then
		      dim c as NSColor = me.CellTag(row, 1)
		      g.ForeColor = c.ColorValue
		      g.FillRect 0, 0, g.Width, g.Height
		      return true
		    else
		      return false
		    end if
		    
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim colors() as Pair = Array("AlternateSelectedControlColor" : NSColor.AlternateSelectedControlColor, _
		  "AlternateSelectedControlTextColor" : NSColor.AlternateSelectedControlTextColor, _
		  "Black" : NSColor.Black, _
		  "Blue" : NSColor.Blue, _
		  "Brown" : NSColor.Brown, _
		  "Clear" : NSColor.Clear, _
		  "Cyan" : NSColor.Cyan, _
		  "DarkGray" : NSColor.DarkGray, _
		  "Gray" : NSColor.Gray, _
		  "Green" : NSColor.Green, _
		  "LightGray" : NSColor.LightGray, _
		  "Magenta" : NSColor.Magenta, _
		  "Orange" : NSColor.Orange, _
		  "Purple" : NSColor.Purple, _
		  "Red" : NSColor.Red, _
		  "White" : NSColor.White, _
		  "Yellow" : NSColor.Yellow, _
		  "ControlTintBlue" : NSColor.ControlTintBlue, _
		  "ControlTintClear" : NSColor.ControlTintClear, _
		  "ControlTintDefault" : NSColor.ControlTintDefault, _
		  "ControlTintGraphite" : NSColor.ControlTintGraphite)
		  
		  for each item as Pair in colors
		    me.AddRow item.Left.StringValue
		    me.CellTag(me.LastIndex, 1) = item.Right
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
