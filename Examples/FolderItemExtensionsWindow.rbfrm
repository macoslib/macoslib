#tag Window
Begin Window FolderItemExtensionsWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.03e+2
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
   Title           =   "FolderItem Extensions"
   Visible         =   True
   Width           =   8.03e+2
   Begin Placard Placard1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   33
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -2
      Value           =   True
      Visible         =   True
      Width           =   804
      Begin PushButton SelectFildeBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Select File"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Placard1"
         Italic          =   ""
         Left            =   8
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   104
      End
      Begin PushButton SelectFolderBTN
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Select Folder"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Placard1"
         Italic          =   ""
         Left            =   127
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   104
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
         InitialParent   =   "Placard1"
         Italic          =   ""
         Left            =   263
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         Text            =   "or drag&&drop a file or folder here"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   520
      End
   End
   Begin Label Label2
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
      Left            =   11
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Results:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   36
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin HTMLViewer HTMLViewer1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   524
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   59
      Visible         =   True
      Width           =   774
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Analyze(f as FolderItem)
		  
		  if f=nil then  RETURN
		  
		  'dim html as string
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Placard1
	#tag Event
		Sub Open()
		  
		  AcceptFileDrop( "Any" )
		  AcceptFileDrop( "fold" )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  
		  #pragma unused action
		  
		  if obj.FolderItemAvailable then
		    Analyze   obj.FolderItem
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectFildeBTN
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem = GetOpenFolderItem( "Any" )
		  
		  Analyze   f
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectFolderBTN
	#tag Event
		Sub Action()
		  
		  dim f as FolderItem = SelectFolder
		  
		  Analyze   f
		End Sub
	#tag EndEvent
#tag EndEvents
