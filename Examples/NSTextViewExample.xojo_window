#tag Window
Begin Window NSTextViewExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin TextArea TextArea1
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "True"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   229
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   30
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   93
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   534
   End
   Begin PushButton btnSetBkgColor
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Set Background Color"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   343
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   151
   End
   Begin PushButton btnClearBkgColor
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Clear Background Color"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   346
      Transparent     =   False
      Underline       =   False
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
