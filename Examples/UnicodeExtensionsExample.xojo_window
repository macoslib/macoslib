#tag Window
Begin Window UnicodeExtensionsExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   571
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
   Title           =   "Unicode Extensions"
   Visible         =   True
   Width           =   1051
   Begin TextArea TA1
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   53
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   14
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   97
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   355
   End
   Begin TextArea TA2
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   36
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   14
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   355
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareCaseInsensitive"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Makes the comparison case-insensitive, so A is equal to a"
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   321
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   187
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareBackwards"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Starts from the end of string 1. Does not apply to Compare, only to Find."
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   341
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   173
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareAnchored"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   362
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   173
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareNonliteral"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Compare Precomposed and Decomposed strings, e.g. ""è"" (precomposed form) is equivalent to ""e+combining `"" (decomposed form)."
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   383
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   173
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareLocalized"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Use localization for comparison. With kCFNonLiteral, a capital A will be considered equal to the mathematical symbol 𝔸. Does not apply to Find."
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   404
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   173
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareNumerically"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Numbers are interpreted as their numerical value so ""20"" will be considered greater than ""3"". This is not the case otherwise."
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   425
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   173
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareDiacriticInsensitive"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Accents and other diacritics are not taken into account for comparing or searching."
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   446
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   205
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareWidthInsensitive"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   467
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   187
   End
   Begin CheckBox OptionCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "kCFCompareForcedOrdering"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   "Forces comparison to return ""less than"" or ""greater than"", but not ""equal"""
      Index           =   8
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   487
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   187
   End
   Begin PushButton CompareBTN
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Compare"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   "Compare String1 to String 2"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   351
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   260
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton FindBTN
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Find"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   "Find String 2 inside String 1"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   441
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   260
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextArea TAR
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   185
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   351
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
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   319
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   403
   End
   Begin PushButton FindAllBTN
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Find All"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   "Find all occurrences of String 2 inside String 1"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   531
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   260
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   353
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Results:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   295
      Transparent     =   False
      Underline       =   False
      Value           =   "Results:"
      Visible         =   True
      Width           =   100
   End
   Begin Label Label2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "String 1:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      Value           =   "String 1:"
      Visible         =   True
      Width           =   100
   End
   Begin Label Label3
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "String 2:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   162
      Transparent     =   False
      Underline       =   False
      Value           =   "String 2:"
      Visible         =   True
      Width           =   100
   End
   Begin Label Label4
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "11.0"
      FontUnit        =   "0"
      Height          =   56
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   True
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This window gives you the possibility to test the advanced options of Mac OS X for comparing and searching strings.\rWith such options, you can search from the end, sort strings with numbers being properly interpreted as numbers (like the Finder does), ignore accents and other diacritics...\rIt may also help you handling Precomposed (NFC, NFKC) and Decomposed (NFD, NFKD) Unicode strings."
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   False
      Value           =   "This window gives you the possibility to test the advanced options of Mac OS X for comparing and searching strings.\rWith such options, you can search from the end, sort strings with numbers being properly interpreted as numbers (like the Finder does), ignore accents and other diacritics...\rIt may also help you handling Precomposed (NFC, NFKC) and Decomposed (NFD, NFKD) Unicode strings."
      Visible         =   True
      Width           =   1028
   End
   Begin Listbox Listbox1
      AllowAutoDeactivate=   "True"
      AllowAutoHideScrollbars=   "True"
      AllowExpandableRows=   "False"
      AllowFocusRing  =   "True"
      AllowResizableColumns=   "False"
      AllowRowDragging=   "False"
      AllowRowReordering=   "False"
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      DropIndicatorVisible=   "False"
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      GridLinesHorizontal=   0
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   0
      GridLinesVerticalStyle=   "0"
      HasBorder       =   "True"
      HasHeader       =   "True"
      HasHeading      =   True
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      HeadingIndex    =   -1
      Height          =   463
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Built-in examples"
      Italic          =   False
      Left            =   772
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   267
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea TAB2
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   36
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   396
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
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   355
   End
   Begin TextArea TAB1
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   53
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   396
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
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   97
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   355
   End
   Begin Label Label5
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   396
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Binary representations:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      Value           =   "Binary representations:"
      Visible         =   True
      Width           =   166
   End
   Begin CheckBox UnicodeNF1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Is NFC"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   62
   End
   Begin CheckBox UnicodeNF1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Is NFD"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   142
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   63
   End
   Begin CheckBox LikeFinderCB
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use Finder settings(*)"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   17
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   325
   End
   Begin Label Label6
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(*) The definition of “Finder settings” may vary from one Apple's example code to another."
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   516
      Transparent     =   False
      Underline       =   False
      Value           =   "(*) The definition of “Finder settings” may vary from one Apple's example code to another."
      Visible         =   True
      Width           =   745
   End
   Begin PushButton ConvertBTN1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Convert"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   221
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   74
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin PushButton ConvertBTN2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Convert"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   219
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   163
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin CheckBox UnicodeNF2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Is NFD"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   140
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   162
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   63
   End
   Begin CheckBox UnicodeNF2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Is NFC"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   78
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   163
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   62
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  AcceptFileDrop "Any"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CalcOptionValue() As integer
		  
		  static values() as integer = Array( 1, 4, 8, 16, 32, 64, 128, 256, 512 )
		  
		  dim value as integer
		  
		  for i as integer = 0 to 8
		    if OptionCB( i ).Value then
		      value = value + values( i )
		    end if
		  next
		  
		  return  value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCBState(states as String, SetEnabled as boolean = true)
		  
		  dim StatesArray() as string
		  
		  StatesArray = states.Split( "," )
		  
		  for i as integer = 0 to 8
		    OptionCB( i ).Value = (StatesArray( i ) = "1")
		    OptionCB( i ).Enabled = SetEnabled
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowBinaryRepresentation(text as string, target as TextArea)
		  
		  dim s as string
		  
		  for i as integer = 1 to text.Len
		    s = s + Hex( Asc( text.Mid( i, 1 ))) + "(" + text.Mid( i, 1 ) + ")" + " "
		  next
		  
		  target.Text = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function StringBetween(theString as string, tag1 as string, tag2 as String) As string
		  
		  dim a, b as integer
		  dim s as string
		  
		  a = theString.Instr( tag1 )
		  b = theString.Instr( a + tag1.Len, tag2 )
		  
		  if a=-1 AND b=-1 then
		    return  ""
		  end if
		  
		  if a=-1 then a=1
		  if b=-1 then b=10000
		  
		  a = a + tag1.Len
		  
		  s = theString.Mid( a, b-a )
		  
		  return  s
		End Function
	#tag EndMethod


	#tag Constant, Name = BuiltinExamples, Type = String, Dynamic = False, Default = \"#EXAMPLE\rName\x3DCompare: case sensitivity\rString1\x3D\xC3\x89v\xC3\xA9nement\rString2\x3D\xC3\xA9v\xC3\xA9nement\rHelp\x3D\rIntro\x3D\xC3\x89v\xC3\xA9nement and \xC3\xA9v\xC3\xA9nement are considered equal only if you set the comparison not to be case sensitive\rStates\x3D1\x2C0\x2C0\x2C0\x2C0\x2C0\x2C0\x2C0\x2C0\rButton\x3DCompare+Find\rOutro\x3D\r#EXAMPLE\rName\x3DCompare: accents and other diacritics\rString1\x3D\xC3\x89v\xC3\xA9nement\rString2\x3DEv\xC3\xA8nement\rHelp\x3D\rIntro\x3DThe two words are equal only is you ignore diacritic\rStates\x3D0\x2C0\x2C0\x2C0\x2C0\x2C0\x2C1\x2C0\x2C0\rButton\x3DCompare+Find\rOutro\x3D\r#EXAMPLE\rName\x3DCompare precomposed (NFC) and decomposed (NFD) strings\rString1\x3D\xC3\x89v\xC3\xA9nement\rString2\x3D(NFD)\xC3\x89v\xC3\xA9nement\rHelp\x3D\rIntro\x3D\xC3\x89v\xC3\xA9nement in NFD form (accents are separated from the main character. See the binary representation) can be compared to their NFC equivalent with the \"non-literal\" option.\rStates\x3D0\x2C0\x2C0\x2C1\x2C0\x2C0\x2C0\x2C0\x2C0\rButton\x3DCompare+Find\rOutro\x3Dmacoslib allows you to convert between precomposed and decomposed strings. This is useful because Mac OS X uses the decomposed form while Real Studio uses the precomposed form.\r#EXAMPLE\rName\x3DCompare numbered strings\rString1\x3DFile 18\rString2\x3DFile 2\rHelp\x3D\rIntro\x3DNumbers are usually compared by their character codes\x2C so \"18\" is considered less than \"2\". With option \"numerical value\"\x2C the numerical values are compared instead\x2C just like the Finder does.\rStates\x3D0\x2C0\x2C0\x2C0\x2C0\x2C1\x2C0\x2C0\x2C0\rButton\x3DCompare\rOutro\x3DHere\x2C \"File 2\" < \"File 18\".\r#EXAMPLE\rName\x3DFind from the end\rString1\x3D\xC3\x89v\xC3\xA8nement\rString2\x3De\rHelp\x3D\rIntro\x3DFind and Find All can be set to start from the end of the first string.\rStates\x3D0\x2C1\x2C0\x2C0\x2C0\x2C0\x2C0\x2C0\x2C0\rButton\x3DFind+Find All\rOutro\x3DWith a simple InStr\x2C the first \"e\" with accent would be found. Here\x2C the last one is found.\r#EXAMPLE\rName\x3DFind All with accent and case insensitivity\rString1\x3D\xC3\x89v\xC3\xA8nement\rString2\x3De\rHelp\x3D\rIntro\x3DYou can combine options to find all occurrences of a word (or character) ignoring accents and case sensitivity.\rStates\x3D1\x2C0\x2C0\x2C0\x2C0\x2C0\x2C1\x2C0\x2C0\rButton\x3DFind All\rOutro\x3DAll the \"e\" are found\x2C no matter if they are capitalized or have an accent.\r", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events TA1
	#tag Event
		Sub TextChange()
		  
		  UnicodeNF1( 0 ).Value = me.Text.IsUnicodeNFC OR me.Text.IsUnicodeNFKC
		  UnicodeNF1( 1 ).Value = me.Text.IsUnicodeNFD OR me.Text.IsUnicodeNFKD
		  
		  if UnicodeNF1( 0 ).Value AND UnicodeNF1( 1 ).Value then
		    ConvertBTN1.Caption = "Convert"
		    ConvertBTN1.Enabled = false
		  elseif UnicodeNF1( 0 ).Value then
		    ConvertBTN1.Caption = "Convert to NFD"
		    ConvertBTN1.Enabled = true
		  else
		    ConvertBTN1.Caption = "Convert to NFC"
		    ConvertBTN1.Enabled = true
		  end if
		  
		  ShowBinaryRepresentation   me.Text, TAB1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TA2
	#tag Event
		Sub TextChange()
		  
		  UnicodeNF2( 0 ).Value = me.Text.IsUnicodeNFC OR me.Text.IsUnicodeNFKC
		  UnicodeNF2( 1 ).Value = me.Text.IsUnicodeNFD OR me.Text.IsUnicodeNFKD
		  
		  if UnicodeNF2( 0 ).Value AND UnicodeNF2( 1 ).Value then
		    ConvertBTN2.Caption = "Convert"
		    ConvertBTN2.Enabled = false
		  elseif UnicodeNF2( 0 ).Value then
		    ConvertBTN2.Caption = "Convert to NFD"
		    ConvertBTN2.Enabled = true
		  else
		    ConvertBTN2.Caption = "Convert to NFC"
		    ConvertBTN2.Enabled = true
		  end if
		  
		  ShowBinaryRepresentation   me.Text, TAB2
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CompareBTN
	#tag Event
		Sub Action()
		  
		  dim options as integer = CalcOptionValue
		  
		  static compResult() as string = Array( "string1 < string2", "string1 = string2", "string1 > string2" )
		  
		  TAR.AppendText   "Comparing the 2 strings with options " + Str( Options ) + ":" + EndOfLine
		  TAR.AppendText   "    result —> " + compResult( StrCompWithOptions( TA1.Text, TA2.Text, options ) + 1 ) + EndOfLine + EndOfLine
		  
		  TAR.ScrollPosition = 10000
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FindBTN
	#tag Event
		Sub Action()
		  
		  dim options as integer = CalcOptionValue
		  dim p as Pair
		  
		  TAR.AppendText   "Finding 2nd string within first with options " + Str( Options ) + ":" + EndOfLine
		  p = InstrWithOptions( TA1.Text, TA2.Text, options )
		  if p = nil then
		    TAR.AppendText   "    result —> not found" + EndOfLine + EndOfLine
		    TA1.SelLength = 0
		  else
		    TAR.AppendText   "    result —> found. Substring starts at " + Str( p.Left ) + " with length " + Str( p.right ) + EndOfLine + EndOfLine
		    TA1.SelStart = p.Left
		    TA1.SelLength = p.Right
		  end if
		  
		  TAR.ScrollPosition = 10000
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FindAllBTN
	#tag Event
		Sub Action()
		  
		  dim options as integer = CalcOptionValue
		  dim pairs() as Pair
		  
		  TAR.AppendText   "Finding 2nd string within first with options " + Str( Options ) + ":" + EndOfLine
		  TA1.SelLength = 0
		  pairs = InstrFindAllWithOptions( TA1.Text, TA2.Text, options )
		  if pairs.Ubound=-1 then
		    TAR.AppendText   "    result —> not found" + EndOfLine + EndOfLine
		  else
		    TAR.AppendText   "    result —> found." + EndOfLine
		    for each p as Pair in Pairs
		      TAR.AppendText  "       Substring starts at " + Str( p.Left ) + " with length " + Str( p.right ) + EndOfLine
		    next
		    TAR.AppendText   EndOfLine
		  end if
		  
		  TAR.ScrollPosition = 10000
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Sub Open()
		  //Populate self
		  
		  dim Examples() as string
		  dim oneExample as string
		  
		  Examples = BuiltinExamples.Split( "#EXAMPLE" + EndOfLine )
		  
		  for each oneExample in examples
		    if oneExample<>"" then
		      me.AddRow   StringBetween( oneExample, "Name=", EndOfLine )
		      me.RowTag( me.LastIndex ) = oneExample
		    end if
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  dim example as string
		  dim BTNS() as string
		  dim s as string
		  
		  if me.ListIndex>-1 then
		    example = me.RowTag( me.ListIndex )
		    
		    s = StringBetween( example, "String1=", EndOfLine )
		    if s.Left( 5 ) = "(NFD)" then
		      s = s.Mid( 6 )
		      s = s.NormalizeUnicodeToNFD
		    end if
		    TA1.Text = s
		    
		    s = StringBetween( example, "String2=", EndOfLine )
		    if s.Left( 5 ) = "(NFD)" then
		      s = s.Mid( 6 )
		      s = s.NormalizeUnicodeToNFD
		    end if
		    TA2.Text = s
		    
		    s = StringBetween( example, "States=", EndOfLine )
		    SetCBState  s, true
		    
		    s = StringBetween( example, "Intro=", EndOfLine )
		    TAR.AppendText   "—————————————" + EndOfLine + s + EndOfLine + EndOfLine
		    
		    s = StringBetween( example, "Button=", EndOfLine )
		    BTNS = s.Split( "+" )
		    
		    for each s in BTNS
		      select case s
		      case "Compare"
		        CompareBTN.Push
		      case "Find"
		        FindBTN.Push
		      case "Find All"
		        FindAllBTN.Push
		      end select
		    next
		    
		    s = StringBetween( example, "Outro=", EndOfLine )
		    TAR.AppendText   s + EndOfLine + EndOfLine
		    
		  else  //No selection
		    TA1.Text = ""
		    TA2.Text = ""
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UnicodeNF1
	#tag Event
		Sub Action(index as Integer)
		  
		  #pragma unused index
		  
		  'if index=0 AND me.Value then  //Convert as NFC
		  'TA1.Text = TA1.Text.MacNormalizeUnicode( "NFC" )
		  'elseif index=1 AND me.value then  //Convert as NFD
		  'TA1.Text = TA1.Text.MacNormalizeUnicode( "NFD" )
		  'end if
		  '
		  'UnicodeNF1( 0 ).Enabled = ( TA1.Text.IsUnicodeNFC OR TA1.Text.IsUnicodeNFKC )
		  'UnicodeNF1( 1 ).Enabled = ( TA1.Text.IsUnicodeNFD OR TA1.Text.IsUnicodeNFKD )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LikeFinderCB
	#tag Event
		Sub Action()
		  
		  'NSCaseInsensitiveSearch | NSNumericSearch |
		  'NSWidthInsensitiveSearch | NSForcedOrderingSearch;
		  
		  if me.Value then
		    SetCBState   "1,0,0,0,0,1,0,1,1", false
		    
		  else
		    SetCBState   "1,0,0,0,0,1,0,1,1", true
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConvertBTN1
	#tag Event
		Sub Action()
		  
		  if me.Caption="Convert to NFC" then
		    TA1.Text = TA1.Text.NormalizeUnicodeToNFC
		  else
		    TA1.Text = TA1.Text.NormalizeUnicodeToNFD
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConvertBTN2
	#tag Event
		Sub Action()
		  
		  if me.Caption="Convert to NFC" then
		    TA2.Text = TA2.Text.NormalizeUnicodeToNFC
		  else
		    TA2.Text = TA2.Text.NormalizeUnicodeToNFD
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UnicodeNF2
	#tag Event
		Sub Action(index as Integer)
		  
		  #pragma unused index
		  
		  'if index=0 AND me.Value then  //Convert as NFC
		  'TA1.Text = TA1.Text.MacNormalizeUnicode( "NFC" )
		  'elseif index=1 AND me.value then  //Convert as NFD
		  'TA1.Text = TA1.Text.MacNormalizeUnicode( "NFD" )
		  'end if
		  '
		  'UnicodeNF1( 0 ).Enabled = ( TA1.Text.IsUnicodeNFC OR TA1.Text.IsUnicodeNFKC )
		  'UnicodeNF1( 1 ).Enabled = ( TA1.Text.IsUnicodeNFD OR TA1.Text.IsUnicodeNFKD )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
