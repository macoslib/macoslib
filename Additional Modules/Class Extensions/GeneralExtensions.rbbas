#tag Module
Protected Module GeneralExtensions
	#tag Method, Flags = &h0
		Function FileMD5(extends TheFile as FolderItem) As string
		  Dim f as FolderItem = TheFile
		  Dim b as BinaryStream
		  Dim s as String
		  
		  Dim d as New MD5Digest
		  
		  If f = Nil Then Return "Nil"
		  
		  If NOT f.IsReadable And NOT f.IsWriteable Then
		    Return "Protected File"
		  Else
		    b = BinaryStream.Open( f, False )
		    
		    While NOT b.eof
		      s = b.Read( 1000000 )
		      d.Process s
		    Wend
		    
		    Return EncodeHex( d.Value )
		  End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hex(value as variant, digits as integer) As String
		  //# Return a hex string with the passed number of digits, adding zeros at the beginning if necessary
		  
		  //@ 'value' must be numeric.
		  //@ If the result is longer than the number of digits, the full result is returned
		  
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
		Function InRange(extends Value as Double, Min as Double = 0, Max as Double = 32767) As Boolean
		  if Value <= Min And Value <= Max then
		    return True
		  else
		    return False
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTrueNumber(extends v as variant) As Boolean
		  //# Equivalent to Variant.IsNumeric but does not return true for strings representing a numeric value
		  
		  Select case VarType( v )
		  case Variant.TypeInteger, Variant.TypeLong, Variant.TypeSingle, Variant.TypeDouble, Variant.TypeCurrency
		    return   true
		  end select
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
