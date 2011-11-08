#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  Carbon._TestSelf
		  CoreFoundation._TestSelf
		  ATSForFonts.ATSFont.SelfTest
		  CertTools.SelfTest
		  TestFileManager
		  TestBundleLookup
		  TestCocoa
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Cocoa.Initialize
		  
		  WindowMenu.Initialize
		End Sub
	#tag EndEvent


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
		Function CocoaNSTableView() As Boolean Handles CocoaNSTableView.Action
			NSTableViewExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CocoaNSTimeZone() As Boolean Handles CocoaNSTimeZone.Action
			NSTimeZoneWindow.Show
			return true
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
			TextAreaExample.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ControlsHISearchField() As Boolean Handles ControlsHISearchField.Action
			HISearchFieldExample.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ControlsMacDatePicker() As Boolean Handles ControlsMacDatePicker.Action
			MacDatePickerExampleWindow.Show
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
		Function ExamplesCarbonPasteboard() As Boolean Handles ExamplesCarbonPasteboard.Action
			CarbonPasteboardExample.Show
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
			Carbon.ShowAboutBox "MacOSLib", "demo", "", "http://code.google.com/p/macoslib/"
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
		Function IconServicesShowIconBrowser() As Boolean Handles IconServicesShowIconBrowser.Action
			MacIconWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IOKitExternalPowerAdapter() As Boolean Handles IOKitExternalPowerAdapter.Action
			IOKitExternalPowerWindow.Show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IOKitPrimaryMACAddress() As Boolean Handles IOKitPrimaryMACAddress.Action
			IOKitPrimaryMACAddressExample.Show
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NavigationServicesOpenExampleWindow() As Boolean Handles NavigationServicesOpenExampleWindow.Action
			NavServicesParentWindow.Show
			return true
			
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
		Protected Sub TestCocoa()
		  #if targetMacOS
		    // Test ProcessInfo.Arguments. First item should be our app's path
		    dim args as NSArray = NSProcessInfo.ProcessInfo.Arguments
		    dim pathFromPI as String = CFString(args.CFValue(0))
		    dim pathFromRB as String = App.ExecutableFile.POSIXPath
		    if pathFromPI <> pathFromRB then break // they should be equal, usually
		    
		    // Try to register something with the Services API
		    Cocoa.NSApplication.App.RegisterServices
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestFileManager()
		  // Test the FSRef related functions:
		  dim f as FolderItem, s as String, ref as FSRef
		  f = GetFolderItem("")
		  s = f.NativePath
		  ref = f.FSRef
		  if ref.FolderItem.AbsolutePath <> f.AbsolutePath then
		    break // test failed!
		  end
		End Sub
	#tag EndMethod


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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
