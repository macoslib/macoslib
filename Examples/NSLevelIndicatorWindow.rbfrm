#tag Window
Begin Window NSLevelIndicatorWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "NSLevelIndicator"
   Visible         =   True
   Width           =   600
   Begin NSLevelIndicator NSLevelIndicator1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      CriticalValue   =   80.0
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   29
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Left            =   153
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      MajorTickMarks  =   ""
      MaxValue        =   100.0
      MinValue        =   0.0
      Scope           =   0
      Style           =   1
      TabIndex        =   ""
      TabPanelIndex   =   0
      TabStop         =   ""
      TickMarks       =   ""
      Top             =   90
      UseFocusRing    =   ""
      Value           =   50.0
      Visible         =   True
      WarningValue    =   60.0
      Width           =   294
   End
   Begin PopupMenu StyleMenu
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   233
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
      Top             =   147
      Underline       =   ""
      Visible         =   True
      Width           =   156
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   153
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
      TabStop         =   True
      Text            =   "Style"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   149
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   68
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
      Left            =   153
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Value"
      TextAlign       =   2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin TextField ValueField
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   233
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   178
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  for i as Integer = 0 to StyleMenu.ListCount - 1
		    if StyleMenu.RowTag(i) = NSLevelIndicator1.Style then
		      StyleMenu.ListIndex = i
		      exit
		    end if
		  next
		  
		  ValueField.Text = Str(NSLevelIndicator1.Value)
		  
		  NSLevelIndicator1.TickMarks = 10
		  NSLevelIndicator1.MajorTickMarks = 4
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events StyleMenu
	#tag Event
		Sub Open()
		  for each style as Pair in Array("RelevancyLevelIndicator" : NSLevelIndicator.RelevancyLevelIndicator, _
		    "RatingLevelIndicator" : NSLevelIndicator.RatingLevelIndicator, _
		    "DiscreteCapacityLevelIndicator" : NSLevelIndicator.DiscreteCapacityLevelIndicator, _
		    "ContinuousCapacityLevelIndicator" : NSLevelIndicator.ContinuousCapacityLevelIndicator)
		    me.AddRow style.Left
		    me.RowTag(me.ListCount - 1) = style.Right
		  next
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    NSLevelIndicator1.Style = me.RowTag(me.ListIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ValueField
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim endEditKeys() as String = Array(Encodings.UTF8.Chr(9), Encodings.UTF8.Chr(3), Encodings.UTF8.Chr(13))
		  
		  if endEditKeys.IndexOf(key) > -1 then
		    NSLevelIndicator1.Value = Val(me.Text)
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
