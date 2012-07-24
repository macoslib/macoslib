#tag Class
Class FSEventStream
	#tag Method, Flags = &h0
		Sub Constructor(ref as integer)
		  me._reference = ref
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromListOfPaths(forPaths() as string, options as integer, latencyInSeconds as double, fromID as UInt64 = 0) As FSEventStream
		  
		  soft declare function FSEventStreamCreate lib CarbonLib (alloc as Ptr, callback as Ptr, context as Ptr, Paths as Ptr, sinceWhen as UInt64, latency as double, flags as UInt32) as integer
		  
		  dim myStreamRef as integer
		  
		  dim Paths as CFArray = CFArray.CreateFromObjectsArray( forPaths )
		  
		  myStreamRef = FSEventStreamCreate( nil, AddressOf FSEventCallback, nil, Paths.Reference, IFTE( fromID=0, kFSEventStreamEventIdSinceNow, fromID ), latencyInSeconds, options )
		  
		  if myStreamRef=0 then
		    return  nil
		  end if
		  
		  return   new FSEventStream( myStreamRef )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub FSEventCallback(streamRef as integer, clientCallbackInfo as Ptr, numEvents as integer, eventPaths as Ptr, eventFlags as Ptr, eventIDs as Ptr)
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

	#tag Method, Flags = &h0
		Sub ScheduleWithRunLoop()
		  #if TargetMacOS
		    soft declare sub FSEventStreamScheduleWithRunLoop lib CarbonLib (streamRef as integer, runLoop as Ptr, runLoopMode as CFStringRef )
		    
		    FSEventStreamScheduleWithRunLoop   me.Reference, CFRunLoop.Current.Reference, "kCFRunLoopDefaultMode"
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start() As Boolean
		  #if TargetMacOS
		    soft declare function FSEventStreamStart lib CarbonLib (streamref as integer) as Boolean
		    
		    return   FSEventStreamStart( me.Reference )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if TargetMacOS
		    soft declare sub FSEventStreamStop lib CarbonLib (streamref as integer)
		    
		    FSEventStreamStop   myStreamRef
		  #endif
		End Sub
	#tag EndMethod


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


End Class
#tag EndClass
