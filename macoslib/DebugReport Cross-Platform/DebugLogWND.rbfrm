#tag Window
Begin Window DebugLogWND
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.42e+2
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
   Title           =   "Debug Log"
   Visible         =   True
   Width           =   3.05e+2
   Begin CheckBox AllowReportCB
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Allow report"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Allow debug reports when checked"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   93
   End
   Begin CheckBox ImmediateReportCB
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Immediate report"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Force immediate refreshing when check (very time consuming). If unchecked, debug reports will be displayed only when the window refreshes."
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   99
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   116
   End
   Begin TextArea LogTA
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   401
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   1
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   303
   End
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   12
      HelpTag         =   "Number of errors reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   426
      UseFocusRing    =   True
      Visible         =   True
      Width           =   12
   End
   Begin Canvas Canvas2
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   12
      HelpTag         =   "Number of warnings reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   75
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   426
      UseFocusRing    =   True
      Visible         =   True
      Width           =   12
   End
   Begin Canvas Canvas3
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   12
      HelpTag         =   "Number of simple reports reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   148
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   426
      UseFocusRing    =   True
      Visible         =   True
      Width           =   12
   End
   Begin Label ErrorCountLBL
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Number of errors reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   22
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   425
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   41
   End
   Begin Label WarningCountLBL
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Number of warnings reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   92
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   425
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   41
   End
   Begin Label ReportCountLBL
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Number of simple reports reported"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   165
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   425
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   41
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Momentarily stops immediate report"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   218
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "F18"
      TextAlign       =   0
      TextColor       =   &h00666666
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   426
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   26
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Disable immediate report"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   247
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "F19"
      TextAlign       =   0
      TextColor       =   &h00666666
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   426
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   26
   End
   Begin PopupArrow PopupArrow1
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   3
      Height          =   10
      HelpTag         =   "Window Menu"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   276
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   430
      Visible         =   True
      Width           =   10
   End
   Begin CheckBox SyslogCB
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Syslog"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   "Also log Errors and Warnings to the System log"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   227
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   67
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  '#if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		  '//Position window. Check for prefs file
		  '
		  'dim f as FolderItem
		  'dim prefs as Dictionary
		  'dim wbounds( 3 ) as string
		  '
		  'f = GetFolderItem( "DebugReport.prefs.plist" )
		  '
		  'if DebugReportModule.Prefs=nil then
		  'prefs = new
		  '
		  'DebugReportModule.Prefs = prefs
		  'else
		  'prefs = DebugReportModule.Prefs
		  'end if
		  '
		  '#endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    //Position window. Check for prefs file
		    
		    dim f as FolderItem
		    f = GetFolderItem( "DebugReport.prefs.plist" )
		    if f<>nil AND f.Exists then
		      dim prefs as Dictionary
		      dim wbounds() as string
		      prefs = PlistAsDictionary_MTC( f )
		      
		      if prefs.HasKey( "WindowBounds" ) then
		        wbounds = Split( prefs.Value( "WindowBounds" ), " " )
		        
		        me.Left = Val( wbounds( 0 ))
		        me.Top = Val( wbounds( 1 ))
		        me.Width = Val( wbounds( 2 ))
		        me.Height = Val( wbounds( 3 ))
		        
		      else
		        me.Left = Screen( 0 ).AvailableWidth - me.Width
		      end if
		      
		    else //Use default
		      me.Left = Screen( 0 ).AvailableWidth - me.Width
		      
		    end if
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  #pragma unused g
		  
		  WarningCountLBL.Text = Str( DebugReportModule.WarningCnt )
		  ErrorCountLBL.Text = Str( DebugReportModule.ErrorCnt )
		  ReportCountLBL.Text = Str( DebugReportModule.ReportCnt )
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.ForeColor = &c9C3120
		  g.FillOval   0, 0, 12, 12
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas2
	#tag Event
		Sub Paint(g As Graphics)
		  g.ForeColor = &c0000FF
		  g.FillOval   0, 0, 12, 12
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas3
	#tag Event
		Sub Paint(g As Graphics)
		  g.ForeColor = &c000000
		  g.FillOval   0, 0, 12, 12
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupArrow1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  dim base as new MenuItem( "MENU" )
		  dim mi as MenuItem
		  
		  base.Append   new Menuitem( "Copy", "_COPY_" )
		  base.Append   new Menuitem( "Clear", "_CLEAR_" )
		  base.Append   new Menuitem( "-" )
		  base.Append   new Menuitem( "Save log to Desktop", "_SAVE_" )
		  
		  mi = base.PopUp
		  if mi is nil then return false // Added by Kem Tekinay. Prevents crash if the user doesn't select anything
		  
		  select case mi.Tag
		  case "_COPY_"
		    dim clip as new Clipboard
		    
		    clip.Text = LogTA.SelText
		    
		  case "_CLEAR_"
		    LogTA.Text = ""
		    LogTA.ScrollPosition = 0
		    
		  case "_SAVE_"
		    beep
		    'dim f as FolderItem
		    'f = SpecialFolder.Desktop.Child( "Debug Log " + Date( new date).AbbreviatedDate
		  end select
		End Function
	#tag EndEvent
#tag EndEvents
