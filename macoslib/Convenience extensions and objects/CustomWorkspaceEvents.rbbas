#tag Module
Protected Module CustomWorkspaceEvents
	#tag Method, Flags = &h21
		Private Sub DispatcherMethod(ws as NSWorkspace, notification as NSNotification)
		  //Handle notifications, extract interesting value(s) and dispatch them to their respective method
		  
		  #pragma unused ws
		  
		  #if TargetMacOS
		    dim CFuserinfo as CoreFoundation.CFDictionary
		    dim UserInfo as Dictionary
		    dim appl as Dictionary
		    dim locName as string
		    dim url as CoreFoundation.CFURL
		    dim f as FolderItem
		    
		    CFuserinfo = notification.UserInfo
		    if CFuserinfo<>nil then  //Convert UserInfo to RS Dictionary
		      UserInfo = CFuserinfo.VariantValue
		    end if
		    
		    #if kLogEvents
		      System.Log   System.LogLevelError, "CustomWorkspaceEvents: going to call method event_" + notification.Name
		    #endif
		    
		    declare function valueForKey lib CocoaLib selector "valueForKey:" (id as Ptr, key as CFStringRef) as Ptr //Access to NSDictionary for non-CFType values
		    
		    select case notification.Name
		    case "NSWorkspaceWillLaunchApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceWillLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidLaunchApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidLaunchApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidTerminateApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidTerminateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceSessionDidBecomeActiveNotification"
		      event_NSWorkspaceSessionDidBecomeActiveNotification( notification )
		      
		      
		    case "NSWorkspaceSessionDidResignActiveNotification"
		      event_NSWorkspaceSessionDidResignActiveNotification( notification )
		      
		      
		    case "NSWorkspaceDidHideApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidHideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidUnhideApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidUnhideApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidActivateApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidActivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidDeactivateApplicationNotification"
		      if IsSnowLeopard then
		        appl = new NSRunningApplication( valueForKey( CFuserinfo, Cocoa.StringConstant( "NSWorkspaceApplicationKey" )), false )
		      end if
		      
		      event_NSWorkspaceDidDeactivateApplicationNotification( notification, appl )
		      
		      
		    case "NSWorkspaceDidRenameVolumeNotification"
		      dim oldLocName as string
		      dim oldurl as CoreFoundation.CFURL
		      dim oldf as FolderItem
		      
		      if IsSnowLeopard then
		        locName = CFuserinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		        f = url.Item
		        oldLocName = CFuserinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeOldLocalizedNameKey" ))).VariantValue
		        oldurl = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeOldURLKey" ))))
		        oldf = oldurl.Item
		      end if
		      
		      event_NSWorkspaceDidRenameVolumeNotification( notification, oldf, oldLocName, f, locName )
		      
		      
		    case "NSWorkspaceDidMountNotification"
		      if IsSnowLeopard then
		        locName = CFuserinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		        f = url.Item
		      end if
		      
		      event_NSWorkspaceDidMountNotification( notification, f, locName )
		      
		      
		    case "NSWorkspaceWillUnmountNotification"
		      if IsSnowLeopard then
		        locName = CFuserinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		        f = url.Item
		      end if
		      
		      event_NSWorkspaceWillUnmountNotification( notification, f, locName )
		      
		      
		    case "NSWorkspaceDidUnmountNotification"
		      if IsSnowLeopard then
		        locName = CFuserinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeLocalizedNameKey" ))).VariantValue
		        url = CoreFoundation.CFURL( userinfo.Value( CFString( Cocoa.StringConstant( "NSWorkspaceVolumeURLKey" ))))
		        f = url.Item
		      end if
		      
		      event_NSWorkspaceDidUnmountNotification( notification, f, locName )
		      
		      
		    case "NSWorkspaceDidPerformFileOperationNotification"
		      dim opNbr as Cocoa.NSNumber
		      opNbr = new NSNumber( valueForKey( CFuserinfo, CFString( "NSOperationNumber" )), false )
		      
		      event_NSWorkspaceDidPerformFileOperationNotification( notification, opNbr.Int32Value )
		      
		      
		    case "NSWorkspaceDidChangeFileLabelsNotification"
		      event_NSWorkspaceDidChangeFileLabelsNotification( notification )
		      
		    case "NSWorkspaceActiveSpaceDidChangeNotification"
		      event_NSWorkspaceActiveSpaceDidChangeNotification( notification )
		      
		    case "NSWorkspaceDidWakeNotification"
		      event_NSWorkspaceDidWakeNotification( notification )
		      
		    case "NSWorkspaceWillPowerOffNotification"
		      event_NSWorkspaceWillPowerOffNotification( notification )
		      
		    case "NSWorkspaceWillSleepNotification"
		      event_NSWorkspaceWillSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidSleepNotification"
		      event_NSWorkspaceScreensDidSleepNotification( notification )
		      
		    case "NSWorkspaceScreensDidWakeNotification"
		      event_NSWorkspaceScreensDidWakeNotification( notification )
		      
		    else
		      event_NSWorkspaceOtherNotification( notification )
		    end select
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceActiveSpaceDidChangeNotification(notification as Dictionary)
		  //# This event is called when user changed of space in the Finder
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidActivateApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when any application has been activated
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidChangeFileLabelsNotification(notification as Dictionary)
		  //# This event is called when user changed the Finder labels
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidDeactivateApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when an application has been deactivated
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidHideApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when an application did hide
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidLaunchApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when an application has been launched
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidMountNotification(notification as Dictionary, MountPoint as FolderItem, LocalizedName as String)
		  //# This event is called when a new volume has been mounted
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidPerformFileOperationNotification(notification as Dictionary, OperationNumber as Int32)
		  //# This event is called when an asynchronous file operation has been performed
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidRenameVolumeNotification(notification as Dictionary, oldMountPoint as FolderItem, oldLocalizedName as string, newMountPoint as FolderItem, newLocalizedName as string)
		  //# This event is called when a volume has been renamed
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidTerminateApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when an application has been terminated
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidUnhideApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when an application did unhide
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidUnmountNotification(notification as Dictionary, MountPoint as FolderItem, LocalizedName as string)
		  //# This event is called when a volume has been unmounted. For a clean unmounting, "event_NSWorkspaceWillUnmountNotification" is called first. If the volume
		  //# suddenly became unavailable (like unplugging a USB stick), only "event_NSWorkspaceDidUnmountNotification" is called.
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceDidWakeNotification(notification as Dictionary)
		  //# This event is called when the System woke up
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceOtherNotification(notification as Dictionary)
		  //# This event is called when the notification does not correspond to any other. It should happen only if macoslib is not up-to-date.
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceScreensDidSleepNotification(notification as Dictionary)
		  //# This event is called when the system put the screen off (depends on energy saving settings)
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceScreensDidWakeNotification(notification as Dictionary)
		  //# This event is called when the system put the screen on (depends on energy saving settings)
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceSessionDidBecomeActiveNotification(notification as Dictionary)
		  //# This event is called when the user's session became active
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceSessionDidResignActiveNotification(notification as Dictionary)
		  //# This event is called when the user's session did become inactive, either by switching to another user's session or back to the login screen
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceWillLaunchApplicationNotification(notification as Dictionary, appl as Dictionary)
		  //# This event is called when the system will launch an application
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceWillPowerOffNotification(notification as Dictionary)
		  //# This event is called when the computer will shut down. Note that you cannot prevent power-off at that stage.
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceWillSleepNotification(notification as Dictionary)
		  //# This event is called when the computer is going to sleep. Note that you cannot prevent the computer to go to sleep.
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_NSWorkspaceWillUnmountNotification(notification as Dictionary, MountPoint as FolderItem, LocalizedName as string)
		  //# This event is called when a volume will be unmounted. This event is called only when the user chose "Eject" and is followed by "event_NSWorkspaceDidUnmountNotification"
		  //# is the unmounting was successfull.
		  
		  //@ For each event, a notification is passed along with some interesting values extracted from the UserInfo Dictionary (see below).
		  //@ "notification" is a Dictionary which contains:
		  //@     "Name" as string: the name of the Notification
		  //@     "AssociatedObject": a Ptr to the original NSNotification
		  //@     "UserInfo": the main Dictionary which contains per-notification values
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Register()
		  //# Initialize the event listening system.
		  
		  //@ Put some code in the "event..." methods you are interested in and call this method once.
		  
		  #if TargetMacOS
		    if sharedWorkspace=nil then
		      sharedWorkspace = new NSWorkspace
		    else
		      return  //It seems we already have registered events
		    end if
		    
		    AddHandler   sharedWorkspace.globalNSWorkspaceNotification, AddressOf  DispatcherMethod
		    
		    sharedWorkspace.RegisterNotifications  1
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		This custom module keeps you from the hassle to redirect NSWorkspace events if you need them. This is possible because the Workspace is actually
		a single global object so each instance of NSWorkspace is the same. NSWorkspace methods are implemented in other extensions.
		
		Write some code in the "event..." methods you are interested in and call CustomWorkspaceEvents.Register from App.Open to initialize listening for notifications.
	#tag EndNote


	#tag Property, Flags = &h21
		Private sharedWorkspace As NSWorkspace
	#tag EndProperty


	#tag Constant, Name = kLogEvents, Type = Boolean, Dynamic = False, Default = \"true", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
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
End Module
#tag EndModule
