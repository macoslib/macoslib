#tag Window
Begin Window IKImageBrowserWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   654
   ImplicitInstance=   True
   LiveResize      =   True
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
   Title           =   "ImageKit Image Browser"
   Visible         =   True
   Width           =   851
   Begin IKImageBrowserView IKIView
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowsEmptySelection=   False
      AllowsMultipleSelection=   False
      AllowsReordering=   False
      AllowTabs       =   "False"
      Animates        =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      CanControlQuickLookPanel=   False
      CellsStyleMask  =   0
      ConstrainsToOriginalSize=   False
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
      NumberOfColumns =   0
      NumberOfRows    =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   852
   End
   Begin PushButton PushButton2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Open image folder…"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   "Open a folder containing images and display the result. Subfolders are ignored."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   22
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   613
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   173
   End
   Begin Slider Slider1
      AllowAutoDeactivate=   "True"
      AllowLiveScrolling=   "True"
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
      MaximumValue    =   "512"
      Minimum         =   32
      MinimumValue    =   "32"
      PageStep        =   20
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      TickStyle       =   "0"
      Top             =   623
      Transparent     =   False
      Value           =   64
      Visible         =   True
      Width           =   165
   End
   Begin Label Label2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   702
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Icon size"
      TextAlign       =   1
      TextAlignment   =   "2"
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   605
      Transparent     =   False
      Underline       =   False
      Value           =   "Icon size"
      Visible         =   True
      Width           =   100
   End
   Begin Label ColsRowsLBL
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   34
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   240
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Columns:\rRows:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   604
      Transparent     =   False
      Underline       =   False
      Value           =   "Columns:\rRows:"
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
		  
		  #pragma unused x
		  #pragma unused y
		  
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
