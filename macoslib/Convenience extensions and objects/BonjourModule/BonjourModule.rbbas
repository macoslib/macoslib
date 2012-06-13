#tag Module
Protected Module BonjourModule
	#tag Method, Flags = &h1
		Protected Sub DidNotPublish(sender as NSNetService, errDict as Dictionary)
		  //A service failed to be published. Broadcast the event to all the BonjourControls
		  
		  dim wr as WeakRef
		  dim bc as BonjourControl
		  
		  for i as integer=BonjourControls.Ubound downto 0
		    wr = BonjourControls( i )
		    if wr.Value = nil then
		      BonjourControls.Remove  i
		      
		    else
		      bc = BonjourControl( wr.Value )
		      bc.Private_HandleCallbacks   sender, "DidNotPublish", errDict
		      
		    end if
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DidPublish(sender as NSNetService)
		  //A service has been published. Broadcast the event to all the BonjourControls
		  
		  dim wr as WeakRef
		  dim bc as BonjourControl
		  
		  for i as integer=BonjourControls.Ubound downto 0
		    wr = BonjourControls( i )
		    if wr.Value = nil then
		      BonjourControls.Remove  i
		      
		    else
		      bc = BonjourControl( wr.Value )
		      bc.Private_HandleCallbacks   sender, "DidPublish"
		      
		    end if
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(nsns as NSNetService)
		  
		  if nsns<>nil then
		    RegisteredServices.Append   nsns
		    nsns.Publish
		  end if
		  
		  'dim nsns as NSNetService = NSNetService.InitForPublishing( name, domain, type, port )
		  '
		  'if TXTDictionary<>nil then
		  'nsns.ServiceTXTDictionary = TXTDictionary
		  'end if
		  '
		  'RegisteredServices.Append   nsns
		  '
		  'nsns.AttachedProperty( "Callback" ) = callback
		  '
		  'AddHandler  nsns.DidPublish, AddressOf DidPublishCallback
		  'AddHandler  nsns.DidNotPublish, AddressOf DidNotPublishCallback
		  'nsns.Publish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PublishService(Name as string, type as string, domain as string, port as integer, TXTDictionary as Dictionary = nil)
		  
		  dim nsns as NSNetService = NSNetService.InitForPublishing( name, domain, type, port )
		  
		  if nsns<>nil then
		    nsns.ServiceTXTDictionary = TXTDictionary
		    'nsns.Private_SetParent   me
		    'nsns.AttachedProperty( "BonjourControlParent" ) = me
		    BonjourModule.PublishService   nsns
		  end if
		  
		  'dim nsns as NSNetService = NSNetService.InitForPublishing( name, domain, type, port )
		  '
		  'if TXTDictionary<>nil then
		  'nsns.ServiceTXTDictionary = TXTDictionary
		  'end if
		  '
		  'RegisteredServices.Append   nsns
		  '
		  'nsns.AttachedProperty( "Callback" ) = callback
		  '
		  'AddHandler  nsns.DidPublish, AddressOf DidPublishCallback
		  'AddHandler  nsns.DidNotPublish, AddressOf DidNotPublishCallback
		  'nsns.Publish
		  
		End Sub
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
		Protected Sub UnregisterService(Name as string, type as string, domain as string, port as integer)
		  dim nsns as NSNetService
		  
		  for i as integer=0 to RegisteredServices.Ubound
		    nsns = RegisteredServices( i )
		    if nsns.Name = name AND nsns.Type = type AND nsns.Domain = domain AND nsns.port = port then
		      
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
		Protected RegisteredServices() As NSNetService
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
