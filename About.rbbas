#tag Module
Protected Module About
	#tag Note, Name = About
		This is the open source "MacOSLib", a collection of classes to interface Mac OS X functions
		
		Original sources are located here:  http://code.google.com/p/macoslib
		
		Requires REALbasic 2007r4 or later
	#tag EndNote

	#tag Note, Name = Release Notes
		
		These release notes were added as of version 100. Check the git history for previous release notes.
		Add new notes above existing ones, and remember to increment the Version constant.
		
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


	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"103", Scope = Protected
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
