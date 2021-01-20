#tag Window
Begin Window CorePrintingWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Resizeable      =   False
   Title           =   "CorePrinting"
   Visible         =   True
   Width           =   780
   Begin Listbox lbPrinters
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   ",,10%,10%"
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
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	ID	Default	Current"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   620
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton btnRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin PushButton btnSetDefault
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Set Default"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
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
      Top             =   48
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   135
      Transparent     =   False
      Underline       =   False
      Value           =   "Default Printer Name:"
      Visible         =   True
      Width           =   100
   End
   Begin Label lblDefaultPrinterName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Value           =   "Unknown"
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btnSetCurrent
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Set Current"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   80
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   227
      Transparent     =   False
      Underline       =   False
      Value           =   "Current Printer Name:"
      Visible         =   True
      Width           =   100
   End
   Begin Label lblCurrentPrinterName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   652
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   266
      Transparent     =   False
      Underline       =   False
      Value           =   "Unknown"
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub RefreshPrinterList()
		  dim printers() as PMPrinter = CorePrinting.PrinterList
		  dim currentPrinter as PMPrinter = CorePrinting.PrintSession.CurrentPrinter
		  
		  dim li as integer = lbPrinters.ListIndex
		  lbPrinters.DeleteAllRows
		  for row as integer = 0 to printers.Ubound
		    dim thisPrinter as PMPrinter = printers( row )
		    lbPrinters.AddRow( thisPrinter.Name, thisPrinter.ID )
		    if thisPrinter.IsDefault then
		      lbPrinters.Cell( row, 2 ) = "😄"
		    end if
		    if thisPrinter.ID = currentPrinter.ID then
		      lbPrinters.Cell( row, 3 ) = "😄"
		    end if
		    
		    lbPrinters.CellTag( row, 0 ) = thisPrinter
		  next row
		  lbPrinters.ListIndex = li
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateInterface()
		  if lbPrinters.ListCount = 0 or lbPrinters.ListIndex = -1 then
		    btnSetDefault.Enabled = false
		  else
		    btnSetDefault.Enabled = true
		  end if
		  btnSetCurrent.Enabled = btnSetDefault.Enabled
		  
		  lblDefaultPrinterName.Text = CorePrinting.DefaultPrinter
		  lblCurrentPrinterName.Text = CorePrinting.PrintSession.CurrentPrinter.Name
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lbPrinters
	#tag Event
		Sub Open()
		  RefreshPrinterList()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  UpdateInterface
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRefresh
	#tag Event
		Sub Action()
		  RefreshPrinterList()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetDefault
	#tag Event
		Sub Action()
		  dim printer as PMPrinter = lbPrinters.CellTag( lbPrinters.ListIndex, 0 )
		  dim printerName as string = printer.Name
		  if not CorePrinting.SetDefaultPrinter( printerName ) then
		    MsgBox "Couldn't set printer."
		  end if
		  
		  // Or just
		  'printer.SetDefault
		  
		  RefreshPrinterList()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetCurrent
	#tag Event
		Sub Action()
		  dim printer as PMPrinter = lbPrinters.CellTag( lbPrinters.ListIndex, 0 )
		  CorePrinting.PrintSession.CurrentPrinter = printer
		  
		  RefreshPrinterList()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
