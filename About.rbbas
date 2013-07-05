#tag Module
Protected Module About
	#tag Note, Name = About
		This is the open source "MacOSLib", a collection of classes to interface Mac OS X functions
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
		Requires REALbasic 2007r4 or later and MacOS X 10.5 or later.
		
	#tag EndNote

	#tag Note, Name = Contributors
		
		Charles Yeomans (CY)
		Thomas Tempelmann (TT)
		Stéphane Mons (SM)
		Kem Tekinay (KT)
		Vidal van Bergen (VVB)
	#tag EndNote

	#tag Note, Name = Documentation
		The macoslib documentation is provided inside macoslib itself as described at http://http://ufos-software.com/docgen/
		
		Eventually, Docgen (1) will be able to export the full documentation of macoslib
		
		
		
		
		
		(1) "Docgen" is a codename. The final software name has not been chosen yet.
		
	#tag EndNote

	#tag Note, Name = How To Use
		To add MacOSLib to your project, select the entire "macoslib" folder in this project, copy it and paste
		it into your project. Do not attempt to import (or drag+drop) the folder from disk into your project,
		as the IDE will mess the class hierarchy up, causing lots of compile errors.
		
		If you find that the macoslib is too large for your needs, don't worry - the compiler will only include
		the code for classes you actually use in your project, so your project won't grow just because you include
		macoslib without using any of its features (well, that's the theory, at least).
		
		You may try to remove unused classes and modules gradually after you figure out you won't need them,
		but please start with the entire macoslib folder to save you trouble initially.
	#tag EndNote

	#tag Note, Name = License
		The present library is distributed under the terms of the MIT License.
		
		See: http://opensource.org/licenses/mit-license.php
	#tag EndNote

	#tag Note, Name = Release Notes
		
		These release notes were added as of version 100. Check the git history for previous release notes.
		Add new notes above existing ones, and remember to increment the Version constant.
		Contributors are identified by initials. See the "Contributors" note for full names.
		
		133: 2013-07-03 by KT
		- Added pragmas for unused method parameters.
		- Added Contributors note.
		
		132: 2013-07-02 by VVB
		- Added ScalingFactor method.
		
		131: 2013-07-01 by KT
		- Changed methods/properties that started with "_" so they won't.
		  New convention is that public methods/properties will simply be marked as "hidden",
		  and private/protected ones will start with "m_".
		
		130: 2013-05-30 by TT
		- Add CarbonDragManager along with Example. This makes the Drop Location available to Cocoa apps
		
		129: 2013-05-25 by CCY 
		- Add NSTask class; fix a bug in ExtendedAttributesExtensions.libcErrorCode that prevented Linux/Windows builds.
		
		128: 2013-05-20 by KT 
		- Fixed unused variables/parameters.
		
		127: 2013-05-20 by CCY
		- Added an example that loads the application icon into an NSImage, and demonstrates how to draw it into an Rb Graphics object,
		  including flipping.
		- Added NSAffineTransform
		- Modified NSGraphicsContext and NSImage.
		
		126: 2013-05-14 by TT
		- Fixed a few places where Names of RB's MenuItems were used to look up items in Cocoa, and that did
		  fail if the name contained a "&"
		
		125: 2013-04-03 by KT
		- Converted StaticText, EditField to modern equivalents.
		
		124: 2013-03-19 by KT
		- Fixed compiler error when not TargetCocoa
		- Removed unused variables and method params.
		
		123: 2013-03-18 (give or take) by CY
		- Various changes and additions.
		
		122: 2013-01-25 by KT
		- Changes to MacPListBrowser.
		- Fixed problem that was preventing compile in Real Studio 2012r2.1.
		
		121: 2013-01-20 by KT
		- Added MacSystemProfiler class to Additional Modules.
		- Added Carbon.VersionAsInteger to standardize version-to-integer conversions. (Moved code from SystemVersionAsInt.)
		- Modified Carbon.SystemVersionAsInt to use Carbon.VersionAsInteger. No change in functionality.
		- Added Carbon.IsMountainLion.
		- Modified MacPListBrowser.
		
		120: 2012-12-13 by TT
		- Added FolderItem.OpenMacResourceFork as a replacement for f.OpenResourceFork
		
		119: 2012-12-12 by KT
		- Removed legal notice from NativeSubclass.DictionaryCaseSensitive.
		- Added lines to prevent compiler from complaining about unused variables.
		
		118: 2012-12-11 by KT
		- Added NativeSubclass module to house subclasses of native types.
		- Added NativeSubclass.DictionaryCaseSensitive.
		- Changed output from CFDictionary.VariantValue and related methods to return a NativeSubclass.DictionaryCaseSensitive.
		  (Note: This is a Dictionary subclass so existing code will not need to change.)
		- Optimized code that converts CFDictionary to and from Dictionary.
		- Added #pragmas for unused "areas" parameter in Paint events in 2012r2 and later.
		
		117: 2012-12-11 by TT
		- Adds "MacResourceFork" as a replacement for the ResourceFork class that's removed in RB 2012r2
		- Adds some notes and tests around getting the app's Bundle Identifier
		
		116: 2012-12-01 by KT
		- Added caching for System.IsFunctionAvailable calls.
		- CoreFoundation.TestSelf: Created switches as constants for each test category.
		- CFBundle.Load: Removed older system function check and call, raise any returned CFError as an exception.
		- ATSFont.File: Added check for older function because the documentation for both functions seems to have 
		  dropped off of Apple's site except for a PDF that says it's all deprecated as of OS X 10.6 in favor of 
		  Core Text.
		- Win32Error.FormatErrorMessage: Added caching and checks for both system functions, just to be safe.
		
		115: 2012-12-01 by CY
		- Remove assignment to NSControl.AcceptFocus; update NSSearchField1 pro…
		- Fix a bug in NSSearchField.MaxRecentSearches.
		
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


	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"133", Scope = Protected
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
