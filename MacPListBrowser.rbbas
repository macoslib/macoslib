#tag Class
Protected Class MacPListBrowser
	#tag Method, Flags = &h0
		Function ArrayValues() As MacPListBrowser()
		  dim r() As MacPListBrowser
		  
		  #if TargetMacOS
		    if zValueType <> ValueType.IsArray then
		      pRaiseError "ArrayValues can only be used with an array."
		    end if
		    
		    dim lastIndex as integer = me.Count - 1
		    redim r( lastIndex )
		    for i as integer = 0 to lastIndex
		      r( i ) = me.Child( i )
		    next
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(index As Integer) As MacPListBrowser
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsArray then
		      pRaiseError "Child with index can only be used with an array."
		    end if
		    
		    dim v() as variant = zValue
		    dim element as variant = v( index )
		    return new MacPListBrowser( element, me, index )
		    
		  #else
		    
		    #pragma unused index
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(index As Integer, Assigns value As Variant)
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsArray then
		      pRaiseError "Child with index can only be used with an array."
		    end if
		    
		    if value IsA MacPListBrowser then value = MacPListBrowser( value ).VariantValue
		    if pValueTypeOfVariant( value ) = ValueType.IsUnknown then
		      pRaiseError "Only a valid type (dictionary, array, string, number, boolean, date, or data) can be assigned to an array."
		    end if
		    
		    dim v() as variant = zValue
		    v( index ) = value
		    
		  #else
		    
		    #pragma unused index
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(key As String) As MacPListBrowser
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsDictionary then
		      pRaiseError "Child with key can only be used with a dictionary."
		    end if
		    
		    dim dict as Dictionary = zValue
		    dim element as variant = dict.Value( key )
		    return new MacPListBrowser( element, me, key )
		    
		  #else
		    
		    #pragma unused key
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Child(key As String, Assigns value As Variant)
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsDictionary then
		      pRaiseError "Child with key can only be used with a dictionary."
		    end if
		    
		    if pValueTypeOfVariant( value ) = ValueType.IsUnknown then
		      pRaiseError "Only a valid type (dictionary, array, string, number, boolean, date, or data) can be assigned to a dictionary."
		    end if
		    
		    dim dict as Dictionary = zValue
		    dict.Value( key ) = value
		    
		  #else
		    
		    #pragma unused index
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(myValue As Variant, myParent As MacPlistBrowser = nil, myParentIndex As Variant = nil)
		  #if TargetMacOS
		    
		    me.VariantValue = myValue
		    
		    if MyParent is nil then
		      zParent = nil
		      zParentIndex = -1
		    else
		      dim w as new WeakRef( myParent )
		      zParent = w
		      zParentIndex = myParentIndex
		    end if
		    
		  #else
		    
		    pRaiseError "This class can only be used in the MacOS.
		    
		    #pragma unused myValue
		    #pragma unused myParent
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  if zValueType = ValueType.IsArray then
		    dim v() as variant = zValue
		    return v.UBound + 1
		  elseif zValueType = ValueType.IsDictionary then
		    dim dict as Dictionary = zValue
		    return dict.Count
		  else
		    return -1 // Not an array or dictionary
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As String()
		  dim r() as string
		  
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsDictionary then
		      pRaiseError "Child with key can only be used with a dictionary."
		    end if
		    
		    dim dict as Dictionary = zValue
		    dim keys() as variant = dict.Keys
		    redim r( keys.Ubound )
		    for i as integer = 0 to keys.Ubound
		      r( i ) = keys( i ).StringValue
		    next
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pArrayType() As ValueType
		  dim r as ValueType = ValueType.IsUnknown
		  
		  #if TargetMacOS
		    
		    if zValueType <> ValueType.IsArray then
		      pRaiseError "ArrayType can only be used with an array."
		    end if
		    
		    if me.Count <> 0 then
		      r = pValueTypeOfVariant( me.Child( 0 ).VariantValue )
		    end if
		    
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
		Private Function pValueTypeFromVariantType(t As Integer) As ValueType
		  
		  select case t
		  case Variant.TypeNil
		    return ValueType.IsNil
		  case Variant.TypeInteger, Variant.TypeSingle, Variant.TypeDouble, Variant.TypeLong
		    return ValueType.IsNumber
		  case Variant.TypeString
		    return ValueType.IsString
		  case Variant.TypeDate
		    return ValueType.IsDate
		  case Variant.TypeBoolean
		    return ValueType.IsBoolean
		  else
		    return ValueType.IsUnknown // Really shouldn't happen
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pValueTypeOfVariant(value As Variant) As ValueType
		  dim v as variant = value
		  
		  if value.IsArray then
		    return ValueType.IsArray
		  else
		    
		    select case v.Type
		    case Variant.TypeNil
		      return ValueType.IsNil
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
		      return ValueType.IsUnknown // Really shouldn't happen
		    end
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveToFile(f As FolderItem) As Boolean
		  dim r as boolean
		  
		  #if TargetMacOS
		    
		    if f <> nil then
		      dim cf as CoreFoundation.CFType = CoreFoundation.CFTypeFromVariant( zValue )
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
		Function ValueAsCFPropertyList() As CoreFoundation.CFPropertyList
		  dim cf as CoreFoundation.CFType = CoreFoundation.CFTypeFromVariant( zValue )
		  return CoreFoundation.CFPropertyList( cf )
		  
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
		Create a new instance by assigning like a dictionary or array to it:
		
		dim b1 as new MacPListBrowser( new Dictionary )
		
		dim a() as variant
		dim b2 as new MacPListBrowser( a )
		
		You can also supply a string, date, number, memoryblock (for data), or boolean, although that's less useful.
		
		Finally, you can supply a plist as a string, or a FolderItem that contains a plist.
		
		You can extract the value of the plist by using VariantValue. If the value is an array or dictionary, you can use
		Child( index ) or Child( key ) respectively to get or assign the value of an element. These values are returns
		as MacPListBrowser instances.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return zArrayType
			  
			End Get
		#tag EndGetter
		ArrayType As ValueType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if zParent is nil then
			    return nil
			  else
			    return MacPListBrowser( zParent.Value )
			  end if
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'if value is nil then
			  'zParent = nil
			  'else
			  'dim w as new WeakRef( value )
			  'zParent = w
			  'end if
			  
			End Set
		#tag EndSetter
		Parent As MacPlistBrowser
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
			  return zValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zValueType = pValueTypeOfVariant( value )
			  if zValueType = ValueType.IsUnknown then
			    zValue = value
			    pRaiseError "This is not an acceptable type for a plist."
			  end if
			  
			  dim addRaw as boolean = true
			  
			  if zValueType = ValueType.IsNil then
			    zValue = nil
			    addRaw = false
			    
			  elseif zValueType = ValueType.IsArray then
			    zValue = value
			    zArrayType = pArrayType
			    addRaw = false
			    
			  elseif value IsA MacPListBrowser then
			    value = MacPListBrowser( value ).VariantValue
			    
			  elseif value IsA FolderItem then
			    dim f as FolderItem = value
			    if f.Exists then
			      dim plist as CoreFoundation.CFPropertyList = CoreFoundation.CFType.CreateFromPListFile( f, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
			      zValue = CFType( plist ).VariantValue
			    else
			      zValue = nil
			    end if
			    addRaw = false
			    
			  elseif value.Type = Variant.TypeString then
			    dim plist as CoreFoundation.CFPropertyList = CFType.CreateFromPListString( value, CoreFoundation.kCFPropertyListMutableContainersAndLeaves )
			    if plist IsA CoreFoundation.CFType then
			      dim v as variant = plist.VariantValue
			      value = v
			    end if
			    
			  end if
			  
			  zValueType = pValueTypeOfVariant( value ) // Update this, in case
			  if addRaw then
			    zValue = value
			  end if
			  
			  // Keep the parent in sync
			  dim p as MacPListBrowser = me.Parent
			  if p <> nil then
			    if p.Type = ValueType.IsArray then
			      p.Child( zParentIndex.IntegerValue ) = zValue
			    else
			      p.Child( zParentIndex.StringValue ) = zValue
			    end if
			  end if
			  
			End Set
		#tag EndSetter
		VariantValue As Variant
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zArrayType As ValueType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zParentIndex As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValue As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zValueType As ValueType
	#tag EndProperty


	#tag Enum, Name = ValueType, Type = Integer, Flags = &h0
		IsNil
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
