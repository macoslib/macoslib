#tag Window
Begin Window PDFBrowser
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   300
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
   Title           =   "Untitled"
   Visible         =   False
   Width           =   300
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
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   287
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
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   287
      Visible         =   True
      Width           =   10
   End
   Begin Label PageNumberText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   135
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   000
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   11
      Top             =   284
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   30
      Window          =   0
      _mWindow        =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim dlg as new OpenDialog
		  if dlg.ShowModal is nil then
		    return
		  end if
		  
		  self.Document = OpenDocument(dlg.Result)
		  if self.Document <> nil then
		    self.Title = dlg.Result.Name
		    PageNumber = 1
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if self.Document is nil then
		    return
		  end if
		  
		  
		  dim page as CGPDFPage = self.Document.Page(self.PageNumber)
		  if page = nil then
		    return
		  end if
		  dim box as CGRect = page.BoxRect(CGPDFBox.Media)
		  
		  
		  dim c as new CGContextGraphicsPort(g)
		  c.TranslateCTM 0, self.Height - box.rectSize.height
		  c.DrawPDFPage page
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  AlignNavigationControls
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

	#tag Method, Flags = &h21
		Private Function OpenDocument(f as FolderItem) As CGPDFDocument
		  if f is nil or not f.Exists then
		    return nil
		  end if
		  
		  return CGPDFDocument.Create(new CFURL(f))
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Document As CGPDFDocument
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
			  self.Refresh
			  
			End Set
		#tag EndSetter
		Private PageNumber As Integer
	#tag EndComputedProperty


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
