#tag Module
Protected Module About
	#tag Note, Name = About
		This is the open source "MacOSLib", a collection of classes to interface Mac OS X functions
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		Requires REALbasic 2007r4 or later and MacOS X 10.5 or later.
	#tag EndNote

	#tag Note, Name = License
		The present library is distributed under the terms of the MIT License.
		
		See: http://opensource.org/licenses/mit-license.php
	#tag EndNote

	#tag Note, Name = Release Notes
		
		These release notes were added as of version 100. Check the git history for previous release notes.
		Add new notes above existing ones, and remember to increment the Version constant.
		
		114: 2012-11-30 by KT
		- CoreFoundation.Write: Added CFPropertyListWrite to replace the deprecated CFPropertyListWriteToStream.
		- CoreFoundation.XMLValue: Added code for CFPropertyListCreateData to replace deprecated CFPropertyListCreateXMLData.
		- Added some comments.
		- Added option to MacPListBrowser.SaveToFile to allow saving as binary.
		- Added more unused method parameter pragmas.
		- Added XMLValue as alias for PListStringValue in MacPListBrowser.
		
		113: 2012-11-29 by CY
		- Attempt to get NSSearchField to participate in key-view loop.
		
		112: 2012-11-28 by KT
		- Updated DICT_CaseSensitiveDictionary in Additional Modules.
		- Minor spelling fixes in comments.
		
		111: 2012-11-24 by KT
		- Added DICT_CaseSensitiveDictionary to Additional Modules.
		- Added case-sensitive options to MacPListBrowser. (Now requires DICT_CaseSensitiveDictionary.)
		- Fixed minor bugs in MacPListBrowser.
		- Added ability to convert CFType to MacPlistBrowser.
		- Fixed minor Windows compilation bug.
		- Added pragmas for unused method parameters.
		
		110: 2012-10-16 by KT
		- Added BooleanValue to CFBoolean.
		- Added Constructor( Boolean) to CFBoolean.
		- Added Operator_Compare and Operator_Convert functions to CFBoolean.
		- Added DateValue to CFDate.
		- Ensured that viewing the properties of a CFURL of a file that doesn't exist won't crash the debugger.
		- Added Exists property to CFURL.
		
		109: 2012-10-15 by KT
		- Minimum supported OS is now MacOS X 10.5.
		- Added methods for resolving alias to CFURL.
		- Added optional parameter to CFURL.Constructor( FolderItem ) to specify that the given alias should be resolved first.
		- Added a bunch of properties to CFURL.
		- Added Operator_Compare and Operator_Convert methods to CFDate.
		- Added Operator_Compare and Operator_Convert methods to CFNumber.
		- Added Operator_Compare methods to CFString.
		- Started removing "soft" from function declarations where the call had been introduced in OS X 10.5 or earlier.
		- CFError can now be raised as an Exception (will generate a MaxOSError Exception). Use like this when ErrorRef is returned from system call:
		     if errorRef <> nil then raise new CFError( errorRef, CFType.HasOwnership )
		- Cleaned up unused local variables.
		
		108: 2012-09-08 by SM
		- Implemented all the ImageCaptureCore Cocoa classes to detect and manage cameras, iPhones and iPods. They are lower-level than
		     their ImageKit counterparts (introduced in v.107), i.e. more powerful but more difficult to implement. ImageCapture includes the following classes: ICDeviceBrowser,
		     ICDevice (children ICCameraDevice and ICScannerDevice), ICCameraItem (children ICCameraFolder, ICCameraFile). Some functions like deletion and uploading are
		     not available.
		     Scanner objects are not implemented.
		- Added a License note in the About module (the license terms were only available on the website)
		
		107: 2012-09-02 by SM
		- Implemented ImageKit classes to use scanners and cameras: IKDeviceBrowserView; IKScannerDeviceView, IKCameraDeviceView
		- Implemented example windows for ImageKit
		- Partially implemented ImageCaptureCore classes necessary to support ImageKit (ICDevice, ICScannerDevice, ICCameraDevice…). They should not be used at the moment.
		- Implemented NSUserDefaults
		- Added convenience functions to store/retrieve window frames from the preferences
		
		106: 2012-08-23 by SM
		- Fixed memory leak with MacSpeechSynthesizer. (thank to Charles for finding the problem)
		- Extended MDItem (CreateFromFile, AllAttributes)
		- Added MacOSFolderItemExtension SpotlightMetadata which returns all the metadata for a file as a Dictionary
		- Extended NSDictionary.Value and NSMutableDictionary.Value to accept a key as variant
		- Added optional class checking in the NSObject Constructor
		- Many improvements in NSAttributedString and its mutable counterpart, though there is still much work to be done
		
		105:
		- Moved M_PList module into "Convenience extensions and objects folder" within macoslib.
		
		104:
		- Added AssertionModule in the Exception Classes folder with AssertPtr and AssertOSVersion
		- Started adjusting code to the OS version the application is running on.
		
		103:
		- Corrected bugs in NSString.
		- Added pathExtension method to NSString and NSURL.
		- Added pragmas for unused variables.
		
		102:
		- Modified MacOSFolderItemExtension.Extension to better identify extensions.
		- Modified MacOSFolderItemExtension.NameNoExtension to leverage code in Extension to properly identify the name.
		- Added pragmas for unused variables in Windows/Linux.
		
		101:
		- Added NSFileHandle and NSPipe classes.
		
		100:
		- Added About.Version constant and these release notes.
		- Changed FileManager.StringValue to return UTF16.
		- Modified MacIcon to use new value from FileManager.StringValue.
		- Added FileManager.StringValue( Extends s As HFSUniStr255 ) to overload the native structure's StringValue.
	#tag EndNote


	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"114", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
