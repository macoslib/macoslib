#tag Module
Protected Module ExtendedAttributesExtensions
	#tag Method, Flags = &h0
		Function ExtendedAttribute(extends f as FolderItem, key as string) As string
		  //# Get the value of an extended attribute
		  
		  soft declare function getxattr lib SystemLib (thePath as CString, theKey as CString, buffer as Ptr, bufSize as UInt32, position as UInt32, options as short) as Int32
		  
		  dim buffersize as integer
		  dim buffer as MemoryBlock
		  
		  f.SetNoError
		  
		  //Call first to get the size of the attribute
		  
		  buffersize = getxattr( f.POSIXPath, key, nil, 0, 0, 0 )
		  
		  if buffersize<0 then //Error
		    f.SetError
		    return ""
		    
		  else
		    buffer = New MemoryBlock( buffersize )
		    
		    buffersize = getxattr( f.POSIXPath, key, buffer, buffer.Size, 0, 0 )
		    
		    if buffersize>=0 then
		      return   buffer.StringValue( 0, buffersize )
		      
		    else
		      f.SetError
		      return ""
		    end if
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtendedAttribute(extends f as FolderItem, key as string, assigns newvalue as string)
		  //# Set an extended attribute
		  
		  soft declare function setxattr lib SystemLib (thePath as CString, theKey as CString, buffer as Ptr, bufSize as UInt32, position as UInt32, options as short) as short
		  
		  //NOTE: size is limited to ca. 3800 bytes !!
		  
		  dim buffer as MemoryBlock
		  dim err as short
		  
		  f.SetNoError
		  buffer = newvalue
		  
		  err = setxattr( f.POSIXPath, key, buffer, buffer.Size, 0, 0 )
		  
		  if err<>0 then
		    f.SetError
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastXAttrError(extends f as FolderItem) As integer
		  //# Returns the last Extended Attributes error code
		  
		  return   f.AttachedPropertyLookup( "LastXAttrError", 0, true )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastXAttrErrorMessage(extends f as FolderItem) As integer
		  //# Returns the last Extended Attributes error message
		  
		  return   f.AttachedPropertyLookup( "LastXAttrErrorMessage", "", true )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function libcErrorCode() As Integer
		  #if TargetMacOS
		    soft declare function errorCode lib SystemLib alias "__error" () as Ptr
		    
		    dim m as MemoryBlock = errorCode()
		    If m is nil then
		      //something bad has happened
		      Return 0
		    End if
		    Return m.Long(0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function libcErrorMessage(errorCode as Integer) As String
		  Soft Declare Function strerror Lib SystemLib (errcode as Integer)  as Ptr
		  
		  dim errorMsg as MemoryBlock = strerror(errorCode)
		  If errorMsg <> nil then
		    Return DefineEncoding(errorMsg.CString(0), Encodings.SystemDefault)
		  Else
		    //something bad has happened
		    Return ""
		  End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListExtendedAttributes(extends f as FolderItem) As string()
		  //# Returns an array of all the extended attributes name
		  
		  soft declare function listxattr lib SystemLib (thePath as CString, buffer as Ptr, bufSize as UInt32, options as short) as Int32
		  
		  dim buffer as MemoryBlock = New MemoryBlock( 8192 )
		  dim listsize as Int32
		  dim result() as string
		  dim s as string
		  
		  f.SetNoError
		  
		  listsize = listxattr( f.POSIXPath, buffer, buffer.Size, 0 )
		  
		  if listsize<0 then //Error
		    f.SetError
		    return result
		    
		  else
		    s = DefineEncoding( buffer.StringValue( 0, listsize ), Encodings.UTF8)
		    result() = Split( s, Chr(0) )
		    call result.Pop //Remove last (empty) string
		    
		    return result
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveExtendedAttribute(extends f as FolderItem, key as string)
		  //# Removes an extended attribute
		  
		  soft declare function removexattr lib SystemLib (thePath as CString, theKey as CString, options as short) as short
		  
		  dim err as short
		  
		  err = removexattr( f.POSIXPath, key, 0 )
		  
		  if err=0 then
		    f.SetNoError
		  else
		    f.SetError
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetError(extends f as FolderItem)
		  
		  f.AttachedProperty( "LastXAttrError" ) = libcErrorCode
		  f.AttachedProperty( "LastXAttrErrorMessage" ) = libcErrorMessage( libcErrorCode )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetNoError(extends f as FolderItem)
		  
		  f.AttachedProperty( "LastXAttrError" ) = 0
		  f.AttachedProperty( "LastXAttrErrorMessage" ) = ""
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = SystemLib, Type = String, Dynamic = False, Default = \"System", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"System"
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
