#tag Window
Begin Window NSWindowExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   420
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
   Width           =   600
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   195
   End
   Begin PushButton btnToggleMovableByBackground
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Toggle Movable By Background"
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   171
      Underline       =   ""
      Visible         =   True
      Width           =   243
   End
   Begin Label lblIsMovableByBackground
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
      Left            =   286
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   171
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   295
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      Top             =   46
      Underline       =   ""
      Visible         =   True
      Width           =   195
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   285
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
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
      Width           =   295
   End
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      Top             =   78
      Underline       =   ""
      Visible         =   True
      Width           =   195
   End
   Begin Label Label1
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
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "(Except this doesn't seem to work)"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   203
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   399
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
      Text            =   "BackingScaleFactor:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   360
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   166
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   183
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
      Text            =   0.
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   360
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   166
   End
   Begin PushButton btnToggleDoumentEdited
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Toggle DocumentEdited"
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   249
      Underline       =   ""
      Visible         =   True
      Width           =   243
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   45
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
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "(Will put or remove the grey dot from the close button. If you've specified a file above, will also dim the icon.)"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   281
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   399
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
      Text            =   "Fullscreen:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   166
   End
   Begin Label lblIsFullscreen
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
      Left            =   186
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
      Text            =   False
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   338
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   166
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Moved()
		  UpdateBackingScaleFactor
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  // Set presentation options for full screen mode
		  Dim NSApp as NSApplication = NSApplication.App
		  NSApp.PresentationOptions = integer(NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationFullScreen or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideToolbar or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideMenuBar or _
		  NSApplication.NSApplicationPresentationOptions.NSApplicationPresentationAutoHideDock)
		  
		  m_NSWindow = self // Record a reference to NSWindow
		  if m_NSWindow.MovableByBackground then
		    lblIsMovableByBackground.Text = "It's movable!"
		  else
		    lblIsMovableByBackground.Text = "NOT movable!"
		  end if
		  
		  m_NSWindow.FullscreenAllowed = true // Allow fullscreen mode
		  m_NSWindow.ContentBorderBottomThickness = 20 // Draw a border at the bottom of the window
		  
		  UpdateBackingScaleFactor
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
		Sub UpdateFullscreen()
		  lblIsFullscreen.Text = Str( m_NSWindow.IsFullscreen )
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		m_NSWindow As NSWindow
	#tag EndProperty


#tag EndWindowCode

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
#tag Events btnToggleMovableByBackground
	#tag Event
		Sub Action()
		  m_NSWindow.MovableByBackground = not m_NSWindow.MovableByBackground
		  if m_NSWindow.MovableByBackground then
		    lblIsMovableByBackground.Text = "It's movable!"
		  else
		    lblIsMovableByBackground.Text = "NOT movable!"
		  end if
		  
		  MsgBox str( m_NSWindow.FullscreenAllowed )
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
#tag Events btnToggleDoumentEdited
	#tag Event
		Sub Action()
		  self.IsModified = not self.IsModified
		  
		  // I'm using IsModified here because it's a convenience method and will probably be used
		  // more often than calling the NSWindow method directly. It, in turn, calls NSWindow.DocumentEdited.
		  //
		  // Otherwise, I could have used m_NSWindow.DocumentEdited.
		End Sub
	#tag EndEvent
#tag EndEvents
