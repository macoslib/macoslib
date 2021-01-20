#tag Window
Begin Window DebugReportExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   372
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
   Resizeable      =   False
   Title           =   "Debug Report example"
   Visible         =   True
   Width           =   600
   Begin HTMLViewer HTML1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   199
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   5
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   24
      Visible         =   True
      Width           =   590
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "DReport   ""A string"", 2, true, 3.14159"
      Default         =   False
      Enabled         =   True
      Height          =   18
      HelpTag         =   "Simple report with a string, an integer, a boolean and a double values"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   256
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   364
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "DReportWarning   ""Couldn't create desired object"""
      Default         =   False
      Enabled         =   True
      Height          =   18
      HelpTag         =   "A simple Warning"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   283
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   364
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Custom implementation for CountryClass"
      Default         =   False
      Enabled         =   True
      Height          =   18
      HelpTag         =   "Example of a custom report implementation"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   334
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   364
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   2
      Transparent     =   False
      Underline       =   False
      Value           =   "Description:"
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton5
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "From Thread"
      Default         =   False
      Enabled         =   True
      Height          =   18
      HelpTag         =   "Reports sent from a Thread"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   395
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   256
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   191
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h21
		Private myThread As DebugReportThread
	#tag EndProperty


	#tag Constant, Name = HTMLContents, Type = String, Dynamic = False, Default = \"<html>\r<head>\r<style type\x3D\"text/css\">\rbody {\rfont-family: Helvetica\x2C Geneva\x2C Arial\x2C sans-serif;\rfont-size: 12 px;\r}\r</style\r</head>\r<body>\r<p>The <b>DebugReportModule</b> allows you to very easily report some interesting data in a floating window without the hassle of formatting data as string.\r\r<p>Simple reports\x2C warnings and errors are presented differently in the log window and they can be automatically logged into the System Log if you want to.\r\r<p>If your application breaks on an exception\x2C you can examine the contents of the Log which is stored on-the-fly.\r\r<p>For Cocoa or Core Foundation (Carbon) objects\x2C the built-in <i>\"description\"</i> function is used.\r\r<H3>Syntax</H3>\r<p><b>DReport( value1 as variant\x2C ... )</b>\rReports all the variant values separated by a space and ending by EndOfLine. The variant values are converted to a string.\r\r<p><b>DReportDebug( value1 as variant\x2C ...)</b>\rSame as DReport but the text is displayed in gray and not reported to SysLog.\r\r<p><b>DReportTitle( value1 as variant\x2C ...)</b>\rSame as DReport but the text is displayed in boldface. Usually used as a title for a series of values.\r\r<p><b>DReportWarning( value1 as variant\x2C ... )</b>\rSame as DReport but prepend a green <b><small>WARNING:</small></b> before the text.\r\r<p><b>DReportError( value1 as variant\x2C ... )</b>\rSame as DReport but prepend a red <b><small>ERROR:</small></b> before the text.\r\r<p><b>NOTE:</b> the <i>\"formatSpec\"</i> parameter is not used yet.\r\r<h3>Expanding DebugReport</h3>\r\r<p>If you want to make a custom class compatible with Debug Report\x2C make it adopt the <i>DebugReportFormatter</i> interface. It will implement a <i>DebugReportStringRepresentation( v as variant\x2C formatSpec as string \x3D \"\" ) as variant</i> method. In that method\x2C you should format <i>v</i> either as a string without considering <i>formatSpec</i> for now or as any variant value which will be further formatted (in which case you should just return the internal data which will automatically be formatted as \"&lt;Classname yourdata &gt;\".\r\r<p>The advised format for as string representation of an object is \"&lt;Classname \"\x2C then the content of the object and a final \"&gt;\" symbol.\r</body></html>", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events HTML1
	#tag Event
		Sub Open()
		  
		  me.LoadPage   HTMLContents, nil
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  DReport  "A string", 2, true, 3.14159
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  DReportWarning   "Couldn't create desired object"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  
		  dim cc as new CountryClass( "FR:France" )
		  
		  DReport   cc //This will call the method implemented by the "DebugReportFormatter" interface
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  
		  myThread = new DebugReportThread
		  DReportTitled  "Starting thread"
		  myThread.Run
		  DReport   "Thread started"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
