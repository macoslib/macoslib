#tag Class
Class NSBundle
Inherits NSObject
	#tag Method, Flags = &h0
		Function AppStoreReceiptDirectory() As FolderItem
		  #if targetMacOS
		    // This method is to be invoked on the application bundle; that is, the object returned by NSBundle.MainBundle.
		    
		    if IsLion then
		      declare function appStoreReceiptURL lib CocoaLib selector "appStoreReceiptURL" (obj_id as Ptr) as Ptr
		      
		      return bundleDirectory(appStoreReceiptURL(self))
		    else
		      return nil
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BundleDirectory() As FolderItem
		  #if targetMacOS
		    declare function bundleURL lib CocoaLib selector "bundleURL" (obj_id as Ptr) as Ptr
		    
		    return bundleDirectory(bundleURL(self))
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function bundleDirectory(urlRef as Ptr) As FolderItem
		  // May return nil if the url points to a nonexisting path.
		  // But even if it's not nil, the item at the URL may still not exist!
		  
		  #if targetMacOS
		    if urlRef <> nil then
		      dim url as new CFURL(urlRef, not CFType.hasOwnership)
		      #pragma BreakOnExceptions off
		      try
		        return new FolderItem(url.StringValue, FolderItem.PathTypeURL)
		      catch UnsupportedFormatException
		        // path invalid - probably not existing
		        return nil
		      end try
		      #pragma BreakOnExceptions reset
		    else
		      return nil
		    end if
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load() As Boolean
		  #if targetCocoa
		    declare function load lib CocoaLib selector "load" (obj_id as Ptr) as Boolean
		    
		    return load(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromIdentifier(bundleID as String) As NSBundle
		  #if targetCocoa
		    declare function bundleWithIdentifier lib CocoaLib selector "bundleWithIdentifier:" (class_id as Ptr, identifier as CFStringRef) as Ptr
		    
		    dim p as Ptr = bundleWithIdentifier(Cocoa.NSClassFromString("NSBundle"), bundleID)
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused bundleID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromPath(path as String) As NSBundle
		  #if targetCocoa
		    declare function bundleWithPath lib CocoaLib selector "bundleWithPath:" (class_id as Ptr, fullPath as CFStringRef) as Ptr
		    
		    dim p as Ptr = bundleWithPath(Cocoa.NSClassFromString("NSBundle"), path)
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused path
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MainBundle() As NSBundle
		  #if targetMacOS
		    declare function mainBundle lib CocoaLib selector "mainBundle" (class_id as Ptr) as Ptr
		    
		    dim p as Ptr = mainBundle(Cocoa.NSClassFromString("NSBundle"))
		    if p <> nil then
		      return new NSBundle(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrincipalClass() As Ptr
		  #if targetCocoa
		    declare function principalClass lib CocoaLib selector "principalClass" (obj_id as Ptr) as Ptr
		    
		    return principalClass(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourcesDirectory() As FolderItem
		  #if targetMacOS
		    declare function resourceURL lib CocoaLib selector "resourceURL" (obj_id as Ptr) as Ptr
		    
		    return bundleDirectory(resourceURL(self))
		  #endif
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Read Me
		NSBundle is not toll-free bridged with CFBundle.  According to the Apple docs, one can use CFBundle for some things Cocoa, but not
		for loading code.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isLoaded lib CocoaLib selector "isLoaded" (obj_id as Ptr) as Boolean
			    
			    return isLoaded(self)
			  #endif
			End Get
		#tag EndGetter
		IsLoaded As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsLoaded"
			Group="Behavior"
			Type="Boolean"
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
