#tag Window
Begin Window NSSoundExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   429
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
   Title           =   "NSSound/AVAsset/AVMetadataItem"
   Visible         =   True
   Width           =   536
   Begin PushButton btnSelect
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   58
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer InterfaceTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label lblFilePath
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   49
      Transparent     =   False
      Underline       =   False
      Value           =   "(no file selected)"
      Visible         =   True
      Width           =   373
   End
   Begin PushButton btnStop
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnPlay
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Play"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnPause
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Pause"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnResume
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Resume"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label lblStatus
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   374
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   135
      Transparent     =   False
      Underline       =   False
      Value           =   "unknown"
      Visible         =   True
      Width           =   142
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   258
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   135
      Transparent     =   False
      Underline       =   False
      Value           =   "Status:"
      Visible         =   True
      Width           =   104
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   258
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   190
      Transparent     =   False
      Underline       =   False
      Value           =   "Current Time:"
      Visible         =   True
      Width           =   104
   End
   Begin Label lblCurrentTime
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   374
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   190
      Transparent     =   False
      Underline       =   False
      Value           =   "0"
      Visible         =   True
      Width           =   142
   End
   Begin CheckBox cbLoops
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Loops"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
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
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   230
      Transparent     =   False
      Underline       =   False
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
      Left            =   245
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   1000
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   232
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   100
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   142
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   231
      Transparent     =   False
      Underline       =   False
      Value           =   "Volume:"
      Visible         =   True
      Width           =   91
   End
   Begin Label lblVolume
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   372
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   231
      Transparent     =   False
      Underline       =   False
      Value           =   "0.000"
      Visible         =   True
      Width           =   142
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Value           =   "Select a sound file:"
      Visible         =   True
      Width           =   169
   End
   Begin Slider sldProgress
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   1000
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   98
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   496
   End
   Begin Listbox lbMetadata
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   117
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   292
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   325
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
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
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   267
      Transparent     =   False
      Underline       =   False
      Value           =   "Metadata"
      Visible         =   True
      Width           =   163
   End
   Begin Canvas cvsArtwork
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   393
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   298
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  if Sound <> nil then
		    RemoveHandler Sound.DidFinishPlaying, AddressOf HandleFinishedPlaying
		    Sound = nil
		  end if
		  
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
		Protected ArtWork As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Sound As NSSound
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SoundFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zUpdatingInterface As Boolean
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
		  
		  if Sound <> nil then
		    RemoveHandler Sound.DidFinishPlaying, AddressOf HandleFinishedPlaying
		    Sound = nil
		  end if
		  
		  Sound = new NSSound( f, false )
		  dim asset as AVAsset = AVAsset.AssetWithURL( new NSURL( f ) )
		  dim duration as double = asset.DurationInSeconds
		  sldProgress.Maximum = duration * 10.0
		  
		  AddHandler Sound.DidFinishPlaying, AddressOf HandleFinishedPlaying
		  Sound.StopOnDestruct = true
		  
		  SoundFile = f
		  ArtWork = nil
		  
		  if not Sound.Play then
		    MsgBox "Couldn't play"
		  end if
		  
		  lbMetadata.DeleteAllRows
		  dim formats() as NSString = asset.AvailableMetadataFormats
		  for each aFormat as NSString in formats
		    dim arr() as AVMetadataItem = asset.MetadataForFormat( aFormat )
		    for each item as AVMetadataItem in arr
		      dim key as string = item.CommonKey
		      dim value as string = item.StringValue
		      if key = "artwork" then
		        Artwork = item.PictureValue // nil is ok
		      else
		        lbMetadata.AddRow key, value
		      end if
		    next item
		  next aFormat
		  
		  cvsArtwork.Invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InterfaceTimer
	#tag Event
		Sub Action()
		  // Updates interface
		  
		  zUpdatingInterface = true
		  
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
		    
		    sldProgress.Enabled = false
		    sldProgress.Value = 0
		    
		    lblCurrentTime.Text = "00:00:" + format( 0, "00.00" )
		    
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
		    
		    dim curTime as double = Sound.CurrentTime
		    
		    sldProgress.Enabled = true
		    if curTime = 0.0 then
		      sldProgress.Value = 1 // Seems to be a bug preventing it from being set to 0
		    else
		      sldProgress.Value = curTime * 10.0
		    end if
		    
		    dim h as integer = curTime / ( 3600.0 )
		    curTime = curTime - ( h * 3600.0 )
		    dim m as integer = curTime / 60.0
		    curTime = curTime - ( m * 60.0 )
		    lblCurrentTime.Text = str( h, "00" ) + ":" + str( m, "00" ) + ":" + format( curTime, "00.00" )
		    
		  end if
		  
		  if SoundFile is nil or not SoundFile.Exists then
		    lblFilePath.Text = "(no file selected)"
		  else
		    lblFilePath.Text = SoundFile.NativePath
		  end if
		  
		  zUpdatingInterface = false
		  
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
#tag Events sldProgress
	#tag Event
		Sub ValueChanged()
		  if not zUpdatingInterface and Sound <> nil then
		    dim curValue as double = me.Value
		    curValue = curValue / 10.0
		    Sound.CurrentTime = curValue
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsArtwork
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if ArtWork <> nil then
		    g.DrawPicture( ArtWork, 0, 0, g.Width, g.Height, 0, 0, ArtWork.Width, ArtWork.Height )
		  else
		    g.ClearRect( 0, 0, g.Width, g.Height )
		  end if
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
