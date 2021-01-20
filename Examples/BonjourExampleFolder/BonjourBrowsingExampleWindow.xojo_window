#tag Window
Begin Window BonjourBrowsingExampleWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   505
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
   Title           =   "Bonjour Services Browser"
   Visible         =   True
   Width           =   683
   Begin Listbox LB1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   405
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Type	Resolution Status"
      Italic          =   False
      Left            =   14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionRequired=   "False"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   55
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   655
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BonjourModule.BonjourControl BonjourControl1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1976802531
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   740
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -13
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin TextField TypeTF
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   77
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   12
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Value           =   "m_macoslib._tcp."
      Visible         =   True
      Width           =   169
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   False
      Value           =   "Type:"
      Visible         =   True
      Width           =   56
   End
   Begin TextField DomainTF
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   354
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   12
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Value           =   ""
      Visible         =   True
      Width           =   169
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   286
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
      Top             =   13
      Transparent     =   False
      Underline       =   False
      Value           =   "Domain:"
      Visible         =   True
      Width           =   56
   End
   Begin PushButton BrowseBTN
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Browse"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   558
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   111
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   14
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   461
      Transparent     =   False
      Underline       =   False
      Value           =   "Double-click on a row to display details and addresses."
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
