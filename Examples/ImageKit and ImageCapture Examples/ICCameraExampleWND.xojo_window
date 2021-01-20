#tag Window
Begin Window ICCameraExampleWND
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   458
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
   Title           =   "ImageCapture Example"
   Visible         =   True
   Width           =   663
   Begin ICDeviceBrowser browser
      Description     =   ""
      DeviceTypes     =   0
      Enabled         =   True
      Index           =   -2147483648
      IsBrowsing      =   False
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Listbox LB1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   36
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   166
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Local devices"
      Italic          =   False
      Left            =   11
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
      Top             =   10
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   218
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
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
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   186
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   119
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Info"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   146
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open…"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   216
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   119
   End
   Begin Listbox LB2
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   36
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   428
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Images"
      Italic          =   False
      Left            =   259
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   10
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   390
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  if icd<>nil then
		    icd.CloseSession
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Handle_DownloadError(camDev as ICCameraDevice, file as ICCameraFile, error as String)
		  
		  DReportError   "Download error:", error, "for file:", file.name
		  
		  #pragma unused camDev
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Handle_ItemAdded(camDev as ICCameraDevice, item as ICCameraItem)
		  
		  if item isa ICCameraFolder then
		    LB2.AddRow   item.Name + " (folder)"
		    LB2.RowTag( LB2.LastIndex ) = item
		  else
		    LB2.AddRow   item.Name + " (" + FormatSize( ICCameraFile( item ).FileSize ) + ")"
		    LB2.RowTag( LB2.LastIndex ) = item
		    call  item.ThumbnailIfAvailable
		  end if
		  
		  #pragma unused camDev
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Handle_ThumbnailReceived(camDev as ICCameraDevice, item as ICCameraItem)
		  dim rtag as ICCameraItem
		  
		  for i as integer=0 to LB2.ListCount - 1
		    rtag = LB2.RowTag( i )
		    if rtag<>nil AND rtag.id = item.id then
		      LB2.RowPicture( i ) = ScaleTo( item.ThumbnailIfAvailable.MakePicture, 32, 32 )
		      exit
		    end if
		  next
		  
		  #pragma unused camDev
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ScaleTo(original as Picture, toWidth as integer, toHeight as integer) As Picture
		  //# Creates a bitmap Picture a scaled to a given size with options
		  
		  //@ Currently, it only scales unproportionally to toWidth and toHeight which must both be non-zero
		  
		  dim pict as Picture
		  
		  //Create and scale picture
		  pict = new Picture( toWidth, toHeight, 32 )
		  pict.Graphics.DrawPicture   original, 0, 0, toWidth, toHeight, 0, 0, original.width, original.Height
		  
		  return  pict
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		icd As ICCameraDevice
	#tag EndProperty


#tag EndWindowCode

#tag Events browser
	#tag Event
		Sub DeviceAdded(device as ICDevice, moreComing as Boolean)
		  
		  LB1.AddRow   device.Name
		  LB1.RowTag( LB1.LastIndex ) = device
		  LB1.RowPicture( LB1.LastIndex ) = ScaleTo( device.Icon.MakePicture, 32, 32 )
		  
		  #pragma unused moreComing
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FinishedEnumeratingLocalDevices()
		  DReport  "Finished enumerating local ICDevices"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LB1
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  g.DrawString   me.Cell( row, column ), x + 8, y
		  
		  return  true
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  LB2.DeleteAllRows
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  browser.DeviceTypes = &h1 OR &h2 OR &h100 //OR &h200 //OR &h400 OR &h800 OR &hFE00
		  browser.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  
		  ReportObjCDetailsForNSObject   browser
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  
		  icd = LB1.RowTag( LB1.ListIndex )
		  
		  if icd.HasOpenSession then
		    DReportError   "Device already opened"
		  else
		    DReport   "Opening device", icd.Name
		    
		    AddHandler   icd.ItemAdded, WeakAddressOf  Handle_ItemAdded
		    AddHandler   icd.ReceivedThumbnail, WeakAddressOf   Handle_ThumbnailReceived
		    AddHandler   icd.DownloadError, WeakAddressOf   Handle_DownloadError
		    
		    icd.OpenSession
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LB2
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  g.DrawString   me.Cell( row, column ), x + 8, y
		  
		  return  true
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  dim rtag as ICCameraItem
		  dim nsa as NSArray
		  
		  if me.ListIndex=-1 then  return
		  
		  rtag = me.RowTag( me.ListIndex )
		  
		  if rtag isa ICCameraFolder then
		    DReport  "Folder contents"
		    
		    nsa = ICCameraFolder( rtag ).Contents
		    
		    DReport   nsa
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  
		  dim file as ICCameraFile = me.RowTag( me.ListIndex )
		  
		  icd.DownloadFile   file, SpecialFolder.Desktop, nil
		  
		End Sub
	#tag EndEvent
#tag EndEvents
