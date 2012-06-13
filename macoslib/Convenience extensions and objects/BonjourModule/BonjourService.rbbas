#tag Class
Class BonjourService
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
		Sub Constructor(name as string, type as string, domain as string = "")
		  
		  nsns = NSNetService.InitForResolving( name, domain, type )
		  
		  if nsns=nil then
		    raise  new MacOSError( -50, "Impossible to create an instance of BonjourService. Parameter error." )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromCocoaObject(service as NSNetService) As BonjourService
		  
		  dim bs as new BonjourService
		  
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
		Private Sub Handle_DidNotResolve(sender as NSNetService, errorCode as integer, errorDomain as integer)
		  
		  #if TargetMacOS
		    if me.Parent = nil then //Standalone object
		      CustomBonjourEvents.event_ServiceResolutionError   me, errorcode, errorDomain
		    else
		      RaiseEvent   ResolutionError( errorCode, errorDomain )
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidResolve(sender as NSNetService)
		  
		  #if TargetMacOS
		    if me.Parent = nil then //Standalone object
		      CustomBonjourEvents.event_ServiceResolved   me
		    else
		      RaiseEvent   Resolved()
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidStopResolving(sender as NSNetService)
		  
		  #if TargetMacOS
		    if me.Parent = nil then //Standalone object
		      CustomBonjourEvents.event_ServiceStoppedResolving   me
		    else
		      RaiseEvent   StoppedResolving()
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_DidUpdateTXTRecord(sender as NSNetService, newData as MemoryBlock)
		  
		  #if TargetMacOS
		    if me.Parent = nil then //Standalone object
		      CustomBonjourEvents.event_ServiceTXTRecordChanged   me
		    else
		      RaiseEvent   TXTDataChanged
		    end if
		  #endif
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

	#tag Method, Flags = &h0
		Function Parent() As BonjourControl
		  
		  if ParentBonjourControl <> nil AND ParentBonjourControl.Value <> nil then
		    return   BonjourControl( ParentBonjourControl.Value )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterHandlers()
		  //# Setup communication between the underlying object and BonjourService
		  
		  //@ DO NOT EDIT
		  
		  AddHandler   nsns.DidNotResolve, AddressOf Handle_DidNotResolve
		  AddHandler   nsns.DidResolve, AddressOf Handle_DidResolve
		  AddHandler   nsns.DidStopResolving, AddressOf Handle_DidStopResolving
		  AddHandler   nsns.DidUpdateTXTRecord, AddressOf Handle_DidUpdateTXTRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resolve(timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    if nsns<>nil then
		      nsns.Resolve   timeoutInSeconds
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetParent(parent as BonjourControl)
		  
		  if parent<>nil then
		    ParentBonjourControl = new WeakRef( parent )
		  else
		    ParentBonjourControl = nil
		  end if
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
		Event ResolutionError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resolved()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StoppedResolving()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TXTDataChanged()
	#tag EndHook


	#tag Note, Name = Documentation
		A BonjourService object represents any service that you published on the network or that you discovered by browsing for a particular type.
		
		Such object contains information on the service (name, type, port, TXT data, addresses).
		
		
		NOTE: once you got a BonjourService, you need to call Resolve to determine the IP addresses allowing connection.
		
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
