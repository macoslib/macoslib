#tag Class
Protected Class ICCameraDevice
Inherits ICDevice
	#tag Method, Flags = &h0
		Function BatteryLevel() As integer
		  #if TargetMacOS
		    declare function batteryLevel lib ICLib selector "batteryLevel" (id as Ptr) as integer
		    
		    return  batteryLevel( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BatteryLevelAvailable() As Boolean
		  #if TargetMacOS
		    declare function batteryLevelAvailable lib ICLib selector "batteryLevelAvailable" (id as Ptr) as Boolean
		    
		    return  batteryLevelAvailable( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelDelete()
		  #if TargetMacOS
		    declare sub cancelDelete lib ICLib selector "cancelDelete" (id as Ptr)
		    
		    cancelDelete( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelDownload()
		  #if TargetMacOS
		    declare sub cancelDownload lib ICLib selector "cancelDownload" (id as Ptr)
		    
		    cancelDownload( me.id )
		  #endif
		End Sub
	#tag EndMethod

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
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false, checkForClass as string = "") -- From NSObject
		  
		  Super.Constructor   id, hasOwnership, checkForClass
		  
		  if GetDelegate=nil then
		    SetDelegate
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContentCatalogPercentCompleted() As integer
		  #if TargetMacOS
		    declare function contentCatalogPercentCompleted lib ICLib selector "contentCatalogPercentCompleted" (id as Ptr) as integer
		    
		    return  contentCatalogPercentCompleted( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contents() As NSArray
		  #if TargetMacOS
		    declare function contents lib ICLib selector "contents" (id as Ptr) as Ptr
		    
		    dim p as Ptr = contents( me.id )
		    if p<>nil then
		      return  new NSArray( p, false )
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
		Private Shared Sub delegate_DeviceDidChangeName(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_ChangedName
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidChangeSharingState(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_ChangedSharingState
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidEncounterError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_Error   error
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveButtonPress(id as Ptr, sel as Ptr, sender as Ptr, button as CFStringRef)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_ButtonPressed   button
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveCustomNotification(id as Ptr, sel as Ptr, sender as Ptr, notification as Ptr, data as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DeviceDidReceiveStatusInformation(id as Ptr, sel as Ptr, sender as Ptr, status as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_StatusNotification   status
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidAddItem(id as Ptr, sel as Ptr, sender as Ptr, newItem as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidAddItem   newItem
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidAddItems(id as Ptr, sel as Ptr, sender as Ptr, newItems as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidAddItems   newItems
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidBecomeReady(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DeviceReady
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidChangeCapability(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidChangeCapability
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidCloseSessionWithError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidCloseSession   error
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidDeleteFilesWithError(id as Ptr, sel as Ptr, sender as Ptr, err as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidDeleteFilesWithError   err
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidDownloadFile(id as Ptr, sel as Ptr, camFile as Ptr, err as Ptr, options as Ptr, context as Ptr)
		  '#pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidDownloadFile  camFile, err, options
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidOpenSessionWithError(id as Ptr, sel as Ptr, sender as Ptr, error as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidOpenSession   error
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidReceiveDownloadProgress(id as Ptr, sel as Ptr, camFile as Ptr, numBytes as integer, maxBytes as integer)
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidReceiveDownloadProgress  camFile, numBytes, maxBytes
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidReceiveMetadata(id as Ptr, sel as Ptr, sender as Ptr, item as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidReceiveMetadata   item
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidReceivePTPEvent(id as Ptr, sel as Ptr, sender as Ptr, evt as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidReceivePTPEvent   evt
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidReceiveThumbnail(id as Ptr, sel as Ptr, sender as Ptr, item as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidReceiveThumbnail   item
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveDevice(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidRemoveDevice
		      
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveItem(id as Ptr, sel as Ptr, sender as Ptr, Item as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidRemoveItem   Item
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRemoveItems(id as Ptr, sel as Ptr, sender as Ptr, Items as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidRemoveItems   Items
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_DidRenameItems(id as Ptr, sel as Ptr, sender as Ptr, list as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_DidRenameItems   list
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub delegate_ReadyWithCompleteContentCatalog(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sender
		  #pragma unused sel
		  #pragma stackOverflowChecking false
		  
		  DReport   "Delegate invoked:", CurrentMethodName
		  
		  if CocoaDelegateMap.HasKey( id ) then
		    dim w as WeakRef = CocoaDelegateMap.Lookup( id, new WeakRef( nil ))
		    dim obj as ICCameraDevice = ICCameraDevice( w.Value )
		    if obj <> nil then
		      obj.Handle_ReadyWithCompleteContentCatalog
		    else
		      //something might be wrong.
		    end if
		  else
		    //something might be wrong.
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DownloadFile(file as ICCameraFile, targetFolder as FolderItem, options as NSDictionary)
		  #if TargetMacOS
		    declare sub requestDownloadFile lib ICLib selector "requestDownloadFile:options:downloadDelegate:didDownloadSelector:contextInfo:" (id as Ptr, _
		    file as ptr, options as Ptr, downloadDelegate as Ptr, endSelector as Ptr, context as Ptr)
		    
		    dim dict as new NSMutableDictionary
		    if options<>nil then
		      dict.AppendDictionary   options
		    end if
		    dict.Value( "ICDownloadsDirectoryURL" ) = new NSURL( targetFolder )
		    
		    requestDownloadFile( me.id, file.id, dict.id, me.GetDelegate, Cocoa.NSSelectorFromString( "didDownloadFile:error:options:contextInfo:" ), nil )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FilesOfType(UTI as string) As NSArray
		  #if TargetMacOS
		    declare function filesOfType lib ICLib selector "filesOfType:" (id as Ptr, UTI as CFStringRef) as Ptr
		    
		    dim p as Ptr = filesOfType( me.id, UTI )
		    if p<>nil then
		      return  new NSArray( p, false )
		    end if
		  #endif
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
		Private Sub Handle_ButtonPressed(button as String)
		  RaiseEvent  ButtonPressed( button )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ChangedName()
		  RaiseEvent  ChangedName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ChangedSharingState()
		  RaiseEvent  ChangedSharingState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DeviceReady()
		  RaiseEvent   DeviceReady
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidAddItem(newItem as Ptr)
		  #if TargetMacOS
		    RaiseEvent  ItemAdded( ImageKit_ImageCapture.ICCameraItemFromPtr( newItem ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidAddItems(newItems as Ptr)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidChangeCapability()
		  
		  RaiseEvent   CapabilityChanged
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidCloseSession(err as Ptr)
		  
		  dim error as NSException
		  if err<>nil then
		    error = new NSException( err )
		  end if
		  
		  RaiseEvent  SessionClosed( error )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidDeleteFilesWithError(err as Ptr)
		  #if TargetMacOS
		    if err<>nil then
		      dim nse as new NSException( err )
		      RaiseEvent   DeleteFilesCompletedWithError( nse.Message )
		    else
		      RaiseEvent   DeleteFilesCompleted
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidDownloadFile(camFile as Ptr, err as Ptr, options as Ptr)
		  #if TargetMacOS
		    dim nse as NSException
		    dim file as ICCameraFile = new ICCameraFile( camFile, false )
		    dim dict as NSDictionary
		    if options<>nil then
		       dict = new NSDictionary( options, false )
		    end if
		    
		    if err<>nil then
		      nse = new NSException( err )
		      RaiseEvent   DownloadError( file, nse.Message )
		      
		    else
		      RaiseEvent   FileDownloaded( file, dict )
		    end if
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidOpenSession(err as Ptr)
		  
		  dim error as NSException
		  if err<>nil then
		    error = new NSException( err )
		  end if
		  
		  RaiseEvent  SessionOpened( error )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidReceiveDownloadProgress(camFile as Ptr, numBytes as integer, maxBytes as integer)
		  #if TargetMacOS
		    dim file as ICCameraFile = new ICCameraFile( camFile )
		    
		    RaiseEvent   DownloadProgress( file, numBytes, maxBytes )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidReceiveMetadata(item as Ptr)
		  #if TargetMacOS
		    RaiseEvent   ReceivedMetadata( ImageKit_ImageCapture.ICCameraItemFromPtr( item ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidReceivePTPEvent(evt as Ptr)
		  #if TargetMacOS
		    RaiseEvent   ReceivedPTPEvent( evt )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidReceiveThumbnail(item as Ptr)
		  #if TargetMacOS
		    RaiseEvent   ReceivedThumbnail( ImageKit_ImageCapture.ICCameraItemFromPtr( item ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidRemoveDevice()
		  RaiseEvent   DeviceRemoved
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidRemoveItem(Item as Ptr)
		  #if TargetMacOS
		    RaiseEvent  ItemRemoved( ImageKit_ImageCapture.ICCameraItemFromPtr( Item ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidRemoveItems(Items as Ptr)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidRenameItems(list as Ptr)
		  #if TargetMacOS
		    dim nsa as NSArray = new NSArray( list )
		    dim items() as ICCameraItem
		    
		    for i as integer=0 to nsa.Count - 1
		      items.Append   ImageKit_ImageCapture.ICCameraItemFromPtr( nsa.Value( i ))
		    next
		    
		    RaiseEvent   ItemsRenamed( items )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_Error(err as Ptr)
		  
		  RaiseEvent   Error( new NSException( err ))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ReadyWithCompleteContentCatalog()
		  
		  RaiseEvent   ReadyWithCompleteContentCatalog
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_StatusNotification(status as Ptr)
		  RaiseEvent   StatusNotification ( new NSDictionary( status, false ))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAccessRestrictedAppleDevice() As Boolean
		  #if TargetMacOS
		    declare function isAccessRestrictedAppleDevice lib ICLib selector "isAccessRestrictedAppleDevice" (id as Ptr) as Boolean
		    
		    return  isAccessRestrictedAppleDevice( me.id )
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
		    declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    objc_registerClassPair newClassId
		    call   class_addProtocol( newClassId, objc_getProtocol( "ICDeviceDelegate" ))
		    call   class_addProtocol( newClassId, objc_getProtocol( "ICCameraDeviceDelegate" ))
		    call   class_addProtocol( newClassId, objc_getProtocol( "ICCameraDeviceDownloadDelegate" ))
		    
		    dim methodList() as Tuple
		    //ICDeviceDelegate
		    methodList.Append  "didRemoveDevice:" : FPtr( AddressOf  delegate_DidRemoveDevice ) : "v@:@"
		    methodList.Append  "device:didOpenSessionWithError:" : FPtr( AddressOf  delegate_DidOpenSessionWithError ) : "v@:@@"
		    methodList.Append  "deviceDidBecomeReady:" : FPtr( AddressOf  delegate_DidBecomeReady ) : "v@:@"
		    methodList.Append  "device:didCloseSessionWithError:" : FPtr( AddressOf  delegate_DidCloseSessionWithError ) : "v@:@@"
		    methodList.Append  "deviceDidChangeName:" : FPtr( AddressOf delegate_DeviceDidChangeName ) : "v@:@"
		    methodList.Append  "deviceDidChangeSharingState:" : FPtr ( AddressOf delegate_DeviceDidChangeSharingState ) : "v@:@"
		    methodList.Append  "device:didReceiveStatusInformation:" : FPtr( AddressOf delegate_DeviceDidReceiveStatusInformation ) : "v@:@@"
		    methodList.Append  "device:didEncounterError:" : FPtr( AddressOf delegate_DeviceDidEncounterError ) : "v@:@@"
		    methodList.Append  "device:didReceiveButtonPress:" : FPtr( AddressOf delegate_DeviceDidReceiveButtonPress ) : "v@:@@"
		    methodList.Append  "device:didReceiveCustomNotification:data:" : FPtr( AddressOf delegate_DeviceDidReceiveCustomNotification ) : "v@:@@@"
		    
		    //ICCameraDeviceDelegate
		    methodList.Append  "cameraDevice:didAddItem:" : FPtr( AddressOf  delegate_DidAddItem ) : "v@:@@"
		    'methodList.Append  "cameraDevice:didAddItems:" : FPtr( AddressOf  delegate_DidAddItems ) : "v@:@@"
		    methodList.Append  "cameraDevice:didRemoveItem:" : FPtr( AddressOf  delegate_DidRemoveItem ) : "v@:@@"
		    'methodList.Append  "cameraDevice:didRemoveItems:" : FPtr( AddressOf  delegate_DidRemoveItems ) : "v@:@@"
		    methodList.Append  "cameraDevice:didRenameItems:" : FPtr( AddressOf delegate_DidRenameItems ) : "v@:@@"
		    methodList.Append  "cameraDevice:didCompleteDeleteFilesWithError:" : FPtr ( AddressOf delegate_DidDeleteFilesWithError ) : "v@:@@"
		    methodList.Append  "cameraDeviceDidChangeCapability:" : FPtr( AddressOf delegate_DidChangeCapability ) : "v@:@"
		    methodList.Append  "cameraDevice:didReceiveThumbnailForItem:" : FPtr( AddressOf delegate_DidReceiveThumbnail ) : "v@:@@"
		    methodList.Append  "cameraDevice:didReceiveMetadataForItem:" : FPtr( AddressOf delegate_DidReceiveMetadata ) : "v@:@@"
		    methodList.Append  "cameraDevice:didReceivePTPEvent:" : FPtr( AddressOf delegate_DidReceivePTPEvent ) : "v@:@@"
		    methodList.Append  "deviceDidBecomeReadyWithCompleteContentCatalog:" : FPtr( AddressOf delegate_ReadyWithCompleteContentCatalog ) : "v@:@"
		    
		    //ICCameraDeviceDownloadDelegate
		    methodList.Append  "didDownloadFile:error:options:contextInfo:" : FPtr( AddressOf delegate_DidDownloadFile ) : "v@:@@@@"
		    methodList.Append  "didReceiveDownloadProgressForFile:downloadedBytes:maxBytes:" : FPtr( AddressOf delegate_DidReceiveDownloadProgress ) : "v@:@II"
		    
		    
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
		Function MediaFiles() As NSArray
		  #if TargetMacOS
		    declare function mediaFiles lib ICLib selector "mediaFiles" (id as Ptr) as Ptr
		    
		    dim p as Ptr = mediaFiles( me.id )
		    if p<>nil then
		      return  new NSArray( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MountPoint() As string
		  #if TargetMacOS
		    declare function mountPoint lib ICLib selector "mountPoint" (id as Ptr) as CFStringRef
		    
		    return  mountPoint( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDeleteFiles(files as NSArray)
		  #if TargetMacOS
		    declare sub requestDeleteFiles lib ICLib selector "requestDeleteFiles:" (id as Ptr, files as Ptr)
		    
		    requestDeleteFiles( me.id, files.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDisableTethering()
		  #if TargetMacOS
		    declare sub requestDisableTethering lib ICLib selector "requestDisableTethering" (id as Ptr)
		    
		    requestDisableTethering( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestEnableTethering()
		  #if TargetMacOS
		    declare sub requestEnableTethering lib ICLib selector "requestEnableTethering" (id as Ptr)
		    
		    requestEnableTethering( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestSyncClock()
		  #if TargetMacOS
		    declare sub requestSyncClock lib ICLib selector "requestSyncClock" (id as Ptr)
		    
		    requestSyncClock( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestTakePicture()
		  #if TargetMacOS
		    declare sub requestTakePicture lib ICLib selector "requestTakePicture" (id as Ptr)
		    
		    requestTakePicture( me.id )
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

	#tag Method, Flags = &h0
		Function TetheredCaptureEnabled() As Boolean
		  #if TargetMacOS
		    declare function tetheredCaptureEnabled lib ICLib selector "tetheredCaptureEnabled" (id as Ptr) as Boolean
		    
		    return  tetheredCaptureEnabled( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeOffset() As double
		  #if TargetMacOS
		    declare function timeOffset lib ICLib selector "timeOffset" (id as Ptr) as double
		    
		    return  timeOffset( me.id )
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ButtonPressed(button as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CapabilityChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ChangedName()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ChangedSharingState()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DeleteFilesCompleted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DeleteFilesCompletedWithError(error as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DeviceReady()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DeviceRemoved()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadError(file as ICCameraFile, error as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadProgress(file as ICCameraFile, bytesReceived as integer, maxBytes as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(err as NSException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FileDownloaded(file as ICCameraFile, options as NSDictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemAdded(item as ICCameraItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemRemoved(item as ICCameraItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemsRenamed(items() as ICCameraItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReadyWithCompleteContentCatalog()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReceivedMetadata(forItem as ICCameraItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReceivedPTPEvent(evt as Ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReceivedThumbnail(forItem as ICCameraItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SessionClosed(error as NSException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SessionOpened(error as NSException)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StatusNotification(status as NSDictionary)
	#tag EndHook


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibICCameraDeviceDelegate", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanAcceptPTPCommands, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanAcceptPTPCommands", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanDeleteAllFiles, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanDeleteAllFiles", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanDeleteOneFile, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanDeleteOneFile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanReceiveFile, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanReceiveFile", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanSyncClock, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanSyncClock", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanTakePicture, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanTakePicture", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICCameraDeviceCanTakePictureUsingShutterReleaseOnCamera, Type = String, Dynamic = False, Default = \"ICCameraDeviceCanTakePictureUsingShutterReleaseOnCamera", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICDeleteAfterSuccessfulDownload, Type = String, Dynamic = False, Default = \"ICDeleteAfterSuccessfulDownload", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICDownloadsDirectoryURL, Type = String, Dynamic = False, Default = \"ICDownloadsDirectoryURL", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICDownloadSidecarFiles, Type = String, Dynamic = False, Default = \"ICDownloadSidecarFiles", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICOverwrite, Type = String, Dynamic = False, Default = \"ICOverwrite", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICSaveAsFilename, Type = String, Dynamic = False, Default = \"ICSaveAsFilename", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICSavedAncillaryFiles, Type = String, Dynamic = False, Default = \"ICSavedAncillaryFiles", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kICSavedFilename, Type = String, Dynamic = False, Default = \"ICSavedFilename", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"ICCameraDevice", Scope = Private
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
