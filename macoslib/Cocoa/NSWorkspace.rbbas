#tag Class
Class NSWorkspace
	#tag Method, Flags = &h0
		 Shared Function OpenFile(f as FolderItem) As Boolean
		  if f is nil then
		    return false
		  end if
		  
		  #if targetCocoa
		    declare function openFile_ lib CocoaLib selector "openFile:" (id as Ptr, fullPath as CFStringRef) as Boolean
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      return openFile_(id, f.POSIXPath)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Perform()
		  'performFileOperation:source:destination:files:tag:
		  '
		  '
		  'NSString *NSWorkspaceMoveOperation;
		  'NSString *NSWorkspaceCopyOperation;
		  'NSString *NSWorkspaceLinkOperation;  n
		  'NSString *NSWorkspaceCompressOperation;
		  'NSString *NSWorkspaceDecompressOperation;
		  'NSString *NSWorkspaceEncryptOperation;
		  'NSString *NSWorkspaceDecryptOperation;
		  'NSString *NSWorkspaceDestroyOperation;
		  'NSString *NSWorkspaceRecycleOperation;
		  'NSString *NSWorkspaceDuplicateOperation;
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function RunningApplications() As NSRunningApplication()
		  #if targetMacOS
		    declare function runningApplications lib CocoaLib selector "runningApplications" (obj_id as Ptr) as Ptr
		    
		    dim theList() as NSRunningApplication
		    dim theArray as new CFArray(runningApplications(sharedInstance), not CFType.hasOwnership)
		    for i as Integer = 0 to theArray.Count - 1
		      dim p as Ptr = theArray.Value(i)
		      if p <> nil then
		        theList.Append new NSRunningApplication(p)
		      end if
		    next
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function sharedInstance() As Ptr
		  #if targetCocoa
		    soft declare function sharedWorkspace lib CocoaLib selector "sharedWorkspace" (classId as Ptr) as Ptr
		    
		    dim classRef as Ptr = Cocoa.NSClassFromString("NSWorkspace")
		    if classRef <> nil then
		      return sharedWorkspace(classRef)
		    else
		      return nil
		    end if
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
End Class
#tag EndClass
