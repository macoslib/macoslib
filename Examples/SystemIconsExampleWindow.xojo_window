#tag Window
Begin Window SystemIconsExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   527
   ImplicitInstance=   True
   LiveResize      =   "False"
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
   Resizeable      =   False
   Title           =   "System Icons Extensions"
   Visible         =   True
   Width           =   695
   Begin Listbox LB1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   24
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   485
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Available Icons"
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   248
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Resize"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Resize the icon"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   440
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   64
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField TF1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   293
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   64
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   61
   End
   Begin TextField TF2
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   367
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   64
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   61
   End
   Begin Canvas CVS1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   42
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   139
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   159
   End
   Begin BevelButton BB1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   3
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   466
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   114
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   32
   End
   Begin SystemIconsToolbar SystemIconsToolbar1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   367
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "\n\nTrue\r\n\nFalse\r\n\nFalse\r\n\nFalse"
      SelectionType   =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      Top             =   9
      Transparent     =   False
      Visible         =   True
      Width           =   142
   End
   BeginSegmented SegmentedControl SegmentedControl2
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "\n\nFalse\r\n\nFalse"
      SelectionType   =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      Top             =   9
      Transparent     =   False
      Visible         =   True
      Width           =   71
   End
   BeginSegmented SegmentedControl SegmentedControl3
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   526
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "\n\nFalse"
      SelectionType   =   2
      TabIndex        =   8
      TabPanelIndex   =   0
      Top             =   9
      Transparent     =   False
      Visible         =   True
      Width           =   43
   End
   BeginSegmented SegmentedControl SegmentedControl4
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   581
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "\n\nFalse"
      SelectionType   =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      Top             =   9
      Transparent     =   False
      Visible         =   True
      Width           =   43
   End
   BeginSegmented SegmentedControl SegmentedControl5
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   6
      Scope           =   0
      Segments        =   "\n\nFalse\r\n\nFalse"
      SelectionType   =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      Top             =   499
      Transparent     =   False
      Visible         =   True
      Width           =   66
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
      Left            =   302
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Your age"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   66
   End
   Begin TextField TF11
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   371
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1206"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   240
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   61
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   14
      HelpTag         =   "Invalid value for your age"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   440
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   246
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   14
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Select an icon in the list"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Colored icons (Templates only)"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   121
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   177
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   274
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   283
      Transparent     =   False
      Visible         =   True
      Width           =   400
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   144
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "All the icons in this window can be obtained from the convenience SystemIcons module. They are all simple Pictures, e.g.\n\n    pict = SystemIcons.Network\nfor the Network icon in the toolbar.\n\n    pict = SystemIcons.Touchbar.ColorPickerFill\nfor the ColorPickerFill icon from the Touchbar."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   293
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   401
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   54
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Warning: you need Real Studio 2011.r4 or higher, Mac OS X 10.6 or higher for optimum results (especially transparency) and Mac OS X 10.12 or higher for the touchbar icons."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   446
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   401
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   283
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Example of a bad entry signalled by a red arrow:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   214
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   375
   End
   Begin Separator Separator2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   273
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   198
      Transparent     =   False
      Visible         =   True
      Width           =   400
   End
   Begin PushButton PB1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   ""
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   466
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   139
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   32
   End
   BeginSegmented SegmentedControl SC1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   463
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "\n\nFalse"
      SelectionType   =   2
      TabIndex        =   22
      TabPanelIndex   =   0
      Top             =   167
      Transparent     =   False
      Visible         =   True
      Width           =   42
   End
   Begin Canvas CVS2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   128
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   546
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   64
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   128
   End
End
#tag EndWindow

