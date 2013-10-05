#tag Window
Begin Window QuickStartPDFWND
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   7.36e+2
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
   Width           =   7.17e+2
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
      Height          =   736
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   131
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      mode            =   ""
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
      Height          =   736
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
End
#tag EndWindow

#tag WindowCode
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
		  
		  PV1.Document = pdoc
		  PV1.AutoScales = true
		  PV1.DisplayMode = 1
		  
		  TV1.SetPDFView  PV1
		  TV1.NeedsDisplay = true
		  
		  
		End Sub
	#tag EndEvent


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
