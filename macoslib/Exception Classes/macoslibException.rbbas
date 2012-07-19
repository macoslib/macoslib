#tag Class
Protected Class macoslibException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(msg as string)
		  
		  me.ErrorNumber = -1
		  me.Message = msg
		  dim stack() as string
		  
		  //Automatically determine the calling method
		  #Pragma BreakOnExceptions false
		  try
		    raise  me
		  catch exc as RuntimeException
		    stack = exc.Stack
		  end try
		  #Pragma BreakOnExceptions Default
		  
		  if stack.Ubound>-1 then
		    MethodName = stack( 0 ).StringBefore( "%" )
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		macoslibException represents any exception that must have occurred because of the macoslib implementation itself. The errorCode usually has no meaning and is -1 by default.
	#tag EndNote


	#tag Property, Flags = &h0
		MethodName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RuntimeException"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RuntimeException"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MethodName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
