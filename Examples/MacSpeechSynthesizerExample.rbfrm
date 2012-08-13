#tag Window
Begin Window MacSpeechSynthesizerExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.23e+2
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
   Resizeable      =   False
   Title           =   "MacSpeechSynthesizer Example"
   Visible         =   True
   Width           =   8.95e+2
   Begin TextArea TA1
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
      Height          =   73
      HelpTag         =   "Text to be spoken. Words are highlighted when spoken."
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   13
      LimitText       =   0
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   39
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   557
   End
   Begin PushButton SpeakBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Speak"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Speak the text"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   119
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Listbox VoicesLB
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   17
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   428
      HelpTag         =   "Available voices on your computer"
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Voice identifiers"
      Italic          =   ""
      Left            =   12
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   162
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   386
      _ScrollWidth    =   -1
   End
   Begin TextArea TA2
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   325
      HelpTag         =   "Voice attributes (as a flattened Dictionary)"
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   431
      LimitText       =   0
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   265
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   451
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   431
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Voice attributes:  (a Dictionary available for each voice)"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   241
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   451
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Get phonemes"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Convert text into phonemes"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   13
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
      Top             =   119
      Underline       =   ""
      Visible         =   True
      Width           =   136
   End
   Begin PushButton SetVoiceBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Select highlighted voice"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Activate the selected voice"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   219
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   594
      Underline       =   ""
      Visible         =   True
      Width           =   179
   End
   Begin Slider VolumeSLID
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   "Set the voice volume"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   664
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
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   49
      Value           =   0
      Visible         =   True
      Width           =   218
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   585
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   "Volume:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   49
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin MacSpeechSynthesizer Speech
      Height          =   32
      Index           =   -2147483648
      Left            =   952
      LockedInPosition=   False
      Rate            =   ""
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -16
      Volume          =   ""
      Width           =   32
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Currently selected voice"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   13
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
      Text            =   "Current voice:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   99
   End
   Begin Label VoiceLBL
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   121
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
      Text            =   "-"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   357
   End
   Begin PushButton StopBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Stop speaking"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   388
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   119
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Slider RateSLID
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   "Set the voice volume"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   664
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   400
      Minimum         =   100
      PageStep        =   20
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   78
      Value           =   190
      Visible         =   True
      Width           =   218
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   585
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      Text            =   "Rate:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin GroupBox PauseGRP
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Pause"
      Enabled         =   True
      Height          =   79
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   541
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   151
      Underline       =   ""
      Visible         =   True
      Width           =   341
      Begin RadioButton RB1
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Immediately"
         Enabled         =   True
         Height          =   16
         HelpTag         =   "When pausing, pause immediately"
         Index           =   0
         InitialParent   =   "PauseGRP"
         Italic          =   ""
         Left            =   548
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   169
         Underline       =   ""
         Value           =   True
         Visible         =   True
         Width           =   177
      End
      Begin RadioButton RB1
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "At the end of the word"
         Enabled         =   True
         Height          =   16
         HelpTag         =   "When pausing, pause at the end of the current word"
         Index           =   1
         InitialParent   =   "PauseGRP"
         Italic          =   ""
         Left            =   548
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   188
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   178
      End
      Begin RadioButton RB1
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "At the end of the sentence"
         Enabled         =   True
         Height          =   16
         HelpTag         =   "When pausing, pause at the end of the current sentence"
         Index           =   2
         InitialParent   =   "PauseGRP"
         Italic          =   ""
         Left            =   548
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0
         TextUnit        =   0
         Top             =   207
         Underline       =   ""
         Value           =   ""
         Visible         =   True
         Width           =   177
      End
   End
   Begin Line Line1
      BorderWidth     =   1
      Height          =   50
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   ""
      LineColor       =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   ""
      Visible         =   True
      Width           =   100
      X1              =   519
      X2              =   519
      Y1              =   144
      Y2              =   193
   End
   Begin Line Line2
      BorderWidth     =   1
      Height          =   50
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   ""
      LineColor       =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   ""
      Visible         =   True
      Width           =   100
      X1              =   519
      X2              =   540
      Y1              =   194
      Y2              =   194
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
