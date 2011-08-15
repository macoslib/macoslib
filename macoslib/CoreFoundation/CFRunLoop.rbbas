#tag Class
Class CFRunLoop
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return CFRunLoop.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddSource(source as CFRunLoopSource)
		  if source = nil then
		    return
		  end if
		  
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CFRunLoopAddSource lib CarbonLib (rl as Ptr, source as Ptr, mode as Ptr)
		    
		    CFRunLoopAddSource me, source, CFRunLoopCommonModes
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CFRunLoopCommonModes() As Ptr
		  dim p as Ptr = CFBundle.CarbonFramework.DataPointerNotRetained(kCFRunLoopCommonModes)
		  if p <> nil then
		    return p.Ptr(0)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function TypeID lib CarbonLib alias "CFRunLoopGetTypeID" () as UInt32
		    static id as CFTypeID = CFTypeID(TypeID)
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsSource(source as CFRunLoopSource) As Boolean
		  #if targetMacOS
		    soft declare function CFRunLoopContainsSource lib CarbonLib (rl as Ptr, source as Ptr, mode as Ptr) as Boolean
		    
		    return me <> nil and source <> nil  and CFRunLoopContainsSource(me, source, CFRunLoopCommonModes)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Current() As CFRunLoop
		  #if targetMacOS
		    soft declare function CFRunLoopGetCurrent lib CarbonLib () as Ptr
		    const hasOwnership = false
		    return new CFRunLoop(CFRunLoopGetCurrent(), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Main() As CFRunLoop
		  #if targetMacOS
		    //Available in Mac OS X v10.5 and later.
		    soft declare function CFRunLoopGetMain lib CarbonLib () as Ptr
		    const hasOwnership = false
		    return new CFRunLoop(CFRunLoopGetMain(), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSource(source as CFRunLoopSource)
		  if source = nil then
		    return
		  end if
		  
		  if me = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare sub CFRunLoopRemoveSource lib CarbonLib (rl as Ptr, source as Ptr, mode as Ptr)
		    
		    CFRunLoopRemoveSource me, source, CFRunLoopCommonModes
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		I've written the methods to always pass kCFLoopCommonModes to mode parameters.  This would not be hard to remove.
	#tag EndNote


	#tag Constant, Name = kCFRunLoopCommonModes, Type = String, Dynamic = False, Default = \"kCFRunLoopCommonModes", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="CFType"
		#tag EndViewProperty
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
