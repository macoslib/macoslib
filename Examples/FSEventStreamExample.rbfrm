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
      Top             =   17
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
      Top             =   17
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		stream As FSEventStream
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  
		  if stream=nil then
		    stream = FSEventStream.CreateFromListOfPaths( Array( "/Volumes" ), &h10 OR &h4 OR &h1 )
		    stream.ScheduleWithRunLoop
		  end if
		  call   stream.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  
		  
		  stream.Stop
		  
		End Sub
	#tag EndEvent
#tag EndEvents
