#tag Window
Begin Window IKScannerWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   629
   ImplicitInstance=   True
   LiveResize      =   "True"
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
   Title           =   "Scanner"
   Visible         =   True
   Width           =   782
   Begin IKScannerDeviceView IKScannerDeviceView1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      displaysDownloadsDirectoryControl=   False
      displaysPostProcessApplicationControl=   False
      DocumentName    =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      HasDisplayModeAdvanced=   False
      HasDisplayModeSimple=   False
      Height          =   630
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
      Width           =   783
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events IKScannerDeviceView1
	#tag Event
		Sub ScanError(ErrorMessage as string)
		  
		  DReportError   "ScanError:", ErrorMessage
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(ErrorMessage as string)
		  
		  DReportError   "Error:", ErrorMessage
		End Sub
	#tag EndEvent
	#tag Event
		Sub ScanFinished(file as FolderItem, data as MemoryBlock)
		  
		  DReport  "Scan finished", file, data
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.mode = 1
		  me.displaysDownloadsDirectoryControl = true
		  me.displaysPostProcessApplicationControl = true
		  me.HasDisplayModeAdvanced = true
		  me.HasDisplayModeSimple = true
		  me.TransferMode = 1
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
