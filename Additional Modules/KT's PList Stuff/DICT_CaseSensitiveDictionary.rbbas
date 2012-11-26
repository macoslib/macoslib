#tag Class
Protected Class DICT_CaseSensitiveDictionary
Inherits Dictionary
	#tag Method, Flags = &h0
		Sub AssignArrays(keyArr() As String, valueArr() As Variant)
		  // Takes two arrays, one for keys, the other of values, and creates a dictionary.
		  // Ubound of both must match or it's an error.
		  
		  if keyArr.Ubound <> valueArr.Ubound then
		    dim err as new RuntimeException
		    err.Message = "The key and value arrays must be of the same size."
		    raise err
		  end if
		  
		  dim lastIndex as integer = keyArr.Ubound
		  for i as integer = 0 to lastIndex
		    me.Value( keyArr( i ) ) = valueArr( i )
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignArrays(keyArr() As Variant, valueArr() As Variant)
		  // Takes two arrays, one for keys, the other of values, and creates a dictionary.
		  // Ubound of both must match or it's an error.
		  
		  if keyArr.Ubound <> valueArr.Ubound then
		    dim err as new RuntimeException
		    err.Message = "The key and value arrays must be of the same size."
		    raise err
		  end if
		  
		  dim lastIndex as integer = keyArr.Ubound
		  for i as integer = 0 to lastIndex
		    me.Value( keyArr( i ) ) = valueArr( i )
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignDictionary(dict As Dictionary)
		  // Converts a plain dictionary to a case-sensitive version
		  
		  dim k() as variant = dict.Keys
		  for i as integer = 0 to k.Ubound
		    dim thisKey as variant = k( i )
		    me.Value( thisKey ) = dict.Value( thisKey )
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignPairs(entries() As Pair)
		  for each entry as Pair in entries
		    me.Value( entry.Left ) = entry.Right
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssignPairs(ParamArray entries As Pair)
		  me.AssignPairs( entries )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As DICT_CaseSensitiveDictionary
		  dim newDict as new DICT_CaseSensitiveDictionary( zEncoding )
		  
		  dim keyArr() as variant = super.Keys // Raw, hex-encoded keys
		  dim lastIndex as Integer = keyArr.Ubound
		  if lastIndex = -1 then return newDict
		  dim valArr() as variant = me.Values
		  
		  for i as integer = 0 to lastIndex
		    dim thisKey as variant = keyArr( i )
		    dim thisVal as variant = valArr( i )
		    newDict.RawValue( thisKey ) = thisVal
		  next i
		  
		  return newDict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneAsDictionary() As Dictionary
		  // Creates a clone as a native dictionary.
		  // Since case-sensitivity is eliminated, only the last value of duplicate keys will be preserved.
		  
		  dim newDict as new Dictionary
		  
		  dim keyArr() as variant = me.Keys
		  dim lastIndex as Integer = keyArr.Ubound
		  if lastIndex = -1 then return newDict
		  dim valArr() as variant = me.Values
		  
		  for i as Integer = 0 to lastIndex
		    dim thisKey as variant = keyArr( i )
		    dim thisVal as variant = valArr( i )
		    newDict.Value( thisKey ) = thisVal
		  next i
		  
		  return newDict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(enc as TextEncoding = nil)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  if enc is nil then
		    zEncoding = Encodings.UTF8
		  else
		    zEncoding = enc
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromDictionary(dict As Dictionary, enc As TextEncoding = nil) As DICT_CaseSensitiveDictionary
		  // Converts a plain dictionary to a case-sensitive version
		  
		  dim r as new DICT_CaseSensitiveDictionary( enc )
		  r.AssignDictionary( dict )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(theKey as Variant) As Boolean
		  return super.HasKey( pEncodeKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKeyStringKey(theKey As String) As Boolean
		  return super.HasKey( pEncodeStringKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemsNotIn(T As DICT_CaseSensitiveDictionary) As DICT_CaseSensitiveDictionary
		  // Returns keys that are in me, but not in T.
		  
		  dim r as new DICT_CaseSensitiveDictionary
		  
		  dim vKeys() as Variant = me.Keys
		  for each vKey as Variant in vKeys
		    if not T.HasKey( vKey ) then
		      r.Value( vKey ) = me.Value( vKey )
		    end if
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Key(index As Integer) As Variant
		  dim k as variant = super.Key( index )
		  return pDecodeKey( k )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As Variant()
		  dim k() as variant = super.Keys()
		  dim lastIndex as Integer = k.Ubound
		  
		  for i as Integer = 0 to lastIndex
		    k( i ) = pDecodeKey( k( i ) )
		  next i
		  
		  return k
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysAsStringArray() As String()
		  dim vKeys() as Variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  
		  dim sKeys() as string
		  if lastIndex = -1 then return sKeys
		  redim sKeys( lastIndex )
		  
		  for i as integer = 0 to lastIndex
		    if vKeys( i ).Type = Variant.TypeString then
		      sKeys( i ) = vKeys( i ).StringValue
		    end if
		  next i
		  
		  return sKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatContain(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLen as Integer = S.Len
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as Variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.Len >= sLen then
		        dim pos as integer = sKey.InStr( S )
		        if pos > 0 then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey
		        end if
		      end if
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatContainB(S As String) As Variant()
		  dim vKeys() as Variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as Variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.LenB >= sLenB then
		        dim pos as integer = sKey.InStrB( S )
		        if pos > 0 then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey
		        end if
		      end if
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatEndWith(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLen as integer = S.Len
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.Len >= sLen then
		        dim part as string = sKey.Right( sLen )
		        if part = S then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey
		        end if
		      end if 
		    end
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatEndWithB(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.LenB >= sLenB then
		        dim part as string = sKey.RightB( sLenB )
		        if part = S then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey
		        end if
		      end if 
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatMatchRegEx(pattern As String, caseSensitive As Boolean = False, greedy As Boolean = True, matchEmpty As Boolean = True) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if pattern = "" or lastIndex = -1 then return vKeys
		  
		  pattern = pattern.ConvertEncoding( Encodings.UTF8 )
		  
		  dim rx as new RegEx
		  rx.SearchPattern = pattern
		  dim options as RegExOptions = rx.Options
		  options.CaseSensitive = caseSensitive
		  options.Greedy = greedy
		  options.MatchEmpty = matchEmpty
		  
		  dim matchKeys() as Variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue.ConvertEncoding( Encodings.UTF8 )
		      dim match as RegExMatch = rx.Search( sKey )
		      if not( match is nil ) and match.SubExpressionCount > 0 then
		        matchIndex = matchIndex + 1
		        matchKeys( matchIndex ) = thisKey
		      end if
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatStartWith(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLen as integer = S.Len
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.Len >= sLen then
		        dim part as string = sKey.Left( sLen )
		        if part = S then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey 
		        end if
		      end if 
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysThatStartWithB(S As String) As Variant()
		  dim vKeys() as variant = me.Keys
		  dim lastIndex as integer = vKeys.Ubound
		  if S = "" or lastIndex = -1 then return vKeys
		  
		  S = S.ConvertEncoding( zEncoding )
		  dim sLenB as integer = S.LenB
		  
		  dim matchKeys() as variant
		  redim matchKeys( lastIndex )
		  dim matchIndex as integer = -1
		  
		  for each thisKey as variant in vKeys
		    if thisKey.Type = Variant.TypeString then
		      dim sKey as string = thisKey.StringValue
		      if sKey.LenB >= sLenB then
		        dim part as string = sKey.LeftB( sLenB )
		        if part = S then
		          matchIndex = matchIndex + 1
		          matchKeys( matchIndex ) = thisKey
		        end if
		      end if 
		    end if
		  next
		  
		  redim matchKeys( matchIndex )
		  return matchKeys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(theKey As Variant, defaultValue as Variant) As Variant
		  return super.Lookup( pEncodeKey( theKey ), defaultValue )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LookupStringKey(theKey As String, defaultValue as variant) As Variant
		  return super.Lookup( pEncodeStringKey( theKey ), defaultValue )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pDecodeKey(theKey as Variant) As Variant
		  dim r as variant
		  
		  if theKey.Type = theKey.TypeString then
		    
		    r = DecodeHex( theKey.StringValue ).DefineEncoding( zEncoding )
		    
		  else
		    
		    r = theKey
		    
		  end if
		  
		  return r
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pEncodeKey(theKey as Variant) As Variant
		  dim r as variant
		  
		  if theKey.Type = Variant.TypeString then
		    
		    r = pEncodeStringKey( theKey )
		    
		  else
		    
		    r = theKey
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pEncodeStringKey(theKey as String) As String
		  dim k as string = theKey.ConvertEncoding( zEncoding )
		  dim r as string = EncodeHex( k )
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawKey(index As Integer) As Variant
		  return super.Key( index )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawKeys() As Variant()
		  return super.Keys
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawValue(theKey as Variant) As Variant
		  return super.Value( theKey )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RawValue(theKey As Variant, Assigns v as Variant)
		  super.Value( theKey ) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(theKey as Variant)
		  super.Remove( pEncodeKey( theKey ) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveStringKey(theKey as String)
		  super.Remove( pEncodeStringKey( theKey ) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(theKey As Variant) As Variant
		  return super.Value( pEncodeKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(theKey as Variant, Assigns v as variant)
		  super.Value( pEncodeKey( theKey ) ) = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueStringKey(theKey As String) As Variant
		  return super.Value( pEncodeStringKey( theKey ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValueStringKey(theKey as String, Assigns v as variant)
		  super.Value( pEncodeStringKey( theKey ) ) = v
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Legal
		This class was created by Kem Tekinay, MacTechnologies Consulting (ktekinay@mactechnologies.com).
		It is copyright ©2012, all rights reserved.
		
		You may use this class AS IS at your own risk for any purpose. The author does not warrant its use
		for any particular purpose and disavows any responsibility for bad design, poor execution,
		or any other faults.
		
		The author does not actively support this class, although comments and recommendations
		are welcome.
		
		You may modify code in this class as long as those modifications are clearly indicated
		via comments in the source code.
		
		You may distribute this class, modified or unmodified, as long as any modifications
		are clearly indicated, as noted above, and this copyright notice is not disturbed or removed.
		
		If you do make useful modifications, please let me know so I can include them in
		future versions.
	#tag EndNote

	#tag Note, Name = Usage
		
		This is a drop-in replacement for the dictionary with some modifications and additional functions:
		
		1. String keys are converted to and from hex on-the-fly for case-sensitivity.
		
		Because the type of key is tested, you can continue to use keys of other types (objects, integers, etc.)
		and will get the same results as with the built-in dictionary.
		
		2. String-specific methods are included.
		
		If you know your key is going to be a string, you can use the "StringKey" versions of the built-in
		methods for a bit of a performance boost. For example:
		
		  v = dict.LookupStringKey ( myStringKey, nil )
		
		Performance with string keys is roughly half of the built-in dictionary so, if you don't
		really need the keys to be case-sensitive and/or performance is an issue,
		use the native dictionary instead.
		
		3. You can specify the text encoding for the keys upon construction of the DICT_CaseSensitiveDictionary.
		
		If you create a dictionary as usual, keys will be converted to, and encoded as, UTF8.
		If you prefer a different type of encoding, you can specify it upon construction.
		For example:
		
		  dim d as new DICT_CaseSensitiveDictionary( Encodings.UTF16 )
		
		4. You can use the "Raw" methods to access the keys directly.
		
		However, be careful with this since by-passing the class methods for converting the string keys
		may lead to unintended consequences later. For example, if you store an already-hex-encoded
		key directly, but forgot to check the encoding before you encoded it, you will not be able to
		use that key with the ValueStringKey method later.
		
		5. There is an included Clone method that will make a copy of the dictionary quickly.
		
		You can do the same thing using the "Raw" methods described above, but I've saved you the trouble.
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected zEncoding As TextEncoding
	#tag EndProperty


	#tag Constant, Name = kVersion, Type = Double, Dynamic = False, Default = \"1.3", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Dictionary"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Dictionary"
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
