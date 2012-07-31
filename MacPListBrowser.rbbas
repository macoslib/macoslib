#tag Class
Protected Class MacPListBrowser
	#tag Method, Flags = &h0
		Sub AppendChild(value As Variant)
		  // Appends a child to an array.
		  
		  pRaiseErrorIfNotArray( "AppendChild" )
		  
		  dim newIndex as integer = me.Count
		  dim v() as Variant = zValue
		  redim v( newIndex )
		  zValue = v
		  me.Child( newIndex ) = value // Do it this way so we don't have to recheck the value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFPropertyListValue() As CoreFoundation.CFPropertyList
		  #if TargetMacOS
		    
		    dim cf as CoreFoundation.CFType = CoreFoundation.CFTypeFromVariant( me.VariantValue )
		    return CoreFoundation.CFPropertyList( cf )
		    
		  #else
		    
		    return nil
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(childIndex As Integer) As MacPListBrowser
		  pRaiseErrorIfNotArray( "Child with index" )
		  
		  dim v() as Variant = zValue
		  return v( childIndex )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(childIndex As Integer, Assigns value As Variant)
		  if value = nil then raise new NilObjectException
		  pRaiseErrorIfNotArray( "Child with index" )
		  
		  dim v() as variant = zValue
		  if childIndex < 0 or childIndex > v.UBound then
		    raise new OutOfBoundsException
		  end if
		  
		  if value IsA MacPListBrowser then // Assign the given MacPListBrowser as my child
		    
		    dim plist as MacPListBrowser = value
		    if plist is me then pRaiseError( "Can't assign a MacPListBrowser as its own child." )
		    
		    dim itsParent as MacPListBrowser = plist.Parent
		    if itsParent is nil then
		      // Do nothing
		      
		    elseif itsParent is me then
		      dim oldIndex as integer = plist.Index
		      if oldIndex <> childIndex then
		        v( oldIndex ) = new MacPListBrowser( plist.VariantValue, me, oldIndex ) // Make a copy
		      end if
		      
		    else // Its parent is not me so remove it from its parent
		      plist.Isolate
		      
		    end if
		    
		    plist.pSetParent( me, childIndex ) // Change the parent of the given MacPListBrowser
		    v( childIndex ) = plist
		    zValue = v
		    
		  else
		    
		    if not pIsValidValue( value ) then
		      pRaiseError "Only a valid type (dictionary, array, string, number, boolean, date, or data) can be assigned to an array."
		    end if
		    
		    v( childIndex ) = new MacPListBrowser( value, self, childIndex )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(childKey As String) As MacPListBrowser
		  pRaiseErrorIfNotDictionary( "Child with key" )
		  
		  dim dict as Dictionary = zValue
		  return dict.Value( childKey )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(childKey As String, Assigns value As Variant)
		  if value = nil then raise new NilObjectException
		  pRaiseErrorIfNotDictionary( "Child with key" )
		  
		  if childKey.LenB = 0 then pRaiseError( "Can't assign an empty key." )
		  
		  dim dict as Dictionary = zValue
		  
		  if value IsA MacPListBrowser then // Assign the given MacPListBrowser as my child
		    
		    dim plist as MacPListBrowser = value
		    if plist is me then pRaiseError( "Can't assign a MacPListBrowser as its own child." )
		    
		    dim itsParent as MacPListBrowser = plist.Parent
		    if itsParent is nil then
		      // Do nothing
		      
		    elseif itsParent is me then
		      dim oldKey as string = plist.Key
		      if oldKey <> childKey and dict.HasKey( oldKey ) then dict.Remove oldKey
		      
		    else // Belongs to another MacPListBrowser so disconnect it
		      plist.Isolate
		      
		    end if
		    
		    plist.pSetParent( me, childKey ) // Change the parent of the given MacPListBrowser
		    dict.Value( childKey ) = plist
		    
		  else
		    
		    if not pIsValidValue( value ) then
		      pRaiseError "Only a valid type (dictionary, array, string, number, boolean, date, or data) can be assigned to a dictionary."
		    end if
		    
		    dict.Value( childKey ) = new MacPListBrowser( value, self, childKey )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildrenKeys() As String()
		  dim r() as string
		  
		  pRaiseErrorIfNotDictionary( "ChildrenKeys" )
		  
		  dim dict as Dictionary = zValue
		  dim keys() as variant = dict.Keys
		  redim r( keys.Ubound )
		  for i as integer = 0 to keys.Ubound
		    r( i ) = keys( i ).StringValue
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As MacPListBrowser
		  // Convenience method to clone me to another MacPListBrowser.
		  // Just calls new.
		  
		  return new MacPListBrowser( me )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rootType As ValueType = ValueType.IsDictionary)
		  #if TargetMacOS
		    
		    dim v as Variant
		    
		    select case rootType
		    case ValueType.IsDictionary
		      v = new Dictionary
		      
		    case ValueType.IsArray
		      dim arr() as Variant
		      v = arr
		      
		    else
		      pRaiseError "If the root value is not an array or dictionary, specify the initial value to use instead."
		      
		    end
		    
		    me.Constructor( v, nil, nil )
		    
		  #else
		    
		    pRaiseError "This class can only be used in the MacOS.
		    
		    #pragma unused myValue
		    #pragma unused myParent
		    #pragma unused myParentIndex
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myValue As Variant)
		  // Public interface for the constructor
		  
		  me.Constructor( myValue, nil, nil )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(myValue As Variant, myParent As MacPListBrowser, myParentIndex As Variant)
		  // Private constuctor for children of a parent.
		  
		  #if TargetMacOS
		    
		    if myvalue = nil then raise new NilObjectException
		    
		    if myValue IsA MacPListBrowser then
		      zValue = MacPListBrowser( myValue ).VariantValue
		      
		      // See if it's a FolderItem that exists
		    elseif myValue IsA FolderItem then
		      dim f as FolderItem = myValue
		      if f.Exists then
		        dim plist as CoreFoundation.CFPropertyList = CoreFoundation.CFType.CreateFromPListFile( f, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		        if plist <> nil then
		          myValue = plist.VariantValue
		        end if
		      end if
		      
		    elseif not pIsValidValue( myValue ) then
		      pRaiseError( "You can only create a MacPListBrowser from another MacPListBrowser, a FolderItem that points to a plist or string, " + _
		      "or from a dictionary, array, string, number, date, boolean, or MemoryBlock." )
		      
		    end if
		    
		    me.VariantValue = myValue // Convert it o MacPListBrowser objects as needed
		    
		    pSetParent( myParent, myParentIndex )
		    
		  #else
		    
		    pRaiseError "This class can only be used in the MacOS.
		    
		    #pragma unused myValue
		    #pragma unused myParent
		    #pragma unused myParentIndex
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  if zIsArray then
		    dim v() as variant = zValue
		    return v.UBound + 1
		  elseif zIsDictionary then
		    dim dict as Dictionary = zValue
		    return dict.Count
		  else
		    return -1 // Not an array or dictionary
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListFile(f As FolderItem) As MacPListBrowser
		  // Convenience method, here just for clarity.
		  // Passing a folderitem to the constructor will do the same thing.
		  
		  return new MacPListBrowser( f )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListString(s As String) As MacPListBrowser
		  // Returns a MacPListBrowser from a plist string.
		  // Could have put this into the contructor, but don't want to make assumptions about
		  // what the developer is trying to do.
		  // Will return nil if the string can't be converted, or just the original string if it's not a plist.
		  
		  dim r as MacPListBrowser
		  
		  #if TargetMacOS
		    
		    dim plist as CoreFoundation.CFPropertyList = CFType.CreateFromPListString( s, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
		    if plist <> nil then
		      dim v as variant = plist.VariantValue
		      r = new MacPListBrowser( v )
		    end if
		    
		  #else
		    
		    #pragma unused s
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByKey(findKey As String, keyMatchType As MatchType = MatchType.Exact, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of children whose key matches the given string.
		  // If recursive, will examine every child dictionary too.
		  
		  // If this isn't an array or dictionary, this will return an empty array
		  
		  dim r() as MacPListBrowser
		  
		  if findKey.LenB <> 0 then
		    
		    if zIsDictionary or ( recursive and zIsArray ) then // If it's not one of these, it won't match anything anyway
		      dim rx as RegEx
		      if keyMatchType = MatchType.RegEx then
		        rx = new RegEx
		        rx.SearchPattern = findKey
		      end if
		      pFindByKey( findKey, keyMatchType, recursive, rx, r )
		    end if
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByValue(value As Variant, onlySameType As Boolean = True, recursive As Boolean = True) As MacPListBrowser()
		  // Returns an array of MacPListBrowser whose value matches the given value.
		  // If recursive, will examine every child too.
		  // Tried to make this very tolerant of bad values so will return an empty array of the value
		  // can't be used for a search.
		  
		  dim r() as MacPListBrowser
		  
		  if value <> nil then 
		    dim valType as ValueType = pValueTypeOfVariant( value )
		    if valType <> ValueType.IsArray and valType <> ValueType.IsDictionary and valType <> ValueType.IsUnknown then
		      
		      pFindByValue( value, onlySameType, recursive, r )
		      
		    end if
		  end if
		  
		  return r
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(childKey As String) As Boolean
		  if zIsDictionary then
		    
		    dim dict as Dictionary = zValue
		    return dict.HasKey( childKey )
		    
		  else
		    
		    return false
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index() As Integer
		  dim r as integer
		  
		  dim p as MacPListBrowser = me.Parent
		  if p <> nil and p.IsArray then
		    r = zParentIndex.IntegerValue
		    
		  else
		    r = -1 // Not part of an array
		    
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsArray() As Boolean
		  return zIsArray
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDictionary() As Boolean
		  return zIsDictionary
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Isolate()
		  // Turns this MacPListBrowser into its own root.
		  
		  dim myParent as MacPListBrowser = me.Parent
		  if myParent <> nil then
		    if myParent.IsDictionary then
		      dim k as string = zParentIndex.StringValue
		      myParent.RemoveChild( k )
		    else // isArray
		      dim i as integer = zParentIndex.IntegerValue
		      myParent.RemoveChild( i )
		    end if
		    
		    // RemoveChild will set the parent to nil
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidIndex(i As Integer) As Boolean
		  // Like HasKey but for arrays
		  
		  pRaiseErrorIfNotArray( "IsValidIndex" )
		  
		  if i < 0 or i > me.UBound then
		    return false
		  else
		    return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByKey(findKey As String, keyMatchType As MatchType, recursive As Boolean, rx As RegEx, appendTo() As MacPListBrowser)
		  // Recursive method used to fill in the appendTo array with children matching the given key
		  
		  if zIsDictionary then
		    
		    dim dict as Dictionary = zValue
		    dim k() as Variant = dict.Keys
		    for i as integer = 0 to k.Ubound
		      dim thisKey as Variant = k( i )
		      if pStringMatches( thisKey.StringValue, findKey, keyMatchType, rx ) then appendTo.Append( dict.Value( thisKey ) )
		      if recursive then
		        dim thisChild as MacPListBrowser = dict.Value( thisKey )
		        thisChild.pFindByKey( findKey, keyMatchType, recursive, rx, appendTo )
		      end if
		    next
		    
		  elseif recursive and zIsArray then
		    
		    dim v() as Variant = zValue
		    for i as integer = 0 to v.Ubound
		      dim thisChild as MacPListBrowser = v( i )
		      thisChild.pFindByKey( findKey, keyMatchType, recursive, rx, appendTo )
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pFindByValue(value As Variant, onlySameType As Boolean, recursive As Boolean, ByRef appendTo() As MacPListBrowser)
		  // Private method to recursively return the items matching the value.
		  
		  // First check this value, but only if this isn't an array or dictionary
		  if not zIsDictionary and not zIsArray then
		    if not onlySameType or zValue.Type = value.Type then
		      if zValue = value then appendTo.Append me
		    end
		  end if
		  
		  // See if we need to recurse
		  if recursive then
		    
		    if zIsDictionary then
		      
		      dim dict as Dictionary = zValue
		      dim k() as Variant = dict.Keys
		      for i as integer = 0 to k.Ubound
		        dim thisKey as Variant = k( i )
		        dim thisChild As MacPListBrowser = dict.Value( thisKey )
		        thisChild.pFindByValue( value, onlySameType, recursive, appendTo )
		      next
		      
		    elseif zValueType = ValueType.IsArray then
		      
		      dim v() as Variant = zValue
		      for i as integer = 0 to v.Ubound
		        dim thisChild as MacPListBrowser = v( i )
		        thisChild.pFindByValue( value, onlySameType, recursive, appendTo )
		      next
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pIsValidValue(ByRef value As Variant) As Boolean
		  // Validates that the value given is acceptable.
		  
		  dim r as boolean
		  
		  dim theType as ValueType = pValueTypeOfVariant( value )
		  if theType <> ValueType.IsUnknown then r = true
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PListStringValue() As String
		  dim r as string
		  
		  #if TargetMacOS
		    
		    dim plist as CoreFoundation.CFPropertyList = me.CFPropertyListValue
		    r = plist.XMLValue
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseError(msg As String)
		  dim err as new RuntimeException
		  err.Message = msg
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotArray(msg As String)
		  if not zIsArray then
		    pRaiseError( msg + " can only be used with an array." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotArrayOrDictionary(msg As String)
		  if not zIsArray and not zIsDictionary then
		    pRaiseError( msg + " can only be used with an array or dictionary." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRaiseErrorIfNotDictionary(msg As String)
		  if not zIsDictionary then
		    pRaiseError( msg + " can only be used with a dictionary." )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pSetParent(myParent As MacPListBrowser, myParentIndex As Variant)
		  // Private method that lets one MacPListBrowser set the parent of another
		  
		  if myParent <> nil then
		    
		    dim w as new WeakRef( myParent )
		    zParent = w
		    zParentIndex = myParentIndex
		    
		  else
		    
		    zParent = nil
		    myParentIndex = nil
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromArray(sourceArr() As Variant)
		  dim newArr() as Variant
		  redim newArr( sourceArr.Ubound )
		  for i as integer = 0 to sourceArr.Ubound
		    dim thisValue as Variant = sourceArr( i )
		    newArr( i ) = new MacPListBrowser( thisValue, self, i )
		  next
		  
		  zValue = newArr
		  zValueType = ValueType.IsArray
		  zIsArray = true
		  zIsDictionary = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pSetValueFromDictionary(sourceDict As Dictionary)
		  dim k() as Variant = sourceDict.Keys
		  dim newDict as new Dictionary
		  for each thisKey as Variant in k
		    dim thisValue as Variant = sourceDict.Value( thisKey )
		    newDict.Value( thisKey ) = new MacPListBrowser( thisValue, self, thisKey.StringValue )
		  next
		  
		  zValue = newDict
		  zValueType = ValueType.IsDictionary
		  zIsDictionary = true
		  zIsArray = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pStringMatches(source As String, findStr As String, useMatchType As MatchType, rx As RegEx) As Boolean
		  // Helper method to determine a match between strings.
		  // If the match type is regex, the RegEx should already be populated.
		  
		  if source.LenB = 0 then return false
		  if findStr.LenB = 0 then return false
		  
		  select case useMatchType
		  case MatchType.Contains
		    return source.InStr( findStr ) <> 0
		  case MatchType.Exact
		    return source = findStr
		  case MatchType.StartsWith
		    dim seg as string = source.Left( findStr.Len )
		    return seg = findStr
		  case MatchType.EndsWith
		    dim seg as string = source.Right( findStr.Len )
		    return seg = findStr
		  case MatchType.RegEx
		    if rx is nil then return false
		    dim match as RegExMatch = rx.Search( source )
		    return match <> nil and match.SubExpressionCount <> 0
		  end
		  
		  // Shouldn't ever get here
		  pRaiseError "Invalid match type."
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pValueTypeOfVariant(value As Variant) As ValueType
		  dim v as variant = value
		  
		  if v.IsArray then
		    return ValueType.IsArray
		  else
		    
		    select case v.Type
		    case Variant.TypeObject
		      if v IsA Dictionary then
		        return ValueType.IsDictionary
		      elseif v.IsArray then
		        return ValueType.IsArray
		      elseif v IsA MemoryBlock then
		        return ValueType.IsData
		      else
		        return ValueType.IsUnknown
		      end if
		    case Variant.TypeInteger, Variant.TypeSingle, Variant.TypeDouble, Variant.TypeLong
		      return ValueType.IsNumber
		    case Variant.TypeString
		      return ValueType.IsString
		    case Variant.TypeDate
		      return ValueType.IsDate
		    case Variant.TypeBoolean
		      return ValueType.IsBoolean
		    else
		      return ValueType.IsUnknown // Really shouldn't get here, but just in case
		    end
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChild(childIndex As Integer)
		  // Return a child with the given index.
		  
		  pRaiseErrorIfNotArray( "RemoveChild with index" )
		  
		  dim v() as variant = zValue
		  dim plist as MacPListBrowser = v( childIndex )
		  plist.pSetParent( nil, nil ) // Remove the parent in case there is a reference to it elsewhere
		  v.Remove childIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChild(childKey As String)
		  // Return a child with the given key.
		  
		  pRaiseErrorIfNotDictionary( "RemoveChild with key" )
		  
		  if childKey.LenB = 0 then pRaiseError( "No key specified." )
		  
		  dim dict as Dictionary = zValue
		  dim plist as MacPListBrowser = dict.Value( childKey )
		  plist.pSetParent( nil, nil ) // Remove the parent in case there is a reference to it elsewhere
		  dict.Remove childKey
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveToFile(f As FolderItem) As Boolean
		  dim r as boolean
		  
		  #if TargetMacOS
		    
		    if f <> nil then
		      dim cf as CoreFoundation.CFType = CoreFoundation.CFTypeFromVariant( VariantValue )
		      dim plist as CoreFoundation.CFPropertyList = CoreFoundation.CFPropertyList( cf )
		      r = plist.WriteToFile( f, true )
		    end if
		    
		  #else
		    
		    #pragma unused f
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ubound() As Integer
		  // Returns the Ubound if this is an array
		  
		  pRaiseErrorIfNotArray( "Ubound" )
		  
		  dim v() as Variant = zValue
		  return v.Ubound
		  
		End Function
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
		
		This class is distributed as part of, and is dependent on, the MacOSLib project.
	#tag EndNote

	#tag Note, Name = Usage
		
		This class is in ongoing development and is meant to make working with plists easier.
		Create a new instance by assigning a valid value to it. Valid values are
		number, string, date, boolean, MemoryBlock (data), array, or dictionary.
		
		dim a() as variant
		dim p1 as new MacPListBrowser( a )
		
		You can also use
		dim p2 as new MacPListBrowser()
		
		to start with an empty dictionary, or
		
		dim p3 as new MacPListBrowser( MacPListBrowser.ValueType.IsArray )
		
		to start with an empty array.
		
		You can create a new instance from an existing PropertyList string using the Shared Method CreateFromPListString,
		or from a FolderItem using CreateFromPListFile or just new MacPListBrowser( f ). If the FolderItem contains
		a plist, it will be interpreted. Otherwise, its contents will be added as a string.
		
		You can extract the value of the plist by using VariantValue. If the value is an array or dictionary, you can use
		Child( childIndex ) or Child( key ) respectively to get or assign the value of an element. These values are returns
		as MacPListBrowser instances.
		
		You can move children around by assigning one child to another, either within the same plist or between plists.
		If you want to make a copy of a plist, use new MacPListBrowser( originalPList ) or the Clone method.
		
		DO NOT LOSE A REFERENCE TO THE ROOT PLIST. Because WeakRefs are used to keep track of parents, you can 
		not get back the root plist if you lose a reference to it. For example:
		
		plist is a root MacPListBrowser
		plist = plist.Child( 1 )
		// Later
		plist = plist.Parent // Will be nil at this point
		
		You can remove a plist from another plist using Isolate.
		
		plist = root.Child( 0 )
		plist.Isolate
		
		At this point,root.Child( 0 ) will be deleted and plist will be a standalone plist.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  dim p as MacPListBrowser = me.Parent
			  if p <> nil and p.Type = ValueType.IsDictionary then
			    r = zParentIndex.StringValue
			    
			  else
			    r = "" // Return an empty string
			    
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value.LenB = 0 then pRaiseError( "Can't assign an empty key." )
			  
			  dim myParent as MacPListBrowser = me.Parent
			  if myParent <> nil and myParent.Type = ValueType.IsDictionary then
			    if myParent.HasKey( value ) then pRaiseError( "The key """ + value + """ already exists." )
			    
			    dim oldKey as string = zParentIndex.StringValue
			    myParent.RemoveChild( oldKey )
			    myParent.Child( value ) = me // Assign it new
			    
			  else // Not part of a dictionary
			    pRaiseError "This MacPListBrowser is not a value within a dictionary."
			  end if
			  
			End Set
		#tag EndSetter
		Key As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if zParent is nil then return nil
			  if zParent.value = nil then
			    zParent = nil
			    zParentIndex = nil
			    return nil
			  end if
			  
			  dim o as Object = zParent.Value
			  dim myParent as MacPListBrowser = MacPListBrowser( o )
			  
			  // Make sure this hasn't gotten unlinked already
			  dim c as MacPListBrowser
			  if myParent.Type = ValueType.IsDictionary then
			    dim k as string = zParentIndex.StringValue
			    if myParent.HasKey( k ) then c = myParent.Child( k )
			  elseif myParent.Type = ValueType.IsArray then
			    dim i as integer = zParentIndex.IntegerValue
			    if myParent.IsValidIndex( i ) then c = myParent.Child( i )
			  end if
			  
			  if not( c is me ) then // No match
			    zParent = nil // Set the parent to nil
			    zParentIndex = nil
			    myParent = nil
			  end if
			  
			  return myParent
			  
			End Get
		#tag EndGetter
		Parent As MacPlistBrowser
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the root MacPListBrowser
			  
			  dim root As MacPListBrowser = me
			  dim oneUp as MacPListBrowser = root.Parent
			  while oneUp <> nil
			    root = oneUp
			    oneUp = root.Parent
			  wend
			  
			  return root
			  
			End Get
		#tag EndGetter
		Root As MacPListBrowser
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zValueType
			  
			End Get
		#tag EndGetter
		Type As ValueType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as Variant
			  
			  if zValueType = ValueType.IsArray then
			    dim sourceArr() as Variant = zValue
			    dim returnArr() as Variant
			    redim returnArr( sourceArr.Ubound )
			    for i as integer = 0 to sourceArr.Ubound
			      dim thisPlist as MacPListBrowser = sourceArr( i )
			      returnArr( i ) = thisPlist.VariantValue
			    next i
			    r = returnArr
			    
			  elseif zValueType = ValueType.IsDictionary then
			    dim sourceDict as Dictionary = zValue
			    dim returnDict as new Dictionary
			    dim k() as Variant = sourceDict.Keys
			    for each thisKey As Variant in k
			      dim thisPlist as MacPListBrowser = sourceDict.Value( thisKey )
			      returnDict.Value( thisKey ) = thisPlist.VariantValue
			    next
			    r = returnDict
			    
			  else
			    r = zValue
			    
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value = nil then raise new NilObjectException
			  
			  if not pIsValidValue( value ) then
			    pRaiseError "This is not an acceptable type for a plist."
			  end if
			  
			  if value IsA Dictionary then
			    pSetValueFromDictionary( value )
			    
			  elseif value.IsArray then
			    dim v() as Variant = value
			    pSetValueFromArray( v )
			    
			  else
			    
			    zValue = value
			    zValueType = pValueTypeOfVariant( value )
			    zIsDictionary = false
			    zIsArray = false
			    
			  end if
			  
			End Set
		#tag EndSetter
		VariantValue As Variant
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zIsArray As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zIsDictionary As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParentIndex As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zRoot As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValue As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValueType As ValueType
	#tag EndProperty


	#tag Enum, Name = MatchType, Type = Integer, Flags = &h0
		Contains
		  Exact
		  StartsWith
		  EndsWith
		RegEx
	#tag EndEnum

	#tag Enum, Name = ValueType, Type = Integer, Flags = &h0
		IsDictionary
		  IsArray
		  IsString
		  IsDate
		  IsBoolean
		  IsData
		  IsNumber
		IsUnknown
	#tag EndEnum


End Class
#tag EndClass
