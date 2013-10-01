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
      Height          =   525
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   75
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
   Begin NotificationObserver Obs
      Height          =   32
      Index           =   -2147483648
      Left            =   1.95e+2
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -5.9e+1
      Width           =   32
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "The IKImageBrowser is not fully implemented yet though this example window will give you a good idea of all the possible features. For example, you can:\r    • Select multiple items\r    • Reorder pictures\r    • Invoke QuickLook by pressing the space bar"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   847
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
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  IKIView.CellsStyleMask = 4 + 8
		  
		  Obs.Register  "", IKIView.id
		  
		  'IKImageBrowserView1.UpdateItemList
		  'IKImageBrowserView1.ReloadAllCellsData
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
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
		  
		  if Keyboard.AsyncShiftKey then
		    me.CollapseGroupAtIndex( itemIndex )
		    
		  else
		    me.ExpandGroupAtIndex( itemIndex )
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as integer, y as integer) As boolean
		  
		  'DReport   "RIGHT CLICKED", x, y
		  
		  base.Append   new MenuItem( "Copy" )
		  
		  return  true
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  DReport  "Event KeyDown with key:", key
		End Function
	#tag EndEvent
	#tag Event
		Sub BackgroundRightClicked(x as integer, y as integer)
		  
		  'DReport  "BACKGROUND CLICKED:", x, y
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem = SelectFolder
		  
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
#tag Events Obs
	#tag Event
		Sub HandleNotification(notification as NSNotification)
		  
		  QReport  "IKImageBrowserView NOTIFICATION", notification.Name
		End Sub
	#tag EndEvent
#tag EndEvents
