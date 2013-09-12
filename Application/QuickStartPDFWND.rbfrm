#tag Window
Begin Window QuickStartPDFWND
   BackColor       =   "&cFFFFFF00"
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   729
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   False
   Width           =   628
   Begin PopupArrow NextArrow
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   10
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   165
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   710
      Visible         =   True
      Width           =   10
   End
   Begin PopupArrow PreviousArrow
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   1
      Height          =   10
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   125
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   710
      Visible         =   True
      Width           =   10
   End
   Begin Label PageNumberText
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   135
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   000
      TextAlign       =   1
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   707
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   30
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   699
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   2
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   605
   End
   Begin ScrollBar SB1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   702
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   611
      LineStep        =   20
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Minimum         =   0
      PageStep        =   200
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -1
      Value           =   0
      Visible         =   True
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  nsw.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorDocumentWindow
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  nsw = New NSWindow(self)
		  
		  nsw.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorDocumentWindow
		  
		  if NOT self.RestoreFrameFromWindowName( "PDFViewer" ) then
		    self.Center
		  end if
		  
		  self.Document = OpenDocument( docfile )
		  if self.Document <> nil then
		    self.Title = docfile.NameNoExtension
		    PageNumber = 1
		  end if
		  
		  AlignNavigationControls
		  call   self.FrameAutoSaveName( "PDFViewer" )
		  self.DocumentFile = docFile
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'if self.Document is nil then
		  'return
		  'end if
		  '
		  '
		  'dim page as CGPDFPage = self.Document.Page(self.PageNumber)
		  'if page = nil then
		  'return
		  'end if
		  'dim box as CGRect = page.BoxRect(CGPDFBox.Media)
		  '
		  '
		  'dim c as new CGContextGraphicsPort(g)
		  'dim sx, sy as double
		  'c.TranslateCTM 0, self.Height - box.rectSize.height
		  '
		  '//Rescale page
		  'sx = self.Width / box.rectSize.width
		  'sy = self.height / box.rectSize.height
		  'if sx >= sy then
		  'c.ScaleCTM   sy, sy
		  'else
		  'c.ScaleCTM   sx, sx
		  'end if
		  '
		  'c.DrawPDFPage page
		  '
		  '#if RBVersion >= 2012.02
		  '#pragma unused areas
		  '#endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  AlignNavigationControls
		  
		  CreatePict
		  
		  if pict<>nil then
		    SB1.Maximum = Pict.Height - Canvas1.Height
		  end if
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AlignNavigationControls()
		  dim center as Integer = self.Width\2
		  PageNumberText.Left = center - PageNumberText.Width\2
		  PreviousArrow.Left = PageNumberText.Left - PreviousArrow.Width
		  NextArrow.Left = PageNumberText.Left + PageNumberText.Width
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(f as FolderItem)
		  // Calling the overridden superclass constructor.
		  
		  docfile = f
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePict()
		  if self.Document is nil then
		    return
		  end if
		  
		  dim sx as double
		  
		  dim page as CGPDFPage = self.Document.Page(self.PageNumber)
		  if page = nil then
		    return
		  end if
		  dim box as CGRect = page.BoxRect(CGPDFBox.Media)
		  sx = self.Width / box.rectSize.width
		  
		  pict = new Picture( box.rectSize.width * sx, box.rectSize.height * sx, 32 )
		  
		  dim c as new CGContextGraphicsPort( pict.graphics )
		  
		  c.ScaleCTM   sx, sx
		  
		  c.DrawPDFPage page
		  
		  SB1.Maximum = pict.Height - Canvas1.Height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpenDocument(f as FolderItem) As CGPDFDocument
		  if f is nil or not f.Exists then
		    return nil
		  end if
		  
		  return CGPDFDocument.Create(new CFURL(f))
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private docfile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Document As CGPDFDocument
	#tag EndProperty

	#tag Property, Flags = &h21
		Private nsw As NSWindow
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return Val(PageNumberText.Text)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if PageNumber = value then
			    return
			  end if
			  if value < 1 or value > self.Document.PageCount then
			    return
			  end if
			  
			  PageNumberText.Text = Str(value)
			  
			  CreatePict
			  SB1.Value = 0
			  Canvas1.Refresh
			  
			End Set
		#tag EndSetter
		Private PageNumber As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		pict As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events NextArrow
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		  
		  #pragma unused X
		  #pragma unused Y
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  //if mouse is still over control
		  
		  if X >= 0 and X < me.Width and Y >= 0 and Y < me.Height then
		    PageNumber = PageNumber + 1
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PreviousArrow
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if X >= 0 and X < me.Width and Y >= 0 and Y < me.Height then
		    PageNumber = PageNumber - 1
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		  
		  #pragma unused X
		  #pragma unused Y
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if self.Document is nil then
		    return
		  end if
		  
		  if Pict=nil then
		    CreatePict
		  end if
		  g.DrawPicture  Pict, 0, -SB1.Value
		  
		  
		  'dim page as CGPDFPage = self.Document.Page(self.PageNumber)
		  'if page = nil then
		  'return
		  'end if
		  'dim box as CGRect = page.BoxRect(CGPDFBox.Media)
		  '
		  '
		  'dim c as new CGContextGraphicsPort(g)
		  'dim sx, sy as double
		  'c.TranslateCTM 0, self.Height - box.rectSize.height
		  '
		  '//Rescale page
		  'sx = self.Width / box.rectSize.width
		  'sy = self.height / box.rectSize.height
		  'if sx >= sy then
		  'c.ScaleCTM   sy, sy
		  'else
		  'c.ScaleCTM   sx, sx
		  'end if
		  '
		  'c.DrawPDFPage page
		  '
		  '#if RBVersion >= 2012.02
		  '#pragma unused areas
		  '#endif
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  
		  SB1.Value = SB1.Value + deltaY
		  
		  return  true
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  base.Append   new MenuItem( "Open in Preview", "PREVIEW" )
		  base.Append   new MenuItem( "Reveal in Finder", "REVEAL" )
		  
		  return  true
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  select case hitItem.Tag
		  case "PREVIEW"
		    call  NSWorkspace.OpenFile  docFile, "Preview"
		    
		  case "REVEAL"
		    docfile.RevealInFinder
		    
		  else
		    return  false
		  end select
		  
		  return  true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SB1
	#tag Event
		Sub ValueChanged()
		  
		  Canvas1.Invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
