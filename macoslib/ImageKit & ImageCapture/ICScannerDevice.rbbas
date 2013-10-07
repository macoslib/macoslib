#tag Class
Protected Class ICScannerDevice
Inherits ICDevice
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(id as Ptr, hasOwnership as boolean = false, checkForClass as string = "")
		  Super.Constructor(id, hasOwnership)
		  
		  if GetDelegate = nil then
		    SetDelegate
		  end if
		  
		  
		  #pragma unused checkForClass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidChangeName(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDevice = ICDevice( w.Value )
		  'if obj <> nil then
		  'obj.Handle_ChangedName
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidChangeSharingState(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDevice = ICDevice( w.Value )
		  'if obj <> nil then
		  'obj.Handle_ChangedSharingState
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidEncounterError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused error
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDevice = ICDevice( w.Value )
		  'if obj <> nil then
		  'obj.Handle_Error   error
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveButtonPress(id as Ptr, sel as Ptr, sender as Ptr, button as CFStringRef)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused button
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDevice = ICDevice( w.Value )
		  'if obj <> nil then
		  'obj.Handle_ButtonPressed   button
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveCustomNotification(id as Ptr, sel as Ptr, sender as Ptr, notification as Ptr, data as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused notification
		  #pragma unused data
		  
		  '#pragma stackOverflowChecking false
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveStatusInformation(id as Ptr, sel as Ptr, sender as Ptr, status as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused status
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDevice = ICDevice( w.Value )
		  'if obj <> nil then
		  'obj.Handle_StatusNotification   status
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidBecomeReady(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		  'if obj <> nil then
		  'obj.Handle_DeviceReady
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidCloseSessionWithError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused error
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		  'if obj <> nil then
		  'obj.Handle_DidCloseSession   error
		  '
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidOpenSessionWithError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  #pragma unused error
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		  'if obj <> nil then
		  'obj.Handle_DidOpenSession   error
		  '
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDevice(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  
		  '#pragma stackOverflowChecking false
		  '
		  'if CocoaDelegateMap.HasKey( id ) then
		  'dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		  'dim obj as ICDeviceBrowser = ICDeviceBrowser( w.Value )
		  'if obj <> nil then
		  'obj.Handle_DidRemoveDevice
		  '
		  'else
		  '//something might be wrong.
		  'end if
		  'else
		  '//something might be wrong.
		  'end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_didSelectFunctionalUnit(id as Ptr, sel as Ptr, sender as Ptr, unit as Ptr, error as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICScannerDevice = ICScannerDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_didSelectFunctionalUnit   unit, error
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_ScannerAvailable(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICScannerDevice = ICScannerDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_ScannerAvailable
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_didSelectFunctionalUnit(unit as Ptr, err as Ptr)
		  #pragma unused unit
		  #pragma unused err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ScannerAvailable()
		  RaiseEvent   ScannerAvailable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #pragma unused className
		  #pragma unused superclassName
		  
		  '//this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  '
		  '#if targetCocoa
		  'declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		  'declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		  'declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		  '
		  'dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		  'if newClassId = nil then
		  'raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		  'return nil
		  'end if
		  '
		  'objc_registerClassPair newClassId
		  '
		  'dim methodList() as Tuple
		  'methodList.Append  "scannerDeviceDidBecomeAvailable:" : FPtr( AddressOf  delegate_ScannerAvailable ) : "v@:@"
		  'methodList.Append  "scannerDevice:didSelectFunctionalUnit:error:" : FPtr( AddressOf  delegate_DidOpenSessionWithError ) : "v@:@@@"
		  'methodList.Append  "scannerDevice:didScanToURL:" : FPtr( AddressOf  delegate_DidBecomeReady ) : "v@:@@"
		  'methodList.Append  "scannerDevice:didScanToBandData:" : FPtr( AddressOf  delegate_DidCloseSessionWithError ) : "v@:@@"
		  'methodList.Append  "scannerDevice:didCompleteOverviewScanWithError:" : FPtr( AddressOf delegate_DeviceDidChangeName ) : "v@:@@"
		  'methodList.Append  "scannerDevice:didCompleteScanWithError:" : FPtr ( AddressOf delegate_DeviceDidChangeSharingState ) : "v@:@@"
		  '
		  ''methodList.Append  "didRemoveDevice:" : FPtr( AddressOf  delegate_DidRemoveDevice ) : "v@:@"
		  ''methodList.Append  "device:didOpenSessionWithError:" : FPtr( AddressOf  delegate_DidOpenSessionWithError ) : "v@:@@"
		  ''methodList.Append  "deviceDidBecomeReady:" : FPtr( AddressOf  delegate_DidBecomeReady ) : "v@:@"
		  ''methodList.Append  "device:didCloseSessionWithError:" : FPtr( AddressOf  delegate_DidCloseSessionWithError ) : "v@:@@"
		  ''methodList.Append  "deviceDidChangeName:" : FPtr( AddressOf delegate_DeviceDidChangeName ) : "v@:@"
		  ''methodList.Append  "deviceDidChangeSharingState:" : FPtr ( AddressOf delegate_DeviceDidChangeSharingState ) : "v@:@"
		  ''methodList.Append  "device:didReceiveStatusInformation:" : FPtr( AddressOf delegate_DeviceDidReceiveStatusInformation ) : "v@:@@"
		  ''methodList.Append  "device:didEncounterError:" : FPtr( AddressOf delegate_DeviceDidEncounterError ) : "v@:@@"
		  ''methodList.Append  "device:didReceiveButtonPress:" : FPtr( AddressOf delegate_DeviceDidReceiveButtonPress ) : "v@:@@"
		  ''methodList.Append  "device:didReceiveCustomNotification:data:" : FPtr( AddressOf delegate_DeviceDidReceiveCustomNotification ) : "v@:@@@"
		  '
		  'dim methodsAdded as Boolean = true
		  'for each item as Tuple in methodList
		  'methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2))
		  'next
		  '
		  'if methodsAdded then
		  'return newClassId
		  'else
		  'return nil
		  'end if
		  '
		  '#else
		  '#pragma unused className
		  '#pragma unused superClassName
		  '#endif
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
		    setDelegate self, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ScannerAvailable()
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibICScannerDeviceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"ICScannerDevice", Scope = Private
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
