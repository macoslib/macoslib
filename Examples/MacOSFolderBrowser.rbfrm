#tag Window
Begin Window MacOSFolderBrowser
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   380
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1162234704
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "MacOSFolders"
   Visible         =   True
   Width           =   482
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      BehaviorIndex   =   0
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   331
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Folder Type	 Absolute Path	 Shell Path"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   482
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   103
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   343
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      BehaviorIndex   =   2
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Disk/Domain:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   343
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   86
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub FillFolderTypesMap()
		  dim folderTypes as new Dictionary
		  
		  folderTypes.value("kUsersFolderType") = FolderManager.kUsersFolderType
		  folderTypes.value("kCurrentUserFolderType") = FolderManager.kCurrentUserFolderType
		  folderTypes.value("kCurrentUserRemoteFolderLocation") = FolderManager.kCurrentUserRemoteFolderLocation
		  folderTypes.value("kCurrentUserRemoteFolderType") = FolderManager.kCurrentUserRemoteFolderType
		  folderTypes.value("kSharedUserDataFolderType") = FolderManager.kSharedUserDataFolderType
		  folderTypes.value("kVolumeSettingsFolderType") = FolderManager.kVolumeSettingsFolderType
		  folderTypes.value("kSystemFolderType") = FolderManager.kSystemFolderType
		  folderTypes.value("kDesktopFolderType") = FolderManager.kDesktopFolderType
		  folderTypes.value("kSystemDesktopFolderType") = FolderManager.kSystemDesktopFolderType
		  folderTypes.value("kTrashFolderType") = FolderManager.kTrashFolderType
		  folderTypes.value("kSystemTrashFolderType") = FolderManager.kSystemTrashFolderType
		  folderTypes.value("kWhereToEmptyTrashFolderType") = FolderManager.kWhereToEmptyTrashFolderType
		  folderTypes.value("kPrintMonitorDocsFolderType") = FolderManager.kPrintMonitorDocsFolderType
		  folderTypes.value("kStartupFolderType") = FolderManager.kStartupFolderType
		  folderTypes.value("kShutdownFolderType") = FolderManager.kShutdownFolderType
		  folderTypes.value("kAppleMenuFolderType") = FolderManager.kAppleMenuFolderType
		  folderTypes.value("kControlPanelFolderType") = FolderManager.kControlPanelFolderType
		  folderTypes.value("kSystemControlPanelFolderType") = FolderManager.kSystemControlPanelFolderType
		  folderTypes.value("kExtensionFolderType") = FolderManager.kExtensionFolderType
		  folderTypes.value("kFontsFolderType") = FolderManager.kFontsFolderType
		  folderTypes.value("kPreferencesFolderType") = FolderManager.kPreferencesFolderType
		  folderTypes.value("kSystemPreferencesFolderType") = FolderManager.kSystemPreferencesFolderType
		  folderTypes.value("kTemporaryFolderType") = FolderManager.kTemporaryFolderType
		  folderTypes.value("kExtensionDisabledFolderType") = FolderManager.kExtensionDisabledFolderType
		  folderTypes.value("kControlPanelDisabledFolderType") = FolderManager.kControlPanelDisabledFolderType
		  folderTypes.value("kSystemExtensionDisabledFolderType") = FolderManager.kSystemExtensionDisabledFolderType
		  folderTypes.value("kStartupItemsDisabledFolderType") = FolderManager.kStartupItemsDisabledFolderType
		  folderTypes.value("kShutdownItemsDisabledFolderType") = FolderManager.kShutdownItemsDisabledFolderType
		  folderTypes.value("kApplicationsFolderType") = FolderManager.kApplicationsFolderType
		  folderTypes.value("kDocumentsFolderType") = FolderManager.kDocumentsFolderType
		  folderTypes.value("kVolumeRootFolderType") = FolderManager.kVolumeRootFolderType //
		  folderTypes.value("kChewableItemsFolderType") = FolderManager.kChewableItemsFolderType //
		  folderTypes.value("kApplicationSupportFolderType") = FolderManager.kApplicationSupportFolderType
		  folderTypes.value("kTextEncodingsFolderType") = FolderManager.kTextEncodingsFolderType
		  folderTypes.value("kStationeryFolderType") = FolderManager.kStationeryFolderType
		  folderTypes.value("kOpenDocFolderType") = FolderManager.kOpenDocFolderType
		  folderTypes.value("kOpenDocShellPlugInsFolderType") = FolderManager.kOpenDocShellPlugInsFolderType
		  folderTypes.value("kEditorsFolderType") = FolderManager.kEditorsFolderType
		  folderTypes.value("kOpenDocEditorsFolderType") = FolderManager.kOpenDocEditorsFolderType
		  folderTypes.value("kOpenDocLibrariesFolderType") = FolderManager.kOpenDocLibrariesFolderType
		  folderTypes.value("kGenEditorsFolderType") = FolderManager.kGenEditorsFolderType
		  folderTypes.value("kHelpFolderType") = FolderManager.kHelpFolderType
		  folderTypes.value("kInternetPlugInFolderType") = FolderManager.kInternetPlugInFolderType
		  folderTypes.value("kModemScriptsFolderType") = FolderManager.kModemScriptsFolderType
		  folderTypes.value("kPrinterDescriptionFolderType") = FolderManager.kPrinterDescriptionFolderType
		  folderTypes.value("kPrinterDriverFolderType") = FolderManager.kPrinterDriverFolderType
		  folderTypes.value("kScriptingAdditionsFolderType") = FolderManager.kScriptingAdditionsFolderType
		  folderTypes.value("kSharedLibrariesFolderType") = FolderManager.kSharedLibrariesFolderType
		  folderTypes.value("kVoicesFolderType") = FolderManager.kVoicesFolderType
		  folderTypes.value("kControlStripModulesFolderType") = FolderManager.kControlStripModulesFolderType
		  folderTypes.value("kAssistantsFolderType") = FolderManager.kAssistantsFolderType
		  folderTypes.value("kUtilitiesFolderType") = FolderManager.kUtilitiesFolderType
		  folderTypes.value("kAppleExtrasFolderType") = FolderManager.kAppleExtrasFolderType
		  folderTypes.value("kContextualMenuItemsFolderType") = FolderManager.kContextualMenuItemsFolderType
		  folderTypes.value("kMacOSReadMesFolderType") = FolderManager.kMacOSReadMesFolderType
		  folderTypes.value("kALMModulesFolderType") = FolderManager.kALMModulesFolderType
		  folderTypes.value("kALMPreferencesFolderType") = FolderManager.kALMPreferencesFolderType
		  folderTypes.value("kALMLocationsFolderType") = FolderManager.kALMLocationsFolderType
		  folderTypes.value("kColorSyncProfilesFolderType") = FolderManager.kColorSyncProfilesFolderType
		  folderTypes.value("kThemesFolderType") = FolderManager.kThemesFolderType
		  folderTypes.value("kFavoritesFolderType") = FolderManager.kFavoritesFolderType
		  folderTypes.value("kInternetFolderType") = FolderManager.kInternetFolderType
		  folderTypes.value("kAppearanceFolderType") = FolderManager.kAppearanceFolderType
		  folderTypes.value("kSoundSetsFolderType") = FolderManager.kSoundSetsFolderType
		  folderTypes.value("kDesktopPicturesFolderType") = FolderManager.kDesktopPicturesFolderType
		  folderTypes.value("kInternetSearchSitesFolderType") = FolderManager.kInternetSearchSitesFolderType
		  folderTypes.value("kFindSupportFolderType") = FolderManager.kFindSupportFolderType
		  folderTypes.value("kFindByContentFolderType") = FolderManager.kFindByContentFolderType
		  folderTypes.value("kInstallerLogsFolderType") = FolderManager.kInstallerLogsFolderType
		  folderTypes.value("kScriptsFolderType") = FolderManager.kScriptsFolderType
		  folderTypes.value("kFolderActionsFolderType") = FolderManager.kFolderActionsFolderType
		  folderTypes.value("kLauncherItemsFolderType") = FolderManager.kLauncherItemsFolderType
		  folderTypes.value("kRecentApplicationsFolderType") = FolderManager.kRecentApplicationsFolderType
		  folderTypes.value("kRecentDocumentsFolderType") = FolderManager.kRecentDocumentsFolderType
		  folderTypes.value("kRecentServersFolderType") = FolderManager.kRecentServersFolderType
		  folderTypes.value("kSpeakableItemsFolderType") = FolderManager.kSpeakableItemsFolderType
		  folderTypes.value("kQuickTimeExtensionsFolderType") = FolderManager.kQuickTimeExtensionsFolderType
		  folderTypes.value("kDisplayExtensionsFolderType") = FolderManager.kDisplayExtensionsFolderType
		  folderTypes.value("kMultiprocessingFolderType") = FolderManager.kMultiprocessingFolderType
		  folderTypes.value("kPrintingPlugInsFolderType") = FolderManager.kPrintingPlugInsFolderType
		  
		  folderTypes.value("kLocalesFolderType") = FolderManager.kLocalesFolderType
		  folderTypes.value("kFindByContentPluginsFolderType") = FolderManager.kFindByContentPluginsFolderType
		  
		  folderTypes.value("kDomainTopLevelFolderType") = FolderManager.kDomainTopLevelFolderType
		  folderTypes.value("kDomainLibraryFolderType") = FolderManager.kDomainLibraryFolderType
		  folderTypes.value("kSystemSoundsFolderType") = FolderManager.kSystemSoundsFolderType
		  folderTypes.value("kColorSyncFolderType") = FolderManager.kColorSyncFolderType
		  folderTypes.value("kColorSyncCMMFolderType") = FolderManager.kColorSyncCMMFolderType
		  folderTypes.value("kPrintersFolderType") = FolderManager.kPrintersFolderType
		  folderTypes.value("kSpeechFolderType") = FolderManager.kSpeechFolderType
		  folderTypes.value("kCarbonLibraryFolderType") = FolderManager.kCarbonLibraryFolderType
		  folderTypes.value("kDocumentationFolderType") = FolderManager.kDocumentationFolderType
		  folderTypes.value("kDeveloperDocsFolderType") = FolderManager.kDeveloperDocsFolderType
		  folderTypes.value("kDeveloperHelpFolderType") = FolderManager.kDeveloperHelpFolderType
		  folderTypes.value("kISSDownloadsFolderType") = FolderManager.kISSDownloadsFolderType
		  folderTypes.value("kUserSpecificTmpFolderType") = FolderManager.kUserSpecificTmpFolderType
		  folderTypes.value("kCachedDataFolderType") = FolderManager.kCachedDataFolderType
		  folderTypes.value("kFrameworksFolderType") = FolderManager.kFrameworksFolderType
		  folderTypes.value("kPrivateFrameworksFolderType") = FolderManager.kPrivateFrameworksFolderType
		  folderTypes.value("kClassicDesktopFolderType") = FolderManager.kClassicDesktopFolderType
		  folderTypes.value("kDeveloperFolderType") = FolderManager.kDeveloperFolderType
		  folderTypes.value("kComponentsFolderType") = FolderManager.kComponentsFolderType
		  folderTypes.value("kQuickTimeComponentsFolderType") = FolderManager.kQuickTimeComponentsFolderType
		  folderTypes.value("kCoreServicesFolderType") = FolderManager.kCoreServicesFolderType
		  folderTypes.value("kPictureDocumentsFolderType") = FolderManager.kPictureDocumentsFolderType
		  folderTypes.value("kMovieDocumentsFolderType") = FolderManager.kMovieDocumentsFolderType
		  folderTypes.value("kInternetSitesFolderType") = FolderManager.kInternetSitesFolderType
		  folderTypes.value("kPublicFolderType") = FolderManager.kPublicFolderType
		  folderTypes.value("kAudioSupportFolderType") = FolderManager.kAudioSupportFolderType
		  folderTypes.value("kAudioSoundsFolderType") = FolderManager.kAudioSoundsFolderType
		  folderTypes.value("kAudioSoundBanksFolderType") = FolderManager.kAudioSoundBanksFolderType
		  folderTypes.value("kAudioAlertSoundsFolderType") = FolderManager.kAudioAlertSoundsFolderType
		  folderTypes.value("kAudioPlugInsFolderType") = FolderManager.kAudioPlugInsFolderType
		  folderTypes.value("kAudioComponentsFolderType") = FolderManager.kAudioComponentsFolderType
		  folderTypes.value("kKernelExtensionsFolderType") = FolderManager.kKernelExtensionsFolderType
		  folderTypes.value("kDirectoryServicesFolderType") = FolderManager.kDirectoryServicesFolderType
		  folderTypes.value("kDirectoryServicesPlugInsFolderType") = FolderManager.kDirectoryServicesPlugInsFolderType
		  folderTypes.value("kInstallerReceiptsFolderType") = FolderManager.kInstallerReceiptsFolderType
		  folderTypes.value("kFileSystemSupportFolderType") = FolderManager.kFileSystemSupportFolderType
		  folderTypes.value("kAppleShareSupportFolderType") = FolderManager.kAppleShareSupportFolderType
		  folderTypes.value("kAppleShareAuthenticationFolderType") = FolderManager.kAppleShareAuthenticationFolderType
		  folderTypes.value("kMIDIDriversFolderType") = FolderManager.kMIDIDriversFolderType
		  folderTypes.value("kKeyboardLayoutsFolderType") = FolderManager.kKeyboardLayoutsFolderType
		  
		  folderTypes.value("kIndexFilesFolderType") = FolderManager.kIndexFilesFolderType
		  folderTypes.value("kFindByContentIndexesFolderType") = FolderManager.kFindByContentIndexesFolderType
		  folderTypes.value("kManagedItemsFolderType") = FolderManager.kManagedItemsFolderType
		  folderTypes.value("kBootTimeStartupItemsFolderType") = FolderManager.kBootTimeStartupItemsFolderType
		  folderTypes.value("kMusicDocumentsFolderType") = FolderManager.kMusicDocumentsFolderType
		  folderTypes.value("kAppleshareAutomountServerAliasesFolderType") = FolderManager.kAppleshareAutomountServerAliasesFolderType
		  
		  folderTypes.Value("kKeychainFolderType") = FolderManager.kKeychainFolderType
		  
		  //added in MacOS 10.3
		  folderTypes.value("kDictionariesFolderType") = FolderManager.kDictionariesFolderType
		  folderTypes.value("kLogsFolderType") = FolderManager.kLogsFolderType
		  folderTypes.value("kDeveloperApplicationsFolderType") = FolderManager.kDeveloperApplicationsFolderType
		  folderTypes.value("kPreferencePanesFolderType") = FolderManager.kPreferencePanesFolderType
		  
		  ListBox1.DeleteAllRows
		  dim domain as Integer = PopupMenu1.RowTag(PopupMenu1.ListIndex)
		  for i as Integer = 0 to folderTypes.Count - 1
		    ListBox1.AddRow folderTypes.Key(i).StringValue
		    dim f as FolderItem = FolderManager.FindFolder(domain, FolderTypes.value(folderTypes.Key(i)).StringValue, false)
		    if f <> nil then
		      ListBox1.Cell(ListBox1.LastIndex, 1) = f.AbsolutePath
		      ListBox1.Cell(ListBox1.LastIndex, 2) = f.ShellPath
		    else
		      ListBox1.Cell(ListBox1.LastIndex, 1) = "Nil"
		    end if
		  next
		  ListBox1.Sort
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events ListBox1
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  if me.ListIndex > -1 then
		    base.Append new MenuItem("Copy constant to clipboard", "MacOSFolders." + me.Cell(me.ListIndex, 0))
		    If me.Cell(me.ListIndex, 1) <> "Nil" then
		      base.Append new MenuItem("Copy Mac path to clipboard", me.Cell(me.ListIndex, 1))
		      base.Append new MenuItem("Copy shell path to clipboard", me.Cell(me.ListIndex, 2))
		    End if
		    return true
		  else
		    return false
		  end if
		  
		  #pragma unused x
		  #pragma unused y
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem is nil then
		    return false
		  end if
		  
		  dim c as new Clipboard
		  c.SetText hitItem.Tag.StringValue
		  return true
		  
		exception oops as TypeMismatchException
		  //please file a macoslib bug report.
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  me.AddRow "kOnSystemDisk"
		  me.RowTag(me.ListCount - 1) = -32768
		  me.AddRow "kOnAppropriateDisk"
		  me.RowTag(me.ListCount - 1) = -32767
		  me.AddRow "kSystemDomain"
		  me.RowTag(me.ListCount - 1) = -32766
		  me.AddRow "kLocalDomain"
		  me.RowTag(me.ListCount - 1) = -32765
		  me.AddRow "kNetworkDomain"
		  me.RowTag(me.ListCount - 1) = -32764
		  me.AddRow "kUserDomain"
		  me.RowTag(me.ListCount - 1) = -32763
		  me.AddRow "kClassicDomain"
		  me.RowTag(me.ListCount - 1) = -32762
		  
		  
		  me.AddSeparator
		  
		  for i as Integer = 0 to VolumeCount - 1
		    me.AddRow "Volume " + Str(i)
		    me.RowTag(me.ListCount - 1) = Volume(i).MacVRefNum
		  next
		  
		  me.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex > -1 then
		    self.FillFolderTypesMap
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
