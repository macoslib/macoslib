#tag Class
Class BonjourControl
Inherits Canvas
	#tag Method, Flags = &h0
		Sub BrowseBonjourServicesOfType(type as string, inDomain as string = "")
		  
		  #if TargetMacOS
		    if NetBrowser=nil then
		      NetBrowser = new NSNetServiceBrowser
		      NetBrowser.AttachedProperty( "ParentBonjourControl" ) = me
		    end if
		    
		    NetBrowser.SearchForServicesOfType   type, inDomain
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  #if TargetMacOS
		    BonjourModule.RegisterControl  me
		    Super.Constructor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindService(nsservice as NSNetService, andRemove as Boolean = false) As BonjourService
		  
		  dim result as BonjourService
		  
		  for i as integer=0 to BSS.Ubound
		    if BSS( i ).Handle = nsservice.id then //Found
		      result = BSS( i )
		      if andRemove then
		        BSS.Remove   i
		      end if
		      return  result
		    end if
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
		  
		  RaiseEvent   ServiceResolutionError( service, errorCode, errorDomain )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceResolved(service as BonjourService)
		  
		  RaiseEvent   ServiceResolved( service )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceStoppedResolving(service as BonjourService)
		  
		  RaiseEvent   ServiceStoppedResolving( service )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceTXTDataChanged(service as BonjourService)
		  
		  RaiseEvent   ServiceTXTRecordChanged( service )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Private_HandleCallbacks(sender as NSNetService, action as string, paramarray params as variant)
		  dim errDict as Dictionary
		  dim nsservice as NSNetService
		  dim moreToCome as Boolean
		  dim bs as BonjourService
		  
		  select case action
		    'case "DidFindService"
		    'nsservice = params( 0 )
		    'moreToCome = params( 1 )
		    'bs = BonjourService.CreateFromCocoaObject( nsservice )
		    'BSS.Append  bs
		    'RaiseEvent   ServiceAdded( bs, moreToCome )
		    '
		    'case "DidRemoveService"
		    'nsservice = params( 0 )
		    'moreToCome = params( 1 )
		    'bs = FindService( nsservice, true )
		    'RaiseEvent  ServiceRemoved( bs, moreToCome )
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Private_HandleCallbacks(sender as NSNetServiceBrowser, action as string, paramarray params as variant)
		  dim errDict as Dictionary
		  dim nsservice as NSNetService
		  dim moreToCome as Boolean
		  dim bs as BonjourService
		  
		  select case action
		  case "DidFindService"
		    nsservice = params( 0 )
		    moreToCome = params( 1 )
		    bs = BonjourService.CreateFromCocoaObject( nsservice )
		    BSS.Append  bs
		    RaiseEvent   ServiceAdded( bs, moreToCome )
		    
		  case "DidRemoveService"
		    nsservice = params( 0 )
		    moreToCome = params( 1 )
		    bs = FindService( nsservice, true )
		    RaiseEvent  ServiceRemoved( bs, moreToCome )
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterBonjourService(service as BonjourService)
		  
		  BSS.Append   service
		  
		  AddHandler   service.Resolved, AddressOf Handle_ServiceResolved
		  AddHandler   service.ResolutionError, AddressOf Handle_ServiceResolutionError
		  AddHandler   service.StoppedResolving, AddressOf Handle_ServiceStoppedResolving
		  AddHandler   service.TXTDataChanged, AddressOf Handle_ServiceTXTDataChanged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterBonjourService(Name as string, type as string, domain as string, port as integer, TXTDictionary as Dictionary = nil)
		  //# Register a Bonjour service
		  
		  dim nsns as NSNetService = NSNetService.InitForPublishing( name, domain, type, port )
		  
		  if nsns<>nil then
		    nsns.ServiceTXTDictionary = TXTDictionary
		    'nsns.Private_SetParent   me
		    'nsns.AttachedProperty( "BonjourControlParent" ) = me
		    BonjourModule.PublishService   nsns
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResolveBonjourService(Name as string, type as string, domain as string = "", timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    dim nsns as NSNetService = NSNetService.InitForResolving( name, domain, type )
		    
		    if nsns<>nil then
		      NetServices.Append   nsns
		      nsns.AttachedProperty( "ParentBonjourControl" ) = me
		      nsns.Resolve   timeoutInSeconds
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RegisterError(name as string, type as string, domain as string, err as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceAdded(service as BonjourService, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRegistered(name as string, type as string, domain as string, port as string, TXTDict as Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRemoved(service as BonjourService, moreComing as boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceResolved(service as BonjourService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceStoppedResolving(service as BonjourService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceTXTRecordChanged(service as BonjourService)
	#tag EndHook


	#tag Property, Flags = &h21
		Private BSS() As BonjourService
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NetBrowser As NSNetServiceBrowser
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NetServices() As NSNetService
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
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
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
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
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