#tag WindowCode
	#tag Constant, Name = kListboxContent, Type = String, Dynamic = False, Default = \"QuickLookTemplate:NSImageNameQuickLookTemplate:16:12\nBluetoothTemplate:NSImageNameBluetoothTemplate\nIChatTheaterTemplate:NSImageNameIChatTheaterTemplate\nSlideshowTemplate:NSImageNameSlideshowTemplate\nActionTemplate:NSImageNameActionTemplate\nSmartBadgeTemplate:NSImageNameSmartBadgeTemplate\nPathTemplate:NSImageNamePathTemplate\nInvalidDataFreestandingTemplate:NSImageNameInvalidDataFreestandingTemplate\nLockLockedTemplate:NSImageNameLockLockedTemplate\nLockUnlockedTemplate:NSImageNameLockUnlockedTemplate\nGoBackTemplate:NSImageNameGoBackTemplate\nGoForwardTemplate:NSImageNameGoForwardTemplate\nGoRightTemplate:NSImageNameGoRightTemplate\nGoLeftTemplate:NSImageNameGoLeftTemplate\nRightFacingTriangleTemplate:NSImageNameRightFacingTriangleTemplate\nLeftFacingTriangleTemplate:NSImageNameLeftFacingTriangleTemplate\nAddTemplate:NSImageNameAddTemplate\nRemoveTemplate:NSImageNameRemoveTemplate\nRevealFreestandingTemplate:NSImageNameRevealFreestandingTemplate\nFollowLinkFreestandingTemplate:NSImageNameFollowLinkFreestandingTemplate:14:14\nEnterFullScreenTemplate:NSImageNameEnterFullScreenTemplate\nExitFullScreenTemplate:NSImageNameExitFullScreenTemplate\nStopProgressTemplate:NSImageNameStopProgressTemplate\nStopProgressFreestandingTemplate:NSImageNameStopProgressFreestandingTemplate:14:14\nRefreshTemplate:NSImageNameRefreshTemplate\nRefreshFreestandingTemplate:NSImageNameRefreshFreestandingTemplate\nFolder:NSImageNameFolder\nTrashEmpty:NSImageNameTrashEmpty\nTrashFull:NSImageNameTrashFull\nHomeTemplate:NSImageNameHomeTemplate\nBookmarksTemplate:NSImageNameBookmarksTemplate:16:12\nCaution:NSImageNameCaution\nStatusAvailable:NSImageNameStatusAvailable\nStatusPartiallyAvailable:NSImageNameStatusPartiallyAvailable\nStatusUnavailable:NSImageNameStatusUnavailable\nStatusNone:NSImageNameStatusNone\nApplicationIcon:NSImageNameApplicationIcon\nMenuOnStateTemplate:NSImageNameMenuOnStateTemplate\nMenuMixedStateTemplate:NSImageNameMenuMixedStateTemplate\nUserGuest:NSImageNameUserGuest\nMobileMe:NSImageNameMobileMe\nMultipleDocuments:NSImageNameMultipleDocuments\nUser:NSImageNameUser\nUserGroup:NSImageNameUserGroup\nEveryone:NSImageNameEveryone\nBonjour:NSImageNameBonjour\nDotMac:NSImageNameDotMac\nComputer:NSImageNameComputer\nFolderBurnable:NSImageNameFolderBurnable\nFolderSmart:NSImageNameFolderSmart\nNetwork:NSImageNameNetwork\nUserAccounts:NSImageNameUserAccounts\nPreferencesGeneral:NSImageNamePreferencesGeneral\nAdvanced:NSImageNameAdvanced\nInfo:NSImageNameInfo\nFontPanel:NSImageNameFontPanel\nColorPanel:NSImageNameColorPanel\nIconViewTemplate:NSImageNameIconViewTemplate\nListViewTemplate:NSImageNameListViewTemplate\nColumnViewTemplate:NSImageNameColumnViewTemplate\nFlowViewTemplate:NSImageNameFlowViewTemplate\nShareTemplate:NSImageNameShareTemplate\nTouchBarAddTemplate:NSImageNameTouchBarAddTemplate\nTouchBarAddDetailTemplate:NSImageNameTouchBarAddDetailTemplate\nTouchBarAlarmTemplate:NSImageNameTouchBarAlarmTemplate\nTouchBarAudioInputMuteTemplate:NSImageNameTouchBarAudioInputMuteTemplate\nTouchBarAudioInputTemplate:NSImageNameTouchBarAudioInputTemplate\nTouchBarAudioOutputMuteTemplate:NSImageNameTouchBarAudioOutputMuteTemplate\nTouchBarAudioOutputVolumeOffTemplate:NSImageNameTouchBarAudioOutputVolumeOffTemplate\nTouchBarAudioOutputVolumeLowTemplate:NSImageNameTouchBarAudioOutputVolumeLowTemplate\nTouchBarAudioOutputVolumeMediumTemplate:NSImageNameTouchBarAudioOutputVolumeMediumTemplate\nTouchBarAudioOutputVolumeHighTemplate:NSImageNameTouchBarAudioOutputVolumeHighTemplate\nTouchBarBookmarksTemplate:NSImageNameTouchBarBookmarksTemplate\nTouchBarColorPickerFill:NSImageNameTouchBarColorPickerFill\nTouchBarColorPickerFont:NSImageNameTouchBarColorPickerFont\nTouchBarColorPickerStroke:NSImageNameTouchBarColorPickerStroke\nTouchBarCommunicationAudioTemplate:NSImageNameTouchBarCommunicationAudioTemplate\nTouchBarCommunicationVideoTemplate:NSImageNameTouchBarCommunicationVideoTemplate\nTouchBarComposeTemplate:NSImageNameTouchBarComposeTemplate\nTouchBarDeleteTemplate:NSImageNameTouchBarDeleteTemplate\nTouchBarDownloadTemplate:NSImageNameTouchBarDownloadTemplate\nTouchBarEnterFullScreenTemplate:NSImageNameTouchBarEnterFullScreenTemplate\nTouchBarExitFullScreenTemplate\nTouchBarFastForwardTemplate\nTouchBarFolderCopyToTemplate\nTouchBarFolderMoveToTemplate\nTouchBarFolderTemplate\nTouchBarNewFolderTemplate\nTouchBarGetInfoTemplate\nTouchBarGoBackTemplate\nTouchBarGoDownTemplate\nTouchBarGoForwardTemplate\nTouchBarGoUpTemplate\nTouchBarHistoryTemplate\nTouchBarIconViewTemplate\nTouchBarListViewTemplate\nTouchBarMailTemplate\nTouchBarNewMessageTemplate\nTouchBarOpenInBrowserTemplate\nTouchBarPauseTemplate\nTouchBarPlayPauseTemplate\nTouchBarPlayTemplate\nTouchBarPlayheadTemplate\nTouchBarQuickLookTemplate\nTouchBarRecordStartTemplate\nTouchBarRecordStopTemplate\nTouchBarRefreshTemplate\nTouchBarRemoveTemplate\nTouchBarRewindTemplate\nTouchBarRotateLeftTemplate\nTouchBarRotateRightTemplate\nTouchBarSearchTemplate\nTouchBarShareTemplate\nTouchBarSidebarTemplate\nTouchBarSkipAhead15SecondsTemplate\nTouchBarSkipAhead30SecondsTemplate\nTouchBarSkipAheadTemplate\nTouchBarSkipBack15SecondsTemplate\nTouchBarSkipBack30SecondsTemplate\nTouchBarSkipBackTemplate\nTouchBarSkipToEndTemplate\nTouchBarSkipToStartTemplate\nTouchBarSlideshowTemplate\nTouchBarTagIconTemplate\nTouchBarTextBoldTemplate\nTouchBarTextItalicTemplate\nTouchBarTextUnderlineTemplate\nTouchBarTextStrikethroughTemplate\nTouchBarTextBoxTemplate\nTouchBarTextCenterAlignTemplate\nTouchBarTextJustifiedAlignTemplate\nTouchBarTextLeftAlignTemplate\nTouchBarTextRightAlignTemplate\nTouchBarTextListTemplate\nTouchBarUserAddTemplate\nTouchBarUserGroupTemplate\nTouchBarUserTemplate\nTouchBarVolumeDownTemplate\nTouchBarVolumeUpTemplate", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events LB1
	#tag Event
		Sub Open()
		  
		  dim pict as Picture
		  dim lines() as string
		  dim names() as string
		  dim w, h as double
		  
		  lines = Split( kListboxContent, EndOfLine )
		  
		  #pragma BreakOnExceptions false
		  
		  for each s as string in lines
		    names = s.Split( ":" )
		    dim NSImageName as string = "NSImageName" + names(0)
		    w = 0.0
		    h = 0.0
		    
		    if names(0).ContainsString("TouchBar") and NOT IsSierra then
		      // Touchbar icons aren't available before Mac OS 10.12 Sierra.
		      Continue
		    end if
		    
		    LB1.AddRow   names( 0 )
		    LB1.RowTag( LB1.LastIndex ) = NSImageName
		    
		    if names.Ubound>=2 then
		      w = Val( names( 2 ))
		    end if
		    
		    if names.Ubound>=3 then
		      h = Val( names( 3 ))
		    end if
		    
		    try
		      me.CellTag( me.LastIndex, 0 ) = SystemIcons.GetPictureFromName( NSImageName )
		    catch exc  
		      
		    end try
		    
		    
		    
		  next
		  
		  #pragma BreakOnExceptions default
		  
		  LB1.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  self.Subtitle = me.Cell( me.ListIndex, 0 )
		  
		  if me.ListIndex=-1 then
		    TF1.Text = ""
		    TF2.Text = ""
		    PushButton1.Enabled = false
		    return
		    
		  else
		    dim pict as Picture = me.CellTag( me.ListIndex, 0 ) 'me.RowPicture( me.ListIndex )
		    if pict <> nil then
		      TF1.Text = Str( pict.Width )
		      TF1.SelectAll
		      TF2.Text = Str( pict.Height )
		      PushButton1.Enabled = true
		      
		      BB1.Icon = pict
		      BB1.Invalidate
		      
		      dim w, h as Integer
		      if pict.Height > 14 then
		        dim factor as Double = Min( 14/pict.Width, 14/pict.Height )
		        w = pict.Width*factor
		        h = pict.Height*factor
		      else
		        w = pict.Width
		        h = pict.Height
		      end if
		      
		      PB1.Image = Pict
		      PB1.Image.Template = me.Cell( me.ListIndex, 0 ).ContainsString( "Template" )
		      PB1.Image.Size = Cocoa.NSMakeSize( w, h )
		      PB1.Invalidate
		      
		      SC1.ImageForSegment(0) = pict
		      SC1.ImageForSegment(0).Template = me.Cell( me.ListIndex, 0 ).ContainsString( "Template" )
		      SC1.ImageForSegment(0).Size = Cocoa.NSMakeSize( w, h )
		      SC1.Invalidate
		    end if
		  end if
		  
		  CVS1.Invalidate
		  CVS2.Invalidate
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  dim pict as Picture = me.CellTag(row,0)
		  dim imageSize as Double = 16 'me.DefaultRowHeight-2
		  
		  if pict <> Nil then
		    dim factor as Double = Min( imageSize/pict.Width, imageSize/pict.Height )
		    factor = min( factor, 1.0 ) // Don't upscale
		    
		    dim newWidth as Double = pict.Width*factor
		    dim newHeight as Double = pict.Height*factor
		    g.DrawPicture pict, (me.DefaultRowHeight/2) - (newWidth/2), (me.DefaultRowHeight/2) - (newHeight/2), newWidth, newHeight, 0, 0, pict.Width, pict.Height
		  else
		    
		  end if
		  
		  g.DrawString( me.Cell(row, column), 2 + (me.DefaultRowHeight-2) + 6, g.TextAscent + (me.DefaultRowHeight/2 - g.TextHeight/2) )
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  '
		  'dim pict as Picture
		  'dim w, h as double
		  'dim name as string
		  '
		  '
		  'name = LB1.RowTag( LB1.ListIndex )
		  'w = Val( TF1.Text )
		  'h = Val( TF2.Text )
		  '
		  'pict = SystemIcons.GetPictureFromName( name, w, h )
		  'LB1.RowPicture( LB1.ListIndex ) = pict
		  '
		  'LB1.Invalidate
		  
		  CVS2.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CVS1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if LB1.ListIndex=-1 then return
		  
		  dim pict1 as Picture
		  pict1 = LB1.CellTag(LB1.ListIndex, 0)
		  
		  if pict1 <> Nil then
		    
		    dim w, h as Integer
		    if pict1.Height > 16 then
		      dim factor as Double = Min( 16/pict1.Width, 16/pict1.Height )
		      w = pict1.Width*factor
		      h = pict1.Height*factor
		    else
		      w = pict1.Width
		      h = pict1.Height
		    end if
		    
		    g.DrawPicture   pict1.IconTemplateSetColor( &cFF9C30 ), 2, 0, w, h, 0, 0, pict1.Width, pict1.Height
		    g.DrawPicture   pict1.IconTemplateSetColor( &c959595 ), 26, 0, w, h, 0, 0, pict1.Width, pict1.Height
		    g.DrawPicture   pict1.IconTemplateSetColor( &c004080 ), 50, 0, w, h, 0, 0, pict1.Width, pict1.Height
		    
		    g.ForeColor = &c959595
		    g.FillRect   0, 20, g.Width, 45
		    g.DrawPicture   pict1.IconTemplateSetColor( &cFFFFFF ), 2, 21, w, h, 0, 0, pict1.Width, pict1.Height
		    g.DrawPicture   pict1.IconTemplateSetColor( &cCCFF66 ), 26, 21, w, h, 0, 0, pict1.Width, pict1.Height
		    g.DrawPicture   pict1.IconTemplateSetColor( &cFFCC66 ), 50, 21, w, h, 0, 0, pict1.Width, pict1.Height
		  end if
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SystemIconsToolbar1
	#tag Event
		Sub Open()
		  
		  ToolButton(me.Item( 0 )).Icon = SystemIcons.Advanced
		  ToolButton(me.Item( 1 )).Icon = SystemIcons.UserAccounts
		  ToolButton(me.Item( 2 )).Icon = SystemIcons.Network
		  ToolButton(me.Item( 4 )).Icon = SystemIcons.TrashEmpty
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Open()
		  dim iconHeight as Integer = 10
		  
		  me.ImageForSegment(0) = SystemIcons.IconViewTemplate
		  me.ImageForSegment(0).Template = True
		  me.ImageForSegment(0).Size = Cocoa.NSMakeSize( me.ImageForSegment(0).Size.width/(me.ImageForSegment(0).Size.height/iconHeight), iconHeight )
		  
		  me.ImageForSegment(1) = SystemIcons.ListViewTemplate
		  me.ImageForSegment(1).Template = True
		  me.ImageForSegment(1).Size = Cocoa.NSMakeSize( me.ImageForSegment(1).Size.width/(me.ImageForSegment(1).Size.height/iconHeight), iconHeight )
		  
		  me.ImageForSegment(2) = SystemIcons.ColumnViewTemplate
		  me.ImageForSegment(2).Template = True
		  me.ImageForSegment(2).Size = Cocoa.NSMakeSize( me.ImageForSegment(2).Size.width/(me.ImageForSegment(2).Size.height/iconHeight), iconHeight )
		  
		  me.ImageForSegment(3) = SystemIcons.FlowViewTemplate
		  me.ImageForSegment(3).Template = True
		  me.ImageForSegment(3).Size = Cocoa.NSMakeSize( me.ImageForSegment(3).Size.width/(me.ImageForSegment(3).Size.height/iconHeight), iconHeight )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl2
	#tag Event
		Sub Open()
		  dim iconHeight as Integer = 12
		  
		  me.ImageForSegment(0) = SystemIcons.GoLeftTemplate
		  me.ImageForSegment(0).Template = True
		  me.ImageForSegment(0).Size = Cocoa.NSMakeSize( me.ImageForSegment(0).Size.width/(me.ImageForSegment(0).Size.height/iconHeight), iconHeight )
		  
		  me.ImageForSegment(1) = SystemIcons.GoRightTemplate
		  me.ImageForSegment(1).Template = True
		  me.ImageForSegment(1).Size = Cocoa.NSMakeSize( me.ImageForSegment(1).Size.width/(me.ImageForSegment(1).Size.height/iconHeight), iconHeight )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl3
	#tag Event
		Sub Open()
		  dim iconHeight as Integer = 14
		  
		  me.ImageForSegment(0) = SystemIcons.ActionTemplate
		  me.ImageForSegment(0).Template = True
		  me.ImageForSegment(0).Size = Cocoa.NSMakeSize( me.ImageForSegment(0).Size.width/(me.ImageForSegment(0).Size.height/iconHeight), iconHeight )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl4
	#tag Event
		Sub Open()
		  dim iconHeight as Integer = 12
		  
		  me.ImageForSegment(0) = SystemIcons.QuickLookTemplate.IconTemplateSetColor( &cA6A6A6 )
		  me.ImageForSegment(0).Template = True
		  me.ImageForSegment(0).Size = Cocoa.NSMakeSize( me.ImageForSegment(0).Size.width/(me.ImageForSegment(0).Size.height/iconHeight), iconHeight )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl5
	#tag Event
		Sub Open()
		  me.Items( 0 ).Icon = SystemIcons.AddTemplate
		  me.ImageForSegment( 0 ).Template = True
		  me.Items( 1 ).Icon = SystemIcons.RemoveTemplate
		  me.ImageForSegment( 1 ).Template = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  static pict as Picture = SystemIcons.InvalidDataFreestandingTemplate
		  g.DrawPicture  pict.IconTemplateSetColor(&c7F0000), 0, 0, 14, 14, 0, 0, pict.Width, pict.Height
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PB1
	#tag Event
		Sub Open()
		  me.BezelStyle = NSBezelStyle.NSTexturedRoundedBezelStyle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CVS2
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'g.ForeColor = &c959595
		  'g.FillRect   0, 0, g.Width, g.Height
		  
		  if LB1.ListIndex > -1 then
		    dim pict1 as Picture = LB1.CellTag(LB1.ListIndex, 0)
		    if IsDarkMode and LB1.Cell(LB1.ListIndex, 0).ContainsString("template") then
		      pict1 = pict1.IconTemplateSetColor( &cFFFFFF )
		    end if
		    g.DrawPicture pict1, 1 + (g.Width/2) - (Val( TF1.Text )/2), 1 + (g.Height/2) - (Val( TF2.Text )/2),  Val( TF1.Text ), Val( TF2.Text ),   0, 0, pict1.Width, pict1.Height
		  else
		    
		  end if
		  
		  g.DrawRect 0, 0, g.Width, g.Height
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
