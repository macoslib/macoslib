#tag Window
Begin Window SystemImages
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
   Title           =   "System Images"
   Type            =   "0"
   Visible         =   True
   Width           =   600
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
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   165
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   270
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		  if PopupMenu1.ListIndex = -1 then
		    return
		  end if
		  
		  
		  dim f as NSImageSystemMethod = PopupMenu1.RowTag(PopupMenu1.ListIndex)
		  dim image as NSImage = f.Invoke
		  dim point as Cocoa.NSPoint
		  point.x = (g.Width - image.Size.width)/2
		  point.y = self.Height - 64.0 - image.Size.height
		  image.Draw point, NSImage.NSComposite.SourceOver
		  
		  'dim pict as Picture
		  'dim cgi as CGImage
		  'dim ctx as new CGContextGraphicsPort( g )
		  'cgi = image.MakeCGImage
		  '
		  ''dim context as new CGContextGraphicsPort( p.Graphics )
		  '
		  'report   "Alpha info:", cgi.GetAlphaInfo
		  '
		  ''ctx.DrawImage   cgi, CGRectMake( g.Width\2 - 256, 128, 32, 32 )
		  ''ctx.Flush
		  '
		  'pict = image
		  'g.DrawPicture   pict, (g.Width - pict.width)/2, 128
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  PopupMenu1.Left = (self.Width - PopupMenu1.Width)\2
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function NSImageSystemMethod() As NSImage
	#tag EndDelegateDeclaration


#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  dim images() as Pair = Array(_
		  "NSImageNameAdvanced" : AddressOf NSImage.Advanced, _
		  "NSImageNameApplicationIcon" : AddressOf NSImage.ApplicationIcon, _
		  "NSImageNameBonjour" : AddressOf NSImage.Bonjour, _
		  "NSImageNameComputer" : AddressOf NSImage.Computer, _
		  "NSImageNameCaution" : AddressOf NSImage.Caution, _
		  "NSImageNameColorPanel" : AddressOf NSImage.ColorPanel, _
		  "NSImageNameDotMac" : AddressOf NSImage.DotMac, _
		  "NSImageNameEveryone" : AddressOf NSImage.Everyone, _
		  "NSImageNameFolder" : AddressOf NSImage.Folder, _
		  "NSImageNameFolderBurnable" : AddressOf NSImage.FolderBurnable, _
		  "NSImageNameFolderSmart" : AddressOf NSImage.FolderSmart, _
		  "NSImageNameFontPanel" : AddressOf NSImage.FontPanel, _
		  "NSImageNameInfo" : AddressOf NSImage.Info, _
		  "NSImageNameMobileMe" : AddressOf NSimage.MobileMe, _
		  "NSImageNameMultipleDocuments" : AddressOf NSImage.MultipleDocuments, _
		  "NSImageNameNetwork" : AddressOf NSImage.Network, _
		  "NSImageNamePreferencesGeneral" : AddressOf NSImage.PreferencesGeneral, _
		  "NSImageNameStatusAvailable" : AddressOf NSImage.StatusAvailable, _
		  "NSImageNameStatusNone" : AddressOf NSImage.StatusNone, _
		  "NSImageNameStatusPartiallyAvailable" : AddressOf NSImage.StatusPartiallyAvailable, _
		  "NSImageNameStatusUnavailable" : AddressOf NSImage.StatusUnavailable, _
		  "NSImageNameTrashEmpty" : AddressOf NSImage.TrashEmpty, _
		  "NSImageNameTrashFull" : AddressOf NSImage.TrashFull, _
		  "NSImageNameUser" : AddressOf NSImage.User, _
		  "NSImageNameUserAccounts" : AddressOf NSImage.UserAccounts, _
		  "NSImageNameUserGroup" : AddressOf NSImage.UserGroup, _
		  "NSImageNameUserGuest" : AddressOf NSImage.UserGuest, _
		  "-" : Nil, _
		  "NSImageNameHomeTemplate" : AddressOf NSImage.HomeTemplate, _
		  "NSImageNameBookmarksTemplate" : AddressOf NSImage.BookmarksTemplate, _
		  "NSImageNameMenuOnStateTemplate" : AddressOf NSImage.MenuOnStateTemplate, _
		  "NSImageNameMenuMixedStateTemplate" : AddressOf NSImage.MenuMixedStateTemplate, _
		  "NSImageNameIconViewTemplate" : AddressOf NSImage.IconViewTemplate, _
		  "NSImageNameListViewTemplate" : AddressOf NSImage.ListViewTemplate, _
		  "NSImageNameColumnViewTemplate" : AddressOf NSImage.ColumnViewTemplate, _
		  "NSImageNameFlowViewTemplate" : AddressOf NSImage.FlowViewTemplate, _
		  "NSImageNameQuickLookTemplate" : AddressOf NSImage.QuickLookTemplate, _
		  "NSImageNameBluetoothTemplate" : AddressOf NSImage.BluetoothTemplate, _
		  "NSImageNameIChatTheaterTemplate" : AddressOf NSImage.IChatTheaterTemplate, _
		  "NSImageNameSlideshowTemplate" : AddressOf NSImage.SlideshowTemplate, _
		  "NSImageNameActionTemplate" : AddressOf NSImage.ActionTemplate, _
		  "NSImageNameSmartBadgeTemplate" : AddressOf NSImage.SmartBadgeTemplate, _
		  "NSImageNamePathTemplate" : AddressOf NSImage.PathTemplate, _
		  "NSImageNameInvalidDataFreestandingTemplate" : AddressOf NSImage.InvalidDataFreestandingTemplate, _
		  "NSImageNameLockLockedTemplate" : AddressOf NSImage.LockLockedTemplate, _
		  "NSImageNameLockUnlockedTemplate" : AddressOf NSImage.LockUnlockedTemplate, _
		  "NSImageNameGoRightTemplate" : AddressOf NSImage.GoRightTemplate, _
		  "NSImageNameGoLeftTemplate" : AddressOf NSImage.GoLeftTemplate, _
		  "NSImageNameRightFacingTriangleTemplate" : AddressOf NSImage.RightFacingTriangleTemplate, _
		  "NSImageNameLeftFacingTriangleTemplate" : AddressOf NSImage.LeftFacingTriangleTemplate, _
		  "NSImageNameAddTemplate" : AddressOf NSImage.AddTemplate, _
		  "NSImageNameRemoveTemplate" : AddressOf NSImage.RemoveTemplate, _
		  "NSImageNameRevealFreestandingTemplate" : AddressOf NSImage.RevealFreestandingTemplate, _
		  "NSImageNameFollowLinkFreestandingTemplate" : AddressOf NSImage.FollowLinkFreestandingTemplate, _
		  "NSImageNameEnterFullScreenTemplate" : AddressOf NSImage.EnterFullScreenTemplate, _
		  "NSImageNameExitFullScreenTemplate" : AddressOf NSImage.ExitFullScreenTemplate, _
		  "NSImageNameStopProgressTemplate" : AddressOf NSImage.StopProgressTemplate, _
		  "NSImageNameStopProgressFreestandingTemplate" : AddressOf NSImage.StopProgressFreestandingTemplate, _
		  "NSImageNameRefreshTemplate" : AddressOf NSImage.RefreshTemplate, _
		  "NSImageNameRefreshFreestandingTemplate" : AddressOf NSImage.RefreshFreestandingTemplate, _
		  "NSImageNameShareTemplate" : AddressOf NSImage.ShareTemplate _
		  )
		  
		  for each item as Pair in images
		    me.AddRow item.Left.StringValue
		    me.RowTag(me.ListCount - 1) = item.Right
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
