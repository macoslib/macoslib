#tag Class
Class BonjourServiceForPublishing
Inherits BonjourService
	#tag Event
		Sub ResolutionError(errorCode as integer, errorDomain as integer)
		  //Not applicable in BonjourServiceForPublishing
		  #pragma unused errorCode
		  #pragma unused errorDomain
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resolved()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub StoppedResolving()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TXTDataChanged()
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Addresses() As String()
		  #if TargetMacOS
		    return  nsns.Addresses
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //No empty constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(name as string, type as string, domain as string = "", port as integer)
		  
		  nsns = NSNetService.InitForResolving( name, domain, type )
		  
		  if nsns=nil then
		    raise  new MacOSError( -50, "Impossible to create an instance of BonjourService. Parameter error." )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromCocoaObject(service as NSNetService) As BonjourServiceForPublishing
		  
		  dim bs as new BonjourServiceForPublishing
		  
		  if service.Port<=0 then
		    raise new MacOSError( -50, "Service was not configured for publishing. Parameter error." )
		  end if
		  
		  bs.nsns = service
		  bs.RegisterHandlers
		  
		  return  bs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Domain
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  
		  return   nsns.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidNotPublish(sender as NSNetService, errorCode as integer, errorDomain as integer)
		  #pragma unused sender
		  
		  if me.Parent = nil then //Standalone object
		    CustomBonjourEvents.event_ServicePublishingError   me, errorcode, errorDomain
		  else
		    RaiseEvent   PublishingError( errorCode, errorDomain )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidPublish(sender as NSNetService)
		  #pragma Unused sender
		  
		  if me.Parent = nil then //Standalone object
		    CustomBonjourEvents.event_ServicePublished   me
		  else
		    RaiseEvent  Published()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidStop(sender as NSNetService)
		  #pragma unused sender
		  
		  if me.Parent = nil then //Standalone object
		    CustomBonjourEvents.event_ServiceStoppedPublishing   me
		  else
		    RaiseEvent  StoppedPublishing()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Name
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Parent() As BonjourControl
		  //Not applicable in BonjourServiceForPublishing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As integer
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Port
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Publish()
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      nsns.Publish
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterHandlers()
		  //# Setup communication between the underlying object and BonjourServiceForPublishing
		  
		  //@ DO NOT EDIT
		  
		  AddHandler   nsns.DidNotPublish, AddressOf Handle_DidNotPublish
		  AddHandler   nsns.DidPublish, AddressOf Handle_DidPublish
		  AddHandler   nsns.DidStopPublishing, AddressOf Handle_DidStop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Resolve(timeoutInSeconds as double)
		  //Block this inherited method which does not apply here
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetParent(parent as BonjourControl)
		  //Not applicable in BonjourServiceForPublishing
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As string
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      return  nsns.Type
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Published()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PublishingError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StoppedPublishing()
	#tag EndHook


	#tag Note, Name = Documentation
		A BonjourServiceForPublishing object represents a service that you can publish on the network. You do not need to create instance of this object
		as the BonjourModule will do it for you.
		
		As all the Bonjour operations are asynchronous, the BonjourServiceForPublishing objects events will inform you about the current publishing status.
		The events will automatically be raised:
		  • In the CustomBonjourEvents module
		  • In any existing BonjourControl object
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			// The underlying Cocoa object
		#tag EndNote
		Private nsns As NSNetService
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			//The parent BonjourControl, when necessary
		#tag EndNote
		Private ParentBonjourControl As WeakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return  nsns.ServiceTXTDictionary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  nsns.ServiceTXTDictionary = value
			  
			End Set
		#tag EndSetter
		TXTRecord As Dictionary
	#tag EndComputedProperty


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
End Class
#tag EndClass
