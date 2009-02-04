#tag Window
Begin Window ImageTransformExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
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
   Title           =   "Image Transform"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Choose"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   500
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   360
      Underline       =   ""
      Visible         =   True
      Width           =   80
      BehaviorIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics)
		  if image <> nil then
		    dim context as new CGContextGraphicsPort(self)
		    context.DrawImage Image, CGRectMake(10, self.Height - Image.Height - 10, Image.Width, Image.Height)
		    context.DrawImage Image.TransformDisabled, CGRectMake(10 + Image.Width, self.Height - Image.Height - 10, Image.Width, Image.Height)
		    context.DrawImage Image.TransformSelected, CGRectMake((10 + Image.Width)*2, self.Height - Image.Height - 10, Image.Width, Image.Height)
		  end if
		End Sub
	#tag EndEvent


	#tag Note, Name = Notes
		You should be able to open an image file in any reasonable format, including .icns.  
		The window will display the image, plus disabled and selected versions of the image.
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Image As CGImage
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim dlg as new OpenDialog
		  dlg.PromptText = "Choose an image file to display."
		  //probably we should assign some file types.
		  if dlg.ShowModalWithin(self) is nil then
		    return
		  end if
		  
		  dim source as new CGImageSource(new CFURL(dlg.Result.URLPath))
		  self.Image = source.Image(0)
		  self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
