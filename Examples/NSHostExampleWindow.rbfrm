#tag Window
Begin Window NSHostExampleWindow
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
   Height          =   361
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
   Title           =   "NSHost"
   Type            =   "0"
   Visible         =   True
   Width           =   449
   Begin TextField TextField1
      AcceptTabs      =   False
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   26
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   186
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   243
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
      InitialValue    =   "Current Host\rFind Host By Name\rFind Host By Address"
      Italic          =   False
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   154
   End
   Begin Listbox Listbox1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontal=   "0"
      GridLinesHorizontalStyle=   "0"
      GridLinesVertical=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   False
      HasHeading      =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   248
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   186
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   False
      SelectionType   =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   73
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   243
      _ScrollOffset   =   0
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
