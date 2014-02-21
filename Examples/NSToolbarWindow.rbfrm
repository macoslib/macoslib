#tag Window
Begin Window NSToolbarWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   525
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
   Title           =   "NSToolbar Example"
   Visible         =   True
   Width           =   846
   Begin TextArea TextArea1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   435
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   70
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   806
   End
   Begin Cocoa.NSSlider NSSlider1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsTickMarkValuesOnly=   ""
      AltIncrementValue=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   103
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MaxValue        =   100
      MinValue        =   0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0.0
      TickPosition    =   0
      Top             =   -74
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   100
   End
   Begin Cocoa.NSSearchField NSSearchField1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   273
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MaxRecentSearches=   0
      Scope           =   0
      SendSearchStringImmediately=   ""
      SendWholeSearchString=   ""
      ShowMenu        =   ""
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0
      Top             =   -74
      Underlined      =   false
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   150
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Hide toolbar baseline"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   37
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   165
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   259
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Enable/Disable item:"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   148
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Toggle"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   633
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      Visible         =   True
      Width           =   80
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
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   419
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      Visible         =   True
      Width           =   196
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // instantiate a new toolbar with a unique identifier and a delegate method for action handling
		  t = new NSToolbar("com.macoslib.test.toolbar", addressOf ToolbarAction)
		  t.AllowsUserCustomization = true // explicitely tell the toolbar to allow the user to customize the toolbar
		  t.AutosavesConfiguration = true // this will save the toolbar configuration in user defaults and reload it at subsequent launches
		  
		  // This is an array of items identifiers to specify the default items (and order) in toolbar
		  // this template is used the first time the app is launched and for defininf the default set in toolbar customization
		  t.DefaultItems = array( _
		  "UserToolbarItem", _
		  "GroupToolbarItem",_
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarShowFontsItemIdentifier, _
		  NSToolbarShowColorsItemIdentifier, _
		  NSToolbarPrintItemIdentifier, _
		  NSToolbarSpaceItemIdentifier, _
		  NSSlider1.name, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  "TemplateToolbarItem",_
		  "HomeToolbarItem", _
		  "SelectToolbarItem",_
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  NSSearchField1.name)
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  t.AllowedItems = array( _
		  "UserToolbarItem", _
		  "GroupToolbarItem",_
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarShowFontsItemIdentifier, _
		  NSToolbarShowColorsItemIdentifier, _
		  NSToolbarPrintItemIdentifier, _
		  NSSlider1.name, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  "TemplateToolbarItem",_
		  "HomeToolbarItem", _
		  "SelectToolbarItem",_
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _
		  NSSearchField1.name)
		  
		  // This (optional) array define the items which allows selection (as in Preferences panel often is used)
		  t.SelectableItems = array( _
		  "UserToolbarItem", _
		  "GroupToolbarItem")
		  
		  // create and add a button item
		  dim ti as new NSToolbarButtonItem("UserToolbarItem") // unique identifier
		  ti.Image = NSImage.User // image
		  ti.ItemLabel = "User" // label shown in toolbar
		  ti.PaletteLabel = "User" // label shown in customization palette (usually the same as ItemLabel)
		  ti.ToolTip = "Show user" // optional tool tip
		  t.AddItem ti // add item to the toolbar
		  
		  // another button item
		  ti = new NSToolbarButtonItem("GroupToolbarItem")
		  ti.Image = NSImage.UserGroup
		  ti.ItemLabel = "Group"
		  ti.PaletteLabel = "Group"
		  ti.ToolTip = "Show group"
		  t.AddItem ti
		  
		  // yet another button item
		  ti = new NSToolbarButtonItem("HomeToolbarItem")
		  ti.Image = MacIcon.NewIconFromOSInfo(MacIcon.kToolbarHomeIcon)
		  ti.ItemLabel = "Home"
		  ti.PaletteLabel = "Home"
		  ti.ToolTip = "Home folder"
		  t.AddItem ti
		  
		  // a button item using a Template (Black/transparent) image
		  ti = new NSToolbarButtonItem("TemplateToolbarItem")
		  ti.Image = NSImage.HomeTemplate
		  ti.Image.Template = true
		  ti.ItemLabel = "Template"
		  ti.PaletteLabel = "Template Image"
		  ti.ToolTip = "Template Image"
		  t.AddItem ti
		  
		  // a custom toolbar item which uses a NSControl subclass
		  dim tc as new NSToolbarCustomItem(NSSlider1) // NSSlider1 is the control to embed
		  tc.itemLabel = "Rate"
		  tc.paletteLabel = "Rate"
		  tc.toolTip = "Set Rate"
		  dim maxSize as Cocoa.NSSize // setup structures for max and min size in toolbar (optional but encouraged)
		  maxSize.height = 32
		  maxSize.width = 200
		  dim minSize as Cocoa.NSSize
		  minSize.height = 24
		  minSize.width = 100
		  tc.maxSize = maxSize
		  tc.minSize = minSize
		  t.addItem tc
		  
		  // a drop menu item display a menu of choices when clicked
		  dim td as new NSToolbarDropMenuItem("SelectToolbarItem")
		  td.image = NSImage.Network
		  td.itemLabel = "Select"
		  td.paletteLabel = "Select"
		  td.toolTip = "Select item"
		  
		  // add menu choices
		  td.AddItem("First option")
		  td.AddItem("Second option")
		  td.AddItem("Third option")
		  td.AddItem("Fourth option")
		  td.AddItem("Fifth option")
		  td.AddSeparator
		  td.AddItem("Another option…")
		  
		  // this is an alternative method to add menu choices
		  // it creates an NSMenu and then assign it to the toolbar item
		  'dim mmenu as new NSMenu
		  'call mmenu.AddItem("First option")
		  'call mmenu.AddItem("Second option")
		  'call mmenu.AddItem("Third option")
		  'call mmenu.AddItem("Fourth option")
		  'call mmenu.AddItem("Fifth option")
		  'mmenu.AddItem(NSMenuItem.SeparatorItem)
		  'call mmenu.AddItem("Another option…")
		  'td.menu = mmenu
		  
		  t.addItem td
		  
		  // another custom toolbar item
		  tc = new NSToolbarCustomItem(NSSearchField1)
		  tc.itemLabel = "Search"
		  tc.paletteLabel = "Search Text"
		  tc.toolTip = "Enter a phrase"
		  tc.maxSize = maxSize
		  tc.minSize = minSize
		  t.addItem tc
		  
		  // since we want a couple of selecable toolbar buttons
		  // just select one as a starting point
		  t.SelectedItemIdentifier = "UserToolbarItem"
		  
		  // tells the window to show the toolbar
		  self.SetToolbar t
		  
		  
		  
		  for each item as NSToolbarItem in t.items
		    PopupMenu1.addRow item.itemIdentifier
		    PopupMenu1.rowTag(PopupMenu1.listcount-1) = item
		  next
		  PopupMenu1.listIndex = 0
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(message as string)
		  TextArea1.appendText message
		  TextArea1.scrollPosition =TextArea1.lineNumAtCharPos(TextArea1.text.len)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToolbarAction(identifier as String, hitItem as NSMenuItem)
		  
		  // here we get the identifier of the clicked toolbar item
		  // and optionally an NSMenuItem for NSToolbarDropMenuItem
		  
		  
		  Log "Selected item """+identifier+""""
		  
		  // just check if hitItem is nil to know if a menu was selected
		  if hitItem <> nil then
		    Log " - Menu """+hitItem.title+""""
		  end if
		  
		  Log endOfLine
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		t As NSToolbar
	#tag EndProperty


#tag EndWindowCode

#tag Events NSSlider1
	#tag Event
		Sub ValueChanged()
		  
		  Log "NSSlider changed value to "+me.stringValue+endofLine
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSSearchField1
	#tag Event
		Sub Open()
		  
		  me.ShowMenu = true
		  me.AddMenuItem "Foo"
		  
		  me.PlaceholderText = "Search"
		  
		  
		  //setting this name means that recent searches will be saved to user defaults under this name.
		  //the shared NSUserDefaults object is saved periodically.
		  me.RecentsAutosaveName = "NSSearchFieldExample.RecentSearches"
		  
		  me.ShowRecentSearches = true
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  beep
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  t.ShowsBaselineSeparator = not me.value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  
		  NSToolbarItem(PopupMenu1.rowTag(PopupMenu1.listIndex)).enabled = not NSToolbarItem(PopupMenu1.rowTag(PopupMenu1.listIndex)).enabled
		End Sub
	#tag EndEvent
#tag EndEvents
