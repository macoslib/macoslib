#tag Class
Class CFSocket
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(protocolFamily as Integer, socketType as Integer, protocol as Integer, callbackTypes as Integer)
		  #if TargetMacOS
		    declare function CFSocketCreate lib CarbonLib (allocator as Ptr, protocolFamily as Integer, socketType as Integer, protocol as Integer, cbTypes as Integer, callBack as Ptr, ByRef context as CFSocketContext) as Ptr
		    
		    prepareCallback()
		    dim p as Ptr = CFSocketCreate (nil, protocolFamily, socketType, protocol, callbackTypes, AddressOf _socketCallBack, myContext)
		    super.Constructor p, true
		    installRunLoopHandler()
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(socketSignature as CFSocketSignature, callbackTypes as Integer, connect as Boolean = false, timeoutSeconds as Double = 10.0)
		  // Note: timeoutSeconds only matters if connect=true
		  
		  #if TargetMacOS
		    declare function CFSocketCreateWithSocketSignature lib CarbonLib (allocator as Ptr, ssig as Ptr, cbTypes as Integer, callBack as Ptr, ByRef context as CFSocketContext) as Ptr
		    declare function CFSocketCreateConnectedToSocketSignature lib CarbonLib (allocator as Ptr, ssig as Ptr, cbTypes as Integer, callBack as Ptr, ByRef context as CFSocketContext, timeout as Double) as Ptr
		    
		    prepareCallback()
		    if connect then
		      super.Constructor CFSocketCreateConnectedToSocketSignature (nil, socketSignature.Reference, callbackTypes, AddressOf _socketCallBack, myContext, timeoutSeconds), true
		    else
		      super.Constructor CFSocketCreateWithSocketSignature (nil, socketSignature.Reference, callbackTypes, AddressOf _socketCallBack, myContext), true
		    end if
		    installRunLoopHandler()
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  me.Close
		  _sockets.Remove(myContext.info)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  #if TargetMacOS
		    declare function CFSocketIsValid lib CarbonLib (socketRef as Ptr) as Boolean
		    
		    if not me.IsNULL then
		      return CFSocketIsValid (me.Reference)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  #if TargetMacOS
		    declare sub CFSocketInvalidate lib CarbonLib (socketRef as Ptr)
		    declare sub CFRunLoopRemoveSource lib CarbonLib (runLoopRef as Ptr, source as Ptr, mode as CFStringRef)
		    
		    CFSocketInvalidate (me.Reference)
		    
		    if me.theRLSrc <> nil then
		      CFRunLoopRemoveSource (me.theRunLoop, me.theRLSrc, CFConstant("kCFRunLoopCommonModes"))
		      CFType.Release (me.theRLSrc)
		      me.theRLSrc = nil
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if TargetMacOS
		    soft declare function CFSocketGetTypeID lib CarbonLib () as CFTypeID
		    static id as CFTypeID = CFSocketGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bind(address as CFData) As Boolean
		  #if TargetMacOS
		    declare function CFSocketSetAddress lib CarbonLib (socketRef as Ptr, addr as Ptr) as Integer
		    
		    if not me.IsNULL then
		      dim errCode as Integer = CFSocketSetAddress (me.Reference, address)
		      return errCode = 0
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IP4Address(ip4address as String, port as UInt16) As CFData
		  // struct sockaddr_in
		  
		  'TODO: turn into subclasses: CFSocketIP4Address, etc.
		  'TODO: resolve name!
		  
		  dim mb as new MemoryBlock (16)
		  mb.LittleEndian = false
		  mb.UInt8Value(0) = mb.Size
		  mb.UInt8Value(1) = CFSocket.PF_INET
		  mb.UInt16Value(2) = port
		  mb.UInt8Value(4) = Val(ip4address.NthField(".",1))
		  mb.UInt8Value(5) = Val(ip4address.NthField(".",2))
		  mb.UInt8Value(6) = Val(ip4address.NthField(".",3))
		  mb.UInt8Value(7) = Val(ip4address.NthField(".",4))
		  return new CFData (mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UnixDomainAddress(unixPath as String) As CFData
		  // struct sockaddr_un
		  
		  if unixPath.Encoding <> nil then
		    unixPath = unixPath.ConvertEncoding(Encodings.UTF8) // just to make sure it's not in UTF-16 or something unusable
		  end if
		  dim mb as new MemoryBlock (2+unixPath.LenB+1)
		  mb.LittleEndian = false
		  mb.UInt8Value(0) = mb.Size
		  mb.UInt8Value(1) = CFSocket.PF_UNIX
		  mb.CString (2) = unixPath
		  return new CFData (mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub installRunLoopHandler()
		  declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		  declare function CFSocketCreateRunLoopSource lib CarbonLib (allocator as Ptr, socketRef as Ptr, order as Integer) as Ptr
		  declare sub CFRunLoopAddSource lib CarbonLib (runLoopRef as Ptr, source as Ptr, mode as CFStringRef)
		  
		  me.theRunLoop = CFRunLoopGetCurrent()
		  me.theRLSrc = CFSocketCreateRunLoopSource (nil, me.Reference, 0)
		  CFRunLoopAddSource (me.theRunLoop, me.theRLSrc, CFConstant("kCFRunLoopCommonModes"))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub _socketCallBack(socketRef as Ptr, type as Integer, addressRef as Ptr, dataPtr as Ptr, context_info as Integer)
		  dim s as CFSocket = CFSocket(WeakRef(_sockets.Value(context_info)).Value)
		  s.socketCallBack (socketRef, type, addressRef, dataPtr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub socketCallBack(socketRef as Ptr, type as Integer, addressRef as Ptr, dataPtr as Ptr)
		  mHadConnectOrAccept = true
		  if type = 1 then
		    raiseEvent IncomingData (nil)
		  elseif type = 2 then
		    raiseEvent Accepted (new CFData(addressRef,false))
		  elseif type = 3 then
		    dim d as new CFData(dataPtr,false)
		    raiseEvent IncomingData (d)
		  elseif type = 4 then
		    dim mb as MemoryBlock = dataPtr
		    raiseEvent Connected (mb.Long(0))
		  elseif type = 8 then
		    raiseEvent DataSent ()
		  else
		    break //oops - unknown type
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub prepareCallback()
		  dim v as Variant = me
		  myContext.info = v.Hash
		  if _sockets = nil then _sockets = new Dictionary
		  if _sockets.HasKey(myContext.info) then raise new RuntimeException // oops! that should never be able to happen
		  _sockets.Value(myContext.info) = new WeakRef(me)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Accepted(addressData as CFData)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event IncomingData(data as CFData)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Connected(errorCode as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataSent()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			declare function CFSocketGetNative lib CarbonLib (socketRef as Ptr) as CFSocketNativeHandle
			
			if not me.IsNULL then
			return CFSocketGetNative (me.Reference)
			end if
			#endif
			End Get
		#tag EndGetter
		NativeHandle As CFSocketNativeHandle
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private theRunLoop As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theRLSrc As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			key: CFSocket's hash value
			value: WeakRef of CFSocket object
		#tag EndNote
		Private Shared _sockets As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myContext As CFSocketContext
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			return mHadConnectOrAccept
			End Get
		#tag EndGetter
		HasConnected As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHadConnectOrAccept As Boolean
	#tag EndProperty


	#tag Constant, Name = PF_INET, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PF_INET6, Type = Double, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PF_UNIX, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SOCK_STREAM, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IPPROTO_TCP, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IPPROTO_UDP, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SOCK_RAW, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SOCK_DGRAM, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SOCK_SEQPACKET, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IPPROTO_ICMP, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kReadCallBack, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAcceptCallBack, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDataCallBack, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kConnectCallBack, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWriteCallBack, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNoCallBack, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CFSocketContext, Flags = &h21
		version as Int32
		  info as Integer
		  retainFunc as Ptr
		  releaseFunc as Ptr
		copyDescFunc as Ptr
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="CFType"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
