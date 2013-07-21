#tag Module
Protected Module StringExtension
	#tag Method, Flags = &h0
		Sub Append(extends s() as string, t() as string)
		  //# Appends an array of strings to another array of strings
		  
		  for i as integer = 0 to UBound(t)
		    s.Append t(i)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(extends s as string) As Boolean
		  //# Returns true if string is not empty, and string is not a possible false value
		  
		  return NOT ( s = "" or s = "false" or s = "f" or s = "0" or s = "no" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(extends s as string, substring as String) As Boolean
		  //# Return true if 'substring' is contained in 's' (comparison is case-insensitive)
		  
		  return  ( s.Instr( substring ) > 0 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsB(extends s as string, substring as String) As Boolean
		  //# Return true if 's' contains the 'substring'.
		  
		  //@ By 'contains' we mean binary containment, as with InStrB.
		  
		  return  ( s.InStrB( substring ) > 0 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndsWith(extends s as string, substring as string) As Boolean
		  //# Return true if the string ends with the substring. (case-insensitive)
		  
		  return Right(s, substring.Len) = substring
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndsWithB(extends s as string, substring as string) As Boolean
		  //# Return true if the string ends with the substring, doing a binary comparison.
		  
		  return StrComp(RightB(s, substring.LenB), substring, 0) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatSize(size as Int64) As String
		  //# Format a file size as a 2-decimal number with appropriate unit (K, M, G, T). It is up to you to add the proper localized abbreviation for "byte".
		  
		  //@ [Cross-platform]
		  
		  
		  static KB as Int64 = 1024
		  static MB as Int64 = KB * KB
		  static GB as Int64 = MB * KB
		  static TB as Int64 = GB * KB
		  static EB as Int64 = TB * KB
		  
		  if size<1024 then
		    return  Str( size )
		    
		  else
		    if size < MB then
		      return   Str( size / KB, "#########.##" ) + " K"
		      
		    elseif size < GB then
		      return   Str( size / MB, "#########.##" ) + " M"
		      
		    elseif size < TB then
		      return   Str( size / GB, "#########.##" ) + " G"
		      
		    elseif size < EB then
		      return   Str( size / EB, "#########.##" ) + " T"
		      
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GUnzip(extends data as string, expectedMaxSize as integer) As string
		  //# Decompress a string compressed with GZip and returns the decompressed string.
		  
		  //@ [Cross-platform]
		  
		  soft declare function uncompress lib libzLib (outBuf as Ptr, byref outLen as UInt32, inBuf as Ptr, inLen as UInt32) as integer
		  
		  dim inBuffer, outBuffer as MemoryBlock
		  dim err as integer
		  dim bufferLength as UInt32
		  
		  
		  inBuffer = data
		  
		  outBuffer = New MemoryBlock( expectedMaxSize )
		  bufferLength = outBuffer.Size
		  
		  err = uncompress( outBuffer, bufferLength, inBuffer, inBuffer.Size)
		  
		  if err=0 then
		    return   outBuffer.StringValue( 0, bufferLength )
		    
		  else
		    return ""
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GZip(extends data as string, level as integer = 6) As string
		  //# Compress a string with GZip and returns the compressed string.
		  
		  //@ [Cross-platform]
		  
		  soft declare function compress2 lib libzLib (outBuf as Ptr, byref outBufLen as UInt32, inBuf as Ptr, inBufLen as UInt32, level as Integer) as integer
		  
		  dim outBuffer, inBuffer as MemoryBlock
		  dim bufferLen as UInt32
		  
		  inBuffer = data
		  'inBuffer.StringValue( 0, lenB( data )) = data
		  
		  outBuffer = New MemoryBlock( lenB( data ) * 1.001 + 12 )
		  bufferLen = outBuffer.Size
		  
		  dim err as integer = compress2( outBuffer, bufferLen, inBuffer, inBuffer.Size, level )
		  
		  if err=0 then
		    return  outBuffer.StringValue( 0, bufferLen )
		    
		  else
		    return  ""
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrFindAllWithOptions(extends theString as string, substring as string, options as integer = 1) As pair()
		  //# Find all the occurrences of substring inside theString with the given options and return an array of Pairs.
		  
		  //@ Each Pair contain the range of matching characters (start:length).
		  
		  #if TargetMacOS
		    dim cfs as new CFString( theString )
		    dim nsa as CFArray
		    dim p() as Pair
		    dim mb as MemoryBlock
		    
		    nsa = cfs.CreateArrayWithFindResults( substring, options )
		    if nsa<>nil then
		      for i as integer = 0 to nsa.Count - 1
		        mb = nsa.Value( i )
		        p.Append   mb.Int32Value( 0 ) + 1 : mb.Int32Value( 4 )  //+1 to make the char position RB-like
		      next
		    end if
		    
		    return   p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrFindAllWithOptions(theString as string, substring as string, options as integer = 1) As pair()
		  //# Find all the occurrences of substring inside theString with the given options and return an array of Pairs.
		  
		  //@ Each Pair contain the range of matching characters (start:length).
		  
		  #if TargetMacOS
		    dim cfs as new CFString( theString )
		    dim nsa as CFArray
		    dim p() as Pair
		    dim mb as MemoryBlock
		    
		    nsa = cfs.CreateArrayWithFindResults( substring, options )
		    if nsa<>nil then
		      for i as integer = 0 to nsa.Count - 1
		        mb = nsa.Value( i )
		        p.Append   mb.Int32Value( 0 ) + 1 : mb.Int32Value( 4 )  //+1 to make the char position RB-like
		      next
		    end if
		    
		    return   p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrWithOptions(extends theString as string, substring as string, options as integer = 1) As pair
		  //# Find the first occurrence of substring inside theString with the given options and return the range of matching characters as a Pair (start:length) or nil if not found.
		  
		  #if TargetMacOS
		    dim cfs as new CFString( theString )
		    dim range as CFRange
		    
		    range = cfs.StringFindWithOptions( substring, options )
		    if range.length<>0 then
		      return   range.location + 1 : range.length  //+1 to make the location RB-like
		    else
		      return   nil
		    end if
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
		      return   range.location + 1 : range.length  //+1 to make the location RB-like
		    else
		      return   nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEmail(extends s as String) As Boolean
		  //# Returns true if the string is a valid email address
		  
		  dim nSearch as New RegEx
		  
		  nSearch.SearchPattern = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
		  return ( nSearch.Search(s) <> Nil )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInArray(extends s as String, L() as String) As Boolean
		  //# Returns true if the string is contains in the string array
		  
		  //@ [Cross-platform]
		  
		  return L.IndexOf(s) > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsNotInArray(extends s as String, L() as String) As Boolean
		  //# Returns true if the string is NOT contained in the string array
		  
		  //@ [Cross-platform]
		  
		  return L.IndexOf(s) = -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartsWith(extends s as string, substring as string) As Boolean
		  //# Return true if the string starts with the substring. (case-insensitive)
		  
		  return Left(s, substring.Len) = substring
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartsWithB(extends s as string, substring as string) As Boolean
		  //# Return true if the string starts with the substring, doing a binary comparison.
		  
		  return StrComp(LeftB(s, substring.LenB), substring, 0) = 0
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
		Function StringAfter(extends s as string, beginningString as string, includeBeginningString as Boolean = false) As string
		  //# Return the string after 'beginning string', except if you set 'includeBeginningString'
		  
		  //@ if the 'beginningString' is not found, the whole string is returned
		  
		  dim a as integer
		  
		  a = Instr(s, beginningString)
		  
		  if includeBeginningString then
		    return  Mid( s, a )
		  else
		    return Mid( s, len(beginningString) + a )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringBefore(extends s as string, beforeString as string, returnEmptyStringIfNotFound as boolean = false) As string
		  //#Returns the string before 'beforeString' or the whole string if the latter was not found
		  
		  //@ [Cross-platform]
		  //@ If 'beforeString' is not found, the method returns:
		  //@     • The full string if returnEmptyStringIfNotFound = false
		  //@     • An empty string is returnEmptyStringIfNotFound = true
		  
		  
		  dim a as integer = s.Instr( beforeString )
		  
		  if a=0 then
		    if returnEmptyStringIfNotFound then
		      return  ""
		    else
		      return  s
		    end if
		  else
		    return   s.Left( a - 1 )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringBetween(extends src as string, startTag as string, endTag as string, includeStart as Boolean = false, includeEnd as Boolean = false) As string
		  //# Return the string between startTag and endTag
		  
		  //@ If 'startTag' does not exist, 1 is assumed; if 'endTag' does not exist, the end of the source string 'src' is assumed
		  //@ If you want the result to include 'startTag' and/or 'endTag', set 'includeStart' and/or 'includeEnd' to true
		  
		  'dim s as string
		  dim a, a2, b, b2 as integer
		  
		  a = src.Instr( startTag )
		  if a=0 then
		    a=1
		    a2 = 1
		  else
		    a2 = a + startTag.Len
		    if NOT includeStart then
		      a = a2
		    end if
		  end if
		  
		  b = src.Instr( a2, endTag )
		  if b = 0 then
		    b = src.Len
		    b2 = b
		  else
		    b2 = b + endTag.Len
		    if NOT includeEnd then
		      b2 = b
		    end if
		  end if
		  
		  return   src.Mid( a, b2 - a )
		  
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


	#tag Constant, Name = libzLib, Type = String, Dynamic = False, Default = \"libz.dylib", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libz.dylib"
	#tag EndConstant


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
