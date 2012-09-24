#tag Window
Begin Window IKCameraDownloadWND
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.12e+2
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
   Title           =   "Camera download"
   Visible         =   True
   Width           =   8.39e+2
   Begin IKCameraDeviceView IKView
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      displaysDownloadsDirectoryControl=   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      hasDisplayModeIcon=   ""
      hasDisplayModeTable=   ""
      Height          =   613
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -1
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
      Top             =   -1
      TransferMode    =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   840
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  IKView.CameraDevice = nil
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events IKView
	#tag Event
		Sub Error(errorMessage as string)
		  
		  DReportError   "Error:", ErrorMessage
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  me.mode = 1 //View by icons
		  me.displaysDownloadsDirectoryControl = true
		  'me.displaysPostProcessApplicationControl = true
		  me.hasDisplayModeIcon = true
		  me.hasDisplayModeTable = true
		  me.TransferMode = 0
		  
		  'ReportObjCDetailsForNSObjectPtr   me.id
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadedFile(file as FolderItem, fileData as MemoryBlock)
		  
		  if file<>nil then
		    DReport   "File downloaded at path:", file.POSIXPath
		  elseif fileData<>nil then
		    DReport   "File downloaded in memory. MemoryBlock size is", FormatSize(fileData.Size)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadError(fileName as string, errorMessage as string)
		  
		  DReportError  "Download error", errorMessage
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  
		  DReport  "Selection changed"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
