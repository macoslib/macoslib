#tag Class
Class FSEventStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as integer, opts as integer)
		  me._reference = ref
		  me._options = opts
		  
		  if gFSEventStreams=nil then
		    gFSEventStreams = new Dictionary
		  end if
		  
		  gFSEventStreams.Value( me.Reference ) = new WeakRef( me )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromListOfFolderItems(forFolders() as FolderItem, options as integer, latencyInSeconds as double, fromID as UInt64 = 0) As FSEventStream
		  
		  #if TargetMacOS
		    dim paths() as string
		    
		    for i as integer=0 to forFolders.Ubound
		      paths.Append  forFolders( i ).POSIXPath
		    next
		    
		    return  FSEventStream.CreateFromListOfPaths( paths, options, latencyInSeconds, fromID )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromListOfPaths(forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As FSEventStream
		  
		  soft declare function FSEventStreamCreate lib CarbonLib (alloc as Ptr, callback as Ptr, context as Ptr, Paths as Ptr, sinceWhen as UInt64, latency as double, flags as UInt32) as integer
		  
		  dim myStreamRef as integer
		  
		  dim Paths as CFArray = CFArray.CreateFromObjectsArray( forPaths )
		  
		  myStreamRef = FSEventStreamCreate( nil, AddressOf FSEventCallback, nil, Paths.Reference, IFTE( fromID=0, kFSEventStreamEventIdSinceNow, fromID ), latencyInSeconds, options )
		  
		  if myStreamRef=0 then
		    return  nil
		  end if
		  
		  return   new FSEventStream( myStreamRef, options )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindInstance(ref as integer) As FSEventStream
		  
		  dim wr as WeakRef
		  
		  if gFSEventStreams<>nil then
		    wr = gFSEventStreams.Lookup( ref, nil )
		    
		    if wr<>nil then
		      return   FSEventStream( wr.Value )
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushAsync()
		  #if TargetMacOS
		    soft declare sub FSEventStreamFlushAsync lib CarbonLib (streamref as integer)
		    
		    FSEventStreamFlushAsync   me.Reference
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushSync()
		  #if TargetMacOS
		    soft declare sub FSEventStreamFlushSync lib CarbonLib (streamref as integer)
		    
		    FSEventStreamFlushSync   me.Reference
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub FSEventCallback(streamRef as integer, clientCallbackInfo as Ptr, numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  dim stream as FSEventStream = FindInstance( streamref )
		  
		  if stream<>nil then
		    stream.HandleEvent   numEvents, eventPaths, eventFlags, eventIDs
		  end if
		  
		  'declare function CFArrayGetStringAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as CFStringRef
		  'declare function CFArrayGetValueAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as Ptr
		  'declare function CFNumberGetValue lib CarbonLib (nbr as Ptr, theType as integer, outValue as Ptr) as Boolean
		  '
		  'const kCFNumberIntType = 9
		  'const kCFNumberLongType = 10
		  '
		  ''dim id as CFArray = new CFArray( eventIDs, false )
		  ''dim paths as CFArray = new CFArray( eventPaths, false )
		  ''dim flags as CFArray = new CFArray( eventFlags, false )
		  '
		  'dim id as UInt64
		  'dim path as String
		  'dim flags as UInt32
		  'dim flagtext() as string
		  'dim mb as new MemoryBlock( 8 )
		  'dim mb1, mb2, mb3 as MemoryBlock
		  'dim p as Ptr
		  '
		  ''mb1 = eventPaths
		  'mb2 = eventFlags
		  'mb3 = eventIDs
		  '
		  ''QReport   Cocoa.NSObjectFromNSPtr( eventPaths )
		  '
		  'QReport  "numEvents:", numEvents
		  '
		  'for i as integer=0 to numEvents - 1
		  'path = CFArrayGetStringAtIndex( eventPaths, i )
		  '
		  ''p = CFArrayGetValueAtIndex( eventFlags, i )
		  ''if CFNumberGetValue( p, kCFNumberIntType, mb ) then
		  ''flags = mb.UInt32Value( 0 )
		  ''else
		  'flags = mb2.UInt32Value( i * 4 )
		  ''end if
		  '
		  'redim flagtext( -1 )
		  '
		  'for j as integer = 0 to 24
		  'if Bitwise.BitAnd( flags, Pow( 2, j ))<>0 then
		  'flagtext.Append   NthField( kFlagList, ",", j + 2 )
		  'end if
		  'next
		  '
		  '
		  ''p = CFArrayGetValueAtIndex( eventIDs, i )
		  ''if CFNumberGetValue( p, kCFNumberLongType, mb ) then
		  ''id = mb.UInt64Value( 0 )
		  ''else
		  'id = mb3.UInt64Value( i * 8 )
		  ''end if
		  '
		  'QReport   id, ":", path, Hex( flags, 8 )
		  'QReport   flagtext
		  'next
		  '
		  ''for i as integer=0 to numEvents - 1
		  ''mb = mb1.Ptr( i * 4 )
		  ''if Abs( mb1.UInt32Value( i * 4 ))>10000 then
		  ''path = mb.CString( 0 )
		  ''else
		  ''path = ""
		  ''QReportError   "Bad address", mb1.UInt32Value( i * 4 )
		  ''end if
		  ''
		  ''flags = mb2.UInt32Value( i * 4 )
		  ''id = mb3.UInt64Value( i * 8 )
		  ''
		  ''QReport   id, ":", path, Hex( flags, 8 )
		  ''next
		  '
		  ''typedef void ( *FSEventStreamCallback )(
		  ''ConstFSEventStreamRef streamRef,
		  ''void *clientCallBackInfo,
		  ''size_t numEvents,
		  ''void *eventPaths,
		  ''const FSEventStreamEventFlags eventFlags[],
		  ''const FSEventStreamEventId eventIds[]);
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEvent(numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  declare function CFArrayGetStringAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as CFStringRef
		  declare function CFArrayGetValueAtIndex lib CarbonLib alias "CFArrayGetValueAtIndex" (theArray as Ptr, idx as Integer) as Ptr
		  declare function CFNumberGetValue lib CarbonLib (nbr as Ptr, theType as integer, outValue as Ptr) as Boolean
		  
		  const kCFNumberIntType = 9
		  const kCFNumberLongType = 10
		  
		  dim id as UInt64
		  dim path as String
		  dim flags as UInt32
		  dim flagtext() as string
		  dim mb as new MemoryBlock( 8 )
		  dim mb1, mb2, mb3 as MemoryBlock
		  dim p as Ptr
		  dim arp() as string
		  dim arf() as int32
		  dim arid() as UInt64
		  dim f as FolderItem
		  
		  'mb1 = eventPaths
		  mb2 = eventFlags
		  mb3 = eventIDs
		  
		  'QReport   Cocoa.NSObjectFromNSPtr( eventPaths )
		  
		  QReport  "numEvents:", numEvents
		  
		  for i as integer=0 to numEvents - 1
		    path = CFArrayGetStringAtIndex( eventPaths, i )
		    
		    arp.Append   path
		    
		    f = new FolderItem( path, FolderItem.PathTypeShell )
		    
		    'p = CFArrayGetValueAtIndex( eventFlags, i )
		    'if CFNumberGetValue( p, kCFNumberIntType, mb ) then
		    'flags = mb.UInt32Value( 0 )
		    'else
		    flags = mb2.UInt32Value( i * 4 )
		    'end if
		    
		    arf.Append   flags
		    
		    redim flagtext( -1 )
		    
		    for j as integer = 0 to 24
		      if Bitwise.BitAnd( flags, RealBasic.Pow( 2, j ))<>0 then
		        flagtext.Append   NthField( kFlagList, ",", j + 2 )
		      end if
		    next
		    
		    
		    'p = CFArrayGetValueAtIndex( eventIDs, i )
		    'if CFNumberGetValue( p, kCFNumberLongType, mb ) then
		    'id = mb.UInt64Value( 0 )
		    'else
		    id = mb3.UInt64Value( i * 8 )
		    'end if
		    
		    arid.Append   id
		    
		    QReport   id, ":", path, Hex( flags, 8 )
		    if f<>nil AND f.exists then
		      QReport  "File inode:", f.inode
		    end if
		    QReport   flagtext
		  next
		  
		  RaiseEvent  FilesystemModified( arp, arf, arid )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleWithRunLoop()
		  #if TargetMacOS
		    soft declare sub FSEventStreamScheduleWithRunLoop lib CarbonLib (streamRef as integer, runLoop as Ptr, runLoopMode as CFStringRef )
		    
		    if me.State = kStateInitialized then
		      FSEventStreamScheduleWithRunLoop   me.Reference, CFRunLoop.Current.Reference, "kCFRunLoopDefaultMode"
		      me._state = kStateScheduled
		    else
		      raise  new macoslibException( "Could not schedule FSEventStream. Incompatible state" )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start() As Boolean
		  #if TargetMacOS
		    soft declare function FSEventStreamStart lib CarbonLib (streamref as integer) as Boolean
		    
		    if me.State = kStateScheduled OR me.State = kStateStopped then
		      dim OK as Boolean = FSEventStreamStart( me.Reference )
		      if OK then
		        me._state = kStateStarted
		      end if
		      return  OK
		    else
		      raise new macoslibException( "FSEventStream cannot be started. Incompatible state." )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if TargetMacOS
		    soft declare sub FSEventStreamStop lib CarbonLib (streamref as integer)
		    
		    if me.State = kStateStarted then
		      FSEventStreamStop   me.Reference
		      _State = kStateStopped
		    else
		      raise new macoslibException( "Cannot stop FSEventStream. Incompatible state." )
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FilesystemModified(alteredPaths() as string, eventFlags() as integer, eventIDs() as UInt64)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared gFSEventStreams As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return   _Reference
			End Get
		#tag EndGetter
		Reference As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  _State
			End Get
		#tag EndGetter
		State As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _options As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _Reference As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _State As Integer
	#tag EndProperty


	#tag Constant, Name = kStateInitialized, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateScheduled, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateStarted, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStateStopped, Type = Double, Dynamic = False, Default = \"3", Scope = Public
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
			Name="Reference"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="State"
			Group="Behavior"
			Type="Integer"
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
End Class
#tag EndClass
