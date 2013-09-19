#tag Window
Begin Window NSPopoverExample
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.58e+2
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
   Title           =   "NSPopover Example"
   Visible         =   True
   Width           =   3.54e+2
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
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
      Text            =   "Popover Type:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
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
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Position:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   76
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton rdioPopType
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Normal"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
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
      Top             =   20
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton rdioPopType
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "HUD"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   44
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox chkAnimates
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Animates"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   180
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btnShowPopover
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   1
      Cancel          =   ""
      Caption         =   "Show Popover"
      Default         =   ""
      Enabled         =   True
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   209
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12
      TextUnit        =   0
      Top             =   212
      Underline       =   ""
      Visible         =   True
      Width           =   125
   End
   Begin Canvas cvsPositionGroup
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   92
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   76
      UseFocusRing    =   True
      Visible         =   True
      Width           =   202
      Begin RadioButton rdioPopPosition
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Top (NSMinYEdge)"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "cvsPositionGroup"
         Italic          =   ""
         Left            =   132
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   100
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   202
      End
      Begin RadioButton rdioPopPosition
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Right (NSMaxXEdge)"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "cvsPositionGroup"
         Italic          =   ""
         Left            =   132
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
         Top             =   124
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   202
      End
      Begin RadioButton rdioPopPosition
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Bottom (NSMaxYEdge)"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "cvsPositionGroup"
         Italic          =   ""
         Left            =   132
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   148
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   202
      End
      Begin RadioButton rdioPopPosition
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Left (NSMinXEdge)"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "cvsPositionGroup"
         Italic          =   ""
         Left            =   132
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   76
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   202
      End
   End
   Begin NSPopover myPopover
      Animates        =   ""
      Height          =   32
      Index           =   -2147483648
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Shown           =   ""
      TabPanelIndex   =   0
      Top             =   200
      Width           =   32
   End
   Begin Canvas groupingbox
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   128
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   486
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   318
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
      Begin PushButton btnClosePopover
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Close"
         Default         =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "groupingbox"
         Italic          =   ""
         Left            =   615
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   412
         Underline       =   ""
         Visible         =   True
         Width           =   55
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "groupingbox"
         Italic          =   ""
         Left            =   536
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "Popover!"
         TextAlign       =   1
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   334
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
      Begin PopupMenu PopupMenu1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "groupingbox"
         InitialValue    =   "Apples\rOranges\rPears\rTomatoes"
         Italic          =   ""
         Left            =   526
         ListIndex       =   0
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
         Top             =   366
         Underline       =   ""
         Visible         =   True
         Width           =   120
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // TheView.addSubview adds controls in position according to their superview's position, in this case the 'groupingbox' canvas.
		  TheView = New NSView( 0, 0, groupingbox.Width, groupingbox.Height )
		  TheView.AddSubview Label1.View
		  TheView.AddSubview PopupMenu1.View
		  TheView.AddSubview btnClosePopover.View
		  
		  PopoverViewController = New NSViewController
		  DetachedWindowViewController = New NSViewController
		  
		  PopoverViewController.View = TheView
		  DetachedWindowViewController.View = TheView
		  
		  // Use an existing window for the DetachedWindow
		  DetachedWindow = New NSWindow( NSPopoverDetachedWindow )
		  NSPopoverDetachedWindow.Close // NSPopoverDetachedWindow is opened because it's used to create the DetachedWindow, so it's best to close it.
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub createPopover()
		  
		  // Move TheView from DetachedWindow back to myPopover
		  DetachedWindow.ContentView = Nil
		  myPopover.ContentViewController = Nil
		  
		  PopoverViewController.View = TheView
		  myPopover.ContentViewController = PopoverViewController
		  
		  // Appearance
		  if rdioPopType(0).Value then
		    myPopover.Appearance = NSPopover.NSPopoverAppearance.Minimal
		  else
		    myPopover.Appearance = NSPopover.NSPopoverAppearance.HUD
		  end if
		  
		  myPopover.Animates = chkAnimates.Value
		  myPopover.Behavior = NSPopover.NSPopoverBehavior.ApplicationDefined
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DetachedWindow As NSWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		DetachedWindowViewController As NSViewController
	#tag EndProperty

	#tag Property, Flags = &h0
		PopoverViewController As NSViewController
	#tag EndProperty

	#tag Property, Flags = &h0
		TheView As NSView
	#tag EndProperty


