#tag Class
Class FSAliasRecord
	#tag Method, Flags = &h0
		Sub Constructor(f As FolderItem, relativeTo As FolderItem = nil)
		  pFromFolderItem( f, relativeTo )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  pDisposeHandle zAliasRecordHandle
		  zAliasRecordHandle = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItem(relativeTo As FolderItem = nil, flags As Integer = FileManager.kFSResolveAliasNoUI) As FolderItem
		  dim mb as MemoryBlock = me.MemoryBlock
		  return FileManager.GetFolderItemFromAliasData( mb, relativeTo, flags )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MemoryBlock() As MemoryBlock
		  dim r as MemoryBlock
		  
		  #if TargetMacOS
		    
		    if zAliasRecordHandle <> nil then
		      pHLockHi( zAliasRecordHandle )
		      dim mb as MemoryBlock = zAliasRecordHandle.Ptr( 0 )
		      dim sz as integer = me.Size
		      r = mb.StringValue( 0, sz )
		      pHUnlock( zAliasRecordHandle )
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As MemoryBlock
		  return me.MemoryBlock
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pDisposeHandle(h As Ptr)
		  #if TargetMacOS
		    
		    if h <> nil then
		      soft declare sub DisposeHandle lib CarbonLib (h as Ptr)
		      DisposeHandle( h )
		    end if
		    
		  #else
		    
		    #pragma unused h
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pFromFolderItem(f As FolderItem, relativeTo As FolderItem)
		  #if TargetMacOS
		    
		    if f is nil then
		      zAliasRecordHandle = nil
		      return
		    end if
		    
		    soft declare function FSNewAlias lib CarbonLib _
		    ( fromFile as Ptr, fsRef as Ptr, ByRef inAlias as Ptr)  as Short
		    
		    dim fileRef as FSRef = FileManager.GetFSRefFromFolderItem( f )
		    dim relativeToRef as FSRef
		    if relativeTo <> nil then
		      relativeToRef = FileManager.GetFSRefFromFolderItem( relativeTo )
		    end if
		    
		    dim OSError as integer
		    if relativeTo <> nil then
		      OSError = FSNewAlias( relativeToRef, fileRef, zAliasRecordHandle )
		    else
		      OSError = FSNewAlias( nil, fileRef, zAliasRecordHandle )
		    end if
		    
		    if OSError <> 0 then
		      zAliasRecordHandle = nil
		      return
		    end if
		    
		  #else
		    
		    #pragma unused f
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pHLockHi(h As Ptr)
		  #if TargetMacOS
		    
		    soft declare sub HLockHi lib CarbonLib (h as Ptr)
		    HLockHi( h  )
		    
		  #else
		    
		    #pragma unused h
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pHUnlock(h As Ptr)
		  #if TargetMacOS
		    
		    soft declare sub HUnlock lib CarbonLib (h as Ptr)
		    HUnlock( h )
		    
		  #else
		    
		    #pragma unused h
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Integer
		  dim r as integer
		  
		  #if TargetMacOS
		    
		    if zAliasRecordHandle <> nil then
		      soft declare function GetAliasSize lib CarbonLib ( inAlias as Ptr ) as Integer
		      r = GetAliasSize( zAliasRecordHandle )
		    end if
		    
		  #endif
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  http://code.google.com/p/macoslib
		
		Added by Kem Tekinay with help and code from Thomas Templemann.
	#tag EndNote


	#tag Property, Flags = &h21
		Private zAliasRecordHandle As Ptr
	#tag EndProperty


End Class
#tag EndClass
