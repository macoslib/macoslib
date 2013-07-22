#tag Class
Class NSMutableDictionary
Inherits NSDictionary
	#tag Method, Flags = &h1000
		Sub Add(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare sub addEntriesFromDictionary lib CocoaLib selector "addEntriesFromDictionary:" (obj_id as Ptr, otherDictionary as Ptr)
		    
		    if otherDictionary <> nil then
		      addEntriesFromDictionary self, otherDictionary
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendDictionary(dictToAppend as NSDictionary)
		  
		  #if TargetMacOS
		    declare sub addEntriesFromDictionary lib Cocoalib selector "addEntriesFromDictionary:" ( id as Ptr, value as Ptr )
		    
		    addEntriesFromDictionary( me.id, dictToAppend.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSMutableDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Delete all the values stored in the dictionary
		  
		  #if TargetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (id as Ptr)
		    
		    removeAllObjects   me.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" ( cls as Ptr, capacity as UInt32 ) as Ptr
		    
		    Super.Constructor( dictionaryWithCapacity( Cocoa.NSClassFromString( "NSMutableDictionary" ), 20 ), false )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    super.Constructor(initWithContentsOfFile(Allocate("NSMutableDictionary"), file.POSIXPath), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    super.Constructor(initWithDictionary(Allocate("NSMutableDictionary"), otherDictionary), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary, copyItems as Boolean)
		  
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:copyItems:" (obj_id as Ptr, otherDictionary as Ptr, flag as Boolean) as Ptr
		    
		    super.Constructor(initWithDictionary(Allocate("NSMutableDictionary"), otherDictionary, copyItems), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused otherDictionary
		    #pragma unused copyItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    super.Constructor(initWithObjects(Allocate("NSMutableDictionary"), objectsArray, keysArray), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSMutableDictionary"), aURL), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(numItems as UInt32)
		  
		  #if targetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (obj_id as Ptr, numItems as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(Allocate("NSMutableDictionary"), numItems), NSMutableDictionary.hasOwnership)
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionary_ lib CocoaLib selector "dictionary" (class_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionary_(ClassRef)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithCapacity(numItems as UInt32) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" (class_id as Ptr, numItems as UInt32) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithCapacity(ClassRef, numItems)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused numItems
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithDictionary(otherDictionary as NSDictionary) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithDictionary lib CocoaLib selector "dictionaryWithDictionary:" _
		    (class_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    if otherDictionary <> nil then
		      dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithFile(file as FolderItem) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfFile lib CocoaLib selector "dictionaryWithContentsOfFile:" _
		    (class_id as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfFile(ClassRef, file.POSIXPath)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObject(key as Ptr, anObject as Ptr) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithObject lib CocoaLib selector "dictionaryWithObject:forKey:" _
		    (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithObjects(keys() as NSObject, objects() as NSObject) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjects lib CocoaLib selector "dictionaryWithObjects:forKeys:" _
		    (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		    if dictRef <> nil then
		      return new NSMutableDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithURL(aURL as NSURL) As NSMutableDictionary
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfURL lib CocoaLib selector "dictionaryWithContentsOfURL:" _
		    (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfURL(ClassRef, aURL)
		      if dictRef <> nil then
		        return new NSMutableDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(otherDictionary as NSDictionary) As NSDictionary
		  
		  self.Add otherDictionary
		  return self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(keys as NSArray)
		  
		  #if targetMacOS
		    declare sub removeObjectsForKeys lib CocoaLib selector "removeObjectsForKeys:" (obj_id as Ptr, keys as Ptr)
		    
		    if keys <> nil then
		      removeObjectsForKeys self, keys
		    end if
		    
		  #else
		    #pragma unused keys
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as NSObject)
		  
		  #if TargetMacos
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" ( id as Ptr, key as Ptr )
		    
		    removeObjectForKey   me.id, key.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(key as Ptr)
		  
		  #if targetMacOS
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" (obj_id as Ptr, key as Ptr)
		    
		    removeObjectForKey self, key
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  #if targetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (obj_id as Ptr)
		    
		    removeAllObjects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare sub setDictionary lib CocoaLib selector "setDictionary:" (obj_id as Ptr, otherDictionary as Ptr)
		    
		    if otherDictionary <> nil then
		      setDictionary self, otherDictionary
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as variant, assigns newValue as NSObject)
		  
		  #if TargetMacOS
		    declare sub setObject lib Cocoalib selector "setObject:forKey:" ( id as Ptr, key as Ptr, value as Ptr )
		    
		    dim truekey as NSObject
		    
		    if key IsA NSObject then
		      truekey = key
		    else
		      truekey = Cocoa.NSObjectFromVariant( key )
		    end if
		    
		    setObject( me.id, newValue.id, truekey.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Value_(key as NSObject, assigns anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub setObject lib CocoaLib selector "setObject:forKey:" (obj_id as Ptr, anObject as Ptr, key as Ptr)
		    
		    dim objRef as Ptr
		    if anObject <> nil then
		      objRef = anObject
		    end if
		    
		    dim keyRef as Ptr
		    if key <> nil then
		      keyRef = key
		    end if
		    
		    setObject self, objRef, keyRef
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Value_(key as String, assigns anObject as NSObject)
		  
		  #if targetMacOS
		    declare sub setValue lib CocoaLib selector "setValue:forKey:" (obj_id as Ptr, anObject as Ptr, key as CFStringRef)
		    
		    dim objRef as Ptr
		    if anObject <> nil then
		      objRef = anObject
		    end if
		    
		    setValue self, objRef, key
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSDictionary"
		#tag EndViewProperty
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
