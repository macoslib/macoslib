#tag Window
Begin Window FSEventStreamExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   316
   ImplicitInstance=   True
   LiveResize      =   "True"
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
   Title           =   "FSEvents"
   Visible         =   True
   Width           =   854
   Begin PushButton StartBTN
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Start"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   268
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton StopBTN
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   104
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   268
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
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
      Top             =   212
      Transparent     =   False
      Underline       =   False
      Value           =   "The following will check every change in your Home folder. Results are given in the Debug Log window on the right —>"
      Visible         =   True
      Width           =   821
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   237
      Transparent     =   False
      Underline       =   False
      Value           =   "-"
      Visible         =   True
      Width           =   821
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   183
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   9
      Transparent     =   False
      Underline       =   False
      Value           =   "On Mac OS X, every file modification event is kept in a database and the events are dispatched to applications which registered for such notifications through a MacFSEventStream. Not only it allows to receive FSEvents in nearly real-time, but also can your application play back all the events which occurred between the last time your application stopped and the current time.\r\rWhen you create a MacFSEventStream, you can specify an arbitrary number of paths to check.\r\rNotes:\r  • On Mac OS X 10.5 and 10.6, only the parent folder is passed when a file is created/modified which means that you must build and keep up-to-date the whole hierarchy of files and folders that you are interested in and detect where the modifications occurred.\r  • Starting with Mac OS X 10.7, you can select to get the events at the file level.\r  • FSEvents are sent in order but FSEvents in rapid succession will be coalesced into one event."
      Visible         =   True
      Width           =   830
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   5
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   195
      Transparent     =   False
      Visible         =   True
      Width           =   821
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  DReport   "This is the debugging window. Press the Start button to start watching changes in your Home folder"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub FilesystemModified(theStream as MacFSEventStream, events() as MacFSEvent)
		  
		  dim f as FolderItem
		  
		  for each evt as MacFSEvent in events
		    QReport  evt, f
		  next
		  
		  #pragma unused theStream
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		stream As MacFSEventStream
	#tag EndProperty


#tag EndWindowCode

#tag Events StartBTN
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem
		  
		  if stream=nil then
		    f = SpecialFolder.UserHome
		    dim opts as integer
		    
		    if SystemVersionAsInt >= 100700 then  //Lion+
		      opts = MacFSEventStream.kFSEventStreamCreateFlagFileEvents OR MacFSEventStream.kFSEventStreamCreateFlagWatchRoot
		    else //Before Lion
		      opts = MacFSEventStream.kFSEventStreamCreateFlagWatchRoot
		    end if
		    
		    stream = MacFSEventStream.CreateFromListOfFolderItems( Array( f ), opts, 0.5 )
		    
		    AddHandler   stream.FilesystemModified, AddressOf FilesystemModified
		    
		    if NOT  stream.Start then
		      MsgBox  "Could not start stream"
		      return
		    end if
		    
		    StopBTN.Enabled = true
		    
		    DReport   "FSEventStream started. First events should appear in the next 10 seconds."
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBTN
	#tag Event
		Sub Action()
		  
		  stream.Stop
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label3
	#tag Event
		Sub Open()
		  
		  if SystemVersionAsInt >= 100700 then
		    me.Text = "As you are running Lion or Mountain Lion, you will receive events with the file name."
		  else
		    me.Text = "As you are running Snow Leopard or below, you will only receive events for modified folders but with no clue on which file changed."
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
