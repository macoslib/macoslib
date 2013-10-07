#tag Class
Class NSUserNotificationCenter
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = NSClassFromString("NSUserNotificationCenter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS then
		    declare function defaultUserNotificationCenter lib CocoaLib selector "defaultUserNotificationCenter" (obj_id as Ptr) as Ptr
		    
		    super.Constructor( defaultUserNotificationCenter( NSClassFromString("NSUserNotificationCenter") ), not hasOwnership )
		    SetDelegate
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_DidActivateNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      obj.HandleDidActivateNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_DidDeliverNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      obj.HandleDidDeliverNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_ShouldPresentNotification(id as Ptr, sel as Ptr, cntl as Ptr, notification as Ptr) As Boolean
		  #pragma unused sel
		  #pragma Unused cntl
		  
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey(id) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		    dim obj as NSUserNotificationCenter = NSUserNotificationCenter(w.Value)
		    if obj <> nil then
		      return obj.HandleShouldPresentNotification(new NSUserNotification(notification))
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeliveredNotifications() As NSUserNotification()
		  
		  #if TargetMacOS then
		    declare function deliveredNotifications lib CocoaLib selector "deliveredNotifications" (obj_id as Ptr) as Ptr
		    
		    dim n() as NSUserNotification
		    
		    dim ar as New NSArray( deliveredNotifications(self) )
		    
		    for i as Integer = 0 to ar.Count -1
		      n.Append New NSUserNotification( ar.Value(i) )
		    next
		    
		    return n
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeliverNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub deliverNotification lib CocoaLib selector "deliverNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim notificationRef as Ptr
		    if UserNotification <> nil then
		      notificationRef = UserNotification
		    end if
		    
		    deliverNotification self, notificationRef
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
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
		  
		  #if TargetMacOS then
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidActivateNotification(UserNotification as NSUserNotification)
		  RaiseEvent DidActivateNotification( UserNotification )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDidDeliverNotification(UserNotification as NSUserNotification)
		  RaiseEvent DidDeliverNotification( UserNotification )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleShouldPresentNotification(UserNotification as NSUserNotification) As Boolean
		  return RaiseEvent ShouldPresentNotification( UserNotification )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if TargetMacOS then
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      raise new ObjCException
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    dim methodList() as Tuple
		    methodList.Append "userNotificationCenter:didDeliverNotification:" : FPtr( AddressOf delegate_DidDeliverNotification ) : "v@:@@"
		    methodList.Append "userNotificationCenter:didActivateNotification:" : FPtr( AddressOf delegate_DidActivateNotification ) : "v@:@@"
		    methodList.Append "userNotificationCenter:shouldPresentNotification:" : FPtr( AddressOf delegate_ShouldPresentNotification ) : "B@:@@"
		    
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      if NOT class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2)) then
		        Raise new ObjCException
		      end if
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      dim e as new ObjCException
		      e.Message = CurrentMethodName + ". Couldn't create delegate"
		      raise  e
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllDeliveredNotifications()
		  
		  #if TargetMacOS then
		    declare sub removeAllDeliveredNotifications lib CocoaLib selector "removeAllDeliveredNotifications" (obj_id as Ptr)
		    
		    removeAllDeliveredNotifications(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveDeliveredNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub removeDeliveredNotification lib CocoaLib selector "removeDeliveredNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    removeDeliveredNotification(self, UserNotificationRef)
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveScheduledNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub removeScheduledNotification lib CocoaLib selector "removeScheduledNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    removeScheduledNotification(self, UserNotificationRef)
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScheduledNotifications() As NSUserNotification()
		  
		  #if TargetMacOS then
		    declare function scheduledNotifications lib CocoaLib selector "scheduledNotifications" (obj_id as Ptr) as Ptr
		    
		    dim n() as NSUserNotification
		    
		    dim ar as New NSArray( scheduledNotifications(self) )
		    
		    for i as Integer = 0 to ar.Count -1
		      n.Append New NSUserNotification( ar.Value(i) )
		    next
		    
		    return n
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScheduleNotification(UserNotification as NSUserNotification)
		  
		  #if TargetMacOS then
		    declare sub scheduleNotification lib CocoaLib selector "scheduleNotification:" (obj_id as Ptr, UserNotification as Ptr)
		    
		    dim UserNotificationRef as Ptr
		    if UserNotification <> Nil then
		      UserNotificationRef = UserNotification
		    end if
		    
		    scheduleNotification self, UserNotificationRef
		  #else
		    #pragma Unused UserNotification
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  
		  #if TargetMacOS then
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
		Event DidActivateNotification(notification as NSUserNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidDeliverNotification(notification as NSUserNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldPresentNotification(notification as NSUserNotification) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function deliveredNotifications lib CocoaLib selector "deliveredNotifications" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( deliveredNotifications(self) )
			  #endif
			End Get
		#tag EndGetter
		DeliveredNotifications As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function scheduledNotifications lib CocoaLib selector "scheduledNotifications" (obj_id as Ptr) as Ptr
			    
			    return New NSArray( scheduledNotifications(self) )
			  #endif
			End Get
		#tag EndGetter
		ScheduledNotifications As NSArray
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibNSUserNotificationCenterDelegate", Scope = Private
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
