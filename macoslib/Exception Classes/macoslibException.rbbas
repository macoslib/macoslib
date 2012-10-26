#tag Class
Protected Class macoslibException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(msg as string)
		  me.ErrorNumber = -1
		  me.Message = msg
		  'dim stack() as string
		  //calling method code removed for now.
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		macoslibException represents any exception that occurred in a macoslib method for which there is no associated Mac OS error code (otherwise, you would get a MacOSError
		  exception instead). The errorCode usually has no meaning and is -1 by default. See the error mesage for description of the error.
	#tag EndNote


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
