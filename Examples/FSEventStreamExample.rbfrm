#tag Window
Begin Window FSEventStreamExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.99e+2
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
   Title           =   "FSEvents"
   Visible         =   True
   Width           =   8.54e+2
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Start"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   21
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
      Top             =   92
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "UUID"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      Top             =   143
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Test CFUUID"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   222
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
      Top             =   143
      Underline       =   ""
      Visible         =   True
      Width           =   146
   End
   Begin PushButton PushButton5
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "DADict"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   21
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
      Top             =   175
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   55
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Currently for debugging purpose only. DO NOT USE."
      TextAlign       =   1
      TextColor       =   &h00FF0000
      TextFont        =   "System"
      TextSize        =   18
      TextUnit        =   0
      Top             =   18
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   820
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		streams() As FSEventStream
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  
		  dim stream as FSEventStream
		  dim f as FolderItem
		  
		  'f = Volume( 0 ) //new FolderItem( "/", FolderItem.PathTypeShell )
		  
		  for i as integer=0 to VolumeCount - 1
		    f = Volume( i )
		    DReport  f.Name, f.UNIXDeviceID
		    DReport  FSEventModule.CopyUUIDForDevice( f.UNIXDeviceID )
		  next
		  
		  'return
		  
		  f = new FolderItem( "Taurus:", FolderItem.PathTypeAbsolute )
		  'stream = FSEventStream.CreateFromListOfPaths( Array( "/Volumes" ), &h10 OR &h4 OR &h1, 0.5 )
		  stream = FSEventStream.CreateFromListOfPathsForDevice( f, Array( "AsgardHD/Users/steff" ), &h10 OR &h4 OR &h1, 0.5 )
		  streams.Append   stream
		  stream.ScheduleWithRunLoop
		  if NOT  stream.Start then
		    DReportError   "Could not start stream"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  
		  for each stream as FSEventStream in streams
		    stream.Stop
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem
		  
		  f = Volume( 0 )
		  
		  DReport   f.LocalVolumeUUID
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  
		  dim uuid as CFUUID
		  dim mb as MemoryBlock
		  
		  uuid = new CFUUID( "07AE3B9B-587E-397C-A731-AD4B1BA1B00E" )
		  
		  Dreport  "uuid:", uuid
		  
		  mb = uuid.GetBytes
		  
		  DReport  "mb:", EncodeHex( mb.StringValue( 0, 16 ), true )
		  
		  uuid = new CFUUID( mb )
		  
		  DReport "uuid2:", uuid
		  
		  DReport  "stringValue:", uuid.StringValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem
		  
		  f = Volume( 0 )
		  
		  DReport   f.DADiskDescription
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
