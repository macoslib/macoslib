#tag Class
Class NSNetService
Inherits NSObject
	#tag Method, Flags = &h0
		Function Addresses() As String()
		  //# Return an array of all the addresses available to communicate with the distant service
		  
		  #if TargetMacOS
		    declare function addresses lib CocoaLib selector "addresses" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( addresses( me.id ), false )
		    dim nsd as NSData
		    dim result() as string
		    
		    DReportTitle  "Adresses:"
		    
		    for i as integer=0 to nsa.Count - 1
		      nsd = new NSData( nsa.Value( i ))
		      result.Append  sockaddrToString( nsd.Data )
		    next
		    
		    DReport  result
		    
		    return   result
		  #endif
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DataFromTXTRecordDictionary(dict as NSDictionary) As NSData
		  
		  #if TargetMacOS
		    declare function _dataFromTXTRecordDictionary lib CocoaLib selector "dataFromTXTRecordDictionary:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    p = _dataFromTXTRecordDictionary( Cocoa.NSClassFromString( "NSNetService" ), dict.id )
		    
		    if p<>nil then
		      return  new NSData( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotPublish(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotPublish   dict
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidNotResolve(id as Ptr, sel as Ptr, cntl as Ptr, err as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim NSdict as NSDictionary = new NSDictionary( err, false )
		      dim dict as Dictionary = NSDict.VariantValue
		      
		      obj.HandleDidNotResolve  dict
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidPublish(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidPublish
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidResolve(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      obj.HandleDidResolve
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidStop(id as Ptr, sel as Ptr, cntl as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
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
		Private Shared Sub delegate_DidUpdateTXTRecord(id as Ptr, sel as Ptr, cntl as Ptr, dataPtr as Ptr)
		  
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as NSNetService = NSNetService( w.Value )
		    if obj <> nil then
		      dim data as NSData = new NSData( dataPtr, false )
		      obj.HandleDidUpdateTXTRecord  data
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DictionaryFromTXTRecordData(data as NSData) As NSDictionary
		  
		  #if TargetMacOS
		    declare function _dictionaryFromTXTRecordData lib CocoaLib selector "dictionaryFromTXTRecordData:" ( Cls as Ptr, data as ptr ) as Ptr
		    
		    dim p as Ptr
		    
		    p = _dictionaryFromTXTRecordData( Cocoa.NSClassFromString( "NSNetService" ), data.id )
		    
		    if p<>nil then
		      return  new NSDictionary( p, false )
		    else
		      return  nil
		    end if
		    
		  #endif
		  
		End Function
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

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotPublish(errDict as Dictionary)
		  
		  RaiseEvent   DidNotPublish( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		  DReportError   "DidNotPublished", errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidNotResolve(errDict as Dictionary)
		  RaiseEvent   DidNotResolve( errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 ))
		  
		  DReportError   "DidNotResolved", errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorCode" ), 0 ), errDict.Lookup( Cocoa.StringConstant( "NSNetServicesErrorDomain" ), 0 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidPublish()
		  RaiseEvent   DidPublish
		  
		  DReport   "DidPublish"
		  
		  call  me.Addresses
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidResolve()
		  
		  RaiseEvent  DidResolve
		  
		  DReport  "DidResolve"
		  
		  call  me.Addresses
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidStop()
		  RaiseEvent   DidStop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidUpdateTXTRecord(data as NSData)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HostName() As String
		  
		  #if TargetMacOS
		    declare function _hostname lib CocoaLib selector "hostName" (id as Ptr) as CFStringRef
		    
		    return  _hostname( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function InitForPublishing(name as String, domain as string, type as string, port as integer) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:port:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef, port as Integer ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name, port )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function InitForResolving(name as String, domain as string, type as string) As NSNetService
		  
		  #if TargetMacOS
		    declare function initWithDomain lib CocoaLib selector "initWithDomain:type:name:port:" ( id as Ptr, domain as CFStringRef, type as CFStringRef, name as CFStringRef ) as Ptr
		    
		    dim p as Ptr = NSObject.Allocate( "NSNetService" )
		    dim nsns as NSNetService
		    
		    p = initWithDomain( p, domain, type, name )
		    
		    if p<>nil then
		      nsns = new NSNetService( p, false )
		      nsns.SetDelegate
		      return  nsns
		    end if
		  #endif
		  
		End Function
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
		    methodList.Append  "netService:didNotPublish:" : FPtr( AddressOf  delegate_DidNotPublish ) : "v@:@@"
		    methodList.Append  "netService:didNotResolve:" : FPtr( AddressOf  delegate_DidNotResolve ) : "v@:@@"
		    methodList.Append  "netService:didUpdateTXTRecordData:" : FPtr( AddressOf  delegate_DidUpdateTXTRecord ) : "v@:@@"
		    methodList.Append  "netServiceDidPublish:" : FPtr( AddressOf delegate_DidPublish ) : "v@:@"
		    methodList.Append  "netServiceDidResolveAddress:" : FPtr ( AddressOf delegate_DidResolve ) : "v@:@"
		    methodList.Append  "netServiceDidStop:" : FPtr( AddressOf delegate_DidStop ) : "v@:@"
		    
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

	#tag Method, Flags = &h0
		Function Name() As String
		  
		  #if TargetMacOS
		    declare function _name lib CocoaLib selector "name" (id as Ptr) as CFStringRef
		    
		    return  _name( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Publish(allowAutoRenaming as boolean = true)
		  
		  #if TargetMacOS
		    declare sub _publish lib CocoaLib selector "publish" ( id as Ptr )
		    'declare sub _publishWithOptions lib CocoaLib selector "publishWithOptions:" ( id as Ptr, opt as integer )
		    
		    '_publishWithOptions  me.id, IFTE( allowAutoRenaming, 0, 1 )
		    _publish me.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveFromRunLoop()
		  
		  #if TargetMacOS
		    declare sub removeFromRunLoop lib CocoaLib selector "removeFromRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Current
		    
		    removeFromRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSRunLoopCommonModes" )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resolve(timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    declare sub resolveWithTimeout lib CocoaLib selector "resolveWithTimeout:" ( id as Ptr, timeout as double )
		    
		    resolveWithTimeout   me.id, timeoutInSeconds
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleInRunLoop()
		  
		  #if TargetMacOS
		    declare sub scheduleInRunLoop lib CocoaLib selector "scheduleInRunLoop:forMode:" ( id as Ptr, aRunLoop as Ptr, mode as CFStringRef )
		    
		    dim nsrl as NSRunLoop = NSRunLoop.Main
		    
		    scheduleInRunLoop   me.id, nsrl.id, Cocoa.StringConstant( "NSDefaultRunLoopMode" )
		    
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


	#tag Hook, Flags = &h0
		Event DidNotPublish(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidNotResolve(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidPublish()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidResolve()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStop()
	#tag EndHook


	#tag Note, Name = Documentation
		The NSNetService object allows you to register a network service on the network or detect computers which provide the service you are looking for.
		
		DECLARING A SERVICE ON THE NETWORK: First create you Socket of ServerSocket to manage incoming connections. The create a NSNetService instance
		   with the shared method "InitForPublishing" and call "Publish". You will get the confirmation that your service has been properly registered in the
		   "DidPublish" event. If an error occurred, you will receive the error code in the "DidNotPublish" event.
		
		DETECTING A SERVICE ON THE NETWORK: see Documentation in the NSNetServiceBrowser class
		
		USING A SERVICE ON THE NETWORK: you do not need to use NSNetServiceBrowser to get a functional NSNetService that you can also create using the name,
		   type and domain of a service (if you know them) with the "InitForResolving" shared method
		
		CONNECTING TO A SERVICE: no matter how you get a NSNetService object, you first need to resolve the actual address(es) of the service. Depending on how many interfaces
		   are active (1 or 2 Ethernet cards, the WiFi network...) you will get a number of IPv4 and IPv6 addresses. Fortunately, you do not need to pick one when using
		   NSNetService. 
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary
			    
			    data = me.TXTData
			    nsd = NSNetService.DictionaryFromTXTRecordData( data )
			    
			    if nsd<>nil then
			      return   nsd.VariantValue
			    else
			      return  new Dictionary
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    dim data as NSData
			    dim nsd as NSDictionary = NSDictionary.CreateFromRSDictionary( value )
			    
			    data = NSNetService.DataFromTXTRecordDictionary( nsd )
			    
			    me.TXTData = data
			  #endif
			End Set
		#tag EndSetter
		ServiceTXTDictionary As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "TXTRecordData" (id as Ptr) as Ptr
			    
			    dim p as Ptr = TXTRecordData( me.id )
			    if p<>nil then
			      return   new NSData( p, false )
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function TXTRecordData lib CocoaLib selector "setTXTRecordData:" (id as Ptr, data as Ptr) as boolean
			    
			    dim OK as Boolean = TXTRecordData( me.id, value.id )
			    
			    if not OK then
			      break
			    end if
			  #endif
			End Set
		#tag EndSetter
		TXTData As NSData
	#tag EndComputedProperty


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
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompletionDelay"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
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
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
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
			Name="TabIndex"
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TokenizingCharacters"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
