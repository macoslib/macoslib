#tag Class
Class NSDictionary
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllKeys() As NSArray
		  #if TargetMacOS
		    declare function m_allKeys lib CocoaLib selector "allKeys" (id as Ptr) as Ptr
		    
		    return new NSArray(m_allKeys(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AllKeys(anObject as Ptr) As NSArray
		  //# Returns a new array containing the keys corresponding to all occurrences of a given object in the dictionary.
		  
		  #if targetMacOS
		    declare function allKeysForObject lib CocoaLib selector "allKeysForObject:" (obj_id as Ptr, anObject as Ptr) as Ptr
		    
		    dim arrayRef as Ptr = allKeysForObject(self, anObject)
		    if arrayRef <> nil then
		      return new NSArray(arrayRef)
		    end if
		    
		  #else
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllValues() As NSArray
		  #if TargetMacOS
		    declare function m_allValues lib CocoaLib selector "allValues" (id as Ptr) as Ptr
		    
		    return new NSArray(m_allValues(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSDictionary")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(file as FolderItem)
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  #if targetMacOS
		    declare function initWithContentsOfFile lib CocoaLib selector "initWithContentsOfFile:" (obj_id as Ptr, path as CFStringRef) as Ptr
		    
		    super.Constructor(initWithContentsOfFile(Allocate("NSDictionary"), file.POSIXPath), NSDictionary.hasOwnership)
		  #else
		    #pragma unused file
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys as NSArray, values as NSArray)
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjectsforKeys lib CocoaLib selector "dictionaryWithObjects:forKeys:" ( cls as Ptr, nsa1 as Ptr, nsa2 as Ptr ) as Ptr
		    
		    Super.Constructor( dictionaryWithObjectsforKeys( Cocoa.NSClassFromString( "NSDictionary" ), values.id, keys.id ), false )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(otherDictionary as NSDictionary)
		  //#
		  #if targetMacOS
		    declare function initWithDictionary lib CocoaLib selector "initWithDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    super.Constructor(initWithDictionary(Allocate("NSDictionary"), otherDictionary), NSDictionary.hasOwnership)
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys() as NSObject, objects() as NSObject)
		  //# Initializes a newly allocated dictionary with entries constructed from the contents of the objects and keys arrays.
		  
		  #if targetMacOS
		    declare function initWithObjects lib CocoaLib selector "initWithObjects:forKeys:" (obj_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    super.Constructor(initWithObjects(Allocate("NSDictionary"), objectsArray, keysArray), NSDictionary.hasOwnership)
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as NSURL)
		  //# Initializes a newly allocated dictionary using the keys and values found at a given URL.
		  
		  #if targetMacOS
		    declare function initWithContentsOfURL lib CocoaLib selector "initWithContentsOfURL:" (obj_id as Ptr, aURL as Ptr) as Ptr
		    
		    super.Constructor(initWithContentsOfURL(Allocate("NSDictionary"), aURL), NSDictionary.hasOwnership)
		  #else
		    #pragma unused aURL
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSDictionary
		  #if TargetMacOS
		    declare function m_copy lib CocoaLib selector "copy" (id as Ptr) as Ptr
		    
		    return   new NSDictionary( m_copy( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create() As NSDictionary
		  //# Creates and returns an empty dictionary.
		  
		  #if TargetMacOS
		    declare function dictionary_ lib CocoaLib selector "dictionary" (class_id as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionary_(ClassRef)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromDictionary(dict as Dictionary) As NSDictionary
		  #if TargetMacOS
		    dim md as new NSMutableDictionary
		    
		    if dict=nil then
		      return   nil
		    end if
		    
		    for i as integer = 0 to dict.Count - 1
		      md.Value( Cocoa.NSObjectFromVariant( dict.Key( i ))) = Cocoa.NSObjectFromVariant( dict.value( dict.key( i )))
		    next
		    
		    return   md.Copy
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromDictionary(otherDictionary as NSDictionary) As NSDictionary
		  //# Creates and returns a dictionary containing the keys and values from another given dictionary.
		  
		  #if TargetMacOS
		    declare function dictionaryWithDictionary lib CocoaLib selector "dictionaryWithDictionary:" _
		    (class_id as Ptr, otherDictionary as Ptr) as Ptr
		    
		    if otherDictionary <> nil then
		      dim dictRef as Ptr = dictionaryWithDictionary(ClassRef, otherDictionary)
		      if dictRef <> nil then
		        return new NSDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromFile(file as FolderItem) As NSDictionary
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfFile lib CocoaLib selector "dictionaryWithContentsOfFile:" (cls as Ptr, path as CFStringRef) as Ptr
		    
		    if file <> nil then
		      dim p as Ptr = dictionaryWithContentsOfFile( Cocoa.NSClassFromString( "NSDictionary" ), file.POSIXPath )
		      
		      if p<>nil then
		        return   new NSDictionary( p, false )
		      end if
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromObject(key as Ptr, anObject as Ptr) As NSDictionary
		  //# Creates and returns a dictionary containing a given key and value.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObject lib CocoaLib selector "dictionaryWithObject:forKey:" _
		    (class_id as Ptr, anObject as Ptr, key as Ptr) as Ptr
		    
		    dim dictRef as Ptr = dictionaryWithObject(ClassRef, anObject, key)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused key
		    #pragma unused anObject
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromObjects(keys() as NSObject, objects() as NSObject) As NSDictionary
		  //# Creates and returns a dictionary containing entries constructed from the contents of an array of keys and an array of values.
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjects lib CocoaLib selector "dictionaryWithObjects:forKeys:" _
		    (class_id as Ptr, objects as Ptr, keys as Ptr) as Ptr
		    
		    dim keysArray as new NSArray(keys)
		    dim objectsArray as new NSArray(objects)
		    
		    dim dictRef as Ptr = dictionaryWithObjects(ClassRef, objectsArray, keysArray)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		    #pragma unused objects
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromURL(aURL as NSURL) As NSDictionary
		  //# Creates and returns a dictionary using the keys and values found in a resource specified by a given URL.
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfURL lib CocoaLib selector "dictionaryWithContentsOfURL:" _
		    (class_id as Ptr, aURL as Ptr) as Ptr
		    
		    if aURL <> nil then
		      dim dictRef as Ptr = dictionaryWithContentsOfURL(ClassRef, aURL)
		      if dictRef <> nil then
		        return new NSDictionary(dictRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused aURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileCreationDate() As NSDate
		  //# Returns the value for the NSFileCreationDate key.
		  
		  #if targetMacOS
		    declare function fileCreationDate lib CocoaLib selector "fileCreationDate" (obj_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = fileCreationDate(self)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileExtensionHidden() As Boolean
		  //# Returns the value for the NSFileExtensionHidden key.
		  
		  #if targetMacOS
		    declare function fileExtensionHidden lib CocoaLib selector "fileExtensionHidden" (obj_id as Ptr) as Boolean
		    
		    return fileExtensionHidden(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileGroupOwnerAccountID() As NSNumber
		  //# Returns the value for the NSFileGroupOwnerAccountID key.
		  
		  #if targetMacOS
		    declare function fileGroupOwnerAccountID lib CocoaLib selector "fileGroupOwnerAccountID" (obj_id as Ptr) as Ptr
		    
		    dim numberRef as Ptr = fileGroupOwnerAccountID(self)
		    if numberRef <> nil then
		      return new NSNumber(numberRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileGroupOwnerAccountName() As String
		  //# Returns the value for the NSFileGroupOwnerAccountName key.
		  
		  #if targetMacOS
		    declare function fileGroupOwnerAccountName lib CocoaLib selector "fileGroupOwnerAccountName" (obj_id as Ptr) as CFStringRef
		    
		    return fileGroupOwnerAccountName(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileHFSCreatorCode() As OSType
		  //# Returns the value for the NSFileHFSCreatorCode key.
		  
		  #if targetMacOS
		    declare function fileHFSCreatorCode lib CocoaLib selector "fileHFSCreatorCode" (obj_id as Ptr) as OSType
		    
		    return fileHFSCreatorCode(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileHFSTypeCode() As OSType
		  //# Returns the value for the NSFileHFSTypeCode key.
		  
		  #if targetMacOS
		    declare function fileHFSTypeCode lib CocoaLib selector "fileHFSTypeCode" (obj_id as Ptr) as OSType
		    
		    return fileHFSTypeCode(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsAppendOnly() As Boolean
		  //# Returns the value for the NSFileAppendOnly key.
		  
		  #if targetMacOS
		    declare function fileIsAppendOnly lib CocoaLib selector "fileIsAppendOnly" (obj_id as Ptr) as Boolean
		    
		    return fileIsAppendOnly(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileIsImmutable() As Boolean
		  //# Returns the value for the NSFileImmutable key.
		  
		  #if targetMacOS
		    declare function fileIsImmutable lib CocoaLib selector "fileIsImmutable" (obj_id as Ptr) as Boolean
		    
		    return fileIsImmutable(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileModificationDate() As NSDate
		  //# Returns the value for the key NSFileModificationDate.
		  
		  #if targetMacOS
		    declare function fileModificationDate lib CocoaLib selector "fileModificationDate" (obj_id as Ptr) as Ptr
		    
		    dim dateRef as Ptr = fileModificationDate(self)
		    if dateRef <> nil then
		      return new NSDate(dateRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileOwnerAccountID() As NSNumber
		  //# Returns the value for the NSFileOwnerAccountID key.
		  
		  #if targetMacOS
		    declare function fileOwnerAccountID lib CocoaLib selector "fileOwnerAccountID" (obj_id as Ptr) as Ptr
		    
		    dim numberRef as Ptr = fileOwnerAccountID(self)
		    if numberRef <> nil then
		      return new NSNumber(numberRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileOwnerAccountName() As String
		  //# Returns the value for the key NSFileOwnerAccountName.
		  
		  #if targetMacOS
		    declare function fileOwnerAccountName lib CocoaLib selector "fileOwnerAccountName" (obj_id as Ptr) as CFStringRef
		    
		    return fileOwnerAccountName(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FilePosixPermissions() As UInt32
		  //# Returns the value for the key NSFilePosixPermissions.
		  
		  #if targetMacOS
		    declare function fileOwnerAccountName lib CocoaLib selector "fileOwnerAccountName" (obj_id as Ptr) as UInt32
		    
		    return fileOwnerAccountName(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSize() As UInt64
		  //# Returns the value for the key NSFileSize.
		  
		  #if targetMacOS
		    declare function fileSize lib CocoaLib selector "fileSize" (obj_id as Ptr) as UInt64
		    
		    return fileSize(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemFileNumber() As UInt32
		  //# Returns the value for the key NSFileSystemFileNumber.
		  
		  #if targetMacOS
		    declare function fileSystemFileNumber lib CocoaLib selector "fileSystemFileNumber" (obj_id as Ptr) as UInt32
		    
		    return fileSystemFileNumber(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileSystemNumber() As Integer
		  //# Returns the value for the key NSFileSystemNumber.
		  
		  #if targetMacOS
		    declare function fileSystemNumber lib CocoaLib selector "fileSystemNumber" (obj_id as Ptr) as Integer
		    
		    return fileSystemNumber(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function FileType() As String
		  //# Returns the value for the key NSFileType.
		  
		  #if targetMacOS
		    declare function fileType lib CocoaLib selector "fileType" (obj_id as Ptr) as CFStringRef
		    
		    return fileType(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as NSObject) As Boolean
		  
		  return   ( me.Value( key ) <> nil )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(otherDictionary as NSDictionary) As Boolean
		  //# Returns a Boolean value that indicates whether the contents of the receiving dictionary are equal to the contents of another given dictionary.
		  
		  #if targetMacOS
		    declare function isEqualToDictionary lib CocoaLib selector "isEqualToDictionary:" (obj_id as Ptr, otherDictionary as Ptr) as Boolean
		    
		    dim otherDictRef as Ptr
		    if otherDictionary <> nil then
		      otherDictRef = otherDictionary
		    end if
		    
		    return isEqualToDictionary(self, otherDictRef)
		  #else
		    #pragma unused otherDictionary
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function KeyEnumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each key in the dictionary.
		  
		  #if targetMacOS
		    declare function keyEnumerator lib CocoaLib selector "keyEnumerator" (obj_id as Ptr) as Ptr
		    
		    dim enumRef as Ptr = keyEnumerator(self)
		    if enumRef <> nil then
		      return new NSEnumerator(enumRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as NSObject, defaultValue as variant) As Variant
		  //# Get a value corresponding to a key of the passed defaukt value if not found
		  
		  #if TargetMacOS
		    Declare function objectForKey lib CocoaLib selector "objectForKey:" ( id as Ptr, key as Ptr ) as Ptr
		    
		    dim p as Ptr = objectForKey( me.id, key.id )
		    
		    if p=nil then
		      return  defaultValue
		    end if
		    
		    return   Cocoa.NSObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as Ptr, fallbackValue as Ptr) As Ptr
		  
		  dim lookupValue as Ptr = self.Value(key)
		  
		  if lookupValue <> nil then
		    return lookupValue
		  else
		    return fallbackValue
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as String, fallbackValue as Ptr) As Ptr
		  
		  dim lookupValue as Ptr = self.Value(key)
		  
		  if lookupValue <> nil then
		    return lookupValue
		  else
		    return fallbackValue
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Dictionary
		  
		  return self.VariantValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as variant) As Variant
		  //# Get a value corresponding to a key
		  
		  #if TargetMacOS
		    Declare function objectForKey lib CocoaLib selector "objectForKey:" ( id as Ptr, key as Ptr ) as Ptr
		    
		    dim trueKey as NSObject
		    
		    if key isa NSObject then
		      trueKey = Key
		    else
		      trueKey = Cocoa.NSObjectFromVariant( key )
		    end if
		    
		    dim p as Ptr = objectForKey( me.id, truekey.id )
		    
		    if p=nil then
		      return   nil
		    end if
		    
		    return   Cocoa.NSObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ValueEnumerator() As NSEnumerator
		  //# Returns an enumerator object that lets you access each value in the dictionary.
		  
		  #if targetMacOS
		    declare function objectEnumerator lib CocoaLib selector "objectEnumerator" (obj_id as Ptr) as Ptr
		    
		    dim enumRef as Ptr = objectEnumerator(self)
		    if enumRef <> nil then
		      return new NSEnumerator(enumRef)
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  // Create a RS Dictionary
		  
		  #if TargetMacOS
		    dim dict as new Dictionary
		    
		    dim keys as NSArray = me.AllKeys
		    dim values as NSArray = me.AllValues
		    dim oneKey, oneValue as objHasVariantValue
		    
		    for i as integer = 0 to keys.Count - 1
		      oneKey = Cocoa.NSObjectFromNSPtr( keys.Value( i ))
		      oneValue = Cocoa.NSObjectFromNSPtr( values.Value( i ))
		      
		      dict.Value( oneKey.VariantValue ) = oneValue.VariantValue
		    next
		    
		    return  dict
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(file as FolderItem, atomically as Boolean = true) As Boolean
		  //# Write the NSDictionary to 'file'. Returns true on success
		  
		  #if TargetMacOS
		    declare function writeToFile lib CocoaLib selector "writeToFile:atomically:" ( id as Ptr, path as CFStringRef, atomically as Boolean ) as Boolean
		    
		    return   writeToFile( me.id, file.POSIXPath, atomically )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function WriteToURL(aURL as NSURL, atomically as Boolean = true) As Boolean
		  //# Writes a property list representation of the contents of the dictionary to a given URL.
		  
		  #if targetMacOS
		    declare function writeToURL lib CocoaLib selector "writeToURL:atomically:" (obj_id as Ptr, aURL as Ptr, flag as Boolean) as Boolean
		    
		    dim urlRef as Ptr
		    if urlRef <> nil then
		      urlRef = aURL
		    end if
		    
		    return writeToURL(self, urlRef, atomically)
		  #else
		    #pragma unused aURL
		    #pragma unused atomically
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub _Constructor(cfd as CFDictionary)
		  // Adopts a CFDictionary
		  // Note: This shall m_not_ create a copy of the passed CFDictionary. For that, there's the Copy function
		  Super.Constructor(cfd)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function m_count lib CocoaLib selector "count" ( id as Ptr ) as UInt32
			    
			    return   m_count( me.id )
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
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
