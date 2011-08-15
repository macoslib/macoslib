#tag Class
Class NSBundle
Inherits NSObject
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


	#tag Note, Name = Read Me
		NSBundle is not toll-free bridged with CFBundle.  According to the Apple docs, one can use CFBundle for some things Cocoa, but not
		for loading code.
	#tag EndNote


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
