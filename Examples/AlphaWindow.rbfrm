#tag Window
Begin Window AlphaWindow
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
   Height          =   400
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
   Title           =   "Window Alpha"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin Slider Slider1
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   17
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   150
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      MaximumValue    =   100
      Minimum         =   0
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "2"
      TickStyle       =   "2"
      Top             =   356
      Transparent     =   False
      Value           =   100
      Visible         =   True
      Width           =   300
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  self.Alpha = me.Value/100
		End Sub
	#tag EndEvent
#tag EndEvents
