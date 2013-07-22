#tag Window
Begin Window TextAreaWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   665253007
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "TextArea Example"
   Visible         =   True
   Width           =   600
   Begin TextArea TextArea1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   501
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Text editing is performed by a text view object. Typically, a text view is an instance of NSTextView or a subclass. A text view provides the front end to the text system. It displays the text, handles the user events that edit the text, and coordinates changes to the stored text required by the editing process. NSTextView implements methods that perform editing, manage the selection, and handle formatting attributes affecting the layout and display of the text.\r\rNSTextView has a number of methods that control the editing behavior available to the user. For example, NSTextView allows you to grant or deny the user the ability to select or edit its text, using the setSelectable: and setEditable: methods. NSTextView also implements the distinction between plain and rich text defined by NSText with its setRichText: and setImportsGraphics: methods. See Text System User Interface Layer Programming Guide programming topic and the NSTextView and NSText class specifications for more information.\r\rAn editable text view can operate in either of two distinct editing modes: as a normal text editor or as a field editor. A field editor is a single text view instance shared by many text fields belonging to a window in an application. This sharing results in a performance gain. When a text field becomes the first responder, the window inserts the field editor in its place in the responder chain. A normal text editor accepts Tab and Return characters as input, whereas a field editor interprets Tab and Return as cues to end editing. The NSTextView method setFieldEditor: controls this behavior."
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -1
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim w as new TextAreaOptionsPanel(TextArea1)
		  w.show
		  w.left = self.left+self.width+50
		  w.top = self.top
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events TextArea1
	#tag Event
		Sub Open()
		  me.UsesFindPanel = true
		  me.UsesFindBar = true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
