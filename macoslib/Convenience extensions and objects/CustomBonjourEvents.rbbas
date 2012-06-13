#tag Module
Protected Module CustomBonjourEvents
	#tag Method, Flags = &h1
		Protected Sub event_ServicePublished(service as BonjourServiceForPublishing)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServicePublishingError(service as BonjourServiceForPublishing, errorCode as integer, errorDomain as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServiceResolved(service as BonjourService)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServiceStoppedPublishing(service as BonjourServiceForPublishing)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServiceStoppedResolving(service as BonjourService)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub event_ServiceTXTRecordChanged(service as BonjourService)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		This custom module allows you to manage Bonjour services with no BonjourControl (which would imply user interaction). This is especially useful because all Bonjour
		commands are asynchronous.
		  • Publishing one or more services
		  • Resolving services which your application has stored previously
		
		Write some code in the "event..." methods you are interested in. Methods to create/use Bonjour services are declared elsewhere (in BonjourModule).
		
		
		BEWARE: do not replace your CustomBonjourEvents module when updating macoslib
		
	#tag EndNote


	#tag Constant, Name = kCustomBonjourEventsVersion, Type = Double, Dynamic = False, Default = \"100", Scope = Protected
	#tag EndConstant


End Module
#tag EndModule
