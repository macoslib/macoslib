#tag Window
Begin Window LabelExtensionExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   315
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
   Title           =   "Label extensions"
   Visible         =   True
   Width           =   754
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   219
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   15
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Normal text\rStyled text"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Value           =   1
      Visible         =   True
      Width           =   726
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   158
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   21
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c000000
         TextFont        =   "System"
         TextSize        =   12.0
         TextUnit        =   0
         Top             =   41
         Transparent     =   False
         Underline       =   False
         Value           =   "In Cocoa, a Label object is just a TextField without background or editing capabilities.\rAs TextFields support AttributedString (i.e. a more advanced equivalent of the RB's StyledText), so can Labels, e.g:\r\r1. Styled text, including subscript and superscript\r2. Different underlining styles and colors (also strike-through)\r3. Multiple help tags for different parts of the text\r4. Automatic handling of hypertext links\r\r... and many more features"
         Visible         =   True
         Width           =   720
      End
      Begin Label RichLBL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   167
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   21
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlign       =   0
         TextColor       =   &c000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   41
         Transparent     =   False
         Underline       =   False
         Value           =   ""
         Visible         =   True
         Width           =   707
      End
   End
   Begin Label Label2
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
      Left            =   16
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   243
      Transparent     =   False
      Underline       =   False
      Value           =   "You can also select how a string will be truncated if it is too long for the Label"
      Visible         =   True
      Width           =   583
   End
   Begin Label Label3
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
      Left            =   35
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   True
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c80004000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Value           =   "You can also select how a string will be truncated if it is too long for the Label"
      Visible         =   True
      Width           =   342
   End
   Begin PopupMenu LineBreakPOP
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Word wrapping\rChar wrapping\rClipping\rTruncating head\rTruncating tail\rTruncating middle"
      Italic          =   False
      Left            =   405
      ListIndex       =   2
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   273
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   297
   End
End
#tag EndWindow

#tag WindowCode
	#tag Constant, Name = HTMLString, Type = String, Dynamic = False, Default = \"<html><body><span style\x3D\"font:13px \'Lucida Grande\'; line-height:100%;\"><u>Hello</u> <b>world</b> !! <a href\x3D\"http://apple.com\">Apple</a></span></body></html>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HTMLStringIntroStyled, Type = String, Dynamic = False, Default = \"<html><body><span style\x3D\"font:13px \'Lucida Grande\'; line-height:100%;\">In Cocoa\x2C a Label object is just a TextField without background or editing capabilities.\r<p>As TextFields support AttributedString (i.e. a more advanced equivalent of the RB\'s StyledText)\x2C so can Labels\x2C e.g:\r\r1. Styled text\x2C including subscript and superscript\r2. Different <span style\x3D\"border-bottom: 1px blue dotted;\">underlining styles</span> and colors (also strike-through)\r3. Multiple help tags for different parts of the text\r4. Automatic handling of hypertext links\r\r... and many more features</span></body></html>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RTFStringIntroStyled, Type = String, Dynamic = False, Default = \"{\\rtf1\\ansi\\ansicpg1252\\cocoartf1138\\cocoasubrtf320\r{\\fonttbl\\f0\\fnil\\fcharset204 LucidaGrande;}\r{\\colortbl;\\red255\\green255\\blue255;\\red128\\green64\\blue0;\\red255\\green0\\blue0;\\red0\\green128\\blue64;\r\\red27\\green0\\blue255;}\r{\\*\\listtable{\\list\\listtemplateid1\\listhybrid{\\listlevel\\levelnfc0\\levelnfcn0\\leveljc0\\leveljcn0\\levelfollow0\\levelstartat1\\levelspace360\\levelindent0{\\*\\levelmarker \\{decimal\\}.}{\\leveltext\\leveltemplateid1\\\'02\\\'00.;}{\\levelnumbers\\\'01;}\\fi-360\\li720\\lin720 }{\\listname ;}\\listid1}}\r{\\*\\listoverridetable{\\listoverride\\listid1\\listoverridecount0\\ls1}}\r\\paperw11900\\paperh16840\\margl1440\\margr1440\\vieww11360\\viewh9220\\viewkind0\r\\pard\\tx566\\tx1133\\tx1700\\tx2267\\tx2834\\tx3401\\tx3968\\tx4535\\tx5102\\tx5669\\tx6236\\tx6803\\pardirnatural\r\r\\f0\\fs24 \\cf0 In \\cf2 Cocoa\\cf0 \x2C a Label object is just a TextField without background or editing capabilities.\\\rAs TextFields support AttributedString (i.e. a more advanced equivalent of the RB\'s StyledText)\x2C so can Labels\x2C e.g:\\\r\\\r\\pard\\tx220\\tx720\\tx1133\\tx1700\\tx2267\\tx2834\\tx3401\\tx3968\\tx4535\\tx5102\\tx5669\\tx6236\\tx6803\\li720\\fi-720\\pardirnatural\r\\ls1\\ilvl0\\cf0 {\\listtext\t1.\t}\r\\b Styled\r\\b0  text\x2C including \r\\fs18 \\sub subscript\r\\fs24 \\nosupersub  and \r\\fs18 \\super superscript\r\\fs24 \\nosupersub \\\r{\\listtext\t2.\t}Different \\ul \\ulc0 underlining styles\\ulnone  and \\ul \\ulc3 colors\\ulnone  (also \\strike \\strikec4 strike-through\\strike0\\striked0 )\\\r{\\listtext\t3.\t}Multiple help tags for different parts of the text\\\r{\\listtext\t4.\t}Automatic handling of hypertext links (try {\\field{\\*\\fldinst{HYPERLINK \"https://github.com/macoslib/macoslib\"}}{\\fldrslt \\ul \\ulc5 macoslib}})\\\r\\pard\\tx566\\tx1133\\tx1700\\tx2267\\tx2834\\tx3401\\tx3968\\tx4535\\tx5102\\tx5669\\tx6236\\tx6803\\pardirnatural\r\\cf0 \\\r... and many more features}", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events RichLBL
	#tag Event
		Sub Open()
		  
		  dim RTFdata as NSData = new NSData( RTFStringIntroStyled )
		  dim nsas as NSAttributedString = NSAttributedString.CreateFromRTF( RTFdata )
		  
		  me.SetAttributedString   new AttributedString( nsas )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineBreakPOP
	#tag Event
		Sub Change()
		  
		  Label3.LineBreak = me.ListIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