#tag EndWindowCode

#tag Events btnShowPopover
	#tag Event
		Sub Action()
		  
		  if myPopover.Shown then
		    myPopover.Close
		  else
		    
		    createPopover
		    
		    // Position
		    dim re as Cocoa.NSRectEdge
		    if rdioPopPosition(0).Value then
		      re = Cocoa.NSRectEdge.NSMinXEdge
		    elseif rdioPopPosition(1).Value then
		      re = Cocoa.NSRectEdge.NSMinYEdge
		    elseif rdioPopPosition(2).Value then
		      re = Cocoa.NSRectEdge.NSMaxXEdge
		    elseif rdioPopPosition(3).Value then
		      re = Cocoa.NSRectEdge.NSMaxYEdge
		    end if
		    
		    myPopover.ShowRelativeToRect me.Bounds, me.View, re
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events myPopover
	#tag Event
		Sub PopoverWillShow(notification as NSNotification)
		  
		  // Close the DetachedWindow so as not to leave behind an 'empty' window when TheView switches back to myPopover.
		  DetachedWindow.Close
		  
		  // If the popover's appearance is HUD, color the text white.
		  if myPopover.Appearance = NSPopover.NSPopoverAppearance.HUD then
		    label1.TextColor = &cFFFFFF
		  else
		    Label1.TextColor = &c000000
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function PopoverShouldClose(popover as NSPopover) As Boolean
		  return True // Return true if popover should close on lost focus, escape key press, performClose and other events.
		End Function
	#tag EndEvent
	#tag Event
		Sub PopoverDidClose(notification as NSNotification)
		  
		  dim closeReason as string = New NSString( notification.UserInfo.Value( New NSString( NSPopover.NSPopoverCloseReasonKey ) ) )
		  
		  if closeReason = NSPopover.NSPopoverCloseReasonStandard then
		    // closeReason can be:
		    //      NSPopoverCloseReasonStandard
		    //      NSPopoverCloseReasonDetachToWindow
		    //
		    // add new code here if you want to respond "after" the popover closes
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub PopoverWillClose(notification as NSNotification)
		  
		  dim closeReason as string = New NSString( notification.UserInfo.Value( New NSString( NSPopover.NSPopoverCloseReasonKey ) ) )
		  
		  if closeReason = NSPopover.NSPopoverCloseReasonDetachToWindow then
		    // closeReason can be:
		    //      NSPopoverCloseReasonStandard
		    //      NSPopoverCloseReasonDetachToWindow
		    //
		    // add new code here if you want to respond "before" the popover closes
		    
		    // Switch the view from the popover to the DetachedWindow just before closing for the best effect.
		    DetachedWindow.ContentView = DetachedWindowViewController.View
		    
		    // Set the detached window style
		    if me.Appearance = NSPopover.NSPopoverAppearance.HUD then
		      DetachedWindow.StyleMask = DetachedWindow.StyleMask or NSWindow.NSHUDWindowMask
		    else
		      DetachedWindow.StyleMask = DetachedWindow.StyleMask and NOT NSWindow.NSHUDWindowMask
		    end if
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DetachableWindowForPopover(popover as NSPopover) As NSWindow
		  
		  me.Animates = false // Using animation when detaching the window moves the DetachedWindow to the background upon mouseUp.
		  return DetachedWindow
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnClosePopover
	#tag Event
		Sub Action()
		  
		  // 'self.close' would keep refering to this window rather then the DetachedWindow.
		  // So get my view's window instead.
		  dim w as NSWindow = me.view.Window
		  
		  if myPopover <> Nil and myPopover.Shown then // Shown from within myPopover
		    myPopover.Close
		  elseif w <> Nil then // Shown from within the DetachedWindow
		    w.Close
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
