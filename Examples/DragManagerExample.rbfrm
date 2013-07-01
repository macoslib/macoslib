#tag Window
Begin Window DragManagerExample
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.55e+2
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
   Title           =   "Drag Manager"
   Visible         =   True
   Width           =   4.09e+2
   Begin Label InfoText
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   222
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   369
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   51
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "This demonstrates dragging of files to the Finder.\rDrag either of the images below to a Finder folder to see where they got dragged."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   369
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Using RB's DragItem"
      Enabled         =   True
      Height          =   104
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   17
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   84
      Underline       =   ""
      Visible         =   True
      Width           =   175
      Begin Canvas DragRBCode
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   29
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   118
         UseFocusRing    =   True
         Visible         =   True
         Width           =   50
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   91
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "Doesn't work in Cocoa builds (as of June 2013)"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   118
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   91
      End
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Using MacOSLib"
      Enabled         =   True
      Height          =   104
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   214
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   84
      Underline       =   ""
      Visible         =   True
      Width           =   175
      Begin Canvas DragCustomCode
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Left            =   228
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   118
         UseFocusRing    =   True
         Visible         =   True
         Width           =   50
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   290
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "Should work even in Cocoa builds"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   118
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   91
      End
   End
   Begin Label InfoText2
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   "Drag Result:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   200
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   369
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function makeTempFile() As FolderItem
		  dim f as FolderItem
		  
		  // Create a temporary file that we can use for dragging
		  dim n as Integer = 1
		  do
		    f = SpecialFolder.Temporary.Child ("dragged file #" + Str(n))
		    if not f.Exists then exit
		    // file exists - let's use a different name
		    n = n + 1
		  loop
		  
		  call TextOutputStream.Create(f)
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub showResult(msg as String)
		  InfoText.Text = msg
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events DragRBCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = &c00FF0000
		  g.FillRoundRect 2, 2, g.Width - 4, g.Height - 4, 8, 8
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim d as new DragItem (self, x, y, me.width, me.height)
		  
		  // add a file to the to-be-dragged object
		  d.FolderItem = makeTempFile()
		  
		  // let the user drag the file
		  d.Drag()
		  
		  // check where the user dropped the file
		  dim dest as Object = d.Destination
		  if dest isA FolderItem then
		    self.showResult "The file was dragged to: " + FolderItem(dest).AbsolutePath
		  else
		    self.showResult "The file was not dragged to a folder, apparently"
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DragCustomCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = &c0000FF00
		  g.FillRoundRect 2, 2, g.Width - 4, g.Height - 4, 8, 8
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim pboard as CarbonPasteboard = CarbonPasteboard.UniquePasteboard
		  pboard.Clear
		  
		  // add a file to the to-be-dragged object
		  dim f as FolderItem = makeTempFile()
		  dim id as Ptr = pboard.ItemIdentifier(1)
		  if not pboard.PutItemFlavor (id, "public.file-url", f.URLPath, 0) then
		    break ' huh?
		    beep
		    return false
		  end if
		  
		  
		  dim d as CarbonDragManager.DragRef = NewDragRefWithPasteboard (pboard)
		  
		  // as a bonus, set allowable drag actions to not include "move" (but "copy")
		  d.SetAllowableActions (d.AllowableActions() and not kDragActionMove, false)
		  
		  // wait cursor is showing in built versions for some reason, so let's tell RB to not do that
		  #pragma DisableAutoWaitCursor true
		  
		  // let the user drag the file
		  dim evr as CarbonDragManager.EventRecord
		  evr.where.h = X
		  evr.where.v = Y
		  dim res as Integer = d.TrackDrag(evr, nil)
		  
		  if res <> 0 then
		    // Drag Manager error codes
		    const badDragRefErr = -1850 ' unknown drag reference
		    const badDragItemErr = -1851 ' unknown drag item reference
		    const badDragFlavorErr = -1852 ' unknown flavor type
		    const duplicateFlavorErr = -1853 ' flavor type already exists
		    const cantGetFlavorErr = -1854 ' error while trying to get flavor data
		    const duplicateHandlerErr = -1855 ' handler already exists
		    const handlerNotFoundErr = -1856 ' handler not found
		    const dragNotAcceptedErr = -1857 ' drag was not accepted by receiver
		    const unsupportedForPlatformErr = -1858 ' call is for PowerPC only
		    const noSuitableDisplaysErr = -1859 ' no displays support translucency
		    const badImageRgnErr = -1860 ' bad translucent image region
		    const badImageErr = -1861 ' bad translucent image PixMap
		    const nonDragOriginatorErr = -1862 ' illegal attempt at originator only data
		    const cancelled = -128
		    self.showResult "The drag failed with code: " + Str (res)
		    
		  else
		    
		    // check where the user dropped the file
		    dim dest as Object = d.DropDestination
		    if dest isA FolderItem then
		      self.showResult "The file was dragged to: " + FolderItem(dest).AbsolutePath
		    else
		      self.showResult "The file was not dragged to a folder, apparently"
		    end if
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
