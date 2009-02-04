#tag Window
Begin Window ImageTransformExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   293
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Image Transformations"
   Visible         =   True
   Width           =   521
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   ""
      Caption         =   "Choose"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   421
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
      Top             =   253
      Underline       =   ""
      Visible         =   True
      Width           =   80
      BehaviorIndex   =   0
   End
   Begin StaticText StaticText1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Multiline       =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "You should be able to open an image file in any reasonable format, including .icns. This window will display the original image, plus disabled and selected versions of it."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      Top             =   222
      Underline       =   ""
      Visible         =   True
      Width           =   389
      BehaviorIndex   =   1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics)
		  if image <> nil then
		    dim w as Single = 10 + me.Image.Width
		    dim context as new CGContextGraphicsPort(self)
		    dim rect as CGRect = CGRectMake(10, self.Height - Image.Height - 10, Image.Width, Image.Height)
		    context.DrawImage me.Image.TransformNone,      CGRectOffset (rect, w * 0, 0)
		    context.DrawImage me.Image.TransformDisabled, CGRectOffset (rect, w * 1, 0)
		    context.DrawImage me.Image.TransformSelected,  CGRectOffset (rect, w * 2, 0)
		  end if
		End Sub
	#tag EndEvent


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
