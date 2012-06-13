#tag Class
Class NSNetServiceBrowser
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  me._id = NSObject.Initialize( NSObject.Allocate( "NSNetServiceBrowser" ))
		  SetDelegate
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidFindDomain(id as Ptr, sel as Ptr, cntl as Ptr, domain as Ptr, more as Boolean)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nss as NSString = new NSString( domain )
		      obj.HandleDidFindDomain   nss.StringValue, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidFindService(id as Ptr, sel as Ptr, cntl as Ptr, service as Ptr, more as Boolean)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nsns as NSNetService = new NSNetService( service, false )
		      obj.HandleDidFindservice   nsns, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotSearch(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotSearch  dict
		      
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDomain(id as Ptr, sel as Ptr, cntl as Ptr, domain as Ptr, more as Boolean)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nss as NSString = new NSString( domain )
		      obj.HandleDidRemoveDomain   nss.StringValue, more
		      
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveService(id as Ptr, sel as Ptr, cntl as Ptr, service as Ptr, more as Boolean)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      dim nsns as NSNetService = new NSNetService( service, false )
		      obj.HandleDidRemoveService   nsns, more
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidStopSearch(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetServiceBrowser = NSNetServiceBrowser( w.Value )
		    if obj <> nil then
		      obj.HandleDidStop
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As NSSearchField
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return NSSearchField(w.Value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FPtr(p as Ptr) As Ptr
		  //This function is a workaround for the inability to convert a Variant containing a delegate to Ptr:
		  //dim v as Variant = AddressOf Foo
		  //dim p as Ptr = v
		  //results in a TypeMismatchException
		  //So now I do
		  //dim v as Variant = FPtr(AddressOf Foo)
		  //dim p as Ptr = v
		  
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFindDomain(DomainName as string, moreComing as Boolean)
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidFindDomain", DomainName, moreComing )
		  end if
		  
		  RaiseEvent   DomainAdded  DomainName, moreComing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidFindService(Service as NSNetService, moreComing as Boolean)
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidFindService", service, moreComing )
		  end if
		  
		  RaiseEvent   ServiceAdded  Service.Name + " @ " + Service.HostName, Service.ServiceTXTDictionary, moreComing, Service
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotSearch(errDict as Dictionary)
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidNotSearch", errDict )
		  end if
		  
		  RaiseEvent   SearchError( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		  DReportError   "DidNotResolved", errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRemoveDomain(DomainName as string, moreComing as Boolean)
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidRemoveDomain", DomainName, moreComing )
		  end if
		  
		  RaiseEvent   DomainRemoved  DomainName, moreComing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidRemoveService(Service as NSNetService, moreComing as Boolean)
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidRemoveService", service, moreComing )
		  end if
		  
		  RaiseEvent   ServiceRemoved  Service.Name, moreComing, service
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidStop()
		  dim bc as BonjourControl = me.AttachedPropertyLookup( "ParentBonjourControl", nil )
		  
		  if bc<>nil then
		    bc.Private_HandleCallbacks( me, "DidStop" )
		  end if
		  
		  RaiseEvent   SearchStopped
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetCocoa
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append  "netServiceBrowser:didFindDomain:moreComing:" : FPtr( AddressOf  delegate_DidFindDomain ) : "v@:@@@"
		    methodList.Append  "netServiceBrowser:didRemoveDomain:moreComing:" : FPtr( AddressOf  delegate_DidRemoveDomain ) : "v@:@@@"
		    methodList.Append  "netServiceBrowser:didFindService:moreComing:" : FPtr( AddressOf  delegate_DidFindService ) : "v@:@@@"
		    methodList.Append  "netServiceBrowser:didRemoveService:moreComing:" : FPtr( AddressOf delegate_DidRemoveService ) : "v@:@@@"
		    methodList.Append  "netServiceBrowser:didNotSearch:" : FPtr ( AddressOf delegate_DidNotSearch ) : "v@:@@"
		    methodList.Append  "netServiceBrowserDidStopSearch:" : FPtr( AddressOf delegate_DidStopSearch ) : "v@:@"
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2))
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveFromRunLoop()
		  
		  #if TargetMacOS
		    declare sub removeFromRunLoop lib CocoaLib selector "removeFromRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Current
		    
		    removeFromRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSRunLoopCommonModes" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScheduleInRunLoop()
		  
		  #if TargetMacOS
		    declare sub scheduleInRunLoop lib CocoaLib selector "scheduleInRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Main
		    
		    scheduleInRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSDefaultRunLoopMode" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForAllServiceTypes(inDomain as string = "")
		  
		  
		  //dns-sd -B _services._dns-sd._udp .
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForBrowsableDomains()
		  //# Search for browsable domains. Results are reported asynchronously in DomainAdded and DomainRemoved events
		  
		  #if TargetMacOS
		    declare sub searchForBrowsableDomains lib CocoaLib selector "searchForBrowsableDomains" (id as Ptr)
		    
		    searchForBrowsableDomains( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchForServicesOfType(ServiceType as String, DomainName as string = "")
		  //# Search for available services of type ServiceType. Results are reported asynchronously in ServiceAdded and ServiceRemoved events.
		  
		  //@ The found/removed BonjourService object (as NSNetService) is passed to the events so you can store/remove it from, e.g. a ListBox. However, you do
		  //@ not need to store it as you can create another instance from the service name, type and domain.
		  
		  #if TargetMacOS
		    declare sub _searchForServicesOfType lib CocoaLib selector "searchForServicesOfType:inDomain:" (id as Ptr, type as CFStringRef, domain as CFStringRef)
		    
		    _searchForServicesOfType   me.id, ServiceType, DomainName
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function sockaddrToString(sockaddr as MemoryBlock) As string
		  
		  dim result as string
		  dim components() as string
		  dim port as integer
		  
		  sockaddr.LittleEndian = false
		  port = sockaddr.UInt16Value( 2 )
		  
		  select case sockaddr.Byte( 1 )
		  case 2 //IPv4
		    for i as integer = 4 to 7
		      components.Append   Str( sockaddr.Byte( i ))
		    next
		    result = Join( components, "." ) + ":" + Str( port )
		    
		  case 30 //IPv6
		    for i as integer = 8 to 22 step 2
		      if sockaddr.UInt16Value( i )=0 then
		        components.Append  ""
		      else
		        components.Append  Hex( sockaddr.UInt16Value( i ))
		      end if
		    next
		    //WARNING: this is not completely correct as only one "::" is allowed
		    result = "[" + Join( components, ":" ) + "]:" + Str( port )
		    
		  else
		    return ""
		    
		  end select
		  
		  return  result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopSearch()
		  //# Stop searching (either domains or services). When stopped, it fires the SearchStopped event
		  
		  #if TargetMacOS
		    declare sub _stop lib CocoaLib selector "stop" (id as Ptr)
		    
		    _stop  me.id
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DomainAdded(DomainName as string, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DomainRemoved(DomainName as string, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SearchError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SearchStopped()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceAdded(ServiceName as string, TXTDict as Dictionary, moreComing as Boolean, BonjourService as NSNetService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRemoved(ServiceName as string, moreComing as Boolean, BonjourService as NSNetService)
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSNetServiceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesActivityInProgress, Type = Double, Dynamic = False, Default = \"-72003", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesBadArgumentError, Type = Double, Dynamic = False, Default = \"-72004", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCancelledError, Type = Double, Dynamic = False, Default = \"-72005", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesCollisionError, Type = Double, Dynamic = False, Default = \"-72001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesInvalidError, Type = Double, Dynamic = False, Default = \"-72006", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesNotFoundError, Type = Double, Dynamic = False, Default = \"-72002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesTimeoutError, Type = Double, Dynamic = False, Default = \"-72007", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNetServicesUnknownError, Type = Double, Dynamic = False, Default = \"-72000", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
End Class
#tag EndClass
