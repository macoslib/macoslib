#tag Window
Begin Window BonjourBrowsingExampleWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.05e+2
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
   Resizeable      =   False
   Title           =   "Bonjour Services Browser"
   Visible         =   True
   Width           =   6.83e+2
   Begin Listbox LB1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   405
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Type	Resolution Status"
      Italic          =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   55
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   655
      _ScrollWidth    =   -1
   End
   Begin BonjourModule.BonjourControl BonjourControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   1976802531
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   740
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -13
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin TextField TypeTF
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
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   77
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "_macoslib._tcp."
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   169
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Type:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin TextField DomainTF
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
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   354
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   169
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   286
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Domain:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin PushButton BrowseBTN
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Browse"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   558
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      Visible         =   True
      Width           =   111
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Double-click on a row to display details and addresses."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "SmallSystem"
      TextSize        =   0
      TextUnit        =   0
      Top             =   461
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   655
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function FindServiceInListBox(service as BonjourService) As integer
		  
		  for i as integer = 0 to LB1.ListCount - 1
		    if LB1.RowTag( i )=service then
		      return  i
		    end if
		  next
		  
		  return  -1
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events LB1
	#tag Event
		Sub DoubleClick()
		  
		  if me.ListIndex=-1 then   RETURN
		  
		  dim w as new ServiceDescriptionSHEET
		  w.Init  me.RowTag( me.ListIndex )
		  w.ShowModalWithin   self
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BonjourControl1
	#tag Event
		Sub ServiceAdded(service as BonjourService, moreComing as Boolean)
		  
		  LB1.AddRow   service.Name, service.Type, "Resolving…"
		  LB1.RowTag( LB1.LastIndex ) = service
		  service.Resolve   20.0
		  
		  #pragma unused moreComing
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
		  
		  dim idx as integer
		  
		  idx = FindServiceInListBox( service )
		  
		  LB1.Cell( idx, 2 ) = "Resolution error " + Str( errorCode )
		  
		  #pragma unused errorCode
		  #pragma unused errorDomain
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServiceResolved(service as BonjourService)
		  
		  dim idx as integer
		  
		  idx = FindServiceInListBox( service )
		  
		  LB1.Cell( idx, 2 ) = "Resolved"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServiceRemoved(service as BonjourService, moreComing as boolean)
		  
		  dim idx as integer
		  
		  idx = FindServiceInListBox( service )
		  
		  if idx<>-1 then
		    LB1.RemoveRow   idx
		  end if
		  
		  #pragma unused moreComing
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServiceStoppedResolving(service as BonjourService)
		  
		  dim idx as integer
		  
		  idx = FindServiceInListBox( service )
		  
		  LB1.Cell( idx, 2 ) = "Stopped resolving"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub BrowsingStopped()
		  
		  'DReport  "BrowsingStopped raised"
		End Sub
	#tag EndEvent
	#tag Event
		Sub BrowsingError(errorCode as integer, errorDomain as integer)
		  
		  'DReport  "BrowsingError raised", errorCode, errorDomain
		  
		  #pragma unused errorCode
		  #pragma unused errorDomain
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BrowseBTN
	#tag Event
		Sub Action()
		  
		  BonjourControl1.BrowseBonjourServicesOfType   TypeTF.Text, DomainTF.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
