#tag Class
Protected Class MacOSError
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(errorCode as Integer, errorMessage as String)
		  self.ErrorNumber = errorCode
		  self.Message = errorMessage
		End Sub
	#tag EndMethod


End Class
#tag EndClass
