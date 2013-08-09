#tag Window
Begin Window NSTextViewExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin TextArea TextArea1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   229
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   30
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   93
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   534
   End
   Begin PushButton btnSetBkgColor
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Set Background Color"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   30
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
      Top             =   343
      Underline       =   ""
      Visible         =   True
      Width           =   151
   End
   Begin PushButton btnClearBkgColor
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Clear Background Color"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   328
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
      Top             =   346
      Underline       =   ""
      Visible         =   True
      Width           =   236
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events TextArea1
	#tag Event
		Sub Open()
		  me.Text = chr( 9 ) + chr( 9 ) + "This is red"
		  
		  dim tv as new NSTextView( me )
		  tv.SelectionGranularity = NSTextView.NSSelectionGranularity.NSSelectByParagraph
		  
		  dim ts as NSTextStorage = tv.TextStorage
		  dim arr as NSArray = ts.LayoutManagers
		  dim firstLayoutManager as NSLayoutManager
		  if arr.Count <> 0 then
		    firstLayoutManager = new NSLayoutManager( arr.Value( 0 ), not NSObject.hasOwnership )
		    firstLayoutManager.ShowsInvisibleCharacters = true
		    firstLayoutManager.ShowsControlCharacters = true
		  end if
		  
		  #pragma unused arr
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetBkgColor
	#tag Event
		Sub Action()
		  TextArea1.FontBackgroundColor( TextArea1.SelStart, TextArea1.SelLength ) = RGB( 255, 0, 0 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClearBkgColor
	#tag Event
		Sub Action()
		  TextArea1.RemoveAllFontBackgroundColor
		End Sub
	#tag EndEvent
#tag EndEvents
