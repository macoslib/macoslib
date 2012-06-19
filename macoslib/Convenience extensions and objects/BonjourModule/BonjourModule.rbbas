#tag Module
Protected Module BonjourModule
	#tag Method, Flags = &h1
		Protected Sub DidNotPublish(sender as NSNetService, errCode as integer, errDomain as integer)
		  '//A service failed to be published. Broadcast the event to all the BonjourControls and the CustomBonjourEvents module.
		  '
		  '#if TargetMacOS
		  'dim wr as WeakRef
		  'dim bc as BonjourControl
		  '
		  'CustomBonjourEvents.event_ServicePublishingError   
		  '
		  'for i as integer=BonjourControls.Ubound downto 0
		  'wr = BonjourControls( i )
		  'if wr.Value = nil then
		  'BonjourControls.Remove  i
		  '
		  'else
		  'bc = BonjourControl( wr.Value )
		  'bc.Private_HandleCallbacks   sender, "DidNotPublish", errDict
		  '
		  'end if
		  '
		  'next
		  '#endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DidPublish(sender as NSNetService)
		  '//A service has been published. Broadcast the event to all the BonjourControls
		  '
		  '#if targetMacOS
		  'dim wr as WeakRef
		  'dim bc as BonjourControl
		  '
		  'for i as integer=BonjourControls.Ubound downto 0
		  'wr = BonjourControls( i )
		  'if wr.Value = nil then
		  'BonjourControls.Remove  i
		  '
		  'else
		  'bc = BonjourControl( wr.Value )
		  'bc.Private_HandleCallbacks   sender, "DidPublish"
		  '
		  'end if
		  '
		  'next
		  '#endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(service as BonjourServiceForpublishing)
		  
		  RegisteredServices.Append   service
		  service.Publish
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(nsns as NSNetService)
		  
		  if nsns<>nil then
		    dim service as BonjourServiceForPublishing = BonjourServiceForPublishing.CreateFromCocoaObject( nsns )
		    RegisteredServices.Append   service
		    service.Publish
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(Name as string, type as string, domain as string = "", port as integer, TXTDictionary as Dictionary = nil)
		  //# Publish a new service but does not return the new object (which is stored internally)
		  
		  #if TargetMacOS
		    dim service as BonjourServiceForPublishing
		    service = PublishService( Name, type, domain, port, TXTDictionary )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PublishService(Name as string, type as string, domain as string = "", port as integer, TXTDictionary as Dictionary = nil) As BonjourServiceForPublishing
		  //# Publish a new service and return the created object
		  
		  #if TargetMacOS
		    dim service as BonjourServiceForPublishing
		    
		    service = new BonjourServiceForPublishing( name, type, domain, port )
		    service.TXTRecord = TXTDictionary
		    RegisteredServices.Append   service
		    service.Publish
		    
		    return  service
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterControl(bc as BonjourControl)
		  //Automatically called by BonjourControl.Constructor
		  
		  #if TargetMacOS
		    dim wr as WeakRef
		    dim shouldReturn as Boolean
		    
		    for i as integer = BonjourControls.Ubound downto 0
		      wr = BonjourControls( i )
		      if wr.Value=bc then //Already registered. We do not return immediately to allow cleanup
		        shouldReturn = true
		        
		      elseif wr.value=nil then //Do some cleanup
		        BonjourControls.Remove  i
		      end if
		    next
		    
		    if shouldReturn then //Already registered
		      return
		    else //Store new control
		      BonjourControls.Append   new WeakRef( bc )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnpublishAllServices()
		  //# Unpublish all the services (usually when the application quits)
		  
		  for each service as BonjourServiceForPublishing in RegisteredServices
		    if service.State <>NSNetService.kStatePublished then
		      service.StopPublishing
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnpublishService(Name as string, type as string, domain as string, port as integer)
		  dim service as BonjourServiceForPublishing
		  
		  for i as integer=0 to RegisteredServices.Ubound
		    service = RegisteredServices( i )
		    if service.Name = name AND service.Type = type AND service.Domain = domain AND service.port = port then
		      service.StopPublishing
		    end if
		  next
		  
		  'dim nsns as NSNetService = NSNetService.InitForPublishing( name, domain, type, port )
		  '
		  'if nsns<>nil then
		  'nsns.ServiceTXTDictionary = TXTDictionary
		  ''nsns.Private_SetParent   me
		  ''nsns.AttachedProperty( "BonjourControlParent" ) = me
		  'BonjourModule.RegisterService   nsns
		  'end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BonjourControls() As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RegisteredServices() As BonjourServiceForPublishing
	#tag EndProperty


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
