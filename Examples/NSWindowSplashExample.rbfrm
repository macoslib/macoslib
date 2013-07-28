#tag Window
Begin Window NSWindowSplashExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   600
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
   Placement       =   3
   Resizeable      =   True
   Title           =   "Splash Window"
   Visible         =   True
   Width           =   600
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   86
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Hello World!"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   72
      TextUnit        =   0
      Top             =   514
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   600
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   86
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Hello World!"
      TextAlign       =   1
      TextColor       =   "&cFFFFFF"
      TextFont        =   "System"
      TextSize        =   72
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  self.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim nsw as New NSWindow(self)
		  
		  nsw.Transparency = 0
		  nsw.MovableByBackground = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim p as Picture = SystemIcons.Computer( self.Width, 0.0 )
		  g.DrawPicture p, ( self.Width / 2 ) - ( p.Width / 2 ), ( self.Height / 2 ) - ( p.Height / 2 )
		End Sub
	#tag EndEvent


#tag EndWindowCode

