#tag Window
Begin Window StringTokenizerExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.0e+2
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
   Resizeable      =   True
   Title           =   "Word Tokenizer Demo"
   Visible         =   True
   Width           =   4.08e+2
   Begin TextArea inputTxt
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   64
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   ""
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
      Text            =   "It's its! Français, oui."
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   368
   End
   Begin Listbox outputList
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   2
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   290
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Is a word	Not a word"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   90
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   368
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub SplitIntoWords()
		  dim input as String = inputTxt.Text
		  
		  outputList.DeleteAllRows
		  
		  dim tokenizer as new CFStringTokenizer (input, CFStringTokenizer.kCFStringTokenizerUnitWord, nil)
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
