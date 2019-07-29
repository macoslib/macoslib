#tag Window
Begin Window IKCameraDownloadWND
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
   Height          =   612
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
   Title           =   "Camera download"
   Type            =   "0"
   Visible         =   True
   Width           =   839
   Begin IKCameraDeviceView IKView
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      displaysDownloadsDirectoryControl=   False
      DoubleBuffer    =   "False"
      Enabled         =   True
      EraseBackground =   "True"
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
