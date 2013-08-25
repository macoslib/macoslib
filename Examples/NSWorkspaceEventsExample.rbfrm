#tag Window
Begin Window NSWorkspaceEventsExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.19e+2
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
   Title           =   "NSWorkspace Notifications"
   Visible         =   True
   Width           =   8.37e+2
   Begin Cocoa.NSWorkspace Workspace
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   9
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   467
      Visible         =   True
      Width           =   32
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   420
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AVAILABLE NOTIFICATIONS\r\rNSWorkspaceWillLaunchApplicationNotification\rNSWorkspaceDidLaunchApplicationNotification\rNSWorkspaceDidTerminateApplicationNotification\rNSWorkspaceSessionDidBecomeActiveNotification\rNSWorkspaceSessionDidResignActiveNotification\rNSWorkspaceDidHideApplicationNotification\rNSWorkspaceDidUnhideApplicationNotification\rNSWorkspaceDidActivateApplicationNotification\rNSWorkspaceDidDeactivateApplicationNotification\rNSWorkspaceDidRenameVolumeNotification\rNSWorkspaceDidMountNotification\rNSWorkspaceDidUnmountNotification\rNSWorkspaceDidPerformFileOperationNotification\rNSWorkspaceDidChangeFileLabelsNotification\rNSWorkspaceActiveSpaceDidChangeNotification\rNSWorkspaceDidWakeNotification\rNSWorkspaceWillPowerOffNotification\rNSWorkspaceWillSleepNotification\rNSWorkspaceScreensDidSleepNotification\rNSWorkspaceScreensDidWakeNotification"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   333
   End
   Begin TextArea TA1
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
      Height          =   489
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   354
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   12
      TextUnit        =   0
      Top             =   10
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   464
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AppendText(theText as String)
		  
		  dim sr as new StyleRun( theText )
		  
		  sr.Bold = false
		  
		  TA1.StyledText.AppendStyleRun   sr
		  
		  TA1.ScrollPosition = 10000
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendTextBold(theText as String)
		  
		  dim sr as new StyleRun( theText )
		  
		  sr.Bold = true
		  
		  TA1.StyledText.AppendStyleRun   sr
		  
		  TA1.ScrollPosition = 10000
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Workspace
	#tag Event
		Sub NSWorkspaceDidActivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has been activated" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidDeactivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has been deactivated" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidMountNotification(notification as NSNotification, url as NSURL, localizedName as String)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "New volume “" + localizedName + "” has been mounted at URL " + url.AbsoluteString + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidHideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has been hidden" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidUnhideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has been unhidden" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceWillSleepNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "The computer is going to sleep" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceWillUnmountNotification(notification as NSNotification, url as NSURL, localizedName as String)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Volume “" + localizedName + "” at URL " + url.AbsoluteString + " is unmounting" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidUnmountNotification(notification as NSNotification, url as NSURL, localizedName as String)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Volume “" + localizedName + "” previously at URL " + url.AbsoluteString + " is no longer mounted" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidTerminateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has quitted" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceSessionDidResignActiveNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "User session is deactivating" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceSessionDidBecomeActiveNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "User session has become active" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceWillLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” is going to be launched" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceWillPowerOffNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "The computer is going to power off" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceScreensDidSleepNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Screen has been put to sleep" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceScreensDidWakeNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Screen has been awaken" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidWakeNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "System has been awaken" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Application “" + theApplication.LocalizedName + "” has been launched" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceActiveSpaceDidChangeNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Active Finder space has changed" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidChangeFileLabelsNotification(notification as NSNotification)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Finder labels have been modified" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidPerformFileOperationNotification(notification as NSNotification, operationID as integer)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "File operation #" + Str( operationID ) + " has completed" + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
	#tag Event
		Sub NSWorkspaceDidRenameVolumeNotification(notification as NSNotification, oldURL as NSURL, oldLocalizedName as string, newURL as NSURL, newLocalizedName as string)
		  
		  AppendTextBold notification.Name + EndOfLine
		  AppendText   "Volume “" + oldLocalizedName + "” previously at URL " + oldURL.AbsoluteString + " has been renamed to “"_
		  + newLocalizedName + "” and mounted at URL " + newURL.AbsoluteString + EndOfLine + EndOfLine
		End Sub
	#tag EndEvent
#tag EndEvents
