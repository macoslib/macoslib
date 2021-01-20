#tag Window
Begin Window NSPrinterExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   547
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
   Title           =   "NSPrinter"
   Visible         =   True
   Width           =   879
   Begin Cocoa.NSTableView PrinterTable
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowColumnReordering=   False
      AllowsExpansionToolTips=   False
      AlternatingRowBackground=   False
      AutoDeactivate  =   True
      AutohideScrollbars=   False
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   False
      ColumnCount     =   0
      debugGridColor  =   &c00000000
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   "False"
      FloatValue      =   0.0
      Height          =   547
      HelpTag         =   ""
      HighlightStyle  =   ""
      HorizontalGrid  =   False
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RowHeight       =   0.0
      Scope           =   0
      StringValue     =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   0
      Transparent     =   True
      TypeSelect      =   False
      Underlined      =   False
      UseFocusRing    =   False
      VerticalGrid    =   False
      VerticalScrollbar=   False
      Visible         =   True
      Width           =   288
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function MakePrinterList() As NSTableViewDataSource
		  self.PrinterNames = NSPrinter.Names
		  
		  dim source as new NSTableViewDataSource
		  AddHandler source.RowCount, AddressOf PrinterListRowCount
		  AddHandler source.GetValue, AddressOf PrinterListGetValue
		  AddHandler source.DisallowTableEdit, AddressOf PrinterListDisallowTableEdit
		  
		  return source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrinterListDisallowTableEdit(source as NSTableViewDataSource, tableView as NSTableView, rowIndex as Integer, column as NSTableColumn) As Boolean
		  return true
		  
		  #pragma unused source
		  #pragma unused tableView
		  #pragma unused rowIndex
		  #pragma unused column
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrinterListGetValue(source as NSTableViewDataSource, row as Integer, columnID as String) As String
		  return  PrinterNames(row)
		  
		  #pragma unused source
		  #pragma unused row
		  #pragma unused columnID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrinterListRowCount(source as NSTableViewDataSource) As Integer
		  return 1 + UBound(PrinterNames)
		  
		  #pragma unused source
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private PrinterList As NSTableViewDataSource
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrinterNames() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events PrinterTable
	#tag Event
		Sub Open()
		  dim newColumn as new NSTableColumn("printers")
		  newColumn.Width = me.Width
		  me.AddColumn newColumn
		  me.HeaderView = nil
		  me.AutohideScrollbars = true
		  
		  self.PrinterList = MakePrinterList
		  me.DataSource = self.PrinterList
		  
		  me.VerticalScrollbar = true
		  
		  me.HighlightStyle = NSTableView.SelectionHighlightStyle.SourceList
		End Sub
	#tag EndEvent
#tag EndEvents
