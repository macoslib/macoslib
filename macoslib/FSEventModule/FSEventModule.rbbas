#tag Module
Protected Module FSEventModule
	#tag Property, Flags = &h21
		Private myStreamRef As integer
	#tag EndProperty


	#tag Constant, Name = kFlagList, Type = String, Dynamic = False, Default = \"kFSEventStreamEventFlagNone\x2CkFSEventStreamEventFlagMustScanSubDirs\x2CkFSEventStreamEventFlagUserDropped\x2CkFSEventStreamEventFlagKernelDropped\x2CkFSEventStreamEventFlagEventIdsWrapped\x2CkFSEventStreamEventFlagHistoryDone\x2CkFSEventStreamEventFlagRootChanged\x2CkFSEventStreamEventFlagMount\x2CkFSEventStreamEventFlagUnmount\x2CkFSEventStreamEventFlagItemCreated\x2CkFSEventStreamEventFlagItemRemoved\x2CkFSEventStreamEventFlagItemInodeMetaMod\x2CkFSEventStreamEventFlagItemRenamed\x2CkFSEventStreamEventFlagItemModified\x2CkFSEventStreamEventFlagItemFinderInfoMod\x2CkFSEventStreamEventFlagItemChangeOwner\x2CkFSEventStreamEventFlagItemXattrMod\x2CkFSEventStreamEventFlagItemIsFile\x2CkFSEventStreamEventFlagItemIsDir\x2CkFSEventStreamEventFlagItemIsSymlink\r", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventIdSinceNow, Type = Double, Dynamic = False, Default = \"&hFFFFFFFFFFFFFFFF", Scope = Public
	#tag EndConstant


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
