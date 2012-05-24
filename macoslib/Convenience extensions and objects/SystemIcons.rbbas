#tag Module
Protected Module SystemIcons
	#tag Method, Flags = &h1
		Protected Function ActionTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameActionTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AddTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameAddTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Advanced() As Picture
		  return  GetPictureFromName( "NSImageNameAdvanced" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ApplicationIcon() As Picture
		  return  GetPictureFromName( "NSImageNameApplicationIcon" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BluetoothTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameBluetoothTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Bonjour() As Picture
		  return  GetPictureFromName( "NSImageNameBonjour" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BookmarksTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameBookmarksTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Caution() As Picture
		  return  GetPictureFromName( "NSImageNameCaution" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorPanel() As Picture
		  return  GetPictureFromName( "NSImageNameColorPanel" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColumnViewTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameColumnViewTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Computer() As Picture
		  return  GetPictureFromName( "NSImageNameComputer" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DotMac() As Picture
		  return  GetPictureFromName( "NSImageNameDotMac" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EnterFullScreenTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameEnterFullScreenTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Everyone() As Picture
		  return  GetPictureFromName( "NSImageNameEveryone" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExitFullScreenTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameExitFullScreenTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FlowViewTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameFlowViewTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Folder() As Picture
		  return  GetPictureFromName( "NSImageNameFolder" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderBurnable() As Picture
		  return  GetPictureFromName( "NSImageNameFolderBurnable" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderSmart() As Picture
		  return  GetPictureFromName( "NSImageNameFolderSmart" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FollowLinkFreestandingTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameFollowLinkFreestandingTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FontPanel() As Picture
		  return  GetPictureFromName( "NSImageNameFontPanel" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPictureFromName(name as string, wantedWidth as double = 0.0, wantedHeight as double = 0.0) As Picture
		  //# Build a Picture given the picture name ( see Apple docs ) and an optional size (0 for full size)
		  
		  #if TargetMacOS
		    dim nsi as NSImage
		    dim scale as double
		    dim w, h as double
		    dim cgi as CGImage
		    dim size as Cocoa.NSSize
		    
		    nsi = NSImage.LoadByNameWithSymbolResolution( name )
		    
		    if nsi=nil then
		      return  nil
		    end if
		    
		    if wantedWidth=0.0 AND wantedHeight=0.0 then
		      cgi = nsi.MakeCGImage( )
		    else
		      size = nsi.Size
		      scale = size.width / size.height
		      if wantedWidth=0.0 then
		        w = scale * h
		      elseif wantedHeight=0.0 then
		        h = w / scale
		      else
		        w = wantedWidth
		        h = wantedHeight
		      end if
		      
		      cgi = nsi.MakeCGImage( w, h )
		    end if
		    
		    if cgi=nil then
		      return  nil
		    end if
		    
		    dim pict as Picture = cgi.MakePicture
		    
		    return  pict
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoLeftTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameGoLeftTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoRightTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameGoRightTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HomeTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameHomeTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IChatTheaterTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameIChatTheaterTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IconTemplateSetColor(extends SystemIconTemplate as Picture, theColor as Color) As Picture
		  //# Use a system icon (one with Template in its name) and apply the given color.
		  
		  dim pict, mask as Picture
		  
		  pict = new Picture( SystemIconTemplate.width, SystemIconTemplate.Height, 32 )
		  mask = new Picture( SystemIconTemplate.width, SystemIconTemplate.Height, 8 )
		  mask.Graphics.DrawPicture   SystemIconTemplate, 0, 0
		  
		  pict.Graphics.ForeColor = theColor
		  pict.Graphics.FillRect   0, 0, pict.Width, pict.Height
		  pict.Mask( true ).Graphics.DrawPicture   mask, 0, 0
		  
		  return  pict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IconViewTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameIconViewTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Info() As Picture
		  return  GetPictureFromName( "NSImageNameInfo" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InvalidDataFreestandingTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameInvalidDataFreestandingTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LeftFacingTriangleTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameLeftFacingTriangleTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ListViewTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameListViewTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LockLockedTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameLockLockedTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LockUnlockedTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameLockUnlockedTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MenuMixedStateTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameMenuMixedStateTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MenuOnStateTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameMenuOnStateTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MobileMe() As Picture
		  return  GetPictureFromName( "NSImageNameMobileMe" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MultipleDocuments() As Picture
		  return  GetPictureFromName( "NSImageNameMultipleDocuments" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Network() As Picture
		  return  GetPictureFromName( "NSImageNameNetwork" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PathTemplate() As Picture
		  return  GetPictureFromName( "NSImageNamePathTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PreferencesGeneral() As Picture
		  return  GetPictureFromName( "NSImageNamePreferencesGeneral" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function QuickLookTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameQuickLookTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RefreshFreestandingTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameRefreshFreestandingTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RefreshTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameRefreshTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RemoveTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameRemoveTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RevealFreestandingTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameRevealFreestandingTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RightFacingTriangleTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameRightFacingTriangleTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SlideshowTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameSlideshowTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SmartBadgeTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameSmartBadgeTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusAvailable() As Picture
		  return  GetPictureFromName( "NSImageNameStatusAvailable" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusNone() As Picture
		  return  GetPictureFromName( "NSImageNameStatusNone" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusPartiallyAvailable() As Picture
		  return  GetPictureFromName( "NSImageNameStatusPartiallyAvailable" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusUnavailable() As Picture
		  return  GetPictureFromName( "NSImageNameStatusUnavailable" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StopProgressFreestandingTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameStopProgressFreestandingTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StopProgressTemplate() As Picture
		  return  GetPictureFromName( "NSImageNameStopProgressTemplate" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrashEmpty() As Picture
		  return  GetPictureFromName( "NSImageNameTrashEmpty" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TrashFull() As Picture
		  return  GetPictureFromName( "NSImageNameTrashFull" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function User() As Picture
		  return  GetPictureFromName( "NSImageNameUser" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserAccounts() As Picture
		  return  GetPictureFromName( "NSImageNameUserAccounts" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserGroup() As Picture
		  return  GetPictureFromName( "NSImageNameUserGroup" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserGuest() As Picture
		  return  GetPictureFromName( "NSImageNameUserGuest" )
		End Function
	#tag EndMethod


	#tag Note, Name = Transparency
		The obtained Picture objects will handle transparency only with Real Studio 2011r4 or higher.
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
