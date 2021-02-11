#tag Window
Begin Window StringTokenizerExample
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
   Title           =   "Word Tokenizer Demo"
   Visible         =   True
   Width           =   408
   Begin TextArea inputTxt
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   64
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Value           =   "It's its! Français, oui."
      Visible         =   True
      Width           =   368
   End
   Begin Listbox outputList
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   2
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   290
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Is a word	Not a word"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   90
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   368
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub SplitIntoWords()
		  dim input as String = inputTxt.Text
		  
		  outputList.DeleteAllRows
		  
		  dim tokenizer as new CFStringTokenizer (input, CFStringTokenizer.kUnitWord, nil)
		  dim prevEnd as Integer = 1, foundAnotherWord as Boolean
		  do
		    tokenizer.AdvanceToNextToken
		    dim start, length as Integer
		    foundAnotherWord = tokenizer.GetCurrentTokenRange (start, length)
		    if start > prevEnd then
		      outputList.AddRow ""
		      outputList.Cell (outputList.LastIndex, 1) = """" + input.Mid (prevEnd, start - prevEnd) + """"
		    end
		    if foundAnotherWord then
		      outputList.AddRow """" + input.Mid (start, length) + """"
		      prevEnd = start + length
		    end
		  loop until not foundAnotherWord
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events inputTxt
	#tag Event
		Sub TextChange()
		  SplitIntoWords
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  SplitIntoWords
		End Sub
	#tag EndEvent
#tag EndEvents
