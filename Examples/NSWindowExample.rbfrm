#tag Window
Begin Window NSWindowExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "0"
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   473
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   "0"
   Resizable       =   True
   Resizeable      =   "True"
   SystemUIVisible =   True
   Title           =   "NSWindow Example"
   Type            =   "0"
   Visible         =   True
   Width           =   700
   Begin PagePanel ppExamples
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   450
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   200
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   3
      Panels          =   ""
      Scope           =   0
      SelectedPanelIndex=   2
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   2
      Visible         =   True
      Width           =   500
      Begin PushButton btnSetFileByURL
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Set File By URL"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   195
      End
      Begin PushButton btnSetFileByPath
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Set File By Path"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   195
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   33
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "(Will put or remove the grey dot from the close button. If you've specified a file above, will also dim the icon.)"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   134
         Transparent     =   False
         Underline       =   False
         Value           =   "(Will put or remove the grey dot from the close button. If you've specified a file above, will also dim the icon.)"
         Visible         =   True
         Width           =   399
      End
      Begin Label lblFilePath
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   419
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "No file specified"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Value           =   "No file specified"
         Visible         =   True
         Width           =   261
      End
      Begin PushButton btnFullScreenToggle
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Toggle Fullscreen"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   485
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   364
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   195
      End
      Begin CheckBox chkBehaviorCanJoinAllSpaces
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Visible On All Spaces"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window appears in all spaces."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorMoveToActiveSpace
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Move to Active Space"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Making the window active does not cause a space switch; the window switches to the active space."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorManaged
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Managed"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window participates in Spaces and Exposé. This is the default behavior if windowLevel is equal to NSNormalWindowLevel."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   78
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorTransient
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Transient"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window floats in Spaces and is hidden by Exposé. This is the default behavior if windowLevel is not equal to NSNormalWindowLevel."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorStationary
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Stationary"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window is unaffected by Exposé; it stays visible and stationary, like the desktop window."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   142
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorParticipatesInCycle
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Participates In Cycle"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window participates in the window cycle for use with the Cycle Through Windows Window menu item."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   174
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorIgnoresCycle
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Ignores Cycle"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "The window is not part of the window cycle for use with the Cycle Through Windows Window menu item."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   206
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkBehaviorFullscreenAllowed
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Fullscreen Allowed"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "A window with this collection behavior has a fullscreen button in the upper right of its titlebar."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "1"
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   238
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         VisualState     =   "1"
         Width           =   190
      End
      Begin CheckBox chkMovable
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Movable"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Specifies whether the window can be dragged by clicking in its title bar or background."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "1"
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         VisualState     =   "1"
         Width           =   190
      End
      Begin CheckBox chkIsModified
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Document Edited"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   195
      End
      Begin CheckBox chkIsFullScreen
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Is Fullscreen"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   364
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkMovableByBackground
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Movable by Background"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Sets whether the window is movable by clicking and dragging anywhere in its background."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   10.0
         FontUnit        =   0
         Height          =   24
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "(Move by background doesn't seem to work in REALStudio, but does in Xojo)"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   False
         Value           =   "(Move by background doesn't seem to work in REALStudio, but does in Xojo)"
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   16
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Behavior:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   270
         Transparent     =   False
         Underline       =   False
         Value           =   "Behavior:"
         Visible         =   True
         Width           =   77
      End
      Begin Label lblCollectionBehavior
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   301
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "0"
         TextAlign       =   "2"
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   270
         Transparent     =   False
         Underline       =   False
         Value           =   "0"
         Visible         =   True
         Width           =   101
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "BackingScaleFactor:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   302
         Transparent     =   False
         Underline       =   False
         Value           =   "BackingScaleFactor:"
         Visible         =   True
         Width           =   138
      End
      Begin Label lblBackingScaleFactor
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   362
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "0"
         TextAlign       =   "2"
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   302
         Transparent     =   False
         Underline       =   False
         Value           =   "0"
         Visible         =   True
         Width           =   40
      End
      Begin CheckBox chkHasShadow
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Has Shadow"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Display/Hide the window shadow"
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "1"
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         VisualState     =   "1"
         Width           =   190
      End
      Begin PushButton btnShowHUD
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Show HUD Window"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkHidesOnDeactivate
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hides On Deactivate"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Specifies whether the window is removed from the screen when the application is inactive."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   20
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkCanHide
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Can Hide"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Specifies whether the window can be hidden when its application becomes hidden (during execution of the NSApplication hide: method)."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "1"
         TabIndex        =   21
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   142
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         VisualState     =   "1"
         Width           =   190
      End
      Begin PopupMenu popResizeOptions
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         InitialValue    =   "Lock Top Left\rLock Top Right\rLock Bottom Left\rLock Bottom Right\rLock Center Top\rLock Center Left\rLock Center Bottom\rLock Center Right\rResize All Sides"
         Italic          =   False
         Left            =   414
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   125
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSmoothResize
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Smooth Resize"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   126
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnCenter
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Center"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   94
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin Slider slideAlphaValue
         AllowAutoDeactivate=   True
         AllowLiveScrolling=   True
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Left            =   212
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Maximum         =   100
         MaximumValue    =   100
         Minimum         =   0
         MinimumValue    =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         TickMarkStyle   =   "0"
         TickStyle       =   "0"
         Top             =   198
         Transparent     =   False
         Value           =   100
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Alpha Value:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   174
         Transparent     =   False
         Underline       =   False
         Value           =   "Alpha Value:"
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkIgnoreMouseEvents
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Ignore Mouse Events"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Specifies whether the window is transparent to mouse clicks and other mouse events, allowing overlay windows.\r\rWARNING: Due to the nature of this property, you will not be able to unset this value once you set it to TRUE"
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   22
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   174
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin Slider slideTransparency
         AllowAutoDeactivate=   True
         AllowLiveScrolling=   True
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Left            =   212
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Maximum         =   100
         MaximumValue    =   100
         Minimum         =   0
         MinimumValue    =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         TickMarkStyle   =   "0"
         TickStyle       =   "0"
         Top             =   266
         Transparent     =   False
         Value           =   100
         Visible         =   True
         Width           =   190
      End
      Begin Label slideTransparancy
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Transparency:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   240
         Transparent     =   False
         Underline       =   False
         Value           =   "Transparency:"
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSplash
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Show Splash Window"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   414
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   266
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnIsOnActiveSpace
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Is On Active Space?"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   414
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   94
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   10.0
         FontUnit        =   0
         Height          =   36
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   23
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "(This window will ignore clicks, so press command-G to turn ""Ignore Mouse Events"" off.)"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   205
         Transparent     =   False
         Underline       =   False
         Value           =   "(This window will ignore clicks, so press command-G to turn ""Ignore Mouse Events"" off.)"
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   26
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "StyleMask:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   332
         Transparent     =   False
         Underline       =   False
         Value           =   "StyleMask:"
         Visible         =   True
         Width           =   138
      End
      Begin Label lblStyleMask
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   362
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   27
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "0"
         TextAlign       =   "2"
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   332
         Transparent     =   False
         Underline       =   False
         Value           =   "0"
         Visible         =   True
         Width           =   40
      End
      Begin PushButton btnSetVisualEffect
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Light Visual Effect"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   301
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSetFile
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Set File"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   195
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide close button"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   179
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   10.0
         FontUnit        =   0
         Height          =   36
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "(OS X 10.10+ Makes the toolbar blurry transparent and moves it down to hover over the window content.)"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   307
         Transparent     =   False
         Underline       =   False
         Value           =   "(OS X 10.10+ Makes the toolbar blurry transparent and moves it down to hover over the window content.)"
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkFullSizeContentView
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "FullSizeContentView"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   "Makes the toolbar blurry transparent and moves it down to hover over the window content. (OS X 10.10+)"
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   283
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin CheckBox chkTransparentToolbar
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Transparent Toolbar"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   190
      End
      Begin PushButton btnHideTitle
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Hide Title"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   219
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide minimize button"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   203
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide zoom button"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   227
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide fullscreen button"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide toolbar button"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   275
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide document icon"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   16
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   299
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin CheckBox chkHideTitleButtons
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hide document versions"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   "0"
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   323
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   "0"
         Width           =   219
      End
      Begin PushButton btnHideTitlebar
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Hide Titlebar"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   490
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   190
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSetVisualEffect1
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Dark Visual Effect"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   333
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSetVisualEffect2
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Titlebar Visual Effect"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   414
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   301
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSetVisualEffect21
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Appearance Based VE"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   414
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   333
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin PopupMenu popTabbingMode
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         InitialValue    =   "Automatic\nPreferred\nDisallowed"
         Italic          =   False
         Left            =   212
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   20
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   389
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "ppExamples"
         Italic          =   False
         Left            =   212
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   21
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "Tabbing Mode:"
         TextAlign       =   "0"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   365
         Transparent     =   True
         Underline       =   False
         Value           =   "Tabbing Mode:"
         Visible         =   True
         Width           =   182
      End
   End
   Begin Listbox lstExamples
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   22
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontal=   "0"
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   False
      HasHeader       =   False
      HasHeading      =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   450
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Titlebar behavior\rWindow behavior\rAppearance & Position"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   True
      RowSelectionType=   "0"
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   True
      SelectionType   =   "0"
      ShowDropIndicator=   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  m_NSWindow.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorUtilityWindow // Fade-out on closing
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if chkIgnoreMouseEvents.Value then // IgnoreMouseEvents is turned on, so we have to pay attention to the keystrokes
		    if key = "g" and Keyboard.CommandKey then
		      chkIgnoreMouseEvents.Value = false
		      return true
		    end if
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Moved()
		  UpdateBackingScaleFactor
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  m_NSWindow = self // Record a reference to NSWindow
		  
		  // Pop up out of the center of the screen!
		  m_NSWindow.Center
		  m_NSWindow.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorAlertPanel // Pop up suddenly, as if there is an important alert!
		  'm_NSWindow.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorDocumentWindow // Zoom in slowely as if opening a document
		  
		  // Set presentation options for full screen mode
		  Dim NSApp as NSApplication = NSApplication.App
		  NSApp.PresentationOptions = integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationFullScreen) or _
		  integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideToolbar) or _
		  integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideMenuBar) or _
		  integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideDock)
		  
		  m_NSWindow.FullscreenAllowed = true // Allow fullscreen mode
		  m_NSWindow.ContentBorderBottomThickness = 23 // Draw a border at the bottom of the window
		  
		  // Check whether the window is on a retina screen
		  UpdateBackingScaleFactor
		  UpdateCollectionBehavior
		  UpdateStyleMask
		  
		  // Sets app wide automatic tabbing mode
		  'WindowExtensions.TabsForApp(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  UpdateFullscreen
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub UpdateBackingScaleFactor()
		  dim factor as double = m_NSWindow.BackingScaleFactor
		  lblBackingScaleFactor.Text = str( factor )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCollectionBehavior()
		  lblCollectionBehavior.Text = str( m_NSWindow.CollectionBehavior )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFullscreen()
		  chkIsFullScreen.Value = m_NSWindow.IsFullscreen
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateStyleMask()
		  lblStyleMask.Text = str( m_NSWindow.StyleMask )
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		m_NSWindow As NSWindow
	#tag EndProperty


