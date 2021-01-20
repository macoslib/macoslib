#tag Class
Protected Class Error
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(errno as Integer)
		  self.ErrorNumber = errno
		  self.Message = ErrorMessage(errno)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ErrorMessage(errorCode as Integer) As String
		  #if TargetMacOS
		    
		    declare function strerror lib libc (errcode as Integer)  as Ptr
		    
		    dim errorMsg as MemoryBlock = strerror(errorCode)
		    if errorMsg <> nil then
		      return DefineEncoding(errorMsg.CString(0), Encodings.SystemDefault)
		    else
		      //something bad has happened
		      return ""
		    end if
		    
		  #else
		    
		    #pragma unused errorCode
		    
		  #endif
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
