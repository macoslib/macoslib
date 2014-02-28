#tag Window
Begin Window NSRunningApplicationsExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.49e+2
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
   Title           =   "Running Applications"
   Visible         =   True
   Width           =   4.38e+2
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   88
      ListIndex       =   0
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
      Top             =   113
      Underline       =   ""
      Visible         =   True
      Width           =   263
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   80
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   22
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Pull up the menu to see the running applications. Choose one to activate it."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   396
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.DeleteAllRows
		  for each runningApp as NSRunningApplication in  NSWorkspace.RunningApplications
		    me.AddRow runningApp.LocalizedName
		    me.RowTag(PopupMenu1.ListCount - 1) = runningApp
		    if runningApp.Icon <> Nil then
		      me.Icon(PopupMenu1.ListCount - 1) = runningApp.Icon
		    end if
		  next
		  return false
		  
		  #pragma unused X
		  #pragma unused Y
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    dim theApp as NSRunningApplication = me.RowTag(me.ListIndex)
		    dim b as Boolean = theApp.Activate
		    me.ListIndex = -1
		    #pragma unused b
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
