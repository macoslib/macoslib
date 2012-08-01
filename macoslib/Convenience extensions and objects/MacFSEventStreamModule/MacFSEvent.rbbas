#tag Class
Class MacFSEvent
Implements DebugReportFormatter
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as string, flags as UInt32, ID as UInt64)
		  
		  _Path = path
		  _Flags = flags
		  _eventID = ID
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DebugReportRepresentation(formatSpec as string = "") As variant
		  // Part of the DebugReportFormatter interface.
		  
		  #if TargetMacOS
		    dim textFlags() as string = FSEventModule.TextConstantsFromFlags( me.Flags )
		    
		    return   "MacFSEvent: { path: " + me.Path + EndOfLine + "eventID: " + Str( eventID, "#####################" ) + EndOfLine + "Flags: " + Hex( Flags, 8 ) + _
		    " ( " + Join( textFlags, ", " ) + " )"
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItem(onlyIfFolderItemExists as Boolean = false) As FolderItem
		  //# Return the FolderItem corresponding to Path
		  
		  //@ If you set onlyIfFolderItemExists then this method will return nil if the FolderItem does not exist
		  
		  #if TargetMacOS
		    dim f as FolderItem = new FolderItem( Path, FolderItem.PathTypeShell )
		    
		    if f<>nil then
		      if onlyIfFolderItemExists then
		        if f.Exists then
		          return  f
		        end if
		      else
		        return  f
		      end if
		    end if
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  _eventID
			End Get
		#tag EndGetter
		eventID As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  _Flags
			End Get
		#tag EndGetter
		Flags As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  _Path
			End Get
		#tag EndGetter
		Path As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _eventID As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _Flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _Path As string
	#tag EndProperty


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
			Name="Path"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
