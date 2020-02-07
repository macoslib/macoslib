#tag Window
Begin Window NSSliderExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   132
   ImplicitInstance=   True
   LiveResize      =   True
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
   Resizeable      =   False
   Title           =   "NSSliders"
   Visible         =   True
   Width           =   588
   Begin Cocoa.NSSlider NSS1
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowsExpansionToolTips=   False
      AllowsTickMarkValuesOnly=   False
      AllowTabs       =   "False"
      AltIncrementValue=   0.0
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   false
      ControlSize     =   ""
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   False
      FloatValue      =   0.0
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   false
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100.0
      MinValue        =   0.0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   0
      SliderType      =   ""
      StringValue     =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TickMarkPosition=   ""
      TickPosition    =   0
      Top             =   13
      Transparent     =   True
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   False
      Value           =   0.0
      Visible         =   True
      Width           =   264
   End
   Begin TextField TextField1
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
      Italic          =   False
      Left            =   159
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "5"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   "5"
      Visible         =   True
      Width           =   80
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
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   249
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
      Text            =   "Ticks"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   False
      Value           =   "Ticks"
      Visible         =   True
      Width           =   100
   End
   Begin Label Label2
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
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   375
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
      Text            =   "Value:"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   False
      Value           =   "Value:"
      Visible         =   True
      Width           =   44
   End
   Begin Label ValueLBL
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
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   429
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Value           =   "-"
      Visible         =   True
      Width           =   91
   End
   Begin NSKnobSlider NSS2
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowsExpansionToolTips=   False
      AllowsTickMarkValuesOnly=   False
      AllowTabs       =   "False"
      AltIncrementValue=   0.0
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   false
      ControlSize     =   ""
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   False
      FloatValue      =   0.0
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   false
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100.0
      MinValue        =   0.0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   0
      SliderType      =   ""
      StringValue     =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TickMarkPosition=   ""
      TickPosition    =   0
      Top             =   56
      Transparent     =   True
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   False
      Value           =   0.0
      Visible         =   True
      Width           =   32
   End
   Begin NSKnobSlider NSS3
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowsExpansionToolTips=   False
      AllowsTickMarkValuesOnly=   False
      AllowTabs       =   "False"
      AltIncrementValue=   0.0
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   false
      ControlSize     =   ""
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   False
      FloatValue      =   0.0
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   false
      Left            =   69
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100.0
      MinValue        =   0.0
      NumberOfTickMarks=   5
      Scope           =   0
      Size            =   1
      SliderType      =   ""
      StringValue     =   ""
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TickMarkPosition=   ""
      TickPosition    =   0
      Top             =   56
      Transparent     =   True
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   False
      Value           =   0.0
      Visible         =   True
      Width           =   32
   End
   Begin Cocoa.NSSlider NSS4
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowAutoDeactivate=   "True"
      AllowFocus      =   "False"
      AllowFocusRing  =   "False"
      AllowsExpansionToolTips=   False
      AllowsTickMarkValuesOnly=   False
      AllowTabs       =   "False"
      AltIncrementValue=   0.0
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bold            =   false
      ControlSize     =   ""
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   False
      FloatValue      =   0.0
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   false
      Left            =   304
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MaxValue        =   100.0
      MinValue        =   0.0
      NumberOfTickMarks=   0
      Scope           =   0
      Size            =   0
      SliderType      =   ""
      StringValue     =   ""
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TickMarkPosition=   ""
      TickPosition    =   0
      Top             =   13
      Transparent     =   True
      Type            =   0
      Underlined      =   false
      UseFocusRing    =   False
      Value           =   0.0
      Visible         =   True
      Width           =   264
   End
   Begin CheckBox CB1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Round value to the closest Tick"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   159
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   91
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
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
