#tag Module
Protected Module FSEventModule
	#tag Method, Flags = &h1
		Protected Function CopyUUIDForDevice(dev as UInt32) As String
		  
		  #if TargetMacOS
		    soft declare function FSEventsCopyUUIDForDevice lib CarbonLib ( dev as UInt32 ) as Ptr
		    
		    dim p as Ptr = FSEventsCopyUUIDForDevice( dev )
		    if p<>nil then
		      dim uuid as new CFUUID( p, false )
		      
		      return uuid.StringValue
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FSEventsGetLastEventIdForDeviceBeforeTime(dev as Int32, beforeDate as Date) As UInt64
		  #if TargetMacOS
		    soft declare function FSEventsGetLastEventIdForDeviceBeforeTime lib CarbonLib (dev as Int32, time as double) as UInt64
		    
		    return  FSEventsGetLastEventIdForDeviceBeforeTime( dev, beforeDate.AsCFAbsoluteTime )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TextConstantsFromFlags(flags as Int32) As string()
		  
		  #if TargetMacOS
		    if flags = 0 then
		      return  Array( "kFSEventStreamEventFlagNone" )
		    end if
		    
		    dim flagtext() as string
		    
		    //What an awful implementation !
		    for j as integer = 0 to 24
		      if Bitwise.BitAnd( flags, RealBasic.Pow( 2, j ))<>0 then
		        flagtext.Append   NthField( kFlagList, ",", j + 2 )
		      end if
		    next
		    
		    return  flagtext
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = kFlagList, Type = String, Dynamic = False, Default = \"kFSEventStreamEventFlagNone\x2CkFSEventStreamEventFlagMustScanSubDirs\x2CkFSEventStreamEventFlagUserDropped\x2CkFSEventStreamEventFlagKernelDropped\x2CkFSEventStreamEventFlagEventIdsWrapped\x2CkFSEventStreamEventFlagHistoryDone\x2CkFSEventStreamEventFlagRootChanged\x2CkFSEventStreamEventFlagMount\x2CkFSEventStreamEventFlagUnmount\x2CkFSEventStreamEventFlagItemCreated\x2CkFSEventStreamEventFlagItemRemoved\x2CkFSEventStreamEventFlagItemInodeMetaMod\x2CkFSEventStreamEventFlagItemRenamed\x2CkFSEventStreamEventFlagItemModified\x2CkFSEventStreamEventFlagItemFinderInfoMod\x2CkFSEventStreamEventFlagItemChangeOwner\x2CkFSEventStreamEventFlagItemXattrMod\x2CkFSEventStreamEventFlagItemIsFile\x2CkFSEventStreamEventFlagItemIsDir\x2CkFSEventStreamEventFlagItemIsSymlink\r", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagEventIdsWrapped, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagHistoryDone, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemChangeOwner, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemCreated, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemFinderInfoMod, Type = Double, Dynamic = False, Default = \"&h2000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemInodeMetaMod, Type = Double, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsDir, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsFile, Type = Double, Dynamic = False, Default = \"&h10000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemIsSymlink, Type = Double, Dynamic = False, Default = \"&h40000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemModified, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemRemoved, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemRenamed, Type = Double, Dynamic = False, Default = \"&h800", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagItemXattrMod, Type = Double, Dynamic = False, Default = \"&h8000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagKernelDropped, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagMount, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagMustScanSubDirs, Type = Double, Dynamic = False, Default = \"&h1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagRootChanged, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagUnmount, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFSEventStreamEventFlagUserDropped, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
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
