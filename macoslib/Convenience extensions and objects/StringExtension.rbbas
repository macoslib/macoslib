#tag Module
Protected Module StringExtension
	#tag Method, Flags = &h0
		Function InstrFindAllWithOptions(theString as string, substring as string, options as integer = 1) As pair()
		  //# Find all the occurrences of substring inside theString with the given options and return an array of Pairs.
		  
		  //@ Each Pair contain the range of matching characters (start:length).
		  
		  #if TargetMacOS
		    dim cfs as new CFString( theString )
		    dim range as CFRange
		    dim nsa as CFArray
		    dim p() as Pair
		    dim mb as MemoryBlock
		    
		    nsa = cfs.CreateArrayWithFindResults( substring, options )
		    if nsa<>nil then
		      for i as integer = 0 to nsa.Count - 1
		        mb = nsa.Value( i )
		        p.Append   mb.Int32Value( 0 ) : mb.Int32Value( 4 )
		      next
		    end if
		    
		    return   p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrWithOptions(theString as string, substring as string, options as integer = 1) As pair
		  //# Find the first occurrence of substring inside theString with the given options and return the range of matching characters as a Pair (start:length) or nil if not found.
		  
		  #if TargetMacOS
		    dim cfs as new CFString( theString )
		    dim range as CFRange
		    
		    range = cfs.StringFindWithOptions( substring, options )
		    if range.length<>0 then
		      return   range.location : range.length
		    else
		      return   nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrCompWithOptions(string1 as String, string2 as string, kCFCompareOptions as integer) As integer
		  //# Compare 2 strings with extended options
		  
		  //@ For options, specify constants beginning with kCFCompare... defined in module CoreFoundation
		  //@ For multiple constants, use OR.
		  
		  #if TargetMacOS
		    dim cfs as new CFString( string1 )
		    
		    return   cfs.StringCompareWithOptions( string2, kCFCompareOptions )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimWhitespace(extends s as string) As string
		  //# Trim whitespaces at both ends of the passed string.
		  
		  //@ Whitespaces include space, tab, newlines, carriage returns and all characters that do not have a visible representation
		  
		  #if TargetMacOS
		    dim cfm as new CFMutableString( s )
		    
		    cfm.TrimWhitespace
		    return   cfm.StringValue
		  #endif
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
