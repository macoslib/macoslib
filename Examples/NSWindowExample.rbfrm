#tag Window
Begin Window NSWindowExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   423
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
   Title           =   "NSWindow Example"
   Visible         =   True
   Width           =   700
   Begin PagePanel ppExamples
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
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
      TabIndex        =   16
      TabPanelIndex   =   0
      Top             =   0
      Value           =   2
      Visible         =   True
      Width           =   500
      Begin PushButton btnSetFileByURL
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set File By URL"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   78
         Underline       =   ""
         Visible         =   True
         Width           =   195
      End
      Begin PushButton btnSetFileByPath
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set File By Path"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   46
         Underline       =   ""
         Visible         =   True
         Width           =   195
      End
      Begin PushButton btnSetFile
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set File"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Visible         =   True
         Width           =   195
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   45
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         Text            =   "(Will put or remove the grey dot from the close button. If you've specified a file above, will also dim the icon.)"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   158
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   399
      End
      Begin Label lblFilePath
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   52
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   419
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         Text            =   "No file specified"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   261
      End
      Begin PushButton btnFullScreenToggle
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Toggle Fullscreen"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   485
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   364
         Underline       =   ""
         Visible         =   True
         Width           =   195
      End
      Begin CheckBox chkBehaviorCanJoinAllSpaces
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Visible On All Spaces"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window appears in all spaces."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorMoveToActiveSpace
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Move to Active Space"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Making the window active does not cause a space switch; the window switches to the active space."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   46
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorManaged
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Managed"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window participates in Spaces and Exposé. This is the default behavior if windowLevel is equal to NSNormalWindowLevel."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   78
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorTransient
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Transient"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window floats in Spaces and is hidden by Exposé. This is the default behavior if windowLevel is not equal to NSNormalWindowLevel."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   110
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorStationary
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Stationary"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window is unaffected by Exposé; it stays visible and stationary, like the desktop window."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   142
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorParticipatesInCycle
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Participates In Cycle"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window participates in the window cycle for use with the Cycle Through Windows Window menu item."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   174
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorIgnoresCycle
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Ignores Cycle"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "The window is not part of the window cycle for use with the Cycle Through Windows Window menu item."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   206
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkBehaviorFullscreenAllowed
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Fullscreen Allowed"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "A window with this collection behavior has a fullscreen button in the upper right of its titlebar."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   238
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkMovable
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Movable"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Specifies whether the window can be dragged by clicking in its title bar or background."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkIsModified
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Document Edited"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   126
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   195
      End
      Begin CheckBox chkIsFullScreen
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Is Fullscreen"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   364
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkMovableByBackground
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Movable by Background"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Sets whether the window is movable by clicking and dragging anywhere in its background."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   46
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   2
         Text            =   "(Move by background doesn't seem to work in REALStudio, but does in Xojo)"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   10
         TextUnit        =   0
         Top             =   70
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   16
         TabPanelIndex   =   2
         Text            =   "Behavior:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   270
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   77
      End
      Begin Label lblCollectionBehavior
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   301
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   2
         Text            =   0
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   270
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   101
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   2
         Text            =   "BackingScaleFactor:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   302
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   138
      End
      Begin Label lblBackingScaleFactor
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   362
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   2
         Text            =   0
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   302
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   40
      End
      Begin CheckBox chkHasShadow
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Has Shadow"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Display/Hide the window shadow"
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnShowHUD
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Show HUD Window"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   46
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkHidesOnDeactivate
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Hides On Deactivate"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Specifies whether the window is removed from the screen when the application is inactive."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   20
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   110
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkCanHide
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Can Hide"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Specifies whether the window can be hidden when its application becomes hidden (during execution of the NSApplication hide: method)."
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   21
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   142
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   190
      End
      Begin PopupMenu popResizeOptions
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         InitialValue    =   "Lock Top Left\rLock Top Right\rLock Bottom Left\rLock Bottom Right\rLock Center Top\rLock Center Left\rLock Center Bottom\rLock Center Right\rResize All Sides"
         Italic          =   ""
         Left            =   414
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   125
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSmoothResize
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Smooth Resize"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   126
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnCenter
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Center"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   94
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin Slider slideAlphaValue
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Left            =   212
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         TickStyle       =   0
         Top             =   198
         Value           =   100
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   3
         Text            =   "Alpha Value:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   174
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin CheckBox chkIgnoreMouseEvents
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Ignore Mouse Events"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Specifies whether the window is transparent to mouse clicks and other mouse events, allowing overlay windows.\r\rWARNING: Due to the nature of this property, you will not be able to unset this value once you set it to TRUE"
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   22
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   174
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   190
      End
      Begin Slider slideTransparency
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Left            =   212
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         TickStyle       =   0
         Top             =   266
         Value           =   100
         Visible         =   True
         Width           =   190
      End
      Begin Label slideTransparancy
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   212
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   3
         Text            =   "Transparency:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   240
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnSplash
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Show Splash Window"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   414
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   266
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin PushButton btnIsOnActiveSpace
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Is On Active Space?"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   414
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   94
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
      Begin Label lblArray
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   47
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "ppExamples"
         Italic          =   ""
         Left            =   490
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   23
         TabPanelIndex   =   2
         Text            =   "(This window will ignore clicks, so press command-G to turn ""Ignore Mouse Events"" off.)"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   10
         TextUnit        =   0
         Top             =   205
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   190
      End
   End
   Begin Listbox lstExamples
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   22
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Working with files\rWindow behavior\rAppearance & Position"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   200
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
		  NSApp.PresentationOptions = integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationFullScreen or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideToolbar or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideMenuBar or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideDock)
		  
		  m_NSWindow.FullscreenAllowed = true // Allow fullscreen mode
		  m_NSWindow.ContentBorderBottomThickness = 23 // Draw a border at the bottom of the window
		  
		  // Check whether the window is on a retina screen
		  UpdateBackingScaleFactor
		  UpdateCollectionBehavior
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
#tag Events lstExamples
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    ppExamples.Value = me.ListIndex
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
