#tag Window
Begin Window NSHostExampleWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.61e+2
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
   Title           =   "NSHost"
   Visible         =   True
   Width           =   4.49e+2
   Begin TextField TextField1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   186
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   243
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Current Host\rFind Host By Name\rFind Host By Address"
      Italic          =   ""
      Left            =   20
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   22
      Underline       =   ""
      Visible         =   True
      Width           =   154
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   248
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   186
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   73
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   243
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  PopupMenu1.ListIndex = 0
		End Sub
	#tag EndEvent


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return self.pHost
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim h as NSHost = self.Host
			  if h = nil then
			    if value = nil then
			      return
			    end if
			  else
			    if h = value then
			      return
			    end if
			  end if
			  
			  
			  dim L as Listbox = Listbox1
			  
			  L.DeleteAllRows
			  if value <> nil then
			    L.AddRow "Names"
			    L.CellBold(L.LastIndex, 0) = true
			    for each name as String in value.Names
			      L.AddRow name
			    next
			    L.AddRow "Addresses"
			    L.CellBold(L.LastIndex, 0) = true
			    for each addr as String in value.Addresses
			      L.AddRow addr
			    next
			    
			    
			    
			  else
			    //
			  end if
			End Set
		#tag EndSetter
		Private Host As NSHost
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private pHost As NSHost
	#tag EndProperty


#tag EndWindowCode

#tag Events TextField1
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim ReturnKey as String = Encodings.UTF8.Chr(13)
		  dim EnterKey as String = Encodings.UTF8.Chr(3)
		  
		  
		  
		  if Key = ReturnKey or Key = EnterKey then
		    if TextField1.Text <> "" then
		      if PopupMenu1.ListIndex = 1 then
		        self.Host = NSHost.GetByName(TextField1.Text)
		      elseif PopupMenu1.ListIndex = 2 then
		        self.Host = NSHost.GetByAddress(TextField1.Text)
		      else
		        //this case shouldn't happen; we ignore it if it does.
		      end if
		    else
		      beep
		    end if
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Change()
		  if me.ListIndex = 0 then
		    TextField1.Enabled = false
		    self.Host = NSHost.CurrentHost
		  else
		    TextField1.Enabled = true
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
