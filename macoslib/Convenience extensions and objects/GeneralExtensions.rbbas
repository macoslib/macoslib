#tag Module
Protected Module GeneralExtensions
	#tag Method, Flags = &h0
		Function Hex(value as variant, digits as integer) As String
		  //# Return a hex string with the passed number of digits
		  
		  const zeros = "00000000000000000000000000000000"
		  
		  dim s as string = Hex( value )
		  
		  if Len( s )>digits then
		    return  s
		  else
		    return  Right( zeros + s, digits )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IFTE(condition as boolean, valueIfTrue as variant, valueIfFalse as variant) As variant
		  //# if condition is true, returns "valueIfTrue" and "valueIfFalse" otherwise. IFTE stand for "IF Then Else"
		  
		  if condition then
		    return   valueIfTrue
		  else
		    return   valueIfFalse
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewRange(start as integer, length as integer) As Range
		  //# Create a Range from the Start and Length parameters
		  
		  dim r as new Range
		  r.StartPos = start
		  r.Length = length
		  
		  return  r
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
