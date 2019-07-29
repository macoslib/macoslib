#tag Window
Begin Window NSPathControlWindow
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
   Title           =   "Untitled"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin NSPathControl NSPathControl1
      AcceptFocus     =   False
      AcceptTabs      =   False
      Alignment       =   ""
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowsExpansionToolTips=   False
      AllowTabs       =   False
      AutoDeactivate  =   True
      autoresizesSubviews=   False
      Backdrop        =   0
      BackgroundColor =   &c00000000
      Bold            =   False
      Description     =   ""
      DoubleBuffer    =   ""
      DoubleValue     =   0.0
      Enabled         =   True
      EraseBackground =   ""
      FloatValue      =   0.0
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IntegerValue    =   0
      IsFlipped       =   False
      Italic          =   False
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      PathStyle       =   1
      Scope           =   0
      StringValue     =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   34
      Transparent     =   True
      Underlined      =   False
      URL             =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   483
   End
   Begin PopupMenu PopupMenu1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   107
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   141
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   29
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
      Text            =   "Path Style"
      TextAlign       =   "1"
      TextAlignment   =   "2"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   143
      Transparent     =   False
      Underline       =   False
      Value           =   "Path Style"
      Visible         =   True
      Width           =   73
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

#tag Events NSPathControl1
	#tag Event
		Sub Action(clickedComponentCell as NSPathComponentCell)
		  break
		  
		  #pragma unused clickedComponentCell
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.URL = SpecialFolder.Documents.URLPath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  dim styles() as Pair = Array("Standard" : NSPathControl.NSPathStyleStandard, _
		  "NavigationBar" : NSPathControl.NSPathStyleNavigationBar, _
		  "PopUp" : NSPathControl.NSPathStylePopUp)
		  
		  for each item as Pair in styles
		    me.AddRow item.Left
		    me.RowTag(me.ListCount - 1) =item.Right
		  next
		  
		  me.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    NSPathControl1.PathStyle = me.RowTag(me.ListIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
