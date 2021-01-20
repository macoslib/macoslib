#tag Window
Begin Window NSLevelIndicatorWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "NSLevelIndicator"
   Visible         =   True
   Width           =   600
   Begin NSLevelIndicator NSLevelIndicator1
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   False
      CriticalValue   =   80.0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   "False"
      FloatValue      =   0.0
      Height          =   29
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   153
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MajorTickMarks  =   0
      MaxValue        =   100.0
      MinValue        =   0.0
      Scope           =   0
      StringValue     =   ""
      Style           =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TickMarkPosition=   ""
      TickMarks       =   0
      Top             =   90
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   False
      Value           =   50.0
      Visible         =   True
      WarningValue    =   60.0
      Width           =   294
   End
   Begin PopupMenu StyleMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   233
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   147
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   156
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   153
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   149
      Transparent     =   False
      Underline       =   False
      Value           =   "Style"
      Visible         =   True
      Width           =   68
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   153
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Value           =   "Value"
      Visible         =   True
      Width           =   68
   End
   Begin TextField ValueField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   233
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   178
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Value           =   ""
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
