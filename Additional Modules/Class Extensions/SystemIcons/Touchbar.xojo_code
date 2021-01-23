#tag Module
Protected Module Touchbar
	#tag Method, Flags = &h1
		Protected Function AddDetailTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAddDetailTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AddTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAddTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AlarmTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAlarmTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioInputMuteTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioInputMuteTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioInputTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioInputTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioOutputMuteTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioOutputMuteTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioOutputVolumeHighTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioOutputVolumeHighTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioOutputVolumeLowTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioOutputVolumeLowTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioOutputVolumeMediumTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioOutputVolumeMediumTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioOutputVolumeOffTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarAudioOutputVolumeOffTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function BookmarksTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarBookmarksTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorPickerFill(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarColorPickerFill", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorPickerFont(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarColorPickerFont", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ColorPickerStroke(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarColorPickerStroke", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CommunicationAudioTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarCommunicationAudioTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CommunicationVideoTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarCommunicationVideoTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ComposeTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarComposeTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeleteTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarDeleteTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DownloadTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarDownloadTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EnterFullScreenTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarEnterFullScreenTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExitFullScreenTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarExitFullScreenTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FastForwardTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarFastForwardTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderCopyToTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarFolderCopyToTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderMoveToTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarFolderMoveToTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarFolderTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetInfoTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarGetInfoTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoBackTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarGoBackTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoDownTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarGoDownTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoForwardTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarGoForwardTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GoUpTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarGoUpTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HistoryTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarHistoryTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IconViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarIconViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ListViewTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarListViewTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MailTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarMailTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewFolderTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarNewFolderTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewMessageTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarNewMessageTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OpenInBrowserTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarOpenInBrowserTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PauseTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarPauseTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PlayheadTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarPlayheadTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PlayPauseTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarPlayPauseTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PlayTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarPlayTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function QuickLookTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarQuickLookTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RecordStartTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRecordStartTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RecordStopTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRecordStopTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RefreshTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRefreshTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RemoveTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRemoveTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RewindTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRewindTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RotateLeftTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRotateLeftTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RotateRightTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarRotateRightTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SearchTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSearchTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShareTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarShareTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SidebarTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSidebarTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipAhead15SecondsTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipAhead15SecondsTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipAhead30SecondsTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipAhead30SecondsTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipAheadTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipAheadTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipBack15SecondsTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipBack15SecondsTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipBack30SecondsTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipBack30SecondsTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipBackTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipBackTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SkipToEndTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSkipToEndTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SlideshowTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarSlideshowTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TagIconTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTagIconTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextBoldTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextBoldTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextBoxTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextBoxTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextCenterAlignTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextCenterAlignTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextItalicTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextItalicTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextJustifiedAlignTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextJustifiedAlignTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextLeftAlignTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextLeftAlignTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextListTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextListTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextRightAlignTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextRightAlignTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextStrikeThroughTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextStrikeThroughTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextUnderlineTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarTextUnderlineTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserAddTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarUserAddTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserGroupTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarUserGroupTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarUserTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VolumeDownTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarVolumeDownTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VolumeUpTemplate(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As Picture
		  //# Returns a Picture corresponding to the Cocoa name. As icons are stored with different sizes/resolutions, the result depends on the proposed dimensions.
		  
		  //@ If you pass two null dimensions, the full size icon is returned.
		  //@ If you pass one non-null dimension, the other dimension is be computed to respect aspect ratio
		  //@ If you pass two non-null dimensions, the resulting icon may be stretched horizontally or vertically
		  
		  return  GetPictureFromName( "NSImageNameTouchBarVolumeUpTemplate", proposedWidth, proposedHeight )
		End Function
	#tag EndMethod


End Module
#tag EndModule
