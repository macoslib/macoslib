#tag Window
Begin Window NSSoundExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin PushButton btnSelect
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Select"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   35
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
      Top             =   22
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer InterfaceTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   -55
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -12
      Width           =   32
   End
   Begin Label lblFilePath
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   60
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   148
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "(no file selected)"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   25
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   432
   End
   Begin PushButton btnStop
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   35
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
      Top             =   125
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnPlay
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Play"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   148
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   125
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnPause
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Pause"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   35
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
      Top             =   180
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnResume
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Resume"
      Default         =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   148
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
      Top             =   180
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label lblStatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   379
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "unknown"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   127
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   142
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   263
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Status:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   127
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   104
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   263
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Current Time:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   182
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   104
   End
   Begin Label lblCurrentTime
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   379
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   182
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   142
   End
   Begin CheckBox cbLoops
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Loops"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   45
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   247
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider sldVolume
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   260
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   1000
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   249
      Value           =   0
      Visible         =   True
      Width           =   100
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   ""
      Left            =   157
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "Volume:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   248
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Label lblVolume
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   387
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   0.000
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   248
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   142
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  if Sound <> nil and Sound.IsPlaying then
		    call Sound.Stop
		  end if
		  Sound = nil
		  SoundFile = nil
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub HandleFinishedPlaying(sender As NSSound, finishedPlaying As Boolean)
		  #pragma unused sender
		  if finishedPlaying then
		    beep
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Sound As NSSound
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SoundFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events btnSelect
	#tag Event
		Sub Action()
		  dim dlg as new OpenDialog
		  dlg.Title = "Select Sound"
		  dlg.PromptText = "Select a sound file:"
		  dim f as FolderItem = dlg.ShowModalWithin( self )
		  if f is nil then return
		  
		  Sound = new NSSound( f, false )
		  SoundFile = f
		  
		  if not Sound.Play then
		    MsgBox "Couldn't play"
		  else
		    AddHandler Sound.DidFinishPlaying, WeakAddressOf HandleFinishedPlaying
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InterfaceTimer
	#tag Event
		Sub Action()
		  // Updates interface
		  
		  if Sound is nil then
		    lblStatus.Text = "no sound"
		    btnStop.Enabled = false
		    btnPlay.Enabled = false
		    btnPause.Enabled = false
		    btnResume.Enabled = false
		    cbLoops.Enabled = false
		    
		    sldVolume.Enabled = false
		    sldVolume.Value = 0
		    lblVolume.Text = "0.000"
		    
		    lblCurrentTime.Text = "0"
		    
		  else
		    dim nsName as NSString = Sound.Name
		    dim name as string
		    if nsName <> nil then
		      name = nsName
		    end if
		    
		    if Sound.IsPlaying then
		      lblStatus.Text = "PLAYING " + name
		      btnPlay.Enabled = false
		      btnStop.Enabled = true
		      btnPause.Enabled = true
		      btnResume.Enabled = true
		      
		    else // not playing
		      lblStatus.Text = "Not Playing " + name
		      btnPlay.Enabled = true
		      btnStop.Enabled = false
		      btnPause.Enabled = false
		      btnResume.Enabled = false
		      
		    end if
		    
		    cbLoops.Enabled = true
		    cbLoops.Value = Sound.Loops
		    
		    sldVolume.Enabled = true
		    sldVolume.Value = Round( Sound.Volume * 1000.0 )
		    lblVolume.Text = format( Sound.Volume, "#,0.000" )
		    
		    lblCurrentTime.Text = format( Sound.CurrentTime, "#,0.####" )
		    
		  end if
		  
		  if SoundFile is nil or not SoundFile.Exists then
		    lblFilePath.Text = "(no file selected)"
		  else
		    lblFilePath.Text = SoundFile.AbsolutePath
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnStop
	#tag Event
		Sub Action()
		  call Sound.Stop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPlay
	#tag Event
		Sub Action()
		  call Sound.Play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPause
	#tag Event
		Sub Action()
		  call Sound.Pause
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnResume
	#tag Event
		Sub Action()
		  call Sound.Resume
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbLoops
	#tag Event
		Sub Action()
		  Sound.Loops = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sldVolume
	#tag Event
		Sub ValueChanged()
		  // Prevent a loop
		  dim currentValue as double = me.Value
		  dim volValue as double = currentValue / me.MaxValue
		  
		  if Sound <> nil and Sound.Volume <> volValue then
		    
		    Sound.Volume = volValue
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
