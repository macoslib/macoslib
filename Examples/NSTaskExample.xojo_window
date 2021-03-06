#tag Window
Begin Window NSTaskExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Resizeable      =   True
   Title           =   "NSTask"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   492
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   336
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   492
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   304
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   304
      Transparent     =   False
      Underline       =   False
      Value           =   "Run ls and redirect output to a file via an NSFileHandle"
      Visible         =   True
      Width           =   458
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   336
      Transparent     =   False
      Underline       =   False
      Value           =   "Run ls and grab output for display"
      Visible         =   True
      Width           =   458
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim task as new NSTask("/bin/ls", "-l", ReplaceAll(SpecialFolder.UserHome.ShellPath, "\", ""))
		  task.Launch
		  task.Wait
		  dim data as NSData = task.StdoutPipe.ReadHandle.ReadAll
		  Msgbox DefineEncoding(data.Data, Encodings.UTF8)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim dlg as new SaveAsDialog
		  dim f as FolderItem = dlg.ShowModalWithin(self)
		  if f = nil then
		    return
		  end if
		  
		  declare function open lib "/use/lib/libc.dylib" (path as CString, flags as Integer) as Integer
		  const O_CREAT = &h0200
		  const O_WRONLY = &h0001
		  
		  dim fd as Integer = open(Replace(f.ShellPath, "\", ""), O_CREAT or O_WRONLY)
		  if fd = -1 then
		    Msgbox "An error occurred while attempting to create " + Replace(f.ShellPath, "\", "")
		    return
		  end if
		  
		  dim task as new NSTask("/bin/ls", "-l", ReplaceAll(SpecialFolder.UserHome.ShellPath, "\", ""))
		  task.SetStdout(new NSFileHandle(fd, true))
		  
		  task.Launch
		  task.Wait
		  
		End Sub
	#tag EndEvent
#tag EndEvents
