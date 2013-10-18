#tag Window
Begin Window IKImageBrowserWND
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.54e+2
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
   Title           =   "ImageKit Image Browser"
   Visible         =   True
   Width           =   8.51e+2
   Begin IKImageBrowserView IKIView
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsEmptySelection=   ""
      AllowsMultipleSelection=   ""
      AllowsReordering=   ""
      Animates        =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      CanControlQuickLookPanel=   ""
      CellsStyleMask  =   ""
      ConstrainsToOriginalSize=   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   593
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      NumberOfColumns =   ""
      NumberOfRows    =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   852
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Open image folder…"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Open a folder containing images and display the result. Subfolders are ignored."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   22
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   613
      Underline       =   ""
      Visible         =   True
      Width           =   173
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   666
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Maximum         =   512
      Minimum         =   32
      PageStep        =   20
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   623
      Value           =   64
      Visible         =   True
      Width           =   165
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   702
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Icon size"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   605
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label ColsRowsLBL
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   34
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   240
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Columns:\rRows:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   604
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   134
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  IKIView.CellsStyleMask = 4 + 8
		  
		  DReport  "The IKImageBrowser is not fully implemented yet though this example window will give you a good idea of all the possible features. For example, you can:"
		  DReport  "• Select multiple items"
		  DReport  "• Reorder pictures"
		  DReport  "• Invoke QuickLook by pressing the space bar"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  //On resizing, Xojo will mess the ControlSize up
		  dim myself as NSSlider = new NSSlider( Ptr( Slider1.Handle ))
		  
		  myself.ControlSize = NSSlider.NSControlSize.NSMiniControlSize
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ikds As IKImageBrowserDataSource
	#tag EndProperty

	#tag Property, Flags = &h0
		ikf As IKFolderItemDataSource
	#tag EndProperty


#tag EndWindowCode

#tag Events IKIView
	#tag Event
		Sub SelectionChanged()
		  
		  DReport  "Event SelectionChanged"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick(itemIndex as integer)
		  
		  DReport   "Double clicked on item", itemIndex
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as integer, y as integer) As boolean
		  
		  base.Append   new MenuItem( "Copy" )
		  
		  return  true
		End Function
	#tag EndEvent
	#tag Event
		Sub BackgroundRightClicked(x as integer, y as integer)
		  
		  DReport  "Background clicked at", x, y
		End Sub
	#tag EndEvent
	#tag Event
		Sub Resized()
		  ColsRowsLBL.Text = "Columns: " + Str( IKIView.NumberOfColumns )  + EndOfLine + "Rows:    " + Str( IKIView.NumberOfRows )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim f as FolderItem
		  
		  f = SelectFolder
		  
		  if f<>nil then
		    ikf = new IKFolderItemDataSource( f )
		    
		    IKIView.SetDataSource   ikf
		    
		    IKIView.CanControlQuickLookPanel = true
		    IKIView.AllowsReordering = true
		    IKIView.AllowsMultipleSelection = true
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  
		  IKIView.CellSize = Cocoa.NSMakeSize( me.value, me.value )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  dim myself as NSSlider = new NSSlider( Ptr( me.Handle ))
		  
		  myself.ControlSize = NSSlider.NSControlSize.NSMiniControlSize
		  
		End Sub
	#tag EndEvent
#tag EndEvents
