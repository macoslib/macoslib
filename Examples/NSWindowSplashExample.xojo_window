#tag Window
Begin Window NSWindowSplashExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
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
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "72.0"
      FontUnit        =   "0"
      Height          =   86
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello World!"
      TextAlign       =   1
      TextAlignment   =   "2"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   72.0
      TextUnit        =   0
      Top             =   514
      Transparent     =   False
      Underline       =   False
      Value           =   "Hello World!"
      Visible         =   True
      Width           =   600
   End
   Begin Label Label2
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "72.0"
      FontUnit        =   "0"
      Height          =   86
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello World!"
      TextAlign       =   1
      TextAlignment   =   "2"
      TextColor       =   &cFFFFFF
      TextFont        =   "System"
      TextSize        =   72.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Value           =   "Hello World!"
      Visible         =   True
      Width           =   600
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
		  self.Close
		  
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
		  dim p as Picture = SystemIcons.Computer( self.Width, 0.0 )
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

