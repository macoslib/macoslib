#tag Window
Begin Window QuickStartPDFWND
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   736
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
   Visible         =   True
   Width           =   717
   Begin PDFView PV1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      displaysLocalCameras=   ""
      displaysLocalScanners=   ""
      displaysNetworkCameras=   ""
      displaysNetworkScanners=   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   709
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   131
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      mode            =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   586
   End
   Begin PDFThumbnailView TV1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   709
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   131
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
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To print the PDF document, press Cmd-P or choose Print from the File menu."
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   12
      TextUnit        =   0
      Top             =   712
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   619
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  
		  PV1.SetFocus
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  nsw = New NSWindow(self)
		  
		  nsw.AnimationBehavior = NSWindow.NSWindowAnimationBehavior.NSWindowAnimationBehaviorDocumentWindow
		  
		  if NOT self.RestoreFrameFromWindowName( "PDFViewer" ) then
		    self.Center
		  end if
		  
		  self.DocumentFile = docfile
		  self.Title = docfile.Name
		  
		  dim pdoc as PDFDocument = PDFDocument.CreateFromFolderItem( docfile )
		  
		  if pdoc=nil then
		    DReportError   "Couldn't open PDF document", docfile
		  end if
		  
		  PV1.Document = pdoc
		  PV1.AutoScales = true
		  PV1.DisplayMode = 1
		  
		  TV1.SetPDFView  PV1
		  TV1.NeedsDisplay = true
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CocoaFilePrint() As Boolean Handles CocoaFilePrint.Action
			PV1.SetFocus
			
			Return false
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1000
		Sub Constructor(f as FolderItem)
		  // Calling the overridden superclass constructor.
		  
		  docfile = f
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private docfile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private nsw As NSWindow
	#tag EndProperty


#tag EndWindowCode

#tag Events PV1
	#tag Event
		Sub Open()
		  
		  'TV1.SetPDFView  PV1
		End Sub
	#tag EndEvent
#tag EndEvents
