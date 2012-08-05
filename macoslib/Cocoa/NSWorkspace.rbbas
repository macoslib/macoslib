#tag Class
Class NSWorkspace
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  me.RegisterNotifications
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FinderLabelColors() As NSArray
		  //Get the Finder labels
		  
		  #if TargetMacOS
		    declare function fileLabelColors lib CocoaLib selector "fileLabelColors" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = fileLabelColors( sharedInstance )
		    
		    return new NSArray( p, false )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FinderLabels() As NSArray
		  //Get the Finder labels
		  
		  #if TargetMacOS
		    declare function fileLabels lib CocoaLib selector "fileLabels" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = fileLabels( sharedInstance )
		    
		    return new NSArray( p, false )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handle_globalNSWorkspaceNotification(observer as NotificationObserver, notification as NSNotification)
		  //Handle notifications, extract interesting value(s) and dispatch them to their respective event
		  
		  #pragma unused observer
		  
		  #if TargetMacOS
		    RaiseEvent   globalNSWorkspaceNotification( notification )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handle_NSWorkspaceNotification(observer as NotificationObserver, notification as NSNotification)
		  //Handle notifications, extract interesting value(s) and dispatch them to their respective event
		  
		  #pragma unused observer
		  
		  #if TargetMacOS
		    dim userinfo as CoreFoundation.CFDictionary
		    dim appl as Cocoa.NSRunningApplication
		    dim locName as string
		    dim url as CoreFoundation.CFURL
		    
		    declare function valueForKey lib CocoaLib selector "valueForKey:" (id as Ptr, key as CFStringRef) as Ptr //Access to NSDictionary for non-CFType values
		    
		    select case notification.Name
		    case "NSWorkspaceWillLaunchApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceWillLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidLaunchApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidTerminateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidTerminateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceSessionDidBecomeActiveNotification"
		      RaiseEvent   NSWorkspaceSessionDidBecomeActiveNotification( notification )
		      
		      
		    case "NSWorkspaceSessionDidResignActiveNotification"
		      RaiseEvent   NSWorkspaceSessionDidResignActiveNotification( notification )
		      
		      
		    case "NSWorkspaceDidHideApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidHideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidUnhideApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidUnhideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidActivateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidActivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidDeactivateApplicationNotification"
		      userinfo = notification.UserInfo
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( userinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      RaiseEvent   NSWorkspaceDidDeactivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidRenameVolumeNotification"
		      userinfo = notification.UserInfo
		      dim oldLocName as string
		      dim oldurl as CoreFoundation.CFURL
		      
		      if IsSnowLeopard then
		        locName = userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		        oldLocName = userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeOldLocalizedNameKey" ))).VariantValue
		        oldurl = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeOldURLKey" ))))
		      end if
		      
		      RaiseEvent  NSWorkspaceDidRenameVolumeNotification( notification, oldurl, oldLocName, url, locName )
		      
		      
		    case "NSWorkspaceDidMountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		      end if
		      
		      RaiseEvent  NSWorkspaceDidMountNotification( notification, url, locName )
		      
		      
		    case "NSWorkspaceWillUnmountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		      end if
		      
		      RaiseEvent  NSWorkspaceWillUnmountNotification( notification, url, locName )
		      
		      
		    case "NSWorkspaceDidUnmountNotification"
		      userinfo = notification.UserInfo
		      
		      if IsSnowLeopard then
		        locName = userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		      end if
		      
		      RaiseEvent  NSWorkspaceDidUnmountNotification( notification, url, locName )
		      
		      
		    case "NSWorkspaceDidPerformFileOperationNotification"
		      dim opNbr as Cocoa.NSNumber
		      userinfo = notification.UserInfo
		      opNbr = new NSNumber( valueForKey( userinfo, CFString( "NSOperationNumber" )), false )
		      
		      RaiseEvent   NSWorkspaceDidPerformFileOperationNotification( notification, opNbr.Int32Value )
		      
		      
		    case "NSWorkspaceDidChangeFileLabelsNotification"
		      RaiseEvent   NSWorkspaceDidChangeFileLabelsNotification( notification )
		      
		    case "NSWorkspaceActiveSpaceDidChangeNotification"
		      RaiseEvent   NSWorkspaceActiveSpaceDidChangeNotification( notification )
		      
		    case "NSWorkspaceDidWakeNotification"
		      RaiseEvent   NSWorkspaceDidWakeNotification( notification )
		      
		    case "NSWorkspaceWillPowerOffNotification"
		      RaiseEvent   NSWorkspaceWillPowerOffNotification( notification )
		      
		    case "NSWorkspaceWillSleepNotification"
		      RaiseEvent   NSWorkspaceWillSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidSleepNotification"
		      RaiseEvent   NSWorkspaceScreensDidSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidWakeNotification"
		      RaiseEvent   NSWorkspaceScreensDidWakeNotification( notification )
		      
		    else
		      RaiseEvent   NSWorkspaceOtherNotification( notification )
		    end select
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub HideOtherApplications()
		  //Hides all applications other than the sender.
		  
		  #if TargetCocoa
		    declare sub hideOtherApplications lib CocoaLib Selector "hideOtherApplications" (id as Ptr)
		    
		    hideOtherApplications( sharedInstance )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IconForFile(f as FolderItem) As NSImage
		  #if TargetMacOS
		    declare function iconForFile lib CocoaLib selector "iconForFile:" (obj_id as Ptr, fullPath as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    if f <> nil then
		      p = iconForFile(sharedInstance, f.POSIXPath)
		    else
		      p = nil
		    end if
		    return new NSImage(p)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IconForFile(f as FolderItem, theIcon as NSImage, options as integer = 0) As Boolean
		  #if TargetMacOS
		    declare function setIconForFile lib CocoaLib selector "setIcon:forFile:options:" (obj_id as Ptr, img as Ptr, fullPath as CFStringRef, opt as integer) as boolean
		    
		    if f=nil or theIcon=nil then
		      return false
		    end if
		    
		    return   setIconForFile(sharedInstance, theIcon, f.POSIXPath, options)
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OpenFile(f as FolderItem) As Boolean
		  if f is nil then
		    return false
		  end if
		  
		  #if TargetMacOS
		    declare function openFile_ lib CocoaLib selector "openFile:" (id as Ptr, fullPath as CFStringRef) as Boolean
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      return openFile_(id, f.POSIXPath)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PerformCopy(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceCopyOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PerformDestroy(sourceDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceDestroyOperation")
		  return performOperation (sourceDir, nil, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PerformMove(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceMoveOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PerformMoveToTrash(sourceDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceRecycleOperation")
		  return performOperation (sourceDir, nil, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function performOperation(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String, op as CFStringRef) As Boolean
		  #if TargetMacOS
		    if sourceDir is nil then
		      return false
		    end if
		    
		    declare function perform_ lib CocoaLib selector "performFileOperation:source:destination:files:tag:" _
		    (ws as Ptr, op as CFStringRef, src as CFStringRef, dst as CFStringRef, files as Ptr, ByRef tagOut as Integer) as Boolean
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      dim tag as Integer
		      dim dst as CFStringRef
		      if destDir <> nil then
		        dst = destDir.POSIXPath
		      end
		      dim names as CFArray = new CFArray(itemNames)
		      dim ok as Boolean = perform_ (id, op, sourceDir.POSIXPath, dst, names, tag)
		      return ok
		    else
		      return false
		    end if
		  #endif
		  
		  'NSString *NSWorkspaceMoveOperation;
		  'NSString *NSWorkspaceCopyOperation;
		  'NSString *NSWorkspaceLinkOperation;
		  'NSString *NSWorkspaceCompressOperation;
		  'NSString *NSWorkspaceDecompressOperation;
		  'NSString *NSWorkspaceEncryptOperation;
		  'NSString *NSWorkspaceDecryptOperation;
		  'NSString *NSWorkspaceDestroyOperation;
		  'NSString *NSWorkspaceRecycleOperation;
		  'NSString *NSWorkspaceDuplicateOperation;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterNotifications(options as integer = 0)
		  //# Register NSWorkspace notifications
		  
		  //@ Options:
		  //@    0: each event is declared separately. The NSNotification is passed to the events along with the extracted interesting data
		  //@    1: all notifications are sent to event globalNSWorkspaceNotification
		  
		  #if TargetMacOS
		    declare function notificationCenter lib CocoaLib selector "notificationCenter" (id as Ptr) as Ptr
		    
		    observer_NSWorkspaceNotification = new NotificationObserver
		    
		    select case options
		    case 0  //Register an event for each notification
		      AddHandler  observer_NSWorkspaceNotification.HandleNotification, WeakAddressOf handle_NSWorkspaceNotification
		    case 1  //All notifications are sent to globalNSWorkspaceNotification
		      AddHandler  observer_NSWorkspaceNotification.HandleNotification, WeakAddressOf handle_globalNSWorkspaceNotification
		    end select
		    
		    observer_NSWorkspaceNotification.pNotificationCenter = notificationCenter( self.sharedInstance )
		    observer_NSWorkspaceNotification.Register   ""  //Register all notifications
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function RunningApplications() As NSRunningApplication()
		  #if TargetMacOS
		    declare function runningApplications lib CocoaLib selector "runningApplications" (obj_id as Ptr) as Ptr
		    
		    dim theList() as NSRunningApplication
		    dim theArray as new CFArray(runningApplications(sharedInstance), not CFType.hasOwnership)
		    for i as Integer = 0 to theArray.Count - 1
		      dim p as Ptr = theArray.Value(i)
		      if p <> nil then
		        theList.Append new NSRunningApplication(p)
		      end if
		    next
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SelectFile(f as FolderItem) As Boolean
		  #if targetCocoa
		    declare function selectFile lib CocoaLib selector "selectFile:inFileViewerRootedAtPath:" (obj_id as Ptr, fullPath as CFStringRef, rootFullPath as CFStringRef) as Boolean
		    
		    return f <> nil and selectFile(sharedInstance, f.POSIXPath, "")
		  #else
		    #pragma unused f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function sharedInstance() As Ptr
		  #if TargetMacOS
		    declare function sharedWorkspace lib CocoaLib selector "sharedWorkspace" (classId as Ptr) as Ptr
		    
		    dim classRef as Ptr = Cocoa.NSClassFromString("NSWorkspace")
		    if classRef <> nil then
		      return sharedWorkspace(classRef)
		    else
		      return nil
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UnmountAndEjectDevice(device as FolderItem) As Boolean
		  
		  #if TargetMacOS
		    declare function unmountAndEjectDeviceAtPath lib CocoaLib selector "unmountAndEjectDeviceAtPath:" (ws as Ptr, path as CFStringRef) as Boolean
		    
		    if device=nil then
		      return false
		    end if
		    
		    return  unmountAndEjectDeviceAtPath( sharedInstance, device.POSIXPath )
		  #endif
		  
		  //We may use unmountAndEjectDeviceAtURL:error: for Snow Leopard and beyond to get the error code
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLForApplicationWithBundleIdentifier(bundleIdentifier as String) As NSURL
		  
		  #if TargetMacOS
		    dim url as NSURL
		    
		    declare function URLForApplicationWithBundleIdentifier lib CocoaLib selector "URLForApplicationWithBundleIdentifier:" (ws as Ptr, id as CFStringRef) as Ptr
		    
		    url = new NSURL( URLForApplicationWithBundleIdentifier( sharedInstance, bundleIdentifier ), false)
		    
		    return  url
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLForAppToOpenURL(url as CFURL) As CFURL
		  #if TargetMacOS
		    declare function getapp lib CocoaLib selector "URLForApplicationToOpenURL:" (id as Ptr, url as Ptr) as Ptr
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      dim p as Ptr = getapp (id, url.Reference)
		      if p <> nil then
		        return new CFURL (p, false)
		      end if
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UTIConformsTo(UTI as string, ConformsTo as String) As Boolean
		  
		  #if TargetMacOS
		    declare function type_conformsToType lib CocoaLib selector "type:conformsToType:" (ws as Ptr, UTI1 as CFStringRef, UTI2 as CFStringRef) as Boolean
		    
		    if UTI="" OR ConformsTo="" then
		      return  false
		    end if
		    
		    return   type_conformsToType( sharedInstance, UTI, ConformsTo )
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event globalNSWorkspaceNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceActiveSpaceDidChangeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidActivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidChangeFileLabelsNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidDeactivateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidHideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidMountNotification(notification as NSNotification, url as CoreFoundation.CFURL, localizedName as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidPerformFileOperationNotification(notification as NSNotification, operationID as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidRenameVolumeNotification(notification as NSNotification, oldURL as CoreFoundation.CFURL, oldLocalizedName as string, newURL as CoreFoundation.CFURL, newLocalizedName as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidTerminateApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnhideApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnmountNotification(notification as NSNotification, url as CoreFoundation.CFURL, localizedName as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidWakeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceOtherNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidSleepNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidWakeNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidBecomeActiveNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidResignActiveNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillLaunchApplicationNotification(notification as NSNotification, theApplication as NSRunningApplication)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillPowerOffNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillSleepNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillUnmountNotification(notification as NSNotification, url as CoreFoundation.CFURL, localizedName as String)
	#tag EndHook


	#tag Note, Name = Documentation
		NSWorkspace methods are shared methods, so you do not need to create an instance to use them.
		
		If you want to get the Workspace events, however, create a single subclass of NSWorkspace and add the code you need in the different
		  declared events you are interested in.
		
		
		** For the description of all the events, see
		https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/Reference/Reference.html
		
		On systems running Leopard (10.5) or below, some parameters passed to the events may be null, e.g. URLs, application.
	#tag EndNote


	#tag Property, Flags = &h21
		Private observer_NSWorkspaceNotification As NotificationObserver
	#tag EndProperty


	#tag Constant, Name = NSExclude10_4ElementsIconCreationOption, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSExcludeQuickDrawElementsIconCreationOption, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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
			Type="Integer"
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
