#tag Window
Begin Window MacTCPSocketsWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   DefaultLocation =   "0"
   Frame           =   "0"
   FullScreen      =   False
   HasBackColor    =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   398
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   MinWidth        =   64
   Placement       =   "0"
   Resizable       =   True
   Resizeable      =   "True"
   SystemUIVisible =   True
   Title           =   "HTTP Request Test"
   Type            =   "0"
   Visible         =   True
   Width           =   687
   Begin TCPSocket TCPSocket1
      Address         =   "www.google.com"
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Port            =   80
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin TextArea TextArea1
      AcceptTabs      =   False
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   333
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is a demonstration for the improved MacTCPSocket.\r\rIf you press Send, either a normal TCPSocket or the MacTCPSocker class will be used to request a page from google.com.\r\rOnce you see the response in this area, note the time it took, which will be shown at the bottom of the window.\r\rWith ""Use MacTCPSocket"" enabled, the response will come in much faster than without. But only when you build for Carbon - on Cocoa it's always fast, it appears.\r\r\rNote that you can accomplish the same speed increase by enabling a Timer with a very low Period. However, a Timer running constantly that way will waste a lot of precious CPU time, raising this app's CPU consumption to 50% or more, needlessly.\r\rSee the About note in the MacTCPSocket class for more information on how and why this works.\r"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   "This is a demonstration for the improved MacTCPSocket.\r\rIf you press Send, either a normal TCPSocket or the MacTCPSocker class will be used to request a page from google.com.\r\rOnce you see the response in this area, note the time it took, which will be shown at the bottom of the window.\r\rWith ""Use MacTCPSocket"" enabled, the response will come in much faster than without. But only when you build for Carbon - on Cocoa it's always fast, it appears.\r\r\rNote that you can accomplish the same speed increase by enabling a Timer with a very low Period. However, a Timer running constantly that way will waste a lot of precious CPU time, raising this app's CPU consumption to 50% or more, needlessly.\r\rSee the About note in the MacTCPSocket class for more information on how and why this works.\r"
      Visible         =   True
      Width           =   647
   End
   Begin PushButton PushButton1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Send"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   587
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      Active          =   ""
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   "0"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Value           =   ""
      Visible         =   True
      Width           =   321
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin MacTCPSocket TCPSocket2
      Address         =   "www.google.com"
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Port            =   80
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin CheckBox CheckBox1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use MacTCPSocket"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   435
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   146
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   "0"
      Period          =   1
      RunMode         =   "0"
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin CheckBox CheckBox2
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use Timer"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   344
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   365
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   87
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #if TargetCocoa
		    Label1.Text = "Change Build Settings to Carbon to see effect!"
		    Label1.TextColor = &cff0000
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub processIncomingData(socket as TCPSocket, data as String)
		  dim passedTime_ms as Double = (Microseconds - mWriteTime) / 1000
		  Label1.Text = "Data came in after waiting for "+Format(passedTime_ms,"#.00")+"ms" + EndOfLine + EndOfLine
		  Label1.TextColor = &c000000
		  
		  TextArea1.Text = data
		  
		  socket.Disconnect
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub sendRequest()
		  dim chosenSocket as TCPSocket
		  if CheckBox1.Value then
		    chosenSocket = TCPSocket2 // this is the faster MacTCPSocket
		  else
		    chosenSocket = TCPSocket1 // this is the normal TCPSocket
		  end
		  chosenSocket.Connect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub socketConnected(socket as TCPSocket)
		  mWriteTime = Microseconds
		  
		  socket.Write ("GET / HTTP/1.1" + EndOfLine.Windows + EndOfLine.Windows)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mWriteTime As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events TCPSocket1
	#tag Event
		Sub DataAvailable()
		  dim data as String = me.ReadAll
		  
		  processIncomingData me, data
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Connected()
		  socketConnected me
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(err As RuntimeException)
		  if me.LastErrorCode = 102 then
		    // that's expected
		    return
		  end
		  
		  MsgBox "Socket reports error: "+Str(me.LastErrorCode)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  sendRequest
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TCPSocket2
	#tag Event
		Sub DataAvailable()
		  dim data as String = me.ReadAll
		  
		  processIncomingData me, data
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Connected()
		  socketConnected me
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  if me.LastErrorCode = 102 then
		    // that's expected
		    return
		  end
		  
		  MsgBox "Socket reports error: "+Str(me.LastErrorCode)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub Action()
		  if me.Value then
		    Timer1.Mode = Timer.ModeMultiple
		  else
		    Timer1.Mode = Timer.ModeOff
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
