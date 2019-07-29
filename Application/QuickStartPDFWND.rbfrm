#tag Window
Begin Window QuickStartPDFWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "0"
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   736
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   "0"
   Resizable       =   True
   Resizeable      =   "True"
   SystemUIVisible =   True
   Title           =   "Untitled"
   Type            =   "0"
   Visible         =   True
   Width           =   717
   Begin PDFView PV1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      AutoDeactivate  =   True
      AutoresizesSubviews=   False
      AutoresizingMask=   0
      AutoScales      =   False
      Backdrop        =   0
      BoundsRotation  =   0.0
      CanBecomeKeyView=   False
      CanDraw         =   False
      CanDrawConcurrently=   False
      Description     =   ""
      DisplayMode     =   0
      displaysLocalCameras=   ""
      displaysLocalScanners=   ""
      displaysNetworkCameras=   ""
      displaysNetworkScanners=   ""
      DoubleBuffer    =   "False"
      Enabled         =   True
      EraseBackground =   "False"
      FocusRingType   =   ""
      FrameRotation   =   0.0
      Height          =   709
      HelpTag         =   ""
      Hidden          =   False
      HiddenOrHasHiddenAncestor=   False
      Index           =   -2147483648
      InitialParent   =   ""
      InLiveResize    =   False
      IsFlipped       =   False
      IsInFullScreenMode=   False
      IsOpague        =   False
      IsRotatedFromBase=   False
      IsRotatedOrScaledFromBase=   False
      Left            =   131
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      mode            =   "0"
      NeedsDisplay    =   False
      PostsBoundsChangedNotifications=   False
      PostsFrameChangedNotifications=   False
      PreservesContentDuringLiveResize=   False
      Scope           =   0
      ShouldDrawColor =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tag             =   0
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      WantsDefaultClipping=   False
      Width           =   586
   End
   Begin PDFThumbnailView TV1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   False
      AutoDeactivate  =   True
      AutoresizesSubviews=   False
      AutoresizingMask=   0
      Backdrop        =   0
      BoundsRotation  =   0.0
      CanBecomeKeyView=   False
      CanDraw         =   False
      CanDrawConcurrently=   False
      Description     =   ""
      DoubleBuffer    =   "False"
      Enabled         =   True
      EraseBackground =   "False"
      FocusRingType   =   ""
      FrameRotation   =   0.0
      Height          =   709
      HelpTag         =   ""
      Hidden          =   False
      HiddenOrHasHiddenAncestor=   False
      Index           =   -2147483648
      InitialParent   =   ""
      InLiveResize    =   False
      IsFlipped       =   False
      IsInFullScreenMode=   False
      IsOpague        =   False
      IsRotatedFromBase=   False
      IsRotatedOrScaledFromBase=   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      NeedsDisplay    =   False
      PostsBoundsChangedNotifications=   False
      PostsFrameChangedNotifications=   False
      PreservesContentDuringLiveResize=   False
      Scope           =   0
      ShouldDrawColor =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tag             =   0
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      WantsDefaultClipping=   False
      Width           =   131
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "To print the PDF document, press Cmd-P or choose Print from the File menu."
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   712
      Transparent     =   False
      Underline       =   False
      Value           =   "To print the PDF document, press Cmd-P or choose Print from the File menu."
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