#tag EndWindowCode

#tag Events btnSetFileByURL
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem( "" )
		  dim url as NSURL
		  if f <> nil then
		    url = new NSURL( f )
		  end if
		  m_NSWindow.RepresentedURL = url
		  if url = nil then
		    self.Title = "No File Set"
		  end if
		  
		  url = m_NSWindow.RepresentedURL
		  if url = nil then
		    lblFilePath.Text = "No file specified"
		  else
		    lblFilePath.Text = url.Item.POSIXPath
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetFileByPath
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem( "" )
		  dim path as string
		  if f <> nil then
		    path = f.POSIXPath
		  end if
		  m_NSWindow.RepresentedFilename = path
		  if path = "" then
		    self.Title = "No File Set"
		  end if
		  
		  path = m_NSWindow.RepresentedFilename
		  if path = "" then
		    lblFilePath.Text = "No file specified"
		  else
		    lblFilePath.Text = path
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnFullScreenToggle
	#tag Event
		Sub Action()
		  if m_NSWindow.FullscreenAllowed then
		    m_NSWindow.ToggleFullScreen
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorCanJoinAllSpaces
	#tag Event
		Sub Action()
		  if chkBehaviorMoveToActiveSpace.Value then
		    MsgBox "NSWindow can't both be visible on all spaces & move to active space"
		    me.Value = false
		    return
		  end if
		  m_NSWindow.CanJoinAllSpaces = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorMoveToActiveSpace
	#tag Event
		Sub Action()
		  if chkBehaviorCanJoinAllSpaces.Value then
		    MsgBox "NSWindow can't both be visible on all spaces & move to active space"
		    me.Value = false
		    return
		  end if
		  m_NSWindow.MoveToActiveSpace = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorManaged
	#tag Event
		Sub Action()
		  m_NSWindow.Managed = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorTransient
	#tag Event
		Sub Action()
		  m_NSWindow.Transient = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorStationary
	#tag Event
		Sub Action()
		  m_NSWindow.Stationary = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorParticipatesInCycle
	#tag Event
		Sub Action()
		  m_NSWindow.ParticipatesInCycle = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorIgnoresCycle
	#tag Event
		Sub Action()
		  m_NSWindow.IgnoresCycle = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkBehaviorFullscreenAllowed
	#tag Event
		Sub Action()
		  m_NSWindow.FullscreenAllowed = me.Value
		  
		  UpdateCollectionBehavior
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkMovable
	#tag Event
		Sub Action()
		  m_NSWindow.IsMovable = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkIsModified
	#tag Event
		Sub Action()
		  self.IsModified = me.Value
		  
		  // I'm using IsModified here because it's a convenience method and will probably be used
		  // more often than calling the NSWindow method directly. It, in turn, calls NSWindow.DocumentEdited.
		  //
		  // Otherwise, I could have used m_NSWindow.DocumentEdited.
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkMovableByBackground
	#tag Event
		Sub Action()
		  m_NSWindow.IsMovable = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkHasShadow
	#tag Event
		Sub Action()
		  m_NSWindow.HasShadow = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnShowHUD
	#tag Event
		Sub Action()
		  NSWindowHUDExample.Show
		  'NSWindowHUDExample.Top = self.Top
		  'NSWindowHUDExample.Left = self.Left + self.Width + 20
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkHidesOnDeactivate
	#tag Event
		Sub Action()
		  m_NSWindow.HidesOnDeactivate = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkCanHide
	#tag Event
		Sub Action()
		  m_NSWindow.CanHide = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSmoothResize
	#tag Event
		Sub Action()
		  dim origWidth as Integer = self.Width
		  dim origHeight as Integer = self.Height
		  
		  self.SmoothResize( Width + 200, Height + 200, popResizeOptions.ListIndex )
		  app.SleepCurrentThread 1000 // Pause for 1 second before sizing back to original size.
		  self.SmoothResize( origWidth, origHeight, popResizeOptions.ListIndex )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCenter
	#tag Event
		Sub Action()
		  m_NSWindow.Center
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events slideAlphaValue
	#tag Event
		Sub ValueChanged()
		  m_NSWindow.AlphaValue = me.Value / 100
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkIgnoreMouseEvents
	#tag Event
		Sub Action()
		  m_NSWindow.IgnoresMouseEvents = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events slideTransparency
	#tag Event
		Sub ValueChanged()
		  m_NSWindow.Transparency = me.Value / 100
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSplash
	#tag Event
		Sub Action()
		  NSWindowSplashExample.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnIsOnActiveSpace
	#tag Event
		Sub Action()
		  if m_NSWindow.IsOnActiveSpace then
		    MsgBox self.Title + " is on the currently active space"
		  else
		    MsgBox self.Title + " is NOT on the currently active space"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetVisualEffect
	#tag Event
		Sub Action()
		  
		  self.SetVisualEffectView( NSVisualEffectView.NSMaterial.Light )
		  'self.SetVisualEffectView( 0, 23, self.Width/2, (self.Height/2) - 23, NSVisualEffectView.NSMaterial.Dark, False, True )
		  'self.SetVisualEffectView( self.width/2, self.Height/2, self.Width/2, self.Height/2, NSVisualEffectView.NSMaterial.Dark, True, False )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetFile
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem( "" )
		  self.DocumentFile = f
		  if f is nil then
		    self.Title = "No File Set"
		  end if
		  
		  f = self.DocumentFile
		  if f is nil then
		    lblFilePath.Text = "No file specified"
		  else
		    lblFilePath.Text = f.POSIXPath
		  end if
		  
		  
		  // I'm using DocumentFile here because it's a convenience method and will probably be used
		  // more often than calling the NSWindow method directly. It, in turn, calls NSWindow.RepresentedFile
		  // in Cocoa, or the appropriate Carbon methods.
		  //
		  // Otherwise, I could have used m_NSWindow.RepresentedFile = f in Cocoa.
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkHideTitleButtons
	#tag Event
		Sub Action(index as Integer)
		  dim button as NSWindowButton
		  
		  Select case index
		  case 0
		    button = NSWindowButton.NSWindowCloseButton
		    
		  case 1
		    button = NSWindowButton.NSWindowMiniaturizeButton
		    
		  case 2
		    button = NSWindowButton.NSWindowZoomButton
		    
		  case 3
		    button = NSWindowButton.NSWindowFullScreenButton
		    
		  case 4
		    button = NSWindowButton.NSWindowToolbarButton
		    
		  case 5
		    button = NSWindowButton.NSWindowDocumentIconButton
		    
		  case 6
		    button = NSWindowButton.NSWindowDocumentVersionsButton
		    
		  End Select
		  
		  self.HideWindowButton(button) = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkFullSizeContentView
	#tag Event
		Sub Action()
		  m_NSWindow.FullSizeContentView = me.Value
		  UpdateStyleMask
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Enabled = IsYosemite
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkTransparentToolbar
	#tag Event
		Sub Action()
		  
		  if IsYosemite then
		    'm_NSWindow.TitlebarAppearsTransparent = me.Value
		    self.TitlebarAppearsTransparent = me.Value
		  else
		    #if DebugBuild then
		      MsgBox "This option is for OS X 10.10+"
		    #endif
		    me.Value = False
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Enabled = IsYosemite
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnHideTitle
	#tag Event
		Sub Action()
		  
		  if IsYosemite then
		    if m_NSWindow.WindowTitleVisibility = NSWindow.NSWindowTitleVisibility.Visible then
		      m_NSWindow.WindowTitleVisibility = NSWindow.NSWindowTitleVisibility.Hidden
		      me.Caption = "Show Title"
		    else
		      m_NSWindow.WindowTitleVisibility = NSWindow.NSWindowTitleVisibility.Visible
		      me.Caption = "Hide Title"
		    end if
		  else
		    #if DebugBuild then
		      MsgBox "This option is for OS X 10.10+"
		    #endif
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Enabled = IsYosemite
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnHideTitlebar
	#tag Event
		Sub Action()
		  chkHideTitleButtons(0).Value = True
		  chkHideTitleButtons(1).Value = True
		  chkHideTitleButtons(2).Value = True
		  chkHideTitleButtons(5).Value = True
		  
		  chkTransparentToolbar.Value = True
		  chkFullSizeContentView.Value = True
		  
		  btnHideTitle.Push
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetVisualEffect1
	#tag Event
		Sub Action()
		  
		  self.SetVisualEffectView( NSVisualEffectView.NSMaterial.Dark )
		  'self.SetVisualEffectView( 0, 23, self.Width/2, (self.Height/2) - 23, NSVisualEffectView.NSMaterial.Dark, False, True )
		  'self.SetVisualEffectView( self.width/2, self.Height/2, self.Width/2, self.Height/2, NSVisualEffectView.NSMaterial.Dark, True, False )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetVisualEffect2
	#tag Event
		Sub Action()
		  self.SetVisualEffectView( NSVisualEffectView.NSMaterial.Titlebar )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetVisualEffect21
	#tag Event
		Sub Action()
		  self.SetVisualEffectView( NSVisualEffectView.NSMaterial.AppearanceBased )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popTabbingMode
	#tag Event
		Sub Change()
		  self.TabsForWindow = WindowExtensions.TabbingMode(me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstExamples
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    ppExamples.Value = me.ListIndex
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
