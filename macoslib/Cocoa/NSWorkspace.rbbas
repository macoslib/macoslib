#tag Class
Class NSWorkspace
	#tag Method, Flags = &h0
		 Shared Function IconForFile(f as FolderItem) As NSImage
		  #if TargetMacOS
		    declare function iconForFile lib CocoaLib selector "iconForFile:" (obj_id as Ptr, fullPath as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    if f <> nil then
		      p = iconForFile(sharedInstance, f.POSIXPath)
		    else
		      p = nil
		    end if
		    return new NSImage(p)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OpenFile(f as FolderItem) As Boolean
		  if f is nil then
		    return false
		  end if
		  
		  #if TargetMacOS
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
		 Shared Function PerformCopy(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceCopyOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PerformMove(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String) As Boolean
		  static op as CFStringRef = Cocoa.StringConstant ("NSWorkspaceMoveOperation")
		  return performOperation (sourceDir, destDir, itemNames, op)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function performOperation(sourceDir as FolderItem, destDir as FolderItem, itemNames() as String, op as CFStringRef) As Boolean
		  #if TargetMacOS
		    if sourceDir is nil then
		      return false
		    end if
		    
		    declare function perform_ lib CocoaLib selector "performFileOperation:source:destination:files:tag:" _
		    (ws as Ptr, op as CFStringRef, src as CFStringRef, dst as CFStringRef, files as Ptr, ByRef tagOut as Integer) as Boolean
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      dim tag as Integer
		      dim dst as CFStringRef
		      if destDir <> nil then
		        dst = destDir.POSIXPath
		      end
		      dim names as CFArray = new CFArray(itemNames)
		      dim ok as Boolean = perform_ (id, op, sourceDir.POSIXPath, dst, names, tag)
		      return ok
		    else
		      return false
		    end if
		  #endif
		  
		  'NSString *NSWorkspaceMoveOperation;
		  'NSString *NSWorkspaceCopyOperation;
		  'NSString *NSWorkspaceLinkOperation;
		  'NSString *NSWorkspaceCompressOperation;
		  'NSString *NSWorkspaceDecompressOperation;
		  'NSString *NSWorkspaceEncryptOperation;
		  'NSString *NSWorkspaceDecryptOperation;
		  'NSString *NSWorkspaceDestroyOperation;
		  'NSString *NSWorkspaceRecycleOperation;
		  'NSString *NSWorkspaceDuplicateOperation;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function RunningApplications() As NSRunningApplication()
		  #if TargetMacOS
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

	#tag Method, Flags = &h0
		 Shared Function SelectFile(f as FolderItem) As Boolean
		  #if targetCocoa
		    declare function selectFile lib CocoaLib selector "selectFile:inFileViewerRootedAtPath:" (obj_id as Ptr, fullPath as CFStringRef, rootFullPath as CFStringRef) as Boolean
		    
		    return f <> nil and selectFile(sharedInstance, f.POSIXPath, "")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function sharedInstance() As Ptr
		  #if TargetMacOS
		    declare function sharedWorkspace lib CocoaLib selector "sharedWorkspace" (classId as Ptr) as Ptr
		    
		    dim classRef as Ptr = Cocoa.NSClassFromString("NSWorkspace")
		    if classRef <> nil then
		      return sharedWorkspace(classRef)
		    else
		      return nil
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function URLForAppToOpenURL(url as CFURL) As CFURL
		  #if TargetMacOS
		    declare function getapp lib CocoaLib selector "URLForApplicationToOpenURL:" (id as Ptr, url as Ptr) as Ptr
		    
		    dim id as Ptr = NSWorkspace.sharedInstance
		    if id <> nil then
		      dim p as Ptr = getapp (id, url.Reference)
		      if p <> nil then
		        return new CFURL (p, false)
		      end if
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
