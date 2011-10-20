#tag Class
Class NSImage
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function ApplicationIcon() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameApplicationIcon"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  #if targetMacOS
		    return Cocoa.NSClassFromString("NSImage")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSImage
		  #if targetMacOS
		    declare function copyWithZone lib CocoaLib selector "copyWithZone:" (obj_id as Ptr, zone as Ptr) as Ptr
		    
		    return new NSImage(copyWithZone(self, nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadByName(name as CFStringRef) As NSImage
		  #if targetMacOS
		    declare function imageNamed lib CocoaLib selector "imageNamed:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = imageNamed(ClassRef, name)
		    if p <> nil then
		      return new NSImage(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadByName(name as String) As NSImage
		  dim cfName as CFStringRef = name
		  return LoadByName(cfName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeCGImage() As CGImage
		  #if targetMacOS
		    declare function CGImageForProposedRect lib CocoaLib selector "CGImageForProposedRect:context:hints:" (obj_id as Ptr, proposedDestRect as Ptr, referenceContext as Ptr, hints as Ptr) as Ptr
		    
		    dim imagePtr as Ptr = CGImageForProposedRect(self, nil, nil, nil)
		    if imagePtr <> nil then
		      return new CGImage(imagePtr, not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveSymbol(symbolName as String) As CFStringRef
		  dim b as CFBundle = CFBundle.NewCFBundleFromID(Cocoa.BundleID)
		  if b <> nil then
		    return b.StringPointerRetained(symbolName)
		    
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Cocoa.NSSize
		  #if targetMacOS
		    declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
		    
		    return size(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(assigns value as Cocoa.NSSize)
		  //starting in MacOS 10.6, this rescales the image.
		  
		  #if targetMacOS
		    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, value as Cocoa.NSSize)
		    
		    setSize(self, value)
		  #endif
		End Sub
	#tag EndMethod


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
