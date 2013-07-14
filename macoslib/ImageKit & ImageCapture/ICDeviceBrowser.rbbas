#tag Class
Protected Class ICDeviceBrowser
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    'RequireFramework  IKLib
		    RequireFramework  ICLib
		    
		    'declare sub m_ICInitialize lib ICLib ()
		    '
		    '_ICInitialize
		    
		    self.Constructor(Initialize(Allocate( "ICDeviceBrowser")), hasOwnership)
		    self.SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create() As ICDeviceBrowser
		  #if TargetMacOS
		    dim result as ICDeviceBrowser
		    RequireFramework  IKLib
		    RequireFramework  ICLib
		    
		    dim p as Ptr
		    p = Initialize( Allocate( "ICDeviceBrowser" ))
		    if p<>nil then
		      result = new ICDeviceBrowser( p, True, "ICDeviceBrowser" )
		      result.SetDelegate
		    end if
		    
		    return  result
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
		Private Shared Sub delegate_DeviceDidChangeName(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser deviceDidChangeName:(ICDevice*)device
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidChangeSharingState(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser deviceDidChangeSharingState:(ICDevice*)device
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidAddDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr, moreComing as Boolean)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		    if obj <> nil then
		      obj.Handle_DidAddDevice   device, moreComing
		      
		    else
		      break
		    end if
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidEnumerateLocalDevices(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		    if obj <> nil then
		      obj.Handle_DidEnumerateLocalDevices
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr, moreGoing as boolean)
		  'deviceBrowser:(ICDeviceBrowser*)browser didRemoveDevice:(ICDevice*)device moreGoing:(BOOL)moreGoing
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  #pragma unused moreGoing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_RequestsSelectDevice(id as Ptr, sel as Ptr, sender as Ptr, device as Ptr)
		  'deviceBrowser:(ICDeviceBrowser*)browser requestsSelectDevice:(ICDevice*)device;
		  
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused device
		  
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
		Private Sub Handle_DidAddDevice(device as Ptr, moreComing as Boolean)
		  RaiseEvent DeviceAdded( ImageKit_ImageCapture.ICDeviceFromPtr( device ), moreComing )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidEnumerateLocalDevices()
		  RaiseEvent FinishedEnumeratingLocalDevices
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetCocoa
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    call   class_addProtocol( newClassId, objc_getProtocol( "ICDeviceBrowserDelegate" ))
		    
		    dim methodList() as Tuple
		    methodList.Append  "deviceBrowser:didAddDevice:moreComing:" : FPtr( AddressOf  delegate_DidAddDevice ) : "v@:@@B"
		    methodList.Append  "deviceBrowser:didRemoveDevice:moreGoing:" : FPtr( AddressOf  delegate_DidRemoveDevice ) : "v@:@@B"
		    methodList.Append  "deviceBrowser:deviceDidChangeName:" : FPtr( AddressOf  delegate_DeviceDidChangeName ) : "v@:@@"
		    methodList.Append  "deviceBrowser:deviceDidChangeSharingState:" : FPtr( AddressOf delegate_DeviceDidChangeSharingState ) : "v@:@@"
		    methodList.Append  "deviceBrowser:requestsSelectDevice:" : FPtr ( AddressOf delegate_RequestsSelectDevice ) : "v@:@@"
		    methodList.Append  "deviceBrowserDidEnumerateLocalDevices:" : FPtr( AddressOf delegate_DidEnumerateLocalDevices ) : "v@:@"
		    
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
		    setDelegate   self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  #if TargetMacOS
		    declare sub start lib ICLib selector "start" (id as Ptr)
		    
		    start( me.id )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  #if TargetMacOS
		    declare sub stop lib ICLib selector "stop" (id as Ptr)
		    
		    stop( me.id )
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DeviceAdded(device as ICDevice, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FinishedEnumeratingLocalDevices()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function devices lib ICLib selector "devices" (id as Ptr) as Ptr
			    
			    return  new NSArray( devices( me.id ), false )
			  #endif
			End Get
		#tag EndGetter
		Devices As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function browsedDeviceTypeMask lib ICLib selector "browsedDeviceTypeMask" (id as Ptr) as integer
			    
			    return  browsedDeviceTypeMask( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setBrowsedDeviceTypeMask lib ICLib selector "setBrowsedDeviceTypeMask:" (id as Ptr, value as integer)
			    
			    setBrowsedDeviceTypeMask( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		DeviceTypes As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isBrowsing lib ICLib selector "isBrowsing" (id as Ptr) as Boolean
			    
			    return  isBrowsing( me.id )
			  #endif
			End Get
		#tag EndGetter
		IsBrowsing As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = ClassName, Type = String, Dynamic = False, Default = \"ICDeviceBrowser", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibICDeviceBrowserDelegate", Scope = Private
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
			Name="DeviceTypes"
			Group="Behavior"
			Type="Integer"
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
			Name="IsBrowsing"
			Group="Behavior"
			Type="Boolean"
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
