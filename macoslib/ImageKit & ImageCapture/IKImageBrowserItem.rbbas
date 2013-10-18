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
		  
		  dim p as Ptr = DelegateClassID
		  
		  Super.Constructor   Initialize( Allocate( p )), false
		  
		  CocoaDelegateMap.Value( self.id ) = new WeakRef( self )
		  
		  url = new NSURL( f )
		  
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
		  #pragma unused sender
		  
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
		  #pragma unused sender
		  
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
		  #pragma unused sender
		  
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
		  #pragma unused sender
		  
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
		  #pragma unused sender
		  
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
		Private Function FormatSize(size as UInt64, binary as Boolean = True) As String
		  //Copied from StringExtensions to remove dependency.
		  
		  //This is only a transient copy and will be removed later. DO NOT USE for development.
		  
		  if IsMountainLion and size >= 0 then
		    // Use Apple's official NSByteCountFormatter.
		    if binary then
		      return NSByteCountFormatter.ByteCountWithStyle( size, NSByteCountFormatter.CountStyle.Binary ) // 1k = 1024 bytes
		    else
		      return NSByteCountFormatter.ByteCountWithStyle( size, NSByteCountFormatter.CountStyle.Decimal ) // 1k = 1000 bytes
		    end if
		    
		  else
		    // Mimic Apple's results manually, and allow for negative numbers.
		    if size = 0 then
		      return "Zero KB"
		    end if
		    
		    dim KB as UInt64 = 1024
		    
		    if not binary then
		      KB = 1000 // Apple decimal format: 1K=1000 bytes
		    end if
		    
		    dim usize as UInt64 = Abs( size ) // Comparing with absolute values is easier then dealing with negative sizes.
		    
		    if usize < KB then
		      if usize = 1 then
		        return  Str( size ) + " byte"
		      else
		        return  Str( size ) + " bytes"
		      end if
		    end if
		    
		    if Round( usize / KB ) < KB then
		      return   Format( size / KB, "-#" ) + " KB"
		    end if
		    
		    dim MB as Int64 = KB * KB //A "Bitwise.ShiftLeft( KB, 10 )" is a little more efficient (6% speed increase) but it only works for 1024-multiples.
		    if Round( usize / MB ) < KB then
		      return   Format( size / MB, "-#.0" ) + " MB"
		    end if
		    
		    dim GB as Int64 = MB * KB
		    if Round( usize / GB ) < KB then
		      return   Format( size / GB, "-#.00" ) + " GB"
		    end if
		    
		    dim TB as Int64 = GB * KB
		    if Round( usize / TB ) < KB then
		      return   Format( size / TB, "-#.00" ) + " TB"
		    end if
		    
		    dim PB as Int64 = TB * KB
		    if Round( usize / PB ) < KB then
		      return   Format( size / PB, "-#.00" ) + " PB"
		    end if
		    
		    dim EB as Int64 = PB * KB
		    if Round( usize / EB ) < KB then
		      return   Format( size / EB, "-#.00" ) + " EB"
		    end if
		    
		    dim ZB as Int64 = EB * KB
		    if Round( usize / ZB ) < KB then
		      return   Format( size / ZB, "-#.00" ) + " ZB"
		    end if
		    
		    dim YB as Int64 = ZB * KB // I'm not currently aware of a format larger than the yottabyte, and Apple doesn't seem to return anything larger than 16 or 18.45 exabyte.
		    return    Format( size / YB, "-#.00" ) + " YB"
		    
		  end if
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

	#tag Method, Flags = &h0
		Function GetImageRepresentation() As NSObject
		  
		  return  Handle_imageRepresentation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageRepresentationType() As string
		  
		  return  Handle_ImageRepresentationType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_imageRepresentation() As NSObject
		  #if TargetMacOS
		    'QReport   CurrentMethodName
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
		    return  me.FormatSize( url.Item.Length )
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Handle_imageTitle() As String
		  #if TargetMacOS
		    dim s as string
		    s = url.LastPathComponent
		    return  NthField( s, ".", 1 )
		    
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
