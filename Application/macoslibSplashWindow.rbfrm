#tag Window
Begin Window macoslibSplashWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   480
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
   Width           =   494
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
      Text            =   "macoslib"
      TextAlign       =   1
      TextColor       =   &h00800000
      TextFont        =   "System"
      TextSize        =   72
      TextUnit        =   0
      Top             =   124
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   480
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   89
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
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
      Text            =   "unleash the power of OS X"
      TextAlign       =   1
      TextColor       =   &h00AB4905
      TextFont        =   "System"
      TextSize        =   36
      TextUnit        =   0
      Top             =   222
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   414
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  nsw.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorUtilityWindow // Fade-out on closing
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		  
		  #pragma unused X
		  #pragma unused Y
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  //# On clicking, close the splash window and immediately open the default window
		  
		  App.SplashTimer.Mode = 0 //Stop timing
		  App.HandleTimerAction( nil )
		  
		  #pragma unused X
		  #pragma unused Y
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  nsw = New NSWindow(self)
		  
		  nsw.Transparency = 0
		  
		  nsw.Center
		  nsw.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorDocumentWindow // Zoom in slowely as if opening a document
		  
		  nsw.MovableByBackground = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim p as Picture = SystemIcons.Network( self.width, 0.0 )
		  g.DrawPicture p, ( self.Width / 2 ) - ( p.Width / 2 ), ( self.Height / 2 ) - ( p.Height / 2 )
		  
		  #if RBVersion >=2012.02
		    #pragma unused areas
		  #endif
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		nsw As NSWindow
	#tag EndProperty


#tag EndWindowCode

