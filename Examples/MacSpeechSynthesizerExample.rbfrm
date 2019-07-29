#tag Window
Begin Window MacSpeechSynthesizerExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "0"
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   623
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
   Resizeable      =   "False"
   SystemUIVisible =   True
   Title           =   "MacSpeechSynthesizer Example"
   Type            =   "0"
   Visible         =   True
   Width           =   895
   Begin TextArea TA1
      AcceptTabs      =   False
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   73
      HelpTag         =   "Text to be spoken. Words are highlighted when spoken."
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   13
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   39
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   557
   End
   Begin PushButton SpeakBTN
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Speak"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   "Speak the text"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
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
      Top             =   119
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Listbox VoicesLB
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   17
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontal=   "0"
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   True
      HasHeading      =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   428
      HelpTag         =   "Available voices on your computer"
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Voice identifiers"
      Italic          =   False
      Left            =   12
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
      SelectionRequired=   False
      SelectionType   =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   162
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   386
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea TA2
      AcceptTabs      =   False
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   True
      AllowTabs       =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   325
      HelpTag         =   "Voice attributes (as a flattened Dictionary)"
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   431
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   265
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   451
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   431
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Voice attributes:  (a Dictionary available for each voice)"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   241
      Transparent     =   False
      Underline       =   False
      Value           =   "Voice attributes:  (a Dictionary available for each voice)"
      Visible         =   True
      Width           =   451
   End
   Begin PushButton PushButton3
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Get phonemes"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   "Convert text into phonemes"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   119
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   136
   End
   Begin PushButton SetVoiceBTN
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Select highlighted voice"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   "Activate the selected voice"
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   594
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   179
   End
   Begin Slider VolumeSLID
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   "Set the voice volume"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   664
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
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      TickStyle       =   "0"
      Top             =   49
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   218
   End
   Begin Label Label2
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   585
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Volume:"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   49
      Transparent     =   False
      Underline       =   False
      Value           =   "Volume:"
      Visible         =   True
      Width           =   67
   End
   Begin MacSpeechSynthesizer Speech
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Rate            =   0.0
      Scope           =   0
      TabPanelIndex   =   0
      Voice           =   ""
      Volume          =   0.0
   End
   Begin Label Label3
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
      HelpTag         =   "Currently selected voice"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Current voice:"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   False
      Value           =   "Current voice:"
      Visible         =   True
      Width           =   99
   End
   Begin Label VoiceLBL
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   False
      Value           =   "-"
      Visible         =   True
      Width           =   357
   End
   Begin PushButton StopBTN
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   "Stop speaking"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   119
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Slider RateSLID
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   "Set the voice volume"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   664
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   400
      MaximumValue    =   400
      Minimum         =   100
      MinimumValue    =   100
      PageStep        =   20
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      TickStyle       =   "0"
      Top             =   78
      Transparent     =   False
      Value           =   190
      Visible         =   True
      Width           =   218
   End
   Begin Label Label4
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   585
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Rate:"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Value           =   "Rate:"
      Visible         =   True
      Width           =   67
   End
   Begin GroupBox PauseGRP
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Pause"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   79
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   541
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   151
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   341
      Begin RadioButton RB1
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Immediately"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   16
         HelpTag         =   "When pausing, pause immediately"
         Index           =   0
         InitialParent   =   "PauseGRP"
         Italic          =   False
         Left            =   548
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   169
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   177
      End
      Begin RadioButton RB1
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "At the end of the word"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   16
         HelpTag         =   "When pausing, pause at the end of the current word"
         Index           =   1
         InitialParent   =   "PauseGRP"
         Italic          =   False
         Left            =   548
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   188
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   178
      End
      Begin RadioButton RB1
         AllowAutoDeactivate=   True
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "At the end of the sentence"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   16
         HelpTag         =   "When pausing, pause at the end of the current sentence"
         Index           =   2
         InitialParent   =   "PauseGRP"
         Italic          =   False
         Left            =   548
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   207
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   177
      End
   End
   Begin Line Line1
      BorderWidth     =   1.0
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "16"
      TabPanelIndex   =   0
      TabStop         =   True
      Thickness       =   1.0
      Transparent     =   False
      Visible         =   True
      X1              =   519.0
      X2              =   519.0
      Y1              =   144.0
      Y2              =   193.0
   End
   Begin Line Line2
      BorderWidth     =   1.0
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "17"
      TabPanelIndex   =   0
      TabStop         =   True
      Thickness       =   1.0
      Transparent     =   False
      Visible         =   True
      X1              =   519.0
      X2              =   540.0
      Y1              =   194.0
      Y2              =   194.0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  dim prefVoice as string = MacSpeechSynthesizer.DefaultVoice
		  
		  for i as integer=0 to VoicesLB.ListCount - 1
		    if VoicesLB.Cell( i, 0 )=prefVoice then
		      VoicesLB.ListIndex = i
		      SetVoiceBTN.Push
		      exit
		    end if
		  next
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events SpeakBTN
	#tag Event
		Sub Action()
		  
		  if me.Caption = "Speak" then
		    if NOT Speech.StartSpeakingText( TA1.Text ) then
		      DReportError   "Couldn't start speaking"
		      StopBTN.Enabled = false
		    else
		      me.Caption = "Pause"
		      StopBTN.Enabled = true
		    end if
		    
		  elseif me.Caption = "Pause" then
		    if RB1( 0 ).Value then
		      Speech.PauseSpeakingAtBoundary( Speech.kNSSpeechImmediateBoundary )
		    elseif RB1( 1 ).Value then
		      Speech.PauseSpeakingAtBoundary( Speech.kNSSpeechWordBoundary )
		    elseif RB1( 2 ).Value then
		      Speech.PauseSpeakingAtBoundary( Speech.kNSSpeechSentenceBoundary )
		    end if
		    
		    me.Caption = "Continue"
		    
		  elseif me.Caption = "Continue" then
		    Speech.ContinueSpeaking
		    
		    me.Caption = "Pause"
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VoicesLB
	#tag Event
		Sub Open()
		  
		  dim ars() as string = MacSpeechSynthesizer.AvailableVoices
		  
		  for each s as string in ars
		    me.AddRow   s
		  next
		  
		  dim dict as Dictionary
		  VolumeSLID.Value = Speech.Volume * 100
		  
		  dict = Speech.AttributesForVoice( Speech.Voice )
		  VoiceLBL.Text = dict.Lookup( "VoiceName", "???" ) + " (" + dict.Lookup( "VoiceLanguage", "??" ) + ")"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  dim dict as Dictionary
		  
		  if me.ListIndex=-1 then
		    TA2.Text = ""
		    SetVoiceBTN.Enabled = false
		    
		  else
		    dict = MacSpeechSynthesizer.AttributesForVoice( me.Cell( me.ListIndex, 0 ))
		    TA2.Text = DebugReportModule.FormatVariant( dict )
		    SetVoiceBTN.Enabled = true
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  
		  DReportTitled   "PhonemesFromText:", Speech.PhonemesFromText( TA1.Text )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetVoiceBTN
	#tag Event
		Sub Action()
		  
		  dim dict as Dictionary
		  
		  dict = Speech.AttributesForVoice( VoicesLB.Cell( VoicesLB.ListIndex, 0 ))
		  VoiceLBL.Text = dict.Lookup( "VoiceName", "???" ) + " (" + dict.Lookup( "VoiceLanguage", "??" ) + ")"
		  
		  if TA1.Text = "" OR TA1.Text = Speech.AttributesForVoice( Speech.Voice ).Lookup( "VoiceDemoText", "" ) then //Set default demo text if none defined
		    TA1.Text = dict.Lookup( "VoiceDemoText", "" )
		  end if
		  
		  Speech.Voice = VoicesLB.Cell( VoicesLB.ListIndex, 0 )
		  VolumeSLID.Value = Speech.Volume * 100
		  RateSLID.Value = Speech.Rate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeSLID
	#tag Event
		Sub ValueChanged()
		  
		  Speech.Volume = me.Value / 100
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Speech
	#tag Event
		Sub WillSpeakWord(wordRange as Cocoa.NSRange, inString as string)
		  
		  #pragma unused inString
		  
		  TA1.SelStart = wordRange.location
		  TA1.SelLength = wordRange.length
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FinishedSpeaking(successfully as Boolean)
		  
		  #pragma unused successfully
		  
		  TA1.SelStart = 0
		  TA1.SelLength = 0
		  
		  StopBTN.Enabled = false
		  SpeakBTN.Caption = "Speak"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SpeechError(errorMsg as string, atPosition as integer, inString as String)
		  #pragma unused atPosition
		  #pragma unused inString
		  
		  DReportError  "Speech error", errorMsg
		End Sub
	#tag EndEvent
	#tag Event
		Sub SyncMessage(message as string)
		  
		  DReport  "SyncMessage:", message
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBTN
	#tag Event
		Sub Action()
		  
		  Speech.StopSpeaking
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RateSLID
	#tag Event
		Sub ValueChanged()
		  
		  Speech.Rate = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
