#tag Module
Protected Module BonjourModule
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub delegate_ServiceRegistered(bc as BonjourControl, ServiceName as string, type as string, domain as string, TXTDict as Dictionary, err as integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub DidNotPublishCallback(sender as NSNetService, errorCode as integer, errorDomain as integer)
		  
		  dim d as delegate_ServiceRegistered = sender.AttachedProperty( "Callback" )
		  
		  'd.Invoke
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DidPublishCallback(sender as NSNetService)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterService(Name as string, type as string, domain as string, port as integer, TXTDictionary as Dictionary = nil, callback as delegate_ServiceRegistered)
		  '
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
		  'AddHandler  nsns.DidPublish, DidPublishCallback
		  'AddHandler  nsns.DidNotPublish, DidNotPublishCallback
		  'nsns.Publish
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected RegisteredServices() As NSNetService
	#tag EndProperty


End Module
#tag EndModule
