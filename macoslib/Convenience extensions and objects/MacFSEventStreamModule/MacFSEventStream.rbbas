#tag Class
Class MacFSEventStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(fromStream as FSEventStream)
		  #if TargetMacOS
		    me.stream = fromStream
		    
		    AddHandler   stream.FilesystemModified, AddressOf HandleEvents
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromListOfFolderItems(forFolders() as FolderItem, options as integer, latencyInSeconds as double, fromID as UInt64 = 0) As MacFSEventStream
		  #if TargetMacOS
		    return  new MacFSEventStream( FSEventStream.CreateFromListOfFolderItems( forFolders, options, latencyInSeconds, fromID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromListOfPaths(forPaths() as string, options as integer, latencyInSeconds as double = 3.0, fromID as UInt64 = 0) As MacFSEventStream
		  #if TargetMacOS
		    return  new MacFSEventStream( FSEventStream.CreateFromListOfPaths( forPaths, options, latencyInSeconds, fromID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushAsync()
		  #if TargetMacOS
		    stream.FlushAsync
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FlushSync()
		  #if TargetMacOS
		    stream.FlushSync
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEvents(obj as FSEventStream, alteredPaths() as string, eventFlags() as integer, eventIDs() as UInt64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Start() As Boolean
		  //# Start receiving events in the FilesystemModified event
		  
		  #if TargetMacOS
		    stream.ScheduleWithRunLoop
		    return   stream.Start
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  //# Stop receiving events in the FilesystemModified event
		  
		  #if TargetMacOS
		    stream.Stop
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FilesystemModified(events() as MacFSEvent)
	#tag EndHook


	#tag Property, Flags = &h21
		Private stream As FSEventStream
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
