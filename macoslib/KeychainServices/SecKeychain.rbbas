#tag Class
Class SecKeychain
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return SecKeychain.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib KeychainServices.framework alias "SecKeychainGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function SecKeychainCopyDefault lib KeychainServices.framework (ByRef keychain as Ptr) as Integer
		    
		    dim newRef as Ptr
		    dim err as Integer = SecKeychainCopyDefault(newRef)
		    if err = noErr then
		      self.Constructor(newRef, CFType.hasOwnership)
		    else
		      raise new KeychainServices.Error(err)
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
