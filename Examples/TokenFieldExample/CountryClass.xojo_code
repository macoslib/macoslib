#tag Class
Protected Class CountryClass
Implements DebugReportFormatter
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(abbreviationAndName as string)
		  
		  dim parts() as string = Split( abbreviationAndName, ":" )
		  
		  ISOAbbreviation = parts( 0 )
		  Name = parts( 1 )
		  URL = "http://en.wikipedia.org/wiki/" + Name  //Of course, this will not always work
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  // Part of the DebugReportFormatter interface.
		  
		  #pragma unused formatSpec
		  
		  dim result() as variant
		  
		  result.Append   "name = " + me.Name
		  result.Append   "abbreviation = " + me.ISOAbbreviation
		  result.Append   "URL = " + me.URL
		  
		  return  result
		  
		  //We also can return a string like:
		  'return   "<CountryClass: name=" + me.Name + ", abbreviation=" + me.ISOAbbreviation + ", URL=" + me.URL + " >"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ISOAbbreviation As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ISOAbbreviation"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
