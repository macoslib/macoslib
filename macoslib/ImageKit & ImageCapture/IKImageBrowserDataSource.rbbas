#tag Class
Protected Class IKImageBrowserDataSource
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  dim p as Ptr = DelegateClassID
		  
		  Super.Constructor   Initialize( Allocate( p )), hasOwnership
		  
		  CocoaDelegateMap.Value( self.id ) = new WeakRef( self )
		  
		  'SetDelegate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ControlMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_GroupAtIndex(id as Ptr, sel as Ptr, sender as Ptr, index as integer) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_GroupAtIndex( index )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_ItemAtIndex(id as Ptr, sel as Ptr, sender as Ptr, index as UInt32) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_ItemAtIndex( index )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_MoveItems(id as Ptr, sel as Ptr, sender as Ptr, indexes as Ptr, toIndex as integer) As Boolean
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_MoveItems( new NSIndexSet( indexes ), toIndex )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_NumberOfGroups(id as Ptr, sel as Ptr, sender as Ptr) As integer
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_NumberOfGroups
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_NumberOfItems(id as Ptr, sel as Ptr, sender as Ptr) As integer
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        return  obj.Handle_NumberOfItems
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_RemoveItems(id as Ptr, sel as Ptr, sender as Ptr, indexSet as Ptr)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        obj.Handle_RemoveItems   new NSIndexSet( indexSet )
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function delegate_WriteToPasteboard(id as Ptr, sel as Ptr, sender as Ptr, indexSet as Ptr, pboard as Ptr) As integer
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserDataSource = IKImageBrowserDataSource( w.Value )
		      if obj <> nil then
		        'obj.Handle_RemovedItems   indexSet
		        return 0
		        
		      else
		        //something might be wrong.
		      end if
		    else
		      //something might be wrong.
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As IKDeviceBrowserView
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return IKDeviceBrowserView( w.Value )
		  
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
		    
		    return delegate_(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_GroupAtIndex(index as integer) As Ptr
		  #if TargetMacOS
		    return  RaiseEvent GroupAtIndex( index )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ItemAtIndex(index as integer) As IKImageBrowserItem
		  #if TargetMacOS
		    return  RaiseEvent ItemAtIndex( index )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_MoveItems(indexes as NSIndexSet, toIndex as integer) As Boolean
		  #if TargetMacOS
		    return  RaiseEvent MoveItems( indexes, toIndex )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_NumberOfGroups() As integer
		  #if TargetMacOS
		    return  RaiseEvent CountGroups
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_NumberOfItems() As integer
		  #if TargetMacOS
		    return  RaiseEvent CountItems
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_RemoveItems(indexes as NSIndexSet)
		  #if TargetMacOS
		    RaiseEvent  RemoveItems( indexes )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAtIndex(index as integer) As IKImageBrowserItem
		  #if TargetMacOS
		    return  Handle_ItemAtIndex( index )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  #if targetMacOS
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString( superclassName ), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    call   class_addProtocol( newClassId, objc_getProtocol( "IKImageBrowserDataSource" ))
		    
		    dim methodList() as Tuple
		    methodList.Append  "numberOfItemsInImageBrowser:" : FPtr( AddressOf delegate_NumberOfItems ) : "i@:@"
		    methodList.Append  "imageBrowser:itemAtIndex:" : FPtr ( AddressOf delegate_ItemAtIndex ) : "@@:@i"
		    methodList.Append  "imageBrowser:removeItemsAtIndexes:" : FPtr( AddressOf delegate_RemoveItems ) : "v@:@@"
		    methodList.Append  "imageBrowser:moveItemsAtIndexes:toIndex:" : FPtr ( AddressOf delegate_MoveItems ) : "B@:@@I"
		    'methodList.Append  "imageBrowser:writeItemsAtIndexes:toPasteboard:" : FPtr( AddressOf delegate_WriteToPasteboard ) : "v@:@@@"
		    methodList.Append  "numberOfGroupsInImageBrowser:" : FPtr ( AddressOf delegate_NumberOfGroups ) : "I@:@"
		    methodList.Append  "imageBrowser:groupAtIndex:" : FPtr( AddressOf delegate_GroupAtIndex ) : "@@:@I"
		    
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2))
		    next
		    
		    if methodsAdded then
		      return newClassId
		    else
		      break
		      return nil
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CountGroups() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CountItems() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GroupAtIndex(index as integer) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemAtIndex(index as integer) As IKImageBrowserItem
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MoveItems(indexes as NSIndexSet, toIndex as integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RemoveItems(indexes as NSIndexSet)
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserDataSourceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserDataSource", Scope = Private
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
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
