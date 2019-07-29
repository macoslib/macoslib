#tag Window
Begin Window AuthorizationShellExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   555
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   593336822
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "AuthorizationShell"
   Visible         =   True
   Width           =   488
   Begin AuthorizationShell AuthorizationShell1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PushButton runBut
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Run"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "12.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   387
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   81
   End
   Begin TextField cmdEdit
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      Height          =   22
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   75
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "/bin/sh"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   117
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   "/bin/sh"
      Visible         =   True
      Width           =   299
   End
   Begin TextField argsEdit
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      Height          =   22
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   75
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-i"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   146
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   "-i"
      Visible         =   True
      Width           =   298
   End
   Begin TextField inputEdit
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   "enter a command here ('exit' when done)"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      Height          =   22
      HelpTag         =   ""
      Hint            =   "enter a command here ('exit' when done)"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   187
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   449
   End
   Begin TextArea outputEdit
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowStyledText =   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Courier"
      FontSize        =   "10.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      HasHorizontalScrollbar=   "False"
      HasVerticalScrollbar=   "True"
      Height          =   288
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Instructions:\r\rHit the Run button to run a new shell (sh) with root permissions.\r\rOnce you've entered your login credentials, reactivate this window by clicking into it.\r\rThen enter a command into the upper editfield, e.g.:\r\rls /.fseventsd\r\rYou'll get a listing of a folder that can't be read without root permissions.\r\rType 'exit' to close the session."
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "Courier"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   221
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   "Instructions:\r\rHit the Run button to run a new shell (sh) with root permissions.\r\rOnce you've entered your login credentials, reactivate this window by clicking into it.\r\rThen enter a command into the upper editfield, e.g.:\r\rls /.fseventsd\r\rYou'll get a listing of a folder that can't be read without root permissions.\r\rType 'exit' to close the session."
      Visible         =   True
      Width           =   449
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cmd:"
      TextAlign       =   2
      TextAlignment   =   "3"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   117
      Transparent     =   False
      Underline       =   False
      Value           =   "Cmd:"
      Visible         =   True
      Width           =   51
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Args:"
      TextAlign       =   2
      TextAlignment   =   "3"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   146
      Transparent     =   False
      Underline       =   False
      Value           =   "Args:"
      Visible         =   True
      Width           =   51
   End
   Begin Line Line1
      BorderWidth     =   1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "8"
      TabPanelIndex   =   0
      TabStop         =   True
      Thickness       =   "1.0"
      Transparent     =   False
      Visible         =   True
      X1              =   12
      X2              =   474
      Y1              =   177
      Y2              =   178
   End
   Begin PushButton clearOutputBut
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   387
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   521
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField fldUsername
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   "optional"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      Height          =   22
      HelpTag         =   ""
      Hint            =   "optional"
      Index           =   -2147483648
      Italic          =   False
      Left            =   145
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   228
   End
   Begin TextField fldPassword
      AcceptTabs      =   False
      Alignment       =   0
      AllowAutoDeactivate=   "True"
      AllowFocusRing  =   "True"
      AllowSpellChecking=   "False"
      AllowTabs       =   "False"
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   "optional"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Format          =   ""
      HasBorder       =   "True"
      Height          =   22
      HelpTag         =   ""
      Hint            =   "optional"
      Index           =   -2147483648
      Italic          =   False
      Left            =   145
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   "0"
      Password        =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   71
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   228
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Username:"
      TextAlign       =   2
      TextAlignment   =   "3"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   False
      Underline       =   False
      Value           =   "Username:"
      Visible         =   True
      Width           =   114
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Password:"
      TextAlign       =   2
      TextAlignment   =   "3"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   71
      Transparent     =   False
      Underline       =   False
      Value           =   "Password:"
      Visible         =   True
      Width           =   114
   End
   Begin Label Label1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   32
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Enter a username and password below. Blank or incorrect values will bring up the standard dialog."
      TextAlign       =   1
      TextAlignment   =   "2"
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Value           =   "Enter a username and password below. Blank or incorrect values will bring up the standard dialog."
      Visible         =   True
      Width           =   449
   End
   Begin Line Line2
      BorderWidth     =   1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "15"
      TabPanelIndex   =   0
      TabStop         =   True
      Thickness       =   "1.0"
      Transparent     =   False
      Visible         =   True
      X1              =   12
      X2              =   474
      Y1              =   102
      Y2              =   103
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  AuthorizationShell1.Close
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BringSelfToFront()
		  // This is a little hack to keep this program's window active after launching the interactive shell.
		  // I (TT) can't even explain why it works.
		  
		  declare function GetCurrentProcess lib "Carbon" (ByRef psn as UInt64) as Integer
		  declare function GetFrontProcess lib "Carbon" (ByRef psn as UInt64) as Integer
		  declare function SetFrontProcess lib "Carbon" (ByRef psn as UInt64) as Integer
		  
		  dim psn, psn2 as UInt64
		  call GetFrontProcess (psn2)
		  call SetFrontProcess (psn2) ' this one is important
		  call GetCurrentProcess (psn)
		  call SetFrontProcess (psn)
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events AuthorizationShell1
	#tag Event
		Sub Completed()
		  // This event gets invoked when the shell is terminated
		  // (e.g. by entering "exit" in the "sh" shell).
		  
		  inputEdit.Enabled = false
		  runBut.Enabled = true
		  cmdEdit.Enabled = true
		  argsEdit.Enabled = true
		  fldUsername.Enabled = true
		  fldPassword.Enabled = true
		  
		  cmdEdit.SetFocus
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  // This event gets invoked through the call of the Poll method
		  
		  outputEdit.AppendText me.ReadAll
		  outputEdit.ScrollPosition = Len(outputEdit.Text) ' scroll to the end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events runBut
	#tag Event
		Sub Action()
		  dim cmd, args() as String
		  
		  cmd = cmdEdit.Text
		  args = argsEdit.Text.Split (" ")
		  
		  runBut.Enabled = false
		  
		  AuthorizationShell1.Reset()
		  AuthorizationShell1.SetUsernameAndPassword( fldUsername.Text, fldPassword.Text ) // Even if it's blank
		  
		  if AuthorizationShell1.AuthorizeAndExecute(cmd, args) then
		    // Shell is running now.
		    // Let's enable command input.
		    
		    fldUsername.Enabled = false
		    fldPassword.Enabled = false
		    
		    runBut.Default = false
		    inputEdit.Enabled = true
		    inputEdit.SetFocus
		    BringSelfToFront
		  elseif AuthorizationShell1.ErrorNumber <> 0 then
		    msgBox "Unknown error: " + str(AuthorizationShell1.ErrorNumber)
		  else
		    msgBox "User cancelled"
		  end if
		  
		  dim finished as boolean = not AuthorizationShell1.IsLive
		  runBut.Enabled = finished
		  cmdEdit.Enabled = finished
		  argsEdit.Enabled = finished
		  fldUsername.Enabled = finished
		  fldPassword.Enabled = finished
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Key = chr(13) or Key = Chr(3) then
		    runBut.Push
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events argsEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Key = chr(13) or Key = Chr(3) then
		    runBut.Push
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events inputEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Key = chr(13) or Key = Chr(3) then
		    
		    // Add a newline to the output
		    outputEdit.AppendText EndOfLine
		    
		    // Send the entered command to the shell
		    AuthorizationShell1.WriteLine me.Text
		    
		    // Clear the input line
		    me.Text = ""
		    
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events clearOutputBut
	#tag Event
		Sub Action()
		  outputEdit.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
