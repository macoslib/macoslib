#tag Window
Begin Window NSDatePickerWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   368
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
   Resizeable      =   True
   Title           =   "NSDatePicker"
   Visible         =   True
   Width           =   764
   Begin NSDatePicker NSPickerDateTimeGraphical
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   150
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   118
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   280
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Change Background"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   167
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
      Top             =   280
      Underline       =   False
      Visible         =   True
      Width           =   168
   End
   Begin CheckBox BackgroundCheckbox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Draw Background"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   280
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   145
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   347
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -302
      Underline       =   False
      Visible         =   True
      Width           =   153
   End
   Begin CheckBox BezeledCheckbox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Bezeled"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   304
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox BorderedCheckbox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Bordered"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin NSDatePicker NSPickerDateOnly
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   592
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   51
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   142
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   592
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date only:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin NSDatePicker NSPickerTimeOnly
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   51
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   142
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Time only:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin NSDatePicker NSPickerDateTime
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   51
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   180
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date && Time:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date && Time Graphical:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin NSDatePicker NSPickerTimeGraphical
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   122
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   132
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
   End
   Begin NSDatePicker NSPickerDateGraphical
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowsExpansionToolTips=   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      Bezeled         =   False
      Bold            =   False
      Bordered        =   False
      DatePickerElements=   0
      Description     =   ""
      DoubleBuffer    =   False
      DoubleValue     =   0.0
      DrawsBackground =   False
      Enabled         =   True
      EraseBackground =   True
      FloatValue      =   0.0
      Height          =   150
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   592
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mode            =   ""
      Scope           =   0
      StringValue     =   ""
      Style           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   118
      Transparent     =   True
      Underlined      =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Time Graphical:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin Label lblArray
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   592
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date Graphical:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
   End
   Begin PushButton btnDateNow
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Set all to now"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   594
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton btnDateNow1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Get All Values"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   423
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events NSPickerDateTimeGraphical
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSClockAndCalendar
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim c as Color = NSPickerDateTimeGraphical.BackgroundColor
		  if SelectColor(c, "Choose a background color for the date picker.") then
		    NSPickerDateTimeGraphical.BackgroundColor = c
		    
		    NSPickerDateOnly.BackgroundColor = c
		    NSPickerDateTime.BackgroundColor = c
		    NSPickerTimeOnly.BackgroundColor = c
		  else
		    //user cancelled
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackgroundCheckbox
	#tag Event
		Sub Action()
		  NSPickerTimeGraphical.DrawsBackground = me.Value
		  NSPickerDateGraphical.DrawsBackground = me.Value
		  NSPickerDateTimeGraphical.DrawsBackground = me.Value
		  
		  NSPickerDateOnly.DrawsBackground = me.Value
		  NSPickerTimeOnly.DrawsBackground = me.Value
		  NSPickerDateTime.DrawsBackground = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'me.Value = NSDatePicker1.DrawsBackground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  dim styles() as Pair = Array("NSTextFieldAndStepper" : NSDatePicker.NSTextFieldAndStepper, _
		  "NSClockAndCalendar" : NSDatePicker.NSClockAndCalendar, _
		  "NSTextField" : NSDatePicker.NSTextField)
		  
		  for each item as Pair in styles
		    me.AddRow item.Left
		    me.RowTag(me.ListCount - 1) = item.Right
		  next
		  
		  'me.ListIndex = 0
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    NSPickerDateTimeGraphical.Style = me.RowTag(me.ListIndex)
		  else
		    //ignore
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BezeledCheckbox
	#tag Event
		Sub Action()
		  NSPickerTimeGraphical.Bezeled = me.Value
		  NSPickerDateGraphical.Bezeled = me.Value
		  NSPickerDateTimeGraphical.Bezeled = me.Value
		  
		  NSPickerDateOnly.Bezeled = me.Value
		  NSPickerTimeOnly.Bezeled = me.Value
		  NSPickerDateTime.Bezeled = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'me.Value = NSDatePicker1.Bezeled
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BorderedCheckbox
	#tag Event
		Sub Action()
		  NSPickerTimeGraphical.Bordered = me.Value
		  NSPickerDateGraphical.Bordered = me.Value
		  NSPickerDateTimeGraphical.Bordered = me.Value
		  
		  NSPickerDateOnly.Bordered = me.Value
		  NSPickerTimeOnly.Bordered = me.Value
		  NSPickerDateTime.Bordered = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'me.Value = NSDatePicker1.Bordered
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSPickerDateOnly
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSTextFieldAndStepper
		  me.DatePickerElements = NOT NSDatePicker.NSDatePickerElementFlagHourMinute and NOT NSDatePicker.NSDatePickerElementFlagHourMinuteSecond
		  
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSPickerTimeOnly
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSTextFieldAndStepper
		  me.DatePickerElements = NOT NSDatePicker.NSDatePickerElementFlagYearMonthDay and NOT NSDatePicker.NSDatePickerElementFlagYearMonth
		  
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSPickerDateTime
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSTextFieldAndStepper
		  
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSPickerTimeGraphical
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSClockAndCalendar
		  me.DatePickerElements = NOT NSDatePicker.NSDatePickerElementFlagYearMonthDay and NOT NSDatePicker.NSDatePickerElementFlagYearMonth
		  
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NSPickerDateGraphical
	#tag Event
		Sub Open()
		  me.Style = NSDatePicker.NSClockAndCalendar
		  me.DatePickerElements = NOT NSDatePicker.NSDatePickerElementFlagHourMinute and NOT NSDatePicker.NSDatePickerElementFlagHourMinuteSecond
		  
		  me.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDateNow
	#tag Event
		Sub Action()
		  NSPickerDateGraphical.DateValue = NSDate.Now
		  NSPickerTimeGraphical.DateValue = NSDate.Now
		  NSPickerDateTimeGraphical.DateValue = NSDate.Now
		  
		  NSPickerDateOnly.DateValue = NSDate.Now
		  NSPickerTimeOnly.DateValue = NSDate.Now
		  NSPickerDateTime.DateValue = NSDate.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDateNow1
	#tag Event
		Sub Action()
		  dim PickerDateTime as date = NSPickerDateTime.DateValue
		  dim PickerDateTimeGraphical as date = NSPickerDateTimeGraphical.DateValue
		  
		  dim PickerTime as date = NSPickerTimeOnly.DateValue
		  dim PickerTimeGraphical as date = NSPickerTimeGraphical.DateValue
		  
		  dim PickerDate as date = NSPickerDateOnly.DateValue
		  dim PickerDateGraphical as date = NSPickerDateGraphical.DateValue
		  
		  MsgBox "Datepicker values: " + EndOfLine + EndOfLine + _
		  PickerDateTime.LongDate + " " + PickerDateTime.LongTime + " (Date & Time)" + EndOfLine + _
		  PickerDateTimeGraphical.LongDate + " " + PickerDateTimeGraphical.LongTime + " (Date & Time Graphical)" + EndOfLine + _
		  _
		  PickerTime.LongDate + " " + PickerTime.LongTime + " (Time)" + EndOfLine + _
		  PickerTimeGraphical.LongDate + " " + PickerTimeGraphical.LongTime + " (Time Graphical)" + EndOfLine + _
		  _
		  PickerDate.LongDate + " " + PickerDate.LongTime + " (Date)" + EndOfLine + _
		  PickerDateGraphical.LongDate + " " + PickerDateGraphical.LongTime + " (Date Graphical)"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
