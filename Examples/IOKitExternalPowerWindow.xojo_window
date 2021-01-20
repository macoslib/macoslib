#tag Window
Begin Window IOKitExternalPowerWindow
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
   Resizeable      =   True
   Title           =   "External Power Adapter"
   Visible         =   True
   Width           =   600
   Begin Label AdapterAttachedText
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
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   1
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   ""
      Visible         =   True
      Width           =   600
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   267
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
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   71
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  SetAdapterAttachedState ExternalPowerAdapter.Details
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub SetAdapterAttachedState(adapter as ExternalPowerAdapter)
		  if adapter <> nil then
		    AdapterAttachedText.Text = "An external power adapter is attached."
		    ListBox1.AddRow "Family Code"
		    Listbox1.Cell(Listbox1.LastIndex, 1) = Str(adapter.FamilyCode)
		    
		    ListBox1.AddRow "Adapter ID"
		    Listbox1.Cell(Listbox1.LastIndex, 1) = Str(adapter.ID)
		    
		    ListBox1.AddRow "Adapter Revision"
		    Listbox1.Cell(Listbox1.LastIndex, 1) = Str(adapter.Revision)
		    
		    ListBox1.AddRow "Adapter SerialNumber"
		    Listbox1.Cell(Listbox1.LastIndex, 1) = Str(adapter.SerialNumber)
		    
		    ListBox1.AddRow "Watts"
		    Listbox1.Cell(Listbox1.LastIndex, 1) = Str(adapter.Watts)
		    
		  else
		    AdapterAttachedText.Text = "No external power adapter is attached."
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

