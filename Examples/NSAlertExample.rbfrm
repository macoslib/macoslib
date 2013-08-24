#tag Window
Begin Window NSAlertExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.0e+2
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
   Title           =   "NSAlert Example"
   Visible         =   True
   Width           =   700
   Begin PushButton btnAlertMultiButtons
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Extra Buttons"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
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
      Top             =   111
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin PushButton btnAlertOKCancelDialog
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Cancel / OK Dialog"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   1
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   47
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin TextField edtResult
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
      Italic          =   ""
      Left            =   107
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   359
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   361
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      TabStop         =   True
      Text            =   "Result:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   360
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   75
   End
   Begin PushButton btnResetAlerts
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Reset Alerts"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   580
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
      Top             =   360
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton btnAlertOKCancelDialog1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Cancel / Yes / No Dialog"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   1
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   79
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin PushButton btnAlertMessage
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Message Dialog"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   480
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
      Top             =   15
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin PushButton btnAlertCustomDialog
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Show Custom Dialog"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   268
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
      Top             =   328
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Message Text:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   15
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Informative Text:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   47
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin TextField edtMessage
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
      Italic          =   ""
      Left            =   182
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Are you sure you want to save changes to this document?"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin TextArea edtInformation
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
      Height          =   66
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   182
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
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This action cannot be undone"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Default Button:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Alternate Button:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   156
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Other Button:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   191
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin TextField edtBtnDefault
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
      Italic          =   ""
      Left            =   182
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
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Save"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   123
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin TextField edtBtnAlternate
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
      Italic          =   ""
      Left            =   182
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
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cancel"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   155
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin TextField edtBtnOther
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
      Italic          =   ""
      Left            =   182
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
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Don't Save"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   189
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin CheckBox chkSuppression
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Show Suppression Button"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   182
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   224
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   286
   End
   Begin CheckBox chkHelp
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Show Help Button"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   182
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   256
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   286
   End
   Begin PopupMenu popStyle
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Warning\rInformational\rCritical"
      Italic          =   ""
      Left            =   182
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   288
      Underline       =   ""
      Visible         =   True
      Width           =   130
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Alert Style:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   288
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin PushButton btnAlertCustomSheet
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Show Custom Sheet"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   56
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   328
      Underline       =   ""
      Visible         =   True
      Width           =   200
   End
   Begin NSAlert SheetAlert
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   12
      LockedInPosition=   False
      Scope           =   0
      ShowsHelp       =   ""
      ShowsSuppressionButton=   ""
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   316
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events btnAlertMultiButtons
	#tag Event
		Sub Action()
		  // MessageText dialog
		  dim nsa as New NSAlert("You can add as many buttons as you want to a 'MessageText' dialog." + chr(13) + chr(13) + "If you add buttons to an 'InformativeText' dialog, an 'OK' button will be added before any additional buttons.")
		  
		  // InformativeText dialog
		  'dim nsa as New NSAlert("You can add as many buttons as you want to a 'MessageText' dialog.", "If you add buttons to an 'InformativeText' dialog, an 'OK' button will be added before any additional buttons.")
		  
		  dim One as NSButton = nsa.AddButtonWithTitle("One")
		  dim Two as NSButton = nsa.AddButtonWithTitle("Two")
		  dim Three as NSButton = nsa.AddButtonWithTitle("Three")
		  dim Four as NSButton = nsa.AddButtonWithTitle("Four")
		  dim Five as NSButton = nsa.AddButtonWithTitle("Five")
		  dim Six as NSButton = nsa.AddButtonWithTitle("Six")
		  dim Seven as NSButton = nsa.AddButtonWithTitle("Seven")
		  
		  #pragma Unused One
		  #pragma Unused Two
		  #pragma Unused Three
		  #pragma Unused Four
		  #pragma Unused Five
		  #pragma Unused Six
		  #pragma Unused Seven
		  
		  dim AllButtons as NSArray = nsa.Buttons // Get all the alert's buttons, including a default 'OK' button.
		  for i as Integer = 0 to AllButtons.Count -1 // set all the button's bezelstyle
		    dim button as New NSButton( AllButtons.Value(i) )
		    button.BezelStyle = NSButton.NSBezelStyle.NSRoundedBezelStyle
		  next
		  
		  dim i as Integer = nsa.RunModal
		  
		  edtResult.Text = str( i )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAlertOKCancelDialog
	#tag Event
		Sub Action()
		  dim b as boolean = AlertOKCancelDialog( _
		  "Are you sure you want to do this?", _ // Title
		  "You will not be able to undo this action", _ // InformativeText
		  "OK", "Cancel", _ // OK/Cancel buttons
		  True, _ // Show warning icon
		  "NSAlertExampleOKCancelDialog" ) // Show suppression button and save the default value
		  
		  edtResult.Text = Str( b )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnResetAlerts
	#tag Event
		Sub Action()
		  App.Prefs.Remove("NSAlertExampleOKCancelDialog")
		  App.Prefs.Remove("NSAlertExampleYesNoCancelDialog")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAlertOKCancelDialog1
	#tag Event
		Sub Action()
		  dim i as Integer = AlertYesNoCancelDialog( _
		  "Are you sure you want to do this?", _ // Title
		  "You will not be able to undo this action", _ // InformativeText
		  "Yes", "No", "Cancel", _ // OK/Cancel buttons
		  False, _ // Show warning icon
		  "NSAlertExampleYesNoCancelDialog" ) // Show suppression button and save the default value
		  
		  Select case i
		  case -1
		    edtResult.Text = "No"
		  case 0
		    edtResult.Text = "Cancel"
		  case 1
		    edtResult.Text = "Yes"
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAlertMessage
	#tag Event
		Sub Action()
		  AlertMessageDialog( "This dialog is the same as the default MsgBox without options" + chr(13) + chr(13) + "Including where adding two returns splits the message into a title and informative text" )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAlertCustomDialog
	#tag Event
		Sub Action()
		  dim nsa as New CustomAlert
		  
		  nsa.MessageText = edtMessage.Text
		  nsa.InformativeText = edtInformation.Text
		  
		  nsa.ShowsHelp = chkHelp.Value
		  nsa.ShowsSuppressionButton = chkSuppression.Value
		  dim SuppressionButton as NSButton
		  if chkSuppression.Value then
		    SuppressionButton = nsa.SuppressionButton
		  end if
		  
		  dim DefaultButton   as NSButton = nsa.AddButtonWithTitle( edtBtnDefault.Text )
		  dim AlternateButton as NSButton = nsa.AddButtonWithTitle( edtBtnAlternate.Text )
		  dim OtherButton     as NSButton = nsa.AddButtonWithTitle( edtBtnOther.Text )
		  
		  #pragma Unused DefaultButton
		  #pragma Unused AlternateButton
		  #pragma Unused OtherButton
		  
		  nsa.AlertStyle = NSAlert.Style( popStyle.ListIndex )
		  
		  dim i as integer = nsa.RunModal // Button Number, starting at 1000.
		  dim b as Boolean = nsa.SuppressionButton.BooleanValue // b = True if SuppressionButton was checked.
		  
		  dim pressed as string
		  select case i
		  case 1000
		    pressed = edtBtnDefault.Text
		  case 1001
		    pressed = edtBtnAlternate.Text
		  case 1002
		    pressed = edtBtnOther.Text
		  end select
		  
		  dim result as string = "Button: " + pressed + " / Suppress: " + Str(b)
		  
		  edtResult.Text = result
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAlertCustomSheet
	#tag Event
		Sub Action()
		  
		  SheetAlert.Constructor // Resets NSAlert
		  
		  SheetAlert.MessageText = edtMessage.Text
		  SheetAlert.InformativeText = edtInformation.Text
		  
		  SheetAlert.ShowsHelp = chkHelp.Value
		  SheetAlert.ShowsSuppressionButton = chkSuppression.Value
		  dim SuppressionButton as NSButton
		  if chkSuppression.Value then
		    SuppressionButton = SheetAlert.SuppressionButton
		  end if
		  
		  dim DefaultButton   as NSButton = SheetAlert.AddButtonWithTitle( edtBtnDefault.Text )
		  dim AlternateButton as NSButton = SheetAlert.AddButtonWithTitle( edtBtnAlternate.Text )
		  dim OtherButton     as NSButton = SheetAlert.AddButtonWithTitle( edtBtnOther.Text )
		  
		  #pragma Unused DefaultButton
		  #pragma Unused AlternateButton
		  #pragma Unused OtherButton
		  
		  SheetAlert.AlertStyle = NSAlert.Style( popStyle.ListIndex )
		  
		  SheetAlert.RunSheet( self, New NSString("What's this?") )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SheetAlert
	#tag Event
		Sub AlertDidEnd(alert as NSAlert, returnCode as Integer, contextInfo as Ptr)
		  #pragma Unused alert
		  #pragma Unused contextInfo
		  
		  dim b as Boolean = alert.SuppressionButton.BooleanValue // b = True if SuppressionButton was checked.
		  
		  dim pressed as string
		  select case returnCode
		  case 1000
		    pressed = edtBtnDefault.Text
		  case 1001
		    pressed = edtBtnAlternate.Text
		  case 1002
		    pressed = edtBtnOther.Text
		  end select
		  
		  dim result as string = "Button: " + pressed + " / Suppress: " + Str(b)
		  
		  edtResult.Text = result
		End Sub
	#tag EndEvent
	#tag Event
		Function AlertShowHelp(alert as NSAlert) As Boolean
		  #pragma Unused alert
		  
		  MsgBox "Summon the dialog sheet help system!"
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
