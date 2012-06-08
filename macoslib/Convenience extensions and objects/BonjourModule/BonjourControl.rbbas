#tag Class
Class BonjourControl
Inherits Canvas
	#tag Method, Flags = &h21
		Private Shared Sub Callback_ServiceRegistered(bc as BonjourControl, ServiceName as string, type as string, domain as string, port as integer, TXTDict as Dictionary, err as integer)
		  
		  bc.Handle_ServiceRegistered   ServiceName, type, domain, port, TXTDict, err
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceRegistered(ServiceName as string, type as string, domain as string, port as integer, TXTDict as Dictionary, err as integer)
		  '
		  'if err<>0 then
		  'RaiseEvent   RegisterError  err
		  'else
		  'RaiseEvent   ServiceRegistered   ServiceName, type, domain, port, TXTDict
		  'end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterService(Name as string, type as string, domain as string, port as integer, TXTDictionary as Dictionary = nil)
		  //# Register a Bonjour service
		  
		  'BonjourModule.RegisterService( Name, type, domain, port, TXTDictionary, AddressOf  Callback_ServiceRegistered )
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RegisterError(err as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRegistered(name as string, type as string, domain as string, port as string, TXTDict as Dictionary)
	#tag EndHook


End Class
#tag EndClass
