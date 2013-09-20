#tag Class
Class NSURL
Inherits NSObject
	#tag Method, Flags = &h1000
		Function AppendComponent(pathComponent as String) As NSURL
		  
		  #if targetMacOS
		    declare function URLByAppendingPathComponent lib CocoaLib selector "URLByAppendingPathComponent:" (obj_id as Ptr, pathComponent as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLByAppendingPathComponent(self, pathComponent)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused pathComponent
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AppendComponent(pathComponent as String, isDirectory as Boolean) As NSURL
		  
		  #if targetMacOS
		    declare function URLByAppendingPathComponent lib CocoaLib selector "URLByAppendingPathComponent:isDirectory:" _
		    (obj_id as Ptr, pathComponent as CFStringRef, isDir as Boolean) as Ptr
		    
		    dim urlRef as Ptr = URLByAppendingPathComponent(self, pathComponent, isDirectory)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused pathComponent
		    #pragma unused isDirectory
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function AppendExtension(pathExtension as String) As NSURL
		  
		  #if targetMacOS
		    declare function URLByAppendingPathExtension lib CocoaLib selector "URLByAppendingPathExtension:" (obj_id as Ptr, pathExtension as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLByAppendingPathExtension(self, pathExtension)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused pathExtension
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BaseURL() As NSURL
		  
		  #if targetMacOS
		    declare function baseURL lib CocoaLib selector "baseURL" (obj_id as Ptr) as Ptr
		    
		    dim urlRef as Ptr = baseURL(self)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function BookmarkData(bookmarkFileURL as NSURL, byRef error as CFError) As NSData
		  
		  #if targetMacOS
		    declare function bookmarkDataWithContentsOfURL lib CocoaLib selector "bookmarkDataWithContentsOfURL:error:" _
		    (class_id as Ptr, bookmarkFileURL as Ptr, byRef error as Ptr) as Ptr
		    
		    dim bookmarkURLRef as Ptr
		    if bookmarkFileURL <> nil then
		      bookmarkURLRef = bookmarkFileURL
		    end if
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    dim dataRef as Ptr = bookmarkDataWithContentsOfURL(ClassRef, bookmarkURLRef, errorRef)
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused bookmarkFileURL
		    #pragma unused error
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function BookmarkData(options as UInt32, resourceValuesKeys() as String, relativeURL as NSURL) As NSData
		  
		  #if targetMacOS
		    declare function bookmarkDataWithOptions lib CocoaLib selector "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:" _
		    (obj_id as Ptr, options as UInt32, resourceValuesKeys as Ptr, relativeURL as Ptr, byRef error as Ptr) as Ptr
		    
		    dim keysArray as NSArray
		    dim keysRef as Ptr
		    if resourceValuesKeys.ubound < -1 then
		      keysArray = new NSArray(resourceValuesKeys)
		      keysRef = keysArray
		    end if
		    
		    dim relativeURLRef as Ptr
		    if relativeURL <> nil then
		      relativeURLRef = relativeURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    dim dataRef as Ptr = bookmarkDataWithOptions(self, options, keysRef, relativeURLRef, errorRef)
		    
		    if errorRef <> nil then
		      mLastError = new CFError(errorRef, false)
		    end if
		    
		    if dataRef <> nil then
		      return new NSData(dataRef)
		    end if
		    
		  #else
		    #pragma unused options
		    #pragma unused resourceValuesKeys
		    #pragma unused relativeURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSURL")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  if not (f is nil) then
		    self.Constructor  f.URLPath
		  else
		    raise new NilObjectException
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(bookmarkData as NSData, options as UInt32, relativeURL as NSURL, isStale as Boolean)
		  
		  #if targetMacOS
		    declare function initByResolvingBookmarkData lib CocoaLib selector "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:" _
		    (obj_id as Ptr, bookmarkData as Ptr, options as UInt32, relativeURL as Ptr, isStale as Boolean, byRef error as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if bookmarkData <> nil then
		      dataRef = bookmarkData
		    end if
		    
		    dim relativeURLRef as Ptr
		    if relativeURL <> nil then
		      relativeURLRef = relativeURL
		    end if
		    
		    dim errorRef as Ptr
		    
		    super.Constructor(initByResolvingBookmarkData(Allocate("NSURL"), dataRef, options, relativeURLRef, isStale, errorRef), NSURL.hasOwnership)
		    
		    if errorRef <> nil then
		      mLastError = new CFError(errorRef, false)
		    end if
		    
		  #else
		    #pragma unused bookmarkData
		    #pragma unused options
		    #pragma unused relativeURL
		    #pragma unused isStale
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theURL as String)
		  #if targetMacOS
		    declare function URLWithString lib CocoaLib selector "URLWithString:" ( id as Ptr, URLString as CFStringRef ) as Ptr
		    
		    super.Constructor URLWithString( Cocoa.NSClassFromString( "NSURL" ), theURL ), false
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(URLString as String, baseURL as NSURL)
		  
		  #if targetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:relativeToURL:" (obj_id as Ptr, URLString as CFStringRef, baseURL as Ptr) as Ptr
		    
		    dim baseURLRef as Ptr
		    if baseURL <> nil then
		      baseURLRef = baseURL
		    end if
		    
		    super.Constructor(initWithString(Allocate("NSURL"), URLString, baseURLRef), NSURL.hasOwnership)
		    
		  #else
		    #pragma unused URLString
		    #pragma unused baseURL
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(scheme as String, host as String, path as String)
		  
		  #if targetMacOS
		    declare function initWithScheme lib CocoaLib selector "initWithScheme:host:path:" (obj_id as Ptr, scheme as CFStringRef, host as CFStringRef, path as CFStringRef) as Ptr
		    
		    super.Constructor(initWithScheme(Allocate("NSURL"), scheme, host, path), NSURL.hasOwnership)
		    
		  #else
		    #pragma unused scheme
		    #pragma unused host
		    #pragma unused path
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function Create(URLString as String, baseURL as NSURL) As NSURL
		  
		  #if targetMacOS
		    declare function URLWithString lib CocoaLib selector "URLWithString:relativeToURL:" (class_id as Ptr, URLString as CFStringRef, baseURL as Ptr) as Ptr
		    
		    dim baseURLRef as Ptr
		    if baseURL <> nil then
		      baseURLRef = baseURL
		    end if
		    
		    dim urlRef as Ptr = URLWithString(ClassRef, URLString, baseURLRef)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused URLString
		    #pragma unused baseURL
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateFromPasteboard(pboard as NSPasteboard) As NSURL
		  
		  #if targetMacOS
		    declare function URLFromPasteboard lib CocoaLib selector "URLFromPasteboard:" (class_id as Ptr, pboard as Ptr) as Ptr
		    
		    dim urlRef as Ptr = URLFromPasteboard(ClassRef, pboard)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused pboard
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithBookmark(bookmarkData as NSData, options as UInt32, relativeURL as NSURL, isStale as Boolean, byRef error as CFError) As NSURL
		  
		  #if targetMacOS
		    declare function URLByResolvingBookmarkData lib CocoaLib selector "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:" _
		    (class_id as Ptr, bookmarkData as Ptr, options as UInt32, relativeURL as Ptr, isStale as Boolean, byRef error as Ptr) as Ptr
		    
		    dim dataRef as Ptr
		    if bookmarkData <> nil then
		      dataRef = bookmarkData
		    end if
		    
		    dim relativeURLRef as Ptr
		    if relativeURL <> nil then
		      relativeURLRef = relativeURL
		    end if
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    dim urlRef as Ptr = URLByResolvingBookmarkData(ClassRef, dataRef, options, relativeURLRef, isStale, errorRef)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused bookmarkData
		    #pragma unused options
		    #pragma unused relativeURL
		    #pragma unused isStale
		    #pragma unused error
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithFile(file as FolderItem) As NSURL
		  
		  #if targetMacOS
		    declare function fileURLWithPath lib CocoaLib selector "fileURLWithPath:isDirectory:" (class_id as Ptr, path as CFStringRef, isDir as Boolean) as Ptr
		    
		    if file <> nil then
		      dim urlRef as Ptr = fileURLWithPath(ClassRef, file.POSIXPath, file.directory)
		      if urlRef <> nil then
		        return new NSURL(urlRef)
		      end if
		    end if
		    
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function CreateWithString(URLString as String) As NSURL
		  
		  #if targetMacOS
		    declare function URLWithString lib CocoaLib selector "URLWithString:" (class_id as Ptr, URLString as CFStringRef) as Ptr
		    
		    dim urlRef as Ptr = URLWithString(ClassRef, URLString)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #else
		    #pragma unused URLString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DeleteExtension() As NSURL
		  
		  #if targetMacOS
		    declare function URLByDeletingPathExtension lib CocoaLib selector "URLByDeletingPathExtension" (obj_id as Ptr) as Ptr
		    
		    dim urlRef as Ptr = URLByDeletingPathExtension(self)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function DeleteLastComponent() As NSURL
		  
		  #if targetMacOS
		    declare function URLByDeletingLastPathComponent lib CocoaLib selector "URLByDeletingLastPathComponent" (obj_id as Ptr) as Ptr
		    
		    dim urlRef as Ptr = URLByDeletingLastPathComponent(self)
		    if urlRef <> nil then
		      return new NSURL(urlRef)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function IsEqual(anObject as Ptr) As Boolean
		  
		  #if targetMacOS
		    declare function isEqual lib CocoaLib selector "isEqual:" (obj_id as Ptr, anObject as Ptr) as Boolean
		    
		    return isEqual(self, anObject)
		    
		  #else
		    #pragma unused anObject
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function KeyList() As String()
		  return kKeyList.Split(EndOfLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSFTPPropertyActiveTransferModeKey() As String
		  
		  return Cocoa.StringConstant("NSFTPPropertyActiveTransferModeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSFTPPropertyFileOffsetKey() As String
		  
		  return Cocoa.StringConstant("NSFTPPropertyFileOffsetKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSFTPPropertyFTPProxy() As String
		  
		  return Cocoa.StringConstant("NSFTPPropertyFTPProxy")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSFTPPropertyUserLoginKey() As String
		  
		  return Cocoa.StringConstant("NSFTPPropertyUserLoginKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSFTPPropertyUserPasswordKey() As String
		  
		  return Cocoa.StringConstant("NSFTPPropertyUserPasswordKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyErrorPageDataKey() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyErrorPageDataKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyHTTPProxy() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyHTTPProxy")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyRedirectionHeadersKey() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyRedirectionHeadersKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyServerHTTPVersionKey() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyServerHTTPVersionKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyStatusCodeKey() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyStatusCodeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSHTTPPropertyStatusReasonKey() As String
		  
		  return Cocoa.StringConstant("NSHTTPPropertyStatusReasonKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLAttributeModificationDateKey() As String
		  
		  return Cocoa.StringConstant("NSURLAttributeModificationDateKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLContentAccessDateKey() As String
		  
		  return Cocoa.StringConstant("NSURLContentAccessDateKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLContentModificationDateKey() As String
		  
		  return Cocoa.StringConstant("NSURLContentModificationDateKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLCreationDateKey() As String
		  
		  return Cocoa.StringConstant("NSURLCreationDateKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLCustomIconKey() As String
		  
		  return Cocoa.StringConstant("NSURLCustomIconKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLEffectiveIconKey() As String
		  
		  return Cocoa.StringConstant("NSURLEffectiveIconKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileAllocatedSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLFileAllocatedSizeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceIdentifierKey() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceIdentifierKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeBlockSpecial() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeBlockSpecial")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeCharacterSpecial() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeCharacterSpecial")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeDirectory() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeDirectory")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeKey() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeNamedPipe() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeNamedPipe")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeRegular() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeRegular")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeSocket() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeSocket")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeSymbolicLink() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeSymbolicLink")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileResourceTypeUnknown() As String
		  
		  return Cocoa.StringConstant("NSURLFileResourceTypeUnknown")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileScheme() As String
		  
		  return Cocoa.StringConstant("NSURLFileScheme")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileSecurityKey() As String
		  
		  return Cocoa.StringConstant("NSURLFileSecurityKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLFileSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLFileSizeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLHasHiddenExtensionKey() As String
		  
		  return Cocoa.StringConstant("NSURLHasHiddenExtensionKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsAliasFileKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsAliasFileKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsDirectoryKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsDirectoryKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsExecutableKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsExecutableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsHiddenKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsHiddenKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsMountTriggerKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsMountTriggerKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsPackageKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsPackageKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsReadableKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsReadableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsRegularFileKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsRegularFileKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsSymbolicLinkKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsSymbolicLinkKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsSystemImmutableKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsSystemImmutableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsUbiquitousItemKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsUbiquitousItemKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsUserImmutableKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsUserImmutableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsVolumeKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsVolumeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLIsWritableKey() As String
		  
		  return Cocoa.StringConstant("NSURLIsWritableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLKeysOfUnsetValuesKey() As String
		  
		  return Cocoa.StringConstant("NSURLKeysOfUnsetValuesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLabelColorKey() As String
		  
		  return Cocoa.StringConstant("NSURLLabelColorKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLabelNumberKey() As String
		  
		  return Cocoa.StringConstant("NSURLLabelNumberKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLinkCountKey() As String
		  
		  return Cocoa.StringConstant("NSURLLinkCountKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLocalizedLabelKey() As String
		  
		  return Cocoa.StringConstant("NSURLLocalizedLabelKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLocalizedNameKey() As String
		  
		  return Cocoa.StringConstant("NSURLLocalizedNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLLocalizedTypeDescriptionKey() As String
		  
		  return Cocoa.StringConstant("NSURLLocalizedTypeDescriptionKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLNameKey() As String
		  
		  return Cocoa.StringConstant("NSURLNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLParentDirectoryURLKey() As String
		  
		  return Cocoa.StringConstant("NSURLParentDirectoryURLKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLPreferredIOBlockSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLPreferredIOBlockSizeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLTotalFileAllocatedSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLTotalFileAllocatedSizeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLTotalFileSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLTotalFileSizeKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLTypeIdentifierKey() As String
		  
		  return Cocoa.StringConstant("NSURLTypeIdentifierKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemHasUnresolvedConflictsKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemHasUnresolvedConflictsKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemIsDownloadedKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemIsDownloadedKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemIsDownloadingKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemIsDownloadingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemIsUploadedKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemIsUploadedKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemIsUploadingKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemIsUploadingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemPercentDownloadedKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemPercentDownloadedKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLUbiquitousItemPercentUploadedKey() As String
		  
		  return Cocoa.StringConstant("NSURLUbiquitousItemPercentUploadedKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeAvailableCapacityKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeAvailableCapacityKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeCreationDateKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeCreationDateKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIdentifierKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIdentifierKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsAutomountedKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsAutomountedKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsBrowsableKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsBrowsableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsEjectableKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsEjectableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsInternalKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsInternalKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsJournalingKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsJournalingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsLocalKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsLocalKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsReadOnlyKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsReadOnlyKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeIsRemovableKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsRemovableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeLocalizedFormatDescriptionKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeLocalizedFormatDescriptionKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeLocalizedNameKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeLocalizedNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeMaximumFileSizeKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeIsBrowsableKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeNameKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeNameKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeResourceCountKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeResourceCountKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsAdvisoryFileLockingKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsAdvisoryFileLockingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsCasePreservedNamesKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsCasePreservedNamesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsCaseSensitiveNamesKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsCaseSensitiveNamesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsExtendedSecurityKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsExtendedSecurityKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsHardLinksKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsHardLinksKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsJournalingKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsJournalingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsPersistentIDsKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsPersistentIDsKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsRenamingKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsRenamingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsRootDirectoryDatesKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsRootDirectoryDatesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsSparseFilesKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsSparseFilesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsSymbolicLinksKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsSymbolicLinksKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsVolumeSizesKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsVolumeSizesKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeSupportsZeroRunsKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeSupportsZeroRunsKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeTotalCapacityKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeTotalCapacityKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeURLForRemountingKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeURLForRemountingKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeURLKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeURLKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NSURLVolumeUUIDStringKey() As String
		  
		  return Cocoa.StringConstant("NSURLVolumeUUIDStringKey")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		  return self.AbsoluteString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(URLString as String)
		  
		  self.Constructor(URLString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PathComponents() As String()
		  
		  #if targetMacOS
		    declare function pathComponents lib CocoaLib selector "pathComponents" (obj_id as Ptr) as Ptr
		    
		    dim rb_array() as String
		    
		    dim arrayRef as Ptr = pathComponents(self)
		    if arrayRef <> nil then
		      rb_array = new NSArray(arrayRef)
		    end if
		    
		    return rb_array
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay, modified by Vidal v. Bergen.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as CFStringRef
		    
		    return pathExtension(self)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ResourceSpecifier() As String
		  
		  #if targetMacOS
		    declare function resourceSpecifier lib CocoaLib selector "resourceSpecifier" (obj_id as Ptr) as CFStringRef
		    
		    return resourceSpecifier(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceValue(forKey as string) As NSObject
		  //Get information about file/volume
		  
		  //If there is no value for the given key, nil is returned.
		  
		  #if TargetMacOS
		    declare function getResourceValue lib CocoaLib selector "getResourceValue:forKey:error:" (id as Ptr, byref value as Ptr, forKey as CFStringRef, byref err as Ptr) as Boolean
		    
		    assertOSVersion  100600 //Snow Leopard
		    
		    dim value as Ptr
		    dim key as CFStringRef
		    if KeyList.IndexOf(forKey) > -1 then
		      key = Cocoa.StringConstant(forKey)
		    else
		      key = forKey
		    end if
		    dim err as Ptr
		    
		    dim OK as Boolean = getResourceValue( self.id, value, key, err )
		    
		    
		    if OK then
		      if value = nil then
		        return nil
		      else
		        return Cocoa.NSObjectFromNSPtr(value)
		      end if
		    else
		      raise new NSException(err)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceValue(forKey as string, newValue as NSObject) As boolean
		  //Set information about file/volume
		  
		  #if TargetMacOS
		    declare function setResourceValue lib CocoaLib selector "setResourceValue:forKey:error:" (id as Ptr, value as Ptr, forKey as CFStringRef, byref err as Ptr) as Boolean
		    
		    assertOSVersion  100600 //Snow Leopard
		    
		    dim key as CFStringRef
		    if KeyList.IndexOf(forKey) > -1 then
		      key = Cocoa.StringConstant(forKey)
		    else
		      key = forKey
		    end if
		    dim err as Ptr
		    
		    dim OK as Boolean = setResourceValue(newValue.id, newValue, key, err )
		    
		    if err <> nil then
		      raise new NSException( err )
		    end if
		    
		    return  OK
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub ResourceValues(assigns keyedValues as NSDictionary)
		  
		  #if targetMacOS
		    declare function setResourceValues lib CocoaLib selector "setResourceValues:error:" _
		    (obj_id as Ptr, keyedValues as Ptr, byRef error as Ptr) as Boolean
		    
		    dim dictRef as Ptr
		    if keyedValues <> nil then
		      dictRef = keyedValues
		    end if
		    
		    dim error as Ptr
		    
		    call setResourceValues(self, dictRef, error)
		    
		    if error <> nil then
		      mLastError = new CFError(error, false)
		    end if
		    
		  #else
		    #pragma unused keyedValues
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function ResourceValues(keys as NSArray, bookmarkData as NSData) As NSDictionary
		  
		  #if targetMacOS
		    declare function resourceValuesForKeys lib CocoaLib selector "resourceValuesForKeys:fromBookmarkData:" _
		    (class_id as Ptr, keys as Ptr, bookmarkData as Ptr) as Ptr
		    
		    dim keysRef as Ptr
		    if keys <> nil then
		      keysRef = keys
		    end if
		    
		    dim bookmarkDataRef as Ptr
		    if bookmarkData <> nil then
		      bookmarkDataRef = bookmarkData
		    end if
		    
		    dim dictRef as Ptr = resourceValuesForKeys(ClassRef, keysRef, bookmarkDataRef)
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		    #pragma unused bookmarkData
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ResourceValues(keys() as String) As NSDictionary
		  
		  #if targetMacOS
		    declare function resourceValuesForKeys lib CocoaLib selector "resourceValuesForKeys:error:" _
		    (obj_id as Ptr, keys as Ptr, byRef error as Ptr) as Ptr
		    
		    dim keysArray as NSArray
		    dim keysRef as Ptr
		    if keys.ubound < -1 then
		      keysArray = new NSArray(keys)
		      keysRef = keysArray
		    end if
		    
		    dim error as Ptr
		    
		    dim dictRef as Ptr = resourceValuesForKeys(self, keysRef, error)
		    
		    if error <> nil then
		      mLastError = new CFError(error, false)
		    end if
		    
		    if dictRef <> nil then
		      return new NSDictionary(dictRef)
		    end if
		    
		  #else
		    #pragma unused keys
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StartAccessingSecurityScopedResource() As Boolean
		  
		  #if targetMacOS
		    declare function startAccessingSecurityScopedResource lib CocoaLib selector "startAccessingSecurityScopedResource" (obj_id as Ptr) as Boolean
		    
		    return startAccessingSecurityScopedResource(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StopAccessingSecurityScopedResource() As Boolean
		  
		  #if targetMacOS
		    declare function stopAccessingSecurityScopedResource lib CocoaLib selector "stopAccessingSecurityScopedResource" (obj_id as Ptr) as Boolean
		    
		    return stopAccessingSecurityScopedResource(self)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  self.absoluteString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function WriteBookmark(bookmarkData as NSData, bookmarkFileURL as NSURL, options as UInt32, byRef error as CFError) As Boolean
		  
		  #if targetMacOS
		    declare function writeBookmarkData lib CocoaLib selector "writeBookmarkData:toURL:options:error:" _
		    (class_id as Ptr, bookmarkData as Ptr, bookmarkFileURL as Ptr, options as UInt32, byRef error as Ptr) as Boolean
		    
		    dim dataRef as Ptr
		    if bookmarkData <> nil then
		      dataRef = bookmarkData
		    end if
		    
		    dim bookmarkURLRef as Ptr
		    if bookmarkFileURL <> nil then
		      bookmarkURLRef = bookmarkFileURL
		    end if
		    
		    dim errorRef as Ptr
		    if error <> nil then
		      errorRef = error
		    end if
		    
		    return writeBookmarkData(ClassRef, dataRef, bookmarkURLRef, options, errorRef)
		    
		  #else
		    #pragma unused bookmarkData
		    #pragma unused bookmarkFileURL
		    #pragma unused options
		    #pragma unused error
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub WriteToPasteboard(pasteboard as NSPasteboard)
		  
		  #if targetMacOS
		    declare sub writeToPasteboard lib CocoaLib selector "writeToPasteboard:" (obj_id as Ptr, pasteboard as Ptr)
		    
		    dim pasteboardRef as Ptr
		    if pasteboard <> nil then
		      pasteboardRef = pasteboard
		    end if
		    
		    writeToPasteboard self, pasteboardRef
		    
		  #else
		    #pragma unused pasteboard
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function absoluteString lib CocoaLib selector "absoluteString" ( id as Ptr ) as CFStringRef
			    
			    return absoluteString( self.id )
			  #endif
			End Get
		#tag EndGetter
		absoluteString As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function absoluteURL lib CocoaLib selector "absoluteURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = absoluteURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		absoluteURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function filePathURL lib CocoaLib selector "filePathURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = filePathURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FilePathURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function fileReferenceURL lib CocoaLib selector "fileReferenceURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = fileReferenceURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FileReferenceURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function fragment lib CocoaLib selector "fragment" (obj_id as Ptr) as CFStringRef
			    
			    return fragment(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Fragment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function host lib CocoaLib selector "host" (obj_id as Ptr) as CFStringRef
			    
			    return host(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Host As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Optimized method to determine if the NSURL corresponds to a directory, e.g. with NSDirectoryEnumerator
			  
			  #if TargetMacOS
			    declare function getResourceValue lib CocoaLib selector "getResourceValue:forKey:error:" (id as Ptr, byref value as Ptr, forKey as CFStringRef, err as Ptr) as Boolean
			    declare function boolValue lib CocoaLib selector "boolValue" (id as Ptr) as Boolean
			    
			    assertOSVersion  100600 //Snow Leopard
			    
			    dim value as Ptr
			    
			    if getResourceValue( self, value, Cocoa.StringConstant( "NSURLIsDirectoryKey" ), nil ) then
			      return   boolValue( value )
			    end if
			  #endif
			End Get
		#tag EndGetter
		IsDirectory As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isFileURL lib CocoaLib selector "isFileURL" (obj_id as Ptr) as Boolean
			    
			    return isFileURL(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsFile As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function isFileReferenceURL lib CocoaLib selector "isFileReferenceURL" (obj_id as Ptr) as Boolean
			    
			    return isFileReferenceURL(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsFileReference As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function checkResourceIsReachableAndReturnError lib CocoaLib selector "checkResourceIsReachableAndReturnError:" _
			    (obj_id as Ptr, byRef error as Ptr) as Boolean
			    
			    dim errorRef as Ptr
			    
			    dim success as Boolean = checkResourceIsReachableAndReturnError(self, errorRef)
			    
			    if errorRef <> nil then
			      mLastError = new CFError(errorRef, false)
			    end if
			    
			    return success
			    
			  #endif
			  
			End Get
		#tag EndGetter
		IsReachable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not ( self = nil ) then
			    return new FolderItem(self.absoluteString, FolderItem.PathTypeURL )
			  end if
			End Get
		#tag EndGetter
		Item As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastError
			End Get
		#tag EndGetter
		LastError As CFError
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function lastPathComponent lib CocoaLib selector "lastPathComponent" (obj_id as Ptr) as CFStringRef
			    
			    return lastPathComponent(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		LastPathComponent As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastError As CFError
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function parameterString lib CocoaLib selector "parameterString" (obj_id as Ptr) as CFStringRef
			    
			    return parameterString(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ParameterString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function password lib CocoaLib selector "password" (obj_id as Ptr) as CFStringRef
			    
			    return password(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Password As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function path lib CocoaLib selector "path" (obj_id as Ptr) as CFStringRef
			    
			    return path(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Path As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function pathExtension lib CocoaLib selector "pathExtension" (obj_id as Ptr) as CFStringRef
			    
			    return pathExtension(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		PathExtension As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function port lib CocoaLib selector "port" (obj_id as Ptr) as CFStringRef
			    
			    return port(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Port As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function query lib CocoaLib selector "query" (obj_id as Ptr) as CFStringRef
			    
			    return query(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Query As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function relativePath lib CocoaLib selector "relativePath" (obj_id as Ptr) as CFStringRef
			    
			    return relativePath(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		RelativePath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function relativeString lib CocoaLib selector "relativeString" (obj_id as Ptr) as CFStringRef
			    
			    return relativeString(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		RelativeString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function URLByResolvingSymlinksInPath lib CocoaLib selector "URLByResolvingSymlinksInPath" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = URLByResolvingSymlinksInPath(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ResolveSymlinks As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function scheme lib CocoaLib selector "scheme" (obj_id as Ptr) as CFStringRef
			    
			    return scheme(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Scheme As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function URLByStandardizingPath lib CocoaLib selector "URLByStandardizingPath" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = URLByStandardizingPath(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		StandardizedPathURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function standardizedURL lib CocoaLib selector "standardizedURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = standardizedURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		StandardizedURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function user lib CocoaLib selector "user" (obj_id as Ptr) as CFStringRef
			    
			    return user(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		User As String
	#tag EndComputedProperty


	#tag Constant, Name = kKeyList, Type = String, Dynamic = False, Default = \"NSURLNameKey\rNSURLLocalizedNameKey\rNSURLIsRegularFileKey\rNSURLIsDirectoryKey\rNSURLIsSymbolicLinkKey\rNSURLIsVolumeKey\rNSURLIsPackageKey\rNSURLIsSystemImmutableKey\rNSURLIsUserImmutableKey\rNSURLIsHiddenKey\rNSURLHasHiddenExtensionKey\rNSURLCreationDateKey\rNSURLContentAccessDateKey\rNSURLContentModificationDateKey\rNSURLAttributeModificationDateKey\rNSURLLinkCountKey\rNSURLParentDirectoryURLKey\rNSURLVolumeURLKey\rNSURLTypeIdentifierKey\rNSURLLocalizedTypeDescriptionKey\rNSURLLabelNumberKey\rNSURLLabelColorKey\rNSURLLocalizedLabelKey\rNSURLEffectiveIconKey\rNSURLCustomIconKey\rNSURLFileSizeKey\rNSURLFileAllocatedSizeKey\rNSURLIsAliasFileKey\rNSURLVolumeLocalizedFormatDescriptionKey\rNSURLVolumeTotalCapacityKey\rNSURLVolumeAvailableCapacityKey\rNSURLVolumeResourceCountKey\rNSURLVolumeSupportsPersistentIDsKey\rNSURLVolumeSupportsSymbolicLinksKey\rNSURLVolumeSupportsHardLinksKey\rNSURLVolumeSupportsJournalingKey\rNSURLVolumeIsJournalingKey\rNSURLVolumeSupportsSparseFilesKey\rNSURLVolumeSupportsZeroRunsKey\rNSURLVolumeSupportsCaseSensitiveNamesKey\rNSURLVolumeSupportsCasePreservedNamesKey", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationMinimalBookmark, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationPreferFileIDResolution, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationSecurityScopeAllowOnlyReadAccess, Type = Double, Dynamic = False, Default = \"4096", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationSuitableForBookmarkFile, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkCreationWithSecurityScope, Type = Double, Dynamic = False, Default = \"2048", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithoutMounting, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithoutUI, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSURLBookmarkResolutionWithSecurityScope, Type = Double, Dynamic = False, Default = \"1024", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="absoluteString"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fragment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDirectory"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFile"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFileReference"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReachable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastPathComponent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="ParameterString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Path"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PathExtension"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Query"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RelativePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RelativeString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scheme"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="User"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
