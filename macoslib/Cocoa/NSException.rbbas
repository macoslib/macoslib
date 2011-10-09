#tag Class
Class NSException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(p as Ptr)
		  #if targetMacOS
		    declare function code lib CocoaLib selector "code" (obj_id as Ptr) as Integer
		    declare function localizedDescription lib CocoaLib selector "localizedDescription" (obj_id as Ptr) as Ptr
		    declare function domain lib CocoaLib selector "domain" (obj_id as Ptr) as Ptr
		    
		    self.ErrorNumber = code(p)
		    self.Message = Retain(localizedDescription(p))
		    self.Domain = Retain(domain(p))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Retain(p as Ptr) As String
		  //I expect p to be a CFStringRef.
		  if p <> nil then
		    return CFStringRetain(p)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = ReadMe
		NSException is essentially a wrapper for the Cocoa NSError class.  It's not named NSError
		because it does not inherit from NSObject, so I decided to tweak the name; also, NSException 
		fits standard Rb naming of RuntimeException subclasses.
		
	#tag EndNote


	#tag Property, Flags = &h0
		Domain As String
	#tag EndProperty


End Class
#tag EndClass
