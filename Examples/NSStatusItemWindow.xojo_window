#tag Window
Begin Window NSStatusItemWindow
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   593336822
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "NSStatusItem Example"
   Visible         =   True
   Width           =   600
   Begin TextArea TextArea1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   334
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Value           =   ""
      Visible         =   True
      Width           =   560
   End
   Begin Label Label1
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Value           =   "Select items from the NSStatusItem ""Test"" (look in main NSStatusBar)"
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  // remove NSStatusItem
		  NSStatusBar.SystemStatusBar.RemoveStatusItem(item1)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  dim bar as NSStatusBar = NSStatusBar.SystemStatusBar
		  item1 = bar.CreateStatusItem(NSStatusBar.NSVariableStatusItemLength, AddressOf StatusItemHandler)
		  item1.title = "Test"
		  item1.highlightMode = true
		  item1.Image = NSImage.StatusAvailable
		  item1.AlternateImage = NSImage.StatusPartiallyAvailable
		  item1.ToolTip = "This is a NSStatusItem"
		  
		  dim mmenu1 as new NSMenu
		  call mmenu1.Append("First option 1")
		  call mmenu1.Append("Second option 1")
		  call mmenu1.Append("Third option 1")
		  call mmenu1.Append("Fourth option 1")
		  
		  dim mmenu2 as new NSMenu
		  call mmenu2.Append("First option 2")
		  call mmenu2.Append("Second option 2")
		  call mmenu2.Append("Third option 2")
		  call mmenu2.Append("Disabled option")
		  mmenu2.itemWithTitle("Disabled option").enabled = false
		  
		  mmenu1.item(2).submenu = mmenu2
		  
		  dim mmenu as new NSMenu
		  call mmenu.Append("First option")
		  call mmenu.Append("Second option")
		  call mmenu.Append("Third option")
		  call mmenu.Append("Fourth option")
		  call mmenu.Append("Fifth option")
		  mmenu.Append(NSMenuItem.CreateSeparatorItem)
		  call mmenu.Append("Another option…")
		  
		  mmenu.item(2).submenu = mmenu1
		  
		  item1.menu = mmenu
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub StatusItemHandler(hitItem as NSMenuItem)
		  
		  TextArea1.appendText "Selected menu """+hitItem.Title+""""+endOfLine
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		item1 As NSStatusItem
	#tag EndProperty


#tag EndWindowCode

