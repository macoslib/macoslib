#tag Module
Protected Module FSEventModule
	#tag Method, Flags = &h1
		Protected Sub CreateStream()
		  
		  soft declare function FSEventStreamCreate lib CarbonLib (alloc as Ptr, callback as Ptr, context as Ptr, Paths as Ptr, sinceWhen as UInt64, latency as double, flags as UInt32) as integer
		  soft declare sub FSEventStreamScheduleWithRunLoop lib CarbonLib (streamRef as integer, runLoop as Ptr, runLoopMode as CFStringRef )
		  soft declare function FSEventStreamStart lib CarbonLib (streamref as integer) as Boolean
		  
		  dim Paths as new CFMutableArray
		  Paths.Append   new CFString( "/Users/steff" )
		  
		  myStreamRef = FSEventStreamCreate( nil, AddressOf FSEventCallback, nil, Paths.Reference, kFSEventStreamEventIdSinceNow, 3.0, &h10 OR &h4 OR &h1 )
		  
		  if myStreamRef=0 then
		    DReportError   "Unable to create the FSEvent stream"
		    return
		  end if
		  
		  FSEventStreamScheduleWithRunLoop   myStreamRef, CFRunLoop.Current.Reference, "kCFRunLoopDefaultMode"
		  
		  if NOT FSEventStreamStart( myStreamRef ) then
		    DReportError   "Could not start stream"
		    return
		  end if
		  
		  DReport  "Stream started"
		  
		  
		  'extern Boolean FSEventStreamStart(
		  'FSEventStreamRef streamRef);
		  
		  'extern void FSEventStreamScheduleWithRunLoop(
		  'FSEventStreamRef streamRef,
		  'CFRunLoopRef runLoop,
		  'CFStringRef runLoopMode);
		  
		  'extern FSEventStreamRef FSEventStreamCreate(
		  'CFAllocatorRef allocator,
		  'FSEventStreamCallback callback,
		  'FSEventStreamContext *context,
		  'CFArrayRef pathsToWatch,
		  'FSEventStreamEventId sinceWhen,
		  'CFTimeInterval latency,
		  'FSEventStreamCreateFlags flags);
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FSEventCallback(streamRef as integer, clientCallbackInfo as Ptr, numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  declare function CFArrayGetStringAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as CFStringRef
		  declare function CFArrayGetValueAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as Ptr
		  declare function CFNumberGetValue lib CarbonLib (nbr as Ptr, theType as integer, outValue as Ptr) as Boolean
		  
		  const kCFNumberIntType = 9
		  const kCFNumberLongType = 10
		  
		  'dim id as CFArray = new CFArray( eventIDs, false )
		  'dim paths as CFArray = new CFArray( eventPaths, false )
		  'dim flags as CFArray = new CFArray( eventFlags, false )
		  
		  dim id as UInt64
		  dim path as String
		  dim flags as UInt32
		  dim flagtext() as string
		  dim mb as new MemoryBlock( 8 )
		  dim mb1, mb2, mb3 as MemoryBlock
		  dim p as Ptr
		  
		  'mb1 = eventPaths
		  mb2 = eventFlags
		  mb3 = eventIDs
		  
		  'QReport   Cocoa.NSObjectFromNSPtr( eventPaths )
		  
		  QReport  "numEvents:", numEvents
		  
		  for i as integer=0 to numEvents - 1
		    path = CFArrayGetStringAtIndex( eventPaths, i )
		    
		    'p = CFArrayGetValueAtIndex( eventFlags, i )
		    'if CFNumberGetValue( p, kCFNumberIntType, mb ) then
		    'flags = mb.UInt32Value( 0 )
		    'else
		    flags = mb2.UInt32Value( i * 4 )
		    'end if
		    
		    redim flagtext( -1 )
		    
		    for j as integer = 0 to 24
		      if Bitwise.BitAnd( flags, Pow( 2, j ))<>0 then
		        flagtext.Append   NthField( kFlagList, ",", j + 2 )
		      end if
		    next
		    
		    
		    'p = CFArrayGetValueAtIndex( eventIDs, i )
		    'if CFNumberGetValue( p, kCFNumberLongType, mb ) then
		    'id = mb.UInt64Value( 0 )
		    'else
		    id = mb3.UInt64Value( i * 8 )
		    'end if
		    
		    QReport   id, ":", path, Hex( flags, 8 )
		    QReport   flagtext
		  next
		  
		  'for i as integer=0 to numEvents - 1
		  'mb = mb1.Ptr( i * 4 )
		  'if Abs( mb1.UInt32Value( i * 4 ))>10000 then
		  'path = mb.CString( 0 )
		  'else
		  'path = ""
		  'QReportError   "Bad address", mb1.UInt32Value( i * 4 )
		  'end if
		  '
		  'flags = mb2.UInt32Value( i * 4 )
		  'id = mb3.UInt64Value( i * 8 )
		  '
		  'QReport   id, ":", path, Hex( flags, 8 )
		  'next
		  
		  'typedef void ( *FSEventStreamCallback )(
		  'ConstFSEventStreamRef streamRef,
		  'void *clientCallBackInfo,
		  'size_t numEvents,
		  'void *eventPaths,
		  'const FSEventStreamEventFlags eventFlags[],
		  'const FSEventStreamEventId eventIds[]);
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Stop()
		  
		End Sub
	#tag EndMethod


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
