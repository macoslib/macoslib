#tag Class
Protected Class IKImageBrowserItem
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(f as FolderItem)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false, checkForClass as string = "") -- From NSObject
		  
		  dim p as Ptr = DelegateClassID
		  
		  Super.Constructor   Initialize( Allocate( p )), false
		  
		  CocoaDelegateMap.Value( self.id ) = new WeakRef( self )
		  
		  'Super.Constructor   Initialize( Allocate( NSClassName )), true
		  
		  url = new NSURL( f )
		  
		  'if NOT f.Directory then
		  'nsi = new NSImage( url )
		  'else
		  'nsi = NSImage.Folder
		  'nsi.SetMaxSize( 512 )
		  'end if
		  '
		  'if nsi=nil OR nsi.id = nil then
		  'DReportWarning   "Couldn't load image", url.VariantValue
		  'end if
		  
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
		Private Shared Function delegate_imageRepresentation(id as Ptr, sel as Ptr, sender as Ptr) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserItem = IKImageBrowserItem( w.Value )
		      if obj <> nil then
		        return  obj.Handle_imageRepresentation.id
		        
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
		Private Shared Function delegate_imageRepresentationType(id as Ptr, sel as Ptr, sender as Ptr, index as integer) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserItem = IKImageBrowserItem( w.Value )
		      if obj <> nil then
		        dim nss as NSString = new NSString( obj.Handle_ImageRepresentationType )
		        return  nss.id
		        
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
		Private Shared Function delegate_ImageSubtitle(id as Ptr, sel as Ptr, sender as Ptr) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserItem = IKImageBrowserItem( w.Value )
		      if obj <> nil then
		        dim nss as NSString = new NSString( obj.Handle_ImageSubtitle )
		        return  nss.id
		        
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
		Private Shared Function delegate_ImageTitle(id as Ptr, sel as Ptr, sender as Ptr) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserItem = IKImageBrowserItem( w.Value )
		      if obj <> nil then
		        dim nss as NSString = new NSString( obj.Handle_ImageTitle )
		        return  nss.id
		        
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
		Private Shared Function delegate_ImageUID(id as Ptr, sel as Ptr, sender as Ptr) As Ptr
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  #if TargetMacOS
		    if CocoaDelegateMap.HasKey( id ) then
		      dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		      dim obj as IKImageBrowserItem = IKImageBrowserItem( w.Value )
		      if obj <> nil then
		        dim nss as NSString = new NSString( obj.Handle_ImageUID )
		        return  nss.id
		        
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
		Private Function Handle_imageRepresentation() As NSObject
		  #if TargetMacOS
		    QReport   CurrentMethodName
		    'return  nsi
		    return  url
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ImageRepresentationType() As string
		  #if TargetMacOS
		    'return  Cocoa.StringConstant( "IKImageBrowserNSImageRepresentationType" )
		    return  Cocoa.StringConstant( "IKImageBrowserNSURLRepresentationType" )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_imageSubtitle() As string
		  #if TargetMacOS
		    return  FormatSize( url.Item.Length )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_imageTitle() As String
		  #if TargetMacOS
		    return  url.LastPathComponent.StringBefore( "." )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_ImageUID() As string
		  #if TargetMacOS
		    return    url.absoluteString
		    
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
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString( "NSObject" ), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    
		    call   class_addProtocol( newClassId, objc_getProtocol( "IKImageBrowserItem" ))
		    
		    dim methodList() as Tuple
		    methodList.Append  "imageUID" : FPtr( AddressOf delegate_ImageUID ) : "@@:@"
		    methodList.Append  "imageRepresentationType" : FPtr ( AddressOf delegate_ImageRepresentationType ) : "@@:@"
		    methodList.Append  "imageRepresentation" : FPtr ( AddressOf delegate_ImageRepresentation ) : "@@:@"
		    methodList.Append  "imageTitle" : FPtr ( AddressOf delegate_ImageTitle ) : "@@:@"
		    methodList.Append  "imageSubtitle" : FPtr ( AddressOf delegate_ImageSubtitle ) : "@@:@"
		    
		    'Providing Optional Information for an Image
		    '– imageVersion
		    '– isSelectable
		    
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
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		nsi As NSImage
	#tag EndProperty

	#tag Property, Flags = &h0
		url As NSURL
	#tag EndProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserItemProtocol", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"macoslibIKImageBrowserItem", Scope = Private
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
