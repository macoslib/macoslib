#tag Class
Protected Class BadSystemException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(msg as string)
		  
		  me.Message = msg
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
