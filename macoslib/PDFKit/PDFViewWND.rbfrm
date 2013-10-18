#tag Window
Begin Window PDFViewWND
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
      Left            =   0
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
      Width           =   717
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim f as FolderItem = GetFolderItem( "Application" ).Child( "BuiltInDocuments" ).Child( "Macoslib Overview.pdf" )
		  dim url as new NSURL( f )
		  
		  declare function initWithURL lib CocoaLib selector "initWithURL:" (id as Ptr, url as Ptr) as Ptr
		  declare sub setDocument lib CocoaLib selector "setDocument:" (id as Ptr, doc as Ptr)
		  declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		  declare sub setAutoScales lib "Quartz.framework" selector "setAutoScales:" (id as Ptr, flag as Boolean)
		  
		  dim pdoc as Ptr = initWithURL( alloc( Cocoa.NSClassFromString( "PDFDocument" )), url )
		  
		  if pdoc<>nil then
		    setDocument  PV1.id, pdoc
		    setAutoScales  PV1.id, true
		  else
		    DReportError   "Unable to create PDFDocument"
		    break
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pdfdoc As Ptr
	#tag EndProperty


#tag EndWindowCode

