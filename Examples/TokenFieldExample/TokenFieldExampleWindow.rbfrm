#tag Window
Begin Window TokenFieldExampleWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.25e+2
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
   Title           =   "NSTokenField Example"
   Visible         =   True
   Width           =   9.91e+2
   Begin Cocoa.NSTokenField NSTokenField1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsExpansionToolTips=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      CompletionDelay =   ""
      DoubleBuffer    =   ""
      DoubleValue     =   ""
      Enabled         =   True
      EraseBackground =   ""
      FloatValue      =   ""
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   26
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0
      TokenizingCharacters=   ",;:"
      Top             =   68
      Underlined      =   false
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   713
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Presentation"
      Enabled         =   True
      Height          =   136
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   26
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   110
      Underline       =   ""
      Visible         =   True
      Width           =   213
      Begin TextField FontNameTF
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   36
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "System"
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   139
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   153
      End
      Begin TextField FontSizeTF
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   36
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   167
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   153
      End
      Begin CheckBox FontBoldCB
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Bold"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   36
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   196
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin CheckBox FontItalicCB
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Italic"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   36
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
         Top             =   217
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton ApplyFontBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Apply"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   150
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   215
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Separators"
      Enabled         =   True
      Height          =   136
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   254
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   110
      Underline       =   ""
      Visible         =   True
      Width           =   293
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   45
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   261
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "The TokenField uses Tab and Return to validate each token. It also allows other characters to be used (comma by default)"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   133
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   279
      End
      Begin TextField SeparatorsTF
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   261
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ","
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   181
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   279
      End
      Begin PushButton SeparatorsApplyBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Apply"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   461
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
         Top             =   215
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
   End
   Begin GroupBox GroupBox3
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Getting and Setting Content"
      Enabled         =   True
      Height          =   247
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   26
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   269
      Underline       =   ""
      Visible         =   True
      Width           =   713
      Begin PushButton SetContentsBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set Contents"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Set the TokenField contents to a small list of european countries"
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   36
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
         Top             =   298
         Underline       =   ""
         Visible         =   True
         Width           =   113
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   167
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
         Text            =   "Set TokenField contents to a small list of european countries"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   299
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   560
      End
      Begin PushButton ClearTokenFieldBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Clear"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   39
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
         Top             =   327
         Underline       =   ""
         Visible         =   True
         Width           =   113
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   165
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         Text            =   "Clear the TokenField"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   327
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   376
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   166
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
         Text            =   "Get Contents and show it below"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   356
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   560
      End
      Begin PushButton GetContentsBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Get Contents"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Get the current contents of the TokenField, making the difference between real objects and unrecognized countries."
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   39
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   356
         Underline       =   ""
         Visible         =   True
         Width           =   113
      End
      Begin TextArea ContentsTA
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   118
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   112
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
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   387
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   613
      End
      Begin PushButton AddUnrecognizedBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Add unrecognized country"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Add an unrecognized country (i.e. Europe). Use the Get Contents button to see the difference"
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   ""
         Left            =   553
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
         TextSize        =   12
         TextUnit        =   0
         Top             =   295
         Underline       =   ""
         Visible         =   True
         Width           =   174
      End
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   51
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   25
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "Type in some country names in the TokenField below. You should be presented a list of suggestions. Type Tab, Return or comma to accept the suggestion.\rOnce accepted, each token is stored as an Object and the text displayed is the ISO abbreviation of the country name."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   12
      TextUnit        =   0
      Top             =   5
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   714
   End
   Begin Listbox LB1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   448
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Country List"
      Italic          =   ""
      Left            =   756
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   68
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   223
      _ScrollWidth    =   -1
   End
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   42
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   766
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      UseFocusRing    =   True
      Visible         =   True
      Width           =   213
   End
   Begin GroupBox GroupBox4
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Completion delay"
      Enabled         =   True
      Height          =   136
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   561
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   110
      Underline       =   ""
      Visible         =   True
      Width           =   178
      Begin TextField DelayTF
         AcceptTabs      =   ""
         Alignment       =   3
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   ""
         Left            =   569
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   "#.##"
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   0.00
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   141
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   125
      End
      Begin Label Label6
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   ""
         Left            =   700
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
         Text            =   "sec"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   141
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   29
      End
      Begin PushButton ApplyDelayBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Apply"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   ""
         Left            =   647
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
         Top             =   215
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  //Create the CountryClass instances for the TokenField
		  
		  dim c() as string = Split( CountryListWithCodes, EndOfLine.Macintosh )
		  dim cc as CountryClass
		  
		  for each s as string in c
		    cc = new CountryClass( s )
		    Countries.Append   cc
		    LB1.AddRow   cc.Name + " (" + cc.ISOAbbreviation + ")"
		    LB1.RowTag( LB1.LastIndex ) = cc
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Countries() As CountryClass
	#tag EndProperty


	#tag Constant, Name = CountryListWithCodes, Type = String, Dynamic = False, Default = \"AF:Afghanistan\rAX:\xC3\x85land Islands\rAL:Albania\rDZ:Algeria\rAS:American Samoa\rAD:Andorra\rAO:Angola\rAI:Anguilla\rAQ:Antarctica\rAG:Antigua and Barbuda\rAR:Argentina\rAM:Armenia\rAW:Aruba\rAU:Australia\rAT:Austria\rAZ:Azerbaijan\rBS:Bahamas\rBH:Bahrain\rBD:Bangladesh\rBB:Barbados\rBY:Belarus\rBE:Belgium\rBZ:Belize\rBJ:Benin\rBM:Bermuda\rBT:Bhutan\rBO:Bolivia\rBA:Bosnia and Herzegovina\rBW:Botswana\rBV:Bouvet Island\rBR:Brazil\rIO:British Indian Ocean Territory\rBN:Brunei Darussalam\rBG:Bulgaria\rBF:Burkina Faso\rBI:Burundi\rKH:Cambodia\rCM:Cameroon\rCA:Canada\rCV:Cape Verde\rKY:Cayman Islands\rCF:Central African Republic\rTD:Chad\rCL:Chile\rCN:China\rCX:Christmas Island\rCC:Cocos (Keeling) Islands\rCO:Colombia\rKM:Comoros\rCG:Congo\rCD:Congo\x2C The Democratic Republic of The\rCK:Cook Islands\rCR:Costa Rica\rCI:Cote D\'ivoire\rHR:Croatia\rCU:Cuba\rCY:Cyprus\rCZ:Czech Republic\rDK:Denmark\rDJ:Djibouti\rDM:Dominica\rDO:Dominican Republic\rEC:Ecuador\rEG:Egypt\rSV:El Salvador\rGQ:Equatorial Guinea\rER:Eritrea\rEE:Estonia\rET:Ethiopia\rFK:Falkland Islands (Malvinas)\rFO:Faroe Islands\rFJ:Fiji\rFI:Finland\rFR:France\rGF:French Guiana\rPF:French Polynesia\rTF:French Southern Territories\rGA:Gabon\rGM:Gambia\rGE:Georgia\rDE:Germany\rGH:Ghana\rGI:Gibraltar\rGR:Greece\rGL:Greenland\rGD:Grenada\rGP:Guadeloupe\rGU:Guam\rGT:Guatemala\rGG:Guernsey\rGN:Guinea\rGW:Guinea-bissau\rGY:Guyana\rHT:Haiti\rHM:Heard Island and Mcdonald Islands\rVA:Holy See (Vatican City State)\rHN:Honduras\rHK:Hong Kong\rHU:Hungary\rIS:Iceland\rIN:India\rID:Indonesia\rIR:Iran\x2C Islamic Republic of\rIQ:Iraq\rIE:Ireland\rIM:Isle of Man\rIL:Israel\rIT:Italy\rJM:Jamaica\rJP:Japan\rJE:Jersey\rJO:Jordan\rKZ:Kazakhstan\rKE:Kenya\rKI:Kiribati\rKP:Korea\x2C Democratic People\'s Republic of\rKR:Korea\x2C Republic of\rKW:Kuwait\rKG:Kyrgyzstan\rLA:Lao People\'s Democratic Republic\rLV:Latvia\rLB:Lebanon\rLS:Lesotho\rLR:Liberia\rLY:Libyan Arab Jamahiriya\rLI:Liechtenstein\rLT:Lithuania\rLU:Luxembourg\rMO:Macao\rMK:Macedonia\x2C The Former Yugoslav Republic of\rMG:Madagascar\rMW:Malawi\rMY:Malaysia\rMV:Maldives\rML:Mali\rMT:Malta\rMH:Marshall Islands\rMQ:Martinique\rMR:Mauritania\rMU:Mauritius\rYT:Mayotte\rMX:Mexico\rFM:Micronesia\x2C Federated States of\rMD:Moldova\x2C Republic of\rMC:Monaco\rMN:Mongolia\rME:Montenegro\rMS:Montserrat\rMA:Morocco\rMZ:Mozambique\rMM:Myanmar\rNA:Namibia\rNR:Nauru\rNP:Nepal\rNL:Netherlands\rAN:Netherlands Antilles\rNC:New Caledonia\rNZ:New Zealand\rNI:Nicaragua\rNE:Niger\rNG:Nigeria\rNU:Niue\rNF:Norfolk Island\rMP:Northern Mariana Islands\rNO:Norway\rOM:Oman\rPK:Pakistan\rPW:Palau\rPS:Palestinian Territory\x2C Occupied\rPA:Panama\rPG:Papua New Guinea\rPY:Paraguay\rPE:Peru\rPH:Philippines\rPN:Pitcairn\rPL:Poland\rPT:Portugal\rPR:Puerto Rico\rQA:Qatar\rRE:Reunion\rRO:Romania\rRU:Russian Federation\rRW:Rwanda\rSH:Saint Helena\rKN:Saint Kitts and Nevis\rLC:Saint Lucia\rPM:Saint Pierre and Miquelon\rVC:Saint Vincent and The Grenadines\rWS:Samoa\rSM:San Marino\rST:Sao Tome and Principe\rSA:Saudi Arabia\rSN:Senegal\rRS:Serbia\rSC:Seychelles\rSL:Sierra Leone\rSG:Singapore\rSK:Slovakia\rSI:Slovenia\rSB:Solomon Islands\rSO:Somalia\rZA:South Africa\rGS:South Georgia and The South Sandwich Islands\rES:Spain\rLK:Sri Lanka\rSD:Sudan\rSR:Suriname\rSJ:Svalbard and Jan Mayen\rSZ:Swaziland\rSE:Sweden\rCH:Switzerland\rSY:Syrian Arab Republic\rTW:Taiwan\x2C Province of China\rTJ:Tajikistan\rTZ:Tanzania\x2C United Republic of\rTH:Thailand\rTL:Timor-leste\rTG:Togo\rTK:Tokelau\rTO:Tonga\rTT:Trinidad and Tobago\rTN:Tunisia\rTR:Turkey\rTM:Turkmenistan\rTC:Turks and Caicos Islands\rTV:Tuvalu\rUG:Uganda\rUA:Ukraine\rAE:United Arab Emirates\rGB:United Kingdom\rUS:United States\rUM:United States Minor Outlying Islands\rUY:Uruguay\rUZ:Uzbekistan\rVU:Vanuatu\rVE:Venezuela\rVN:Viet Nam\rVG:Virgin Islands\x2C British\rVI:Virgin Islands\x2C U.S.\rWF:Wallis and Futuna\rEH:Western Sahara\rYE:Yemen\rZM:Zambia\rZW:Zimbabwe", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events NSTokenField1
	#tag Event
		Function CompletionForSubstring(substring as string, tokenIndex as integer, byref selectedItemInArray as integer) As String()
		  #pragma unused tokenIndex
		  
		  dim suggestions() as string
		  
		  for each c as CountryClass in Countries
		    if Instr( c.Name, substring )=1 then //Country name starts with the typed characters
		      //Add to suggestions
		      suggestions.Append   c.Name
		    end if
		  next
		  
		  selectedItemInArray = 0
		  
		  return   suggestions
		End Function
	#tag EndEvent
	#tag Event
		Function ObjectForTokenString(tokenString as String) As variant
		  
		  for each c as CountryClass in Countries
		    if c.Name = tokenString then //Token name correspond to the country code
		      return  c
		    end if
		  next
		  
		End Function
	#tag EndEvent
	#tag Event
		Function TokenStringForObject(obj as Variant) As String
		  
		  dim cc as CountryClass
		  
		  if obj isa CountryClass then
		    cc = obj
		    return  cc.ISOAbbreviation
		    
		  elseif obj isa NSObject then
		    return   Cocoa.NSObjectFromNSPtr( NSObject( obj ).id )
		    
		  else
		    return  obj
		    
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ObjectHasMenu(obj as Variant) As boolean
		  // Only CountryClass objects can have a menu. Unrecognized strings do not.
		  
		  if obj isa CountryClass then
		    return  true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub MenuAction(forObject as variant, SelectedItem as MenuItem)
		  
		  'report  "Menu action fired for item", SelectedItem.Text, "with tag", SelectedItem.Tag
		  
		  dim cc as CountryClass
		  
		  if forObject isa CountryClass then
		    cc = forObject
		    
		    select case SelectedItem.Tag
		    case "_COPY_"
		      dim c as new ClipBoard
		      c.SetText  cc.Name
		    case "_WIKI_"
		      ShowURL   cc.URL
		    end select
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ConstructMenuForObject(obj as Variant, baseMenu as MenuItem)
		  #pragma unused obj
		  
		  baseMenu.Append   new MenuItem( "Copy country name", "_COPY_" )
		  baseMenu.Append   new MenuItem( "Get info on Wikipedia", "_WIKI_" )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function WriteObjectToPasteboard(obj as variant, ValuesForPasteboard as Dictionary) As boolean
		  
		  //When the user copies or drag the token, we're asked to provide data for the corresponding pasteboard
		  
		  //To do so, we need to populate the ValuesForPasteboard dictionary: the Key must correspond to the Uniform Type Identifier
		  //The better format should be written first.
		  //Return false if you don' want to write the object into the Pasteboard
		  
		  dim cc as CountryClass
		  
		  if obj isa CountryClass then
		    cc = obj
		    
		    //The most important data are those which will allow to re-create the object in any application which supports the UTI.
		    //That is why we create it first
		    dim dict as new Dictionary
		    
		    dict.Value( "Name" ) = cc.Name
		    dict.Value( "ISOAbbreviation" ) = cc.ISOAbbreviation
		    dict.Value( "URL" ) = cc.URL
		    
		    ValuesForPasteboard.Value( "com.macoslib.country" ) = dict
		    
		    //As a second value (for copying), we copy the country name so it can be pasted in a text editor
		    ValuesForPasteboard.Value( "public.utf8-plain-text" ) = cc.Name
		    
		    return  true //We must validate the values by returning true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ReadObjectFromPasteboard(ValuesInPasteboard as Dictionary) As variant
		  
		  dim cc as CountryClass
		  dim dict as Dictionary
		  
		  'report   "ReadObjectFromPasteboard"
		  
		  for i as integer = 0 to ValuesInPasteboard.Count - 1
		    'report   ValuesInPasteboard.Key( i ), ValuesInPasteboard.Value( ValuesInPasteboard.Key( i ))
		  next
		  
		  if ValuesInPasteboard.HasKey( "com.macoslib.country" ) then
		    dict = ValuesInPasteboard.Value( "com.macoslib.country" )
		    cc = new CountryClass
		    cc.Name = dict.Value( "Name" )
		    cc.ISOAbbreviation = dict.Value( "ISOAbbreviation" )
		    cc.URL = dict.Value( "URL" )
		    
		    return  cc
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function EditingStringForObject(obj as Variant) As String
		  
		  dim cc as CountryClass
		  
		  'report  CurrentMethodName
		  
		  if obj isa CountryClass then
		    cc = obj
		    return  cc.Name
		    
		  else
		    break
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  //This is the UTI we use for Country objects
		  
		  me.AcceptRawDataDrop( "com.macoslib.country" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ApplyFontBTN
	#tag Event
		Sub Action()
		  
		  NSTokenField1.TextFont = FontNameTF.Text
		  NSTokenField1.TextSize = val( FontSizeTF.Text )
		  NSTokenField1.Bold = FontBoldCB.Value
		  NSTokenField1.Italic = FontItalicCB.Value
		  
		  NSTokenField1.InvalidateFont
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SeparatorsApplyBTN
	#tag Event
		Sub Action()
		  
		  NSTokenField1.TokenizingCharacters = SeparatorsTF.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetContentsBTN
	#tag Event
		Sub Action()
		  //To populate the TokenField, set the FieldContents to an array of the Objects you want. The TokenField will ask for the name to be displayed for each object
		  //  through the "TokenStringForObject" event.
		  
		  dim wantedCountries() as string = Array( "France", "Germany", "Spain", "Italy", "Switzerland" )
		  
		  dim objs() as variant
		  
		  //Collect the CountryClass objects whose name is in wantedCountries
		  for each c as CountryClass in Countries
		    if wantedCountries.IndexOf( c.Name )<>-1 then
		      objs.Append   c
		    end if
		  next
		  
		  //Now set the TokenField contents
		  NSTokenField1.FieldContents  = objs
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClearTokenFieldBTN
	#tag Event
		Sub Action()
		  
		  NSTokenField1.Clear
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetContentsBTN
	#tag Event
		Sub Action()
		  //The contents of a TokenField (an array of Variants) contain the objects corresponding to the tokens but it can also contain values as String when
		  //   some text has not been tokenized (like a new value).
		  
		  dim objs() as variant
		  dim cc as CountryClass
		  dim s as string
		  
		  //Get the TokenField contents
		  objs = NSTokenField1.FieldContents
		  
		  //Process the objects. Here we only have 2 choices: a CountryClass or a String
		  ContentsTA.Text = "Contents of the TokenField:" + EndOfLine
		  for each v as variant in objs
		    if v isa CountryClass then
		      cc = v
		      ContentsTA.AppendText   "• CountryClass for country " + cc.Name + EndOfLine
		    else //We consider it a String
		      s = v
		      ContentsTA.AppendText   "• String for unrecognized country “" + s + "”" + EndOfLine
		    end if
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddUnrecognizedBTN
	#tag Event
		Sub Action()
		  NSTokenField1.AppendObject   new NSString( "Europe" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Open()
		  
		  'me.AcceptRawDataDrop( "com.macoslib.country" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ApplyDelayBTN
	#tag Event
		Sub Action()
		  
		  NSTokenField1.CompletionDelay = Val( DelayTF.Text )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
