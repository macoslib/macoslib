#tag Window
Begin Window IKCameraDownloadWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   612
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
   Title           =   "Camera download"
   Visible         =   True
   Width           =   839
   Begin IKCameraDeviceView IKView
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "True"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      Backdrop        =   0
      displaysDownloadsDirectoryControl=   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      hasDisplayModeIcon=   False
      hasDisplayModeTable=   False
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
      mode            =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -1
      TransferMode    =   0
      Transparent     =   True
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
		  me.hasDisplayModeIcon = true
		  me.hasDisplayModeTable = true
		  me.TransferMode = 0
		  
		  
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
		  
		  #pragma unused fileName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  
		  DReport  "Selection changed"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
