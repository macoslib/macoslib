#tag Window
Begin Window SystemExtensionsWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.47e+2
   ImplicitInstance=   True
   LiveResize      =   False
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
   Resizeable      =   False
   Title           =   "System Extensions"
   Visible         =   True
   Width           =   7.29e+2
   Begin GroupBox GroupBox3
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Other Data"
      Enabled         =   True
      Height          =   62
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   6
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   372
      Underline       =   ""
      Visible         =   True
      Width           =   703
      Begin Label DoubleClickTimeLBL
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "SystemDoubleClickTime"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   398
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   679
      End
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Available Printers"
      Enabled         =   True
      Height          =   123
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   242
      Underline       =   ""
      Visible         =   True
      Width           =   702
      Begin Listbox Listbox2
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   ""
         ColumnWidths    =   "35%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   16
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   94
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         InitialValue    =   "Name	Type"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   264
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   679
         _ScrollWidth    =   -1
      End
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Finder Labels"
      Enabled         =   True
      Height          =   189
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   44
      Underline       =   ""
      Visible         =   True
      Width           =   702
      Begin Listbox Listbox1
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   ""
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   18
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   155
         HelpTag         =   "Finder Labels obtained with SystemExtensions module"
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
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
         TextSize        =   11
         TextUnit        =   0
         Top             =   69
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   186
         _ScrollWidth    =   -1
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   64
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "Note that you can use the CustomWorkspaceEvents module to get a notification anytime the user makes changes to the Finder labels (name or color).\r\rYour application can then take the changes into account immediately."
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   69
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   481
      End
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   12
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "SystemExtensions are not invoked with a ""dot notation"" (because Real Studio does not allow extending a module) but they all use System as a prefix. Use the autocompletion feature to access them easily."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   697
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events DoubleClickTimeLBL
	#tag Event
		Sub Open()
		  
		  me.Text = "• Double-click time interval is " + Str( SystemDoubleClickInterval * 1000 ) + " ms, i.e. ~" + Str( SystemDoubleClickIntervalInTicks ) + " Ticks"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox2
	#tag Event
		Sub Open()
		  
		  dim names() as string = SystemListPrinterNames
		  dim types() as string = SystemListPrinterTypes
		  
		  for i as integer = 0 to ubound( names )
		    me.AddRow   names( i ), types( i )
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Sub Open()
		  //Populate the listbox
		  
		  dim labels() as string = SystemFinderLabels
		  dim colors() as Color = SystemFinderLabelColors
		  dim pict as Picture
		  
		  for i as integer = 0 to labels.Ubound
		    me.AddRow   "  " + labels( i )  //Add text
		    
		    //Add a colored rectangle with the label color
		    pict = new Picture( 20, 16, 32 )
		    pict.Graphics.ForeColor = colors( i )
		    pict.Graphics.FillRect( 0, 0, 20, 16 )
		    
		    me.RowPicture( me.LastIndex ) = pict
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
