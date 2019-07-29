#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  // Let's run some test procedures...
		  
		  TestCarbon
		  TestCoreFoundation
		  TestCocoa ' call this only after TestCoreFoundation because it relies on prefs settings from the former call!
		  TestATSFont
		  TestCertTools
		  
		  #if XojoVersion < 2019.02
		    TestFileManager
		    TestBundleLookup
		  #endif
		  
		  TestTTsSmartPrefs
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #if not TargetMacOS
		    MsgBox "This project will only run in MacOS, but the classes are safe to use in any project."
		    quit
		  #endif
		  
		  #if Target32Bit
		    #pragma Error "MACOSLIB 2: works in 64 bit only"
		  #endif
		  
		  Cocoa.Initialize
		  
		  //Initialize the Timer which will close the Splash window and open the default window.
		  SplashTimer = new Timer
		  AddHandler SplashTimer.Action, AddressOf HandleTimerAction
		  SplashTimer.Period = 2500
		  SplashTimer.Mode = 1
		  
		  //Read prefs
		  dim f as FolderItem = SpecialFolder.Preferences.Child( "com.declaresub.macoslib.plist" )
		  if f.Exists then
		    PrefsPL = new DebugReportModule.PropertyList( f )
		  else
		    PrefsPL = new DebugReportModule.PropertyList
		    PrefsPL.file = f
		  end if
		  
		  dim LV as integer = PrefsPL.Lookup( "LastVersionChecked", 0 ) //Last version checked
		  if LV=0 then //Very first launching
		    
		  else //User has already launched the app
		    if LV<About.Version then //User is seeing a new version of macoslib
		      
		    end if
		  end if
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ApplicationExtensionsMenu() As Boolean Handles ApplicationExtensionsMenu.Action
			ApplicationExtensionsWindow.show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BonjourExampleMenu() As Boolean Handles BonjourExampleMenu.Action
			BonjourPublishingExampleWindow.Show
			BonjourBrowsingExampleWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaApplicationIcon() As Boolean Handles CocoaApplicationIcon.Action
			AppIconExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSAlert() As Boolean Handles CocoaNSAlert.Action
			NSAlertExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSByteCountFormatter() As Boolean Handles CocoaNSByteCountFormatter.Action
			NSByteCountFormatterExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSColorBrowser() As Boolean Handles CocoaNSColorBrowser.Action
			NSColorWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSDatePicker() As Boolean Handles CocoaNSDatePicker.Action
			NSDatePickerWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSDockTile() As Boolean Handles CocoaNSDockTile.Action
			NSDockTileExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSGradient() As Boolean Handles CocoaNSGradient.Action
			NSGradientwindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSHost() As Boolean Handles CocoaNSHost.Action
			NSHostExampleWindow.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSLevelIndicator() As Boolean Handles CocoaNSLevelIndicator.Action
			NSLevelIndicatorWindow.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSPasteboard() As Boolean Handles CocoaNSPasteboard.Action
			NSPasteboardExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSPathControl() As Boolean Handles CocoaNSPathControl.Action
			NSPathControlWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSPopover() As Boolean Handles CocoaNSPopover.Action
			NSPopoverExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSPrinter() As Boolean Handles CocoaNSPrinter.Action
			NSPrinterExampleWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSRunningApplication() As Boolean Handles CocoaNSRunningApplication.Action
			NSRunningApplicationsExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSSearchField() As Boolean Handles CocoaNSSearchField.Action
			NSSearchFieldExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSSharingServicePicker() As Boolean Handles CocoaNSSharingServicePicker.Action
			NSSharingServiceExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSSound() As Boolean Handles CocoaNSSound.Action
			NSSoundExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSStatusItem() As Boolean Handles CocoaNSStatusItem.Action
			
			NSStatusItemWindow.show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSTableView() As Boolean Handles CocoaNSTableView.Action
			NSTableViewExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSTask() As Boolean Handles CocoaNSTask.Action
			NSTaskExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSTimeZone() As Boolean Handles CocoaNSTimeZone.Action
			NSTimeZoneWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSToolbar() As Boolean Handles CocoaNSToolbar.Action
			NSToolbarWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSUserNotifications() As Boolean Handles CocoaNSUserNotifications.Action
			NSUserNotificationExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSWindow() As Boolean Handles CocoaNSWindow.Action
			NSWindowExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSWorkspaceNotifications() As Boolean Handles CocoaNSWorkspaceNotifications.Action
			NSWorkspaceEventsExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaSystemImages() As Boolean Handles CocoaSystemImages.Action
			SystemImages.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaTextArea() As Boolean Handles CocoaTextArea.Action
			'TextAreaExample.Show
			TextAreaWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ControlsHISearchField() As Boolean Handles ControlsHISearchField.Action
			'HISearchFieldExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ControlsMacDatePicker() As Boolean Handles ControlsMacDatePicker.Action
			'MacDatePickerExampleWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreFoundationShowVersion() As Boolean Handles CoreFoundationShowVersion.Action
			Msgbox Str(CoreFoundation.Version)
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreFoundationStringTokenizer() As Boolean Handles CoreFoundationStringTokenizer.Action
			StringTokenizerExample.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreGraphicsAxialShadingExample() As Boolean Handles CoreGraphicsAxialShadingExample.Action
			AxialShadingExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreGraphicsImageTransform() As Boolean Handles CoreGraphicsImageTransform.Action
			ImageTransformExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreGraphicsPDFBrowser() As Boolean Handles CoreGraphicsPDFBrowser.Action
			dim w as new PDFBrowser
			w.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreGraphicsRadialShadingExample() As Boolean Handles CoreGraphicsRadialShadingExample.Action
			RadialShadingExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CoreTextOpenExampleWindow() As Boolean Handles CoreTextOpenExampleWindow.Action
			CoreTextExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function DebugReportMenu() As Boolean Handles DebugReportMenu.Action
			DebugReportExampleWindow.show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExamplesAuthorizationShell() As Boolean Handles ExamplesAuthorizationShell.Action
			AuthorizationShellExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExamplesCarbonPasteboard() As Boolean Handles ExamplesCarbonPasteboard.Action
			'CarbonPasteboardExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExamplesCorePrinting() As Boolean Handles ExamplesCorePrinting.Action
			CorePrintingWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExamplesLanguages() As Boolean Handles ExamplesLanguages.Action
			LanguagesWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExamplesSockets() As Boolean Handles ExamplesSockets.Action
			MacTCPSocketsWin.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileAbout() As Boolean Handles FileAbout.Action
			Carbon.ShowAboutBox "MacOSLib", "demo", "", "https://github.com/macoslib/macoslib/"
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FolderManagerShowFolders() As Boolean Handles FolderManagerShowFolders.Action
			MacOSFolderBrowser.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FSEventStreamMenu() As Boolean Handles FSEventStreamMenu.Action
			FSEventStreamExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IconServicesShowIconBrowser() As Boolean Handles IconServicesShowIconBrowser.Action
			MacIconWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IKImageBrowserMenu() As Boolean Handles IKImageBrowserMenu.Action
			IKImageBrowserWND.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ImageCaptureMenu() As Boolean Handles ImageCaptureMenu.Action
			ICCameraExampleWND.show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ImageKitMenu() As Boolean Handles ImageKitMenu.Action
			IKDeviceBrowserWND.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IOKitExternalPowerAdapter() As Boolean Handles IOKitExternalPowerAdapter.Action
			IOKitExternalPowerWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IOKitIdleTime() As Boolean Handles IOKitIdleTime.Action
			IOKitIdleTimeExampleWindow.Show
			return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IOKitPrimaryMACAddress() As Boolean Handles IOKitPrimaryMACAddress.Action
			IOKitPrimaryMACAddressExample.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function LabelExtensionMenu() As Boolean Handles LabelExtensionMenu.Action
			LabelExtensionExampleWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuItemExamplesMenuLocalizedTextDragManager() As Boolean Handles MenuItemExamplesMenuLocalizedTextDragManager.Action
			'DragManagerExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuItemExamplesMenuLocalizedTextThemeColors() As Boolean Handles MenuItemExamplesMenuLocalizedTextThemeColors.Action
			ThemeColorExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NavigationServicesOpenExampleWindow() As Boolean Handles NavigationServicesOpenExampleWindow.Action
			NavServicesParentWindow.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NSImageViewMenu() As Boolean Handles NSImageViewMenu.Action
			NSImageViewExampleWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NSSliderKnobCellMeniu() As Boolean Handles NSSliderKnobCellMeniu.Action
			NSSliderExampleWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NSSlidersExampleMenu() As Boolean Handles NSSlidersExampleMenu.Action
			NSSliderExampleWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NSTokenFieldMenuItem() As Boolean Handles NSTokenFieldMenuItem.Action
			TokenFieldExampleWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function QTKitQTCaptureView() As Boolean Handles QTKitQTCaptureView.Action
			QTCaptureViewExample.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function QTKitQTMovieView() As Boolean Handles QTKitQTMovieView.Action
			QTMovieViewExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SpeechMenu() As Boolean Handles SpeechMenu.Action
			MacSpeechSynthesizerExample.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function StringExtensionMenu() As Boolean Handles StringExtensionMenu.Action
			StringExtensionsExampleWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function StringExtensionsMenu() As Boolean Handles StringExtensionsMenu.Action
			UnicodeExtensionsExample.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SystemExtensionsMenu() As Boolean Handles SystemExtensionsMenu.Action
			SystemExtensionsWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SystemIconsMenuItem() As Boolean Handles SystemIconsMenuItem.Action
			SystemIconsExampleWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UnicodeExtensionsMenu() As Boolean Handles UnicodeExtensionsMenu.Action
			UnicodeExtensionsExample.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WelcomeWindowMenu() As Boolean Handles WelcomeWindowMenu.Action
			
			DefaultWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowManagerAlpha() As Boolean Handles WindowManagerAlpha.Action
			AlphaWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowManagerProxyIcons() As Boolean Handles WindowManagerProxyIcons.Action
			ProxyIconWindow.Show
			return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub HandleTimerAction(theTimer as Timer)
		  macoslibSplashWindow.Close
		  DefaultWindow.Show
		  
		  #pragma unused theTimer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pTestAssert(b as Boolean, msg as String = "")
		  if not b then
		    break
		    #if TargetHasGUI
		      MsgBox "Test in Cocoa module failed: "+EndOfLine+EndOfLine+msg
		    #else
		      Print "Test in Cocoa module failed: "+msg
		    #endif
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestATSFont()
		  #if TargetMacOS
		    dim f as ATSFont
		    f = ATSFont.FindFromName("Lucida Grande")
		    if f = nil then
		      // oops, why is that font not found?
		      break
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestBundleLookup()
		  dim f as FolderItem
		  f = LaunchServices.FindApp ("", "com.apple.finder", "")
		  if f = nil or not f.Exists then
		    MsgBox "Error: can't locate Finder.app"
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestCarbon()
		  dim osversion as Integer = Carbon.SystemVersionAsInt
		  dim nsversion as Double = Cocoa.NSAppKitVersionNumber
		  dim cfversion as Double = CoreFoundation.Version
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestCertTools()
		  // Call this function just to test whether the verification code works in general
		  
		  #if TargetMacOS
		    dim f as FolderItem
		    f = SpecialFolder.Temporary.Child("selftest-data")
		    BinaryStream.Create(f,true).Write(DecodeBase64(SampleReceipt))
		    dim d as Dictionary
		    d = CertTools.ReadReceipt(f)
		    f.Delete
		    
		    if d = nil then raise new RuntimeException // selftest failed
		    
		    dim guid as String
		    
		    guid = CertTools.DeviceGUID
		    if guid = "" then
		      MsgBox "Oops - no DeviceGUID on this computer?"
		    end if
		    
		    guid = CertTools.HexBytesToData (Array("00", "17", "f2", "c4", "bc", "c0"))
		    
		    if not CertTools.IsValid (guid, d, "com.example.sampleApp") then
		      raise new RuntimeException // selftest failed
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestCocoa()
		  // This is an incomplete set of tests to make sure nothing got screwed up too much
		  
		  dim f, dir as FolderItem
		  dim mainBundle as NSBundle = NSBundle.MainBundle
		  
		  // Test NSBundle.AppStoreReceiptDirectory
		  //   For this to work, the path to the receipt file
		  //   must exist, or we'll get nil from the function.
		  //   Therefore, we'll add that folder here first.
		  dir = mainBundle.BundleDirectory.Child("Contents").Child("_MASReceipt")
		  dir.CreateAsFolder()
		  f = mainBundle.AppStoreReceiptDirectory()
		  pTestAssert (f <> nil and f.Name = "receipt") ' In case this fails: Did the receipt URL move somewhere else? At least until OSX 10.8 it shouldn't have
		  
		  // Test NSUserDefaults
		  // (Assumes that TestCoreFoundation got called before this!)
		  dim defaults as NSUserDefaults = NSUserDefaults.StandardUserDefaults
		  dim runCount as Integer = defaults.IntegerValue("RunCount")
		  if runCount <= 0 then
		    break // this means that we did not get the RunCount pref value that was set in TestCoreFoundation()
		  end
		  defaults = nil
		  
		  // Test ProcessInfo.Arguments. First item should be our app's path
		  dim args() as String = NSProcessInfo.ProcessInfo.Arguments
		  dim pathFromPI as String = args(0)
		  dim pathFromRB as String = App.ExecutableFile.POSIXPath
		  if pathFromPI <> pathFromRB then break // they should be equal, usually
		  
		  // Try to register something with the Services API
		  Cocoa.NSApplication.App.RegisterServices
		  
		  // Copy a file
		  dim srcFile as FolderItem = App.ExecutableFile // let's copy our code file (we just need to use some file we know to exist)
		  dim dstDir as FolderItem = SpecialFolder.Temporary
		  dstDir.Child(srcFile.Name).Delete
		  dim ok as Boolean
		  ok = NSWorkspace.PerformCopy (srcFile.Parent, dstDir, Array(srcFile.Name))
		  if not ok then break
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestCoreFoundation()
		  // This is an incomplete set of tests to make sure nothing got screwed up too much
		  
		  // Flip the switches for the tests below here.
		  // Use true and FALSE as values to help distinguish easily.
		  const kTestCFArray = true
		  const kTestCFNumber = true
		  const kTestCFString = true
		  const kTestCFBoolean = true
		  const kTestCFPreferences = true
		  const kTestCFURL = true
		  const kTestCFDate = true
		  const kTestCFTimeZone = true
		  const kTestCFStream = true
		  const kTestCFBundleAndCFPropertyList = FALSE
		  'const kTestCFSocket = FALSE
		  
		  // Check our app's Bundle Identifier
		  dim myBundleID as String = CFBundle.Application.Identifier
		  pTestAssert myBundleID = "com.declaresub.macoslib"
		  
		  // Test creating new bundles
		  dim s as String
		  s = CFBundle.NewCFBundleFromID(CoreFoundation.BundleID).Identifier
		  pTestAssert s = CoreFoundation.BundleID
		  
		  dim cft as CFType
		  
		  if kTestCFArray then
		    dim vals() as CFString
		    vals.Append "a"
		    vals.Append "b"
		    dim arr as new CFArray(vals)
		    dim p as Ptr = arr.Reference
		    arr = CFArray(CFType.NewObject(p, false, kCFPropertyListImmutable)) // here the ref needs to be retained
		    p = arr.Reference
		    arr = new CFArray(p, false) // here the ref needs to be retained
		    pTestAssert arr.CFValue(1).Equals(new CFString("b"))
		  end // at this point the CFString objects should all get deallocated
		  
		  // Test CFNumber operations
		  if kTestCFNumber then
		    dim cf1, cf2 as CFNumber
		    cf1 = new CFNumber(1)
		    pTestAssert cf2 is nil
		    cf2 = new CFNumber(nil,false)
		    pTestAssert not (cf2 is nil)
		    pTestAssert cf2=nil
		    cf2 = new CFNumber(0)
		    pTestAssert (cf2 <> nil)
		    pTestAssert cf1.IntegerValue > cf2.IntegerValue
		    pTestAssert cf1.DoubleValue = 1
		    pTestAssert cf1.Equals(new CFNumber(1.0))
		    pTestAssert cf1 > cf2
		    pTestAssert not( cf1 = cf2 )
		    pTestAssert not( cf1 < cf2 )
		    cf2 = 5
		    pTestAssert cf2.IntegerValue = 5
		    cf2 = 5.1
		    pTestAssert cf2.DoubleValue = 5.1
		    cf1 = cf2
		    pTestAssert cf1 is cf2
		  end
		  
		  // Test CFString operations
		  if kTestCFString then
		    dim s1 as CFString = "z"
		    dim s2 as CFString = "a"
		    pTestAssert s2 < s1
		    pTestAssert s2 < "b"
		    pTestAssert s1 > "y"
		    pTestAssert s1 = "Z"
		    s1 = new CFString( nil, CFType.HasOwnership )
		    pTestAssert s1 = nil
		    'pTestAssert s2 < s1
		    'pTestAssert s1 < "a"
		  end if
		  
		  // Test CFBoolean operations
		  if kTestCFBoolean then
		    dim cfbF as new CFBoolean( False )
		    dim cfbT as CFBoolean = true
		    pTestAssert cfbT = true
		    pTestAssert cfbT <> false
		    pTestAssert cfbT
		    pTestAssert not( cfbF.BooleanValue )
		    pTestAssert cfbT <> cfbF
		    dim cfbN as CFBoolean // nil
		    pTestAssert cfbT <> cfbN
		  end if
		  
		  // Test the CFPreferences functionality
		  if kTestCFPreferences then
		    dim cf1 as CFNumber
		    dim prefs as CFPreferences
		    dim prefKeys() as String = prefs.Keys
		    for each key as String in prefKeys
		      dim desc as String = CFType(prefs.Value(key)).Description
		      #pragma unused desc
		    next
		    cf1 = CFNumber(prefs.Value("RunCount"))
		    dim runCount as Integer
		    if cf1 <> nil then
		      runCount = cf1.IntegerValue
		    end if
		    cf1 = new CFNumber (runCount + 1)
		    prefs.Value("RunCount") = cf1
		    call prefs.Sync // this writes back the changes to the prefs we made here
		    cft = CFType(prefs.Value("RunCount"))
		    pTestAssert cf1.Equals(CFType(prefs.Value("RunCount")))
		  end
		  
		  // Test CFURL
		  if kTestCFURL then
		    dim url as new CFURL(SpecialFolder.System)
		    pTestAssert url.Scheme = "file"
		    pTestAssert url.NetLocation = "localhost" or url.NetLocation = ""
		    pTestAssert url.StringValue = "file://"+url.NetLocation+url.Path+"/"
		    pTestAssert url.Name.StringValue = SpecialFolder.System.Name
		    pTestAssert url.IsAlias.VariantValue = SpecialFolder.System.Alias
		    pTestAssert url.IsDirectory = true
		    url = new CFURL( SpecialFolder.Temporary.Child( "SomethingThatDoesn'tExist" ) )
		    pTestAssert url.FileSize is nil
		  end
		  
		  // Test CFDate
		  if kTestCFDate then
		    dim d1 as new Date
		    dim d2 as new Date
		    dim d3 as date
		    d2.TotalSeconds = d1.TotalSeconds - 5
		    dim cfd1 as new CFDate( d1 )
		    dim cfd2 as CFDate = d2
		    pTestAssert cfd1 > cfd2
		    pTestAssert( ( cfd1 - cfd2 ) = 5. )
		    pTestAssert cfd1 = d1
		    pTestAssert cfd1 > d3
		    cfd1 = nil
		    pTestAssert cfd1 = nil
		  end if
		  
		  // Test CFTimeZone
		  if kTestCFTimeZone then
		    dim zonenames() as String = CFTimeZone.NameList()
		    dim tzone as new CFTimeZone(zonenames(1))
		    pTestAssert tzone.Name = zonenames(1)
		  end
		  
		  // Test CFStreams
		  if kTestCFStream then
		    dim reader as CFReadStream
		    'dim writer as CFWriteStream
		    reader = new CFReadStream("12345")
		    pTestAssert reader.Status = 0
		    pTestAssert reader.Open()
		    pTestAssert reader.Read(3,s)
		    pTestAssert s = "123"
		    pTestAssert not reader.IsAtEnd
		    pTestAssert reader.Read(3,s)
		    pTestAssert s = "45"
		    pTestAssert reader.IsAtEnd
		    pTestAssert reader.Read(3,s)
		    pTestAssert reader.IsOpen
		    reader.Close()
		    pTestAssert not reader.IsOpen
		    pTestAssert not reader.Open()
		    pTestAssert not reader.IsOpen
		    ' not usable due to bug(?) in OS 10.5:
		    'if CFStream.NewBoundPair (reader, writer) then
		    'pTestAssert reader.Open
		    'pTestAssert writer.Open
		    'pTestAssert writer.IsReady
		    'pTestAssert not reader.HasDataAvailable
		    'pTestAssert writer.Write("abcd") = 4
		    'pTestAssert reader.HasDataAvailable
		    'pTestAssert reader.Read(4,s)
		    'pTestAssert s = "abcd"
		    'end if
		  end if
		  
		  // Test CFBundle and CFPropertyList
		  if kTestCFBundleAndCFPropertyList then
		    // get this app's Info.plist contents via CFBundle.InfoDictionary
		    dim bndl as CFBundle = CFBundle.Application
		    dim infodict as CFDictionary = bndl.InfoDictionary
		    pTestAssert not CFPropertyList(infodict).IsValid(kCFPropertyListXMLFormat_v1_0) // it's a CFDictionary but not a true CFPropertyList
		    pTestAssert infodict.Value(CFString("CFBundleIdentifier")) = bndl.InfoDictionaryValue("CFBundleIdentifier")
		    // get this app's Info.plist contents again, this time by locating the file directly and opening it
		    dim url as new CFURL (bndl.URL, "Contents/Info.plist") // create the path to the plist file by hand
		    dim cfStr as CFString = CFString("CFBundleInfoPlistURL")
		    dim url2 as CFURL = CFURL(infodict.Value(cfStr)) // get the same path by asking our App Bundle's info dictionary
		    pTestAssert url.StringValue = url2.StringValue, url.StringValue+" <> "+url2.StringValue
		    dim rs as new CFReadStream (url) // read the plist file directly
		    pTestAssert rs.Open
		    // read the plist file into a mutable CFPropertyList instance
		    dim format as Integer, errorMessage as String
		    dim plist as CFPropertyList = NewCFPropertyList (rs, kCFPropertyListMutableContainersAndLeaves, format, errorMessage)
		    pTestAssert errorMessage="", errorMessage
		    pTestAssert plist.IsValid (format)
		    // get the xml representation of the plist dictionary, then recreate another mutable CFPropertyList instance from it
		    dim xml as String
		    xml = plist.XMLValue
		    plist = NewCFPropertyList (xml, kCFPropertyListMutableContainersAndLeaves, errorMessage)
		    pTestAssert errorMessage="", errorMessage
		    pTestAssert plist.XMLValue = xml // make sure the two are identical in their xml representation
		    // add a new element to the plist
		    CFMutableDictionary(plist).Value(CFString("_AddedKVP_")) = CFString("test value")
		    pTestAssert plist.XMLValue <> xml
		    // write the plist back to a new temp file
		    dim tmpFile as FolderItem = GetTemporaryFolderItem()
		    dim url3 as new CFURL (tmpFile)
		    dim ws as new CFWriteStream(url3)
		    pTestAssert ws.Open
		    pTestAssert plist.Write (ws, kCFPropertyListBinaryFormat_v1_0, errorMessage) // this should write a binary plist but it actually writes an xml one. Odd
		    ws.Close
		    // read the temp file back and see if it contains our added value
		    rs = new CFReadStream (url3)
		    pTestAssert rs.Open
		    pTestAssert rs.Read(99999, s)
		    pTestAssert s.InStr("test value") > 0
		    tmpFile.Delete
		  end
		  
		  '// Test CFSocket (TCP/IP)
		  '#if kTestCFSocket then
		  '// (TT 6 Dec 09) this is not working - at least not when reading and writing within same process
		  'declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		  'declare sub CFReadStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		  'declare sub CFWriteStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		  '
		  'dim serverSocket, clientSocket as CFSocket
		  'dim serverReader, clientReader as CFReadStream
		  'dim serverWriter, clientWriter as CFWriteStream
		  '
		  'dim myAddr as CFData = CFSocket.IP4Address("localhost", 26214)
		  '
		  '// set up the server streams
		  'serverSocket = new CFSocket (CFSocket.PF_INET, CFSocket.SOCK_STREAM, CFSocket.IPPROTO_TCP, CFSocket.kAcceptCallBack)
		  'pTestAssert serverSocket.Bind(myAddr), "bind" // -> listen on socket
		  '
		  '// set up the client streams
		  'CFStream.NewBoundPairFromHostAddress ("localhost", 26214, clientReader, clientWriter)
		  '
		  'pTestAssert clientReader.Open
		  'pTestAssert clientWriter.Open
		  '
		  'CFWriteStreamScheduleWithRunLoop (clientWriter, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		  '
		  'App.DoEvents
		  '
		  'dim n as Integer = clientWriter.Write("start")
		  'pTestAssert n = 5
		  '
		  'do
		  'App.DoEvents
		  'if serverSocket.HasConnected and serverReader = nil then
		  'CFStream.NewBoundPairFromNativeSocket (serverSocket.NativeHandle, serverReader, serverWriter)
		  '
		  'CFReadStreamScheduleWithRunLoop (serverReader, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		  '
		  'pTestAssert serverReader.Open
		  'pTestAssert serverWriter.Open
		  '
		  'App.DoEvents
		  '
		  'pTestAssert clientWriter.Write("hello") = 5
		  'end
		  'if serverReader <> nil and serverReader.HasDataAvailable then
		  'if serverReader.Read(4,s) then
		  'break
		  'end if
		  'end if
		  'loop
		  '
		  'break
		  '#endif
		  '
		  '// Test CFSockets (Unix Domain Sockets)
		  '#if kTestCFSocket then
		  '// (TT 6 Dec 09) this is not working - at least not when reading and writing within same process
		  'declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		  'declare sub CFReadStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		  'declare sub CFWriteStreamScheduleWithRunLoop lib CarbonLib (streamRef as Ptr, runLoopRef as Ptr, mode as CFStringRef)
		  '
		  'dim serverSocket, clientSocket as CFSocket
		  'dim serverReader, clientReader as CFReadStream
		  'dim serverWriter, clientWriter as CFWriteStream
		  '
		  'dim path as String = "/var/tmp/cftest_socket_file"
		  'dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		  'f.Delete
		  'pTestAssert not f.Exists
		  '
		  'dim ssig as new CFSocketSignature (path)
		  'serverSocket = new CFSocket (ssig, CFSocket.kNoCallBack, false)
		  'pTestAssert not serverSocket.IsNULL
		  'pTestAssert serverSocket.IsValid
		  'pTestAssert f.Exists
		  '
		  ''pTestAssert serverSocket.Bind(ssig.address), "bind" // -> listen on socket
		  '
		  'clientSocket = new CFSocket (ssig, CFSocket.kNoCallBack, true)
		  'pTestAssert not clientSocket.IsNULL
		  'pTestAssert clientSocket.IsValid
		  '
		  ''not working: CFStream.NewBoundPairFromSocket ssig, reader, writer
		  'CFStream.NewBoundPairFromNativeSocket (clientSocket.NativeHandle, clientReader, clientWriter)
		  'CFStream.NewBoundPairFromNativeSocket (serverSocket.NativeHandle, serverReader, serverWriter)
		  '
		  'CFReadStreamScheduleWithRunLoop (serverReader, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		  'CFWriteStreamScheduleWithRunLoop (clientWriter, CFRunLoopGetCurrent(), CFConstant("kCFRunLoopCommonModes"))
		  '
		  'pTestAssert serverReader.Open
		  'pTestAssert clientWriter.Open
		  '
		  'App.DoEvents
		  'pTestAssert not serverReader.HasDataAvailable
		  ''pTestAssert clientWriter.IsReady
		  'pTestAssert clientWriter.Write("abcd") = 4
		  'App.DoEvents
		  'pTestAssert serverReader.HasDataAvailable
		  'pTestAssert serverReader.Read(4,s)
		  'pTestAssert s = "abcd"
		  '
		  'f.Delete
		  'pTestAssert not f.Exists
		  '#endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestFileManager()
		  // Test the FSRef related functions:
		  dim f as FolderItem, s as String, ref as FSRef
		  f = GetFolderItem("")
		  s = FileManager.NativePath( f )
		  ref = f.FSRef
		  if ref.FolderItem.NativePath <> f.NativePath then
		    break // test failed!
		  end
		  
		  dim space as Int64 = f.FreeSpaceOnVolume
		  if space <= 0 then
		    break // test failed!
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestTTsSmartPrefs()
		  const appName = "MacOSLib Prefs Testing"
		  try
		    // create a new prefs file
		    Dim prefs As New TTsSmartPreferences(appName, true)
		    Dim currentArray() As Variant
		    currentArray = prefs.Value("somearray", currentArray) // when retrieving arrays, an array of Variants must be used
		    prefs.Value("somearray") = Array("foo", "bar") // when setting arrays, arrays of String, Integer, Boolean, Double etc. may be used
		    prefs.Sync ' writes the data to the prefs file immediately
		    prefs = nil
		    // re-read the data using a fresh class
		    prefs = New TTsSmartPreferences(appName, true)
		    Dim updatedArray() As Variant
		    updatedArray = prefs.Value("somearray", updatedArray)
		  catch
		    'ignore
		  end
		  // delete the prefs file and folder
		  TTsSmartPreferences.AppSupportFolder(appName, false).Child("Preferences.plist").Delete
		  TTsSmartPreferences.AppSupportFolder(appName, false).Delete
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static gPrefs as TTsSmartPreferences
			  if gPrefs = nil then
			    gPrefs = new TTsSmartPreferences ("") // <- enter your app's name here, it's necessary for Windows and Linux
			  end
			  return gPrefs
			End Get
		#tag EndGetter
		Prefs As TTsSmartPreferences
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		PrefsPL As DebugReportModule.PropertyList
	#tag EndProperty

	#tag Property, Flags = &h0
		SplashTimer As Timer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = SampleReceipt, Type = String, Dynamic = False, Default = \"MIIOBQYJKoZIhvcNAQcCoIIN9jCCDfICAQExCzAJBgUrDgMCGgUAMIIBogYJKoZIhvcNAQcBoIIB\rkwSCAY8xggGLMAsCAQ4CAQEEAwIBATAMAgEKAgEBBAQWAjQrMAwCAQ0CAQEEBAICJxAwDQIBAQIB\rAQQFAgMS1ocwDgIBBAIBAQQGAgQAvGFOMA4CAQkCAQEEBgIEUTAwMjAOAgELAgEBBAYCBAU5f7Ew\rDwIBAwIBAQQHDAUxLjAuMjAcAgEFAgEBBBSt47vV2YqpqYj/QjKH9l+RMo2mWDAeAgEIAgEBBBYW\rFDIwMTAtMTAtMDdUMDM6NTc6MzVaMB4CAQwCAQEEFhYUMjAxMC0xMC0yMFQwMDo0OTowMlowHwIB\rAgIBAQQXDBVjb20uZXhhbXBsZS5TYW1wbGVBcHAwRQIBBwIBAQQ9meEu6yrksmfyITiofOrnivVP\rngMnOTSyzSHt8FZefsDD/RabEw5qY7JK8QvheidogEWA8+cRYtMwmsCGLTBKAgEGAgEBBEKEyS4P\rdjBT+E7IgQ3f8dhUKOk2B5AjdOMaD0oFBZA2NLAcjoI3UGUuY29t0HYYJxjvIoX0o38/tAwOQdos\rWVt/+NCgggsBMIICyTCCAjKgAwIBAgINMzOvEBAUrwABrwAAATANBgkqhkiG9w0BAQUFADB7MQsw\rCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNh\rdGlvbiBBdXRob3JpdHkxLzAtBgNVBAMTJkFwcGxlIEZhaXJQbGF5IENlcnRpZmljYXRpb24gQXV0\raG9yaXR5MB4XDTEwMTAxNDAwMDMxN1oXDTE1MTAxMzAwMDMxN1owbDELMAkGA1UEBhMCVVMxEzAR\rBgNVBAoTCkFwcGxlIEluYy4xFzAVBgNVBAsTDkFwcGxlIEZhaXJQbGF5MS8wLQYDVQQDEyZNYWNB\rcHBTdG9yZS4zMzMzQUYxMDEwMTRBRjAwMDFBRjAwMDAwMTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw\rgYkCgYEAtx8x/Hrjy0Kfg9eDxIb5K6JbznK821o6/BL1koKDZUAq7gZIMci9TXhRocVkfyorCVRI\rX5SR/5C630JxBV2fLE0+dP7XibiP6dpApigr1fHm2UjMPFtckPuJKl4KMktOksKsGzWT5TBKHjFa\rsIAWeIUSMuS53tTi8DwMOwXH7L0CAwEAAaNgMF4wDgYDVR0PAQH/BAQDAgO4MAwGA1UdEwEB/wQC\rMAAwHQYDVR0OBBYEFN0RgFNdNOQza7S4jKTa+TKilIisMB8GA1UdIwQYMBaAFPoN1BGRG+ayTh4G\rSZQR3WNiB1lkMA0GCSqGSIb3DQEBBQUAA4GBAE8jgTjxNaZ1AXREB384TWTp8yMVvO3DmRCmiLfP\rsOUUoQ5SpIIONyLbQfm21uGXJLs3ObnEJjVdUS8N/WRzkpBYMkT+cKRppT9wgjVaIaOJBSbBEFT+\rtT0tWi1xDZdWLiAS8LUjSEzoLUFp7Bh865Tp8mgmjq4zI/gkDP66GvAQMIIDcTCCAlmgAwIBAgIB\rETANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQG\rA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3Qg\rQ0EwHhcNMDcwMjE0MTkyMDQxWhcNMTIwMjE0MTkyMDQxWjB7MQswCQYDVQQGEwJVUzETMBEGA1UE\rChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxLzAt\rBgNVBAMTJkFwcGxlIEZhaXJQbGF5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIGfMA0GCSqGSIb3\rDQEBAQUAA4GNADCBiQKBgQCyZzxdKueP8nfP7zG80QT96p/QhimQCqP/ZErvafQKue/ExGPKOi0h\rPVKMI4kpqtsX3MsoxGnNciTCEMH0eB0xFsXm6hkdKjO+gKvcEUgGKh8OYYHNeZpdEvSEkMh89nib\rUvj68YhuEHL4XcuI7LZVFJekTQvBTydnmaaks9farQIDAQABo4GcMIGZMA4GA1UdDwEB/wQEAwIB\rhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBT6DdQRkRvmsk4eBkmUEd1jYgdZZDAfBgNVHSME\rGDAWgBQr0GlHlHYJ/vRrjS5ApvdHTX8IXjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vd3d3LmFw\rcGxlLmNvbS9hcHBsZWNhL3Jvb3QuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQDAoHP4Heoc0c3FhnWk\ru+tAxWotDP5b/G7BW9dIfUCpYS1LN3A47waRS68Rwh+V7ogzb19y6vbVdrVXWHHwPhDD1S67L6Y6\rc8IyZQpWBBYZmE0LeG3Qo3RkmFT0p9cdov8qw3kAspnn57vVBqLrSTNpZ0EBma1osNN69JXg/SSI\rKhDno2j/rXv62brxpX/Kk6LOAzcDZoWTBRsx9nWCky/T8No5Nz1f/rrNmnDABosi7qnOBG4kaTsW\rUqXA8sCuQ3CEuyGRQ8u7t+pbupPgt3eJ701WBDNdzlxZMafXO0VWEc2uy5sOoM/ck6jKxVh4AAXZ\rmavWXofqknM0VKOTGKSDMIIEuzCCA6OgAwIBAgIBAjANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQG\rEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBB\rdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3QgQ0EwHhcNMDYwNDI1MjE0MDM2WhcNMzUwMjA5\rMjE0MDM2WjBiMQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBw\rbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFjAUBgNVBAMTDUFwcGxlIFJvb3QgQ0EwggEiMA0G\rCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDkkakJH5HbHkdQ6wXtXnmELes2oldMVeyLGYne+Uts\r9QerIjAC6Bg++FAJ039BqJj50cpmnCRrEdCju+QbKsMflZ56DKRHi1vUFjczy8QPTc4UadHJGXL1\rXQ7Vf1+b8iUDulWPTV0N8WQ1IxVLFVkds5T39pyez1C6wVhQZ48ItCD3y6wsIG9wtj8BMIy3Q88P\rnT3zK0koGsj+zrW5DtleHNbLPbU6rfQPDgCSC7EhFi501TwN22IWq6NxkkdTVcGvL0Gz+PvjcM3m\ro0xFfh9Ma1CWQYnEdGILEINBhzOKgbEwWOxaBDKMaLOPHd5lc/9nXmW8Sdh2nzMUZaF3lMktAgMB\rAAGjggF6MIIBdjAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUK9Bp\rR5R2Cf70a40uQKb3R01/CF4wHwYDVR0jBBgwFoAUK9BpR5R2Cf70a40uQKb3R01/CF4wggERBgNV\rHSAEggEIMIIBBDCCAQAGCSqGSIb3Y2QFATCB8jAqBggrBgEFBQcCARYeaHR0cHM6Ly93d3cuYXBw\rbGUuY29tL2FwcGxlY2EvMIHDBggrBgEFBQcCAjCBthqBs1JlbGlhbmNlIG9uIHRoaXMgY2VydGlm\raWNhdGUgYnkgYW55IHBhcnR5IGFzc3VtZXMgYWNjZXB0YW5jZSBvZiB0aGUgdGhlbiBhcHBsaWNh\rYmxlIHN0YW5kYXJkIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHVzZSwgY2VydGlmaWNhdGUgcG9s\raWN5IGFuZCBjZXJ0aWZpY2F0aW9uIHByYWN0aWNlIHN0YXRlbWVudHMuMA0GCSqGSIb3DQEBBQUA\rA4IBAQBcNplMLXi37Yyb3PN3m/J20ncwT8EfhYOFG5k9RzfyqZtAjizUsZAS2L70c5vu0mQPy3lP\rNNiiPvl4/2vIB+x9OYOLUyDTOMSxv5pPCmv/K/xZpwUJfBdAVhEedNO3iyM7R6PVbyTi69G3cN8P\rReEnyvFteO3ntRcXqNx+IjXKJdXZD9Zr1KIkIxH3oayPc4FgxhtbCS+SsvhESPBgOJ4V9T0mZyCK\rM2r3DYLP3uujL/lTaltkwGMzd/c6ByxW69oPIQ7aunMZT7XZNn/Bh1XZp5m5MkL72NVxnn6hUrcb\rvZNCJBIqxw8dtk2cXmPIS4AXUKqK1drk/NAJBzewdXUhMYIBMzCCAS8CAQEwgYwwezELMAkGA1UE\rBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRpb24g\rQXV0aG9yaXR5MS8wLQYDVQQDEyZBcHBsZSBGYWlyUGxheSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0\reQINMzOvEBAUrwABrwAAATAJBgUrDgMCGgUAMA0GCSqGSIb3DQEBAQUABIGAkXGoA0Hy6ykuNk/e\rfqEPHPTgZgMdIgCZMShXPlaIBJWlUEcitbneF+9ODCbrqyGM7esOu6HJDUl5K45b5Sy+SePLQ9Sq\rRcMTOqeLn9qCR/VMbkHIYjawZ9A+CuLLfvt9GXJxuFChWIrP5JZeGx8nasOXmj8MI8qoIiaQnDQq\rW8w\x3D", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
