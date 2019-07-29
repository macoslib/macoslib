#tag Window
Begin Window ApplicationExtensionsWindow
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
   Height          =   169
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
   Title           =   "Application Extensions"
   Type            =   "0"
   Visible         =   True
   Width           =   641
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
      Height          =   47
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Value           =   "-"
      Visible         =   True
      Width           =   623
   End
   Begin PushButton PushButton1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Hide Others"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   "Hide all applications except yours."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
   End
   Begin Label Label2
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   47
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "With the bundle as a base, you can easily get informations, FolderItems to the different folders inside the bundle and access the resources (even localized) very easily."
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Value           =   "With the bundle as a base, you can easily get informations, FolderItems to the different folders inside the bundle and access the resources (even localized) very easily."
      Visible         =   True
      Width           =   623
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Label1
	#tag Event
		Sub Open()
		  
		  me.Text = "You application bundle (the folder containing your application) is located at: " + App.ApplicationBundle.POSIXPath
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  
		  App.HideOthers
		  
		End Sub
	#tag EndEvent
#tag EndEvents
