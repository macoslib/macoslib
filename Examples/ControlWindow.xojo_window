#tag Window
Begin Window ControlWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
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
   Title           =   "Controls"
   Visible         =   True
   Width           =   300
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      Bold            =   False
      Caption         =   "Visible"
      ControlOrder    =   "0"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   171
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   255
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox CheckBox2
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      Caption         =   "Enabled"
      ControlOrder    =   "1"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   35
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   255
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin CheckboxContainer ContainerControl11
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      BehaviorIndex   =   2
      ControlOrder    =   "2"
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   114
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   260
   End
   Begin MacCheckbox MacCheckbox1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      AutoToggle      =   False
      Backdrop        =   0
      BehaviorIndex   =   3
      Caption         =   "MacFoo"
      ControlOrder    =   "3"
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   63
      Transparent     =   True
      UseFocusRing    =   True
      Value           =   2
      Visible         =   True
      Width           =   180
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events CheckBox1
	#tag Event
		Sub Action()
		  ContainerControl11.Visible = me.Value
		  'ContainerControl11.MacCheckbox1.Visible = me.Value
		  
		  MacCheckbox1.Visible = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub Action()
		  ContainerControl11.MacCheckbox1.Enabled = me.Value
		  MacCheckbox1.Enabled = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ContainerControl11
	#tag Event
		Sub Open()
		  me.MacCheckbox1.Caption = "ContainerControl Checkbox"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MacCheckbox1
	#tag Event
		Sub Open()
		  me.Caption = "Window Checkbox"
		End Sub
	#tag EndEvent
#tag EndEvents
