#tag Window
Begin Window NSSliderExampleWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   132
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
   Resizeable      =   False
   Title           =   "NSSliders"
   Visible         =   True
   Width           =   588
   Begin Cocoa.NSSlider NSS1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsTickMarkValuesOnly=   ""
      AltIncrementValue=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100
      MinValue        =   0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0
      TickPosition    =   0
      Top             =   13
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   264
   End
   Begin TextField TextField1
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
      Left            =   159
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   5
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   61
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   249
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
      Text            =   "Ticks"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
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
      Left            =   375
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
      Text            =   "Value:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   44
   End
   Begin Label ValueLBL
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
      Left            =   429
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin NSKnobSlider NSS2
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsTickMarkValuesOnly=   False
      AltIncrementValue=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   13
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      MaxValue        =   100
      MinValue        =   0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0.0
      TickPosition    =   0
      Top             =   56
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   32
   End
   Begin NSKnobSlider NSS3
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsTickMarkValuesOnly=   False
      AltIncrementValue=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   69
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      MaxValue        =   100
      MinValue        =   0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   1
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0.0
      TickPosition    =   0
      Top             =   56
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   32
   End
   Begin Cocoa.NSSlider NSS4
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AllowsTickMarkValuesOnly=   ""
      AltIncrementValue=   ""
      AutoDeactivate  =   True
      autoresizesSubviews=   ""
      Backdrop        =   ""
      Bold            =   false
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsFlipped       =   ""
      Italic          =   false
      Left            =   304
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100
      MinValue        =   0
      NumberOfTickMarks=   0
      Scope           =   0
      Size            =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   ""
      TextFont        =   "System"
      TextSize        =   0
      TickPosition    =   0
      Top             =   13
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   264
   End
   Begin CheckBox CB1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Round value to the closest Tick"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   159
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   91
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   409
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events NSS1
	#tag Event
		Sub ValueChanged()
		  
		  ValueLBL.Text = Str( me.Value )
		  'NSS2.Value = me.Value
		  'NSS3.Value = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  if Key=Chr( 13 ) then
		    NSS1.NumberOfTickMarks = val( me.Text )
		    NSS2.NumberOfTickMarks = val( me.Text )
		    NSS3.NumberOfTickMarks = val( me.Text )
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events NSS2
	#tag Event
		Sub ValueChanged()
		  
		  ValueLBL.Text = Str( me.Value )
		  'NSS1.Value = me.Value
		  'NSS3.Value = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSS3
	#tag Event
		Sub ValueChanged()
		  
		  ValueLBL.Text = Str( me.Value )
		  'NSS1.Value = me.Value
		  'NSS2.Value = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSS4
	#tag Event
		Sub ValueChanged()
		  
		  ValueLBL.Text = Str( me.Value )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CB1
	#tag Event
		Sub Action()
		  NSS1.AllowsTickMarkValuesOnly = me.Value
		  NSS2.AllowsTickMarkValuesOnly = me.Value
		  NSS3.AllowsTickMarkValuesOnly = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
