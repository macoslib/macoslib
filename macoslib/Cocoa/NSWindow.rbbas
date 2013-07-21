#tag Class
Class NSWindow
Inherits NSResponder
	#tag Method, Flags = &h1000
		Sub Constructor(w As Window)
		  Super.Constructor( Ptr( w.Handle ), not hasOwnership )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(w As Window)
		  me.Constructor( w )
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as double = 1.
			  
			  #if TargetCocoa
			    
			    if me.RespondsToSelector( "backingScaleFactor" ) then
			      declare function instanceBackingScaleFactor lib CarbonLib selector "backingScaleFactor" ( obj_id As Ptr ) As Single
			      r = instanceBackingScaleFactor( self )
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		BackingScaleFactor As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function IsDocumentEdited lib CarbonLib selector "isDocumentEdited" ( id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.0.
			    
			    return IsDocumentEdited( self )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    declare sub SetDocumentEdited lib CarbonLib selector "setDocumentEdited:" ( id As Ptr, value As Boolean )
			    // Introduced in MacOS X 10.0.
			    
			    SetDocumentEdited( self, value )
			    
			  #endif
			  
			End Set
		#tag EndSetter
		DocumentEdited As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    declare function IsMovableByWindowBackground lib CarbonLib selector "isMovableByWindowBackground" ( id As Ptr ) As Boolean
			    // Introduced in MacOS X 10.2.
			    
			    return IsMovableByWindowBackground( self )
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub SetMovableByWindowBackground lib CarbonLib selector "setMovableByWindowBackground:" ( id As Ptr, value As Boolean )
			    // Introduced in MacOS X 10.2.
			    
			    SetMovableByWindowBackground( self, value )
			    
			  #endif
			  
			End Set
		#tag EndSetter
		MovableByBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim f as FolderItem
			  
			  #if TargetMacOS
			    
			    dim url as NSURL = me.RepresentedURL
			    if url <> nil then
			      f = url.Item
			    end if
			    
			  #endif
			  
			  return f
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    
			    // Working with the path just because it's easier.
			    
			    if value = nil then
			      me.RepresentedFilename = ""
			    else
			      
			      dim path as string
			      #if RBVersion >= 2013.0
			        path = value.NativePath
			      #else
			        path = value.POSIXPath
			      #endif
			      me.RepresentedFilename = path
			      
			    end if
			    
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedFile As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim name as CFStringRef
			  
			  #if TargetCocoa
			    
			    declare function instanceRepresentedFilename lib CarbonLib selector "representedFilename" ( id As Ptr ) As CFStringRef
			    // Introduced in MacOS X 10.0.
			    
			    name = instanceRepresentedFilename( self )
			    
			  #endif
			  
			  return name
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub instanceSetTitleWithRepresentedFilename lib CocoaLib selector "setTitleWithRepresentedFilename:" ( id as Ptr, name as CFStringRef )
			    // Introduced in MacOS X 10.0.
			    
			    instanceSetTitleWithRepresentedFilename( self, value )
			    
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedFilename As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetCocoa
			    
			    dim url as NSURL
			    
			    declare function instanceRepresentedURL lib CarbonLib selector "representedURL" ( id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.5.
			    
			    dim p as Ptr = instanceRepresentedURL( self )
			    if p <> nil then
			      url = new NSURL( p, not hasOwnership )
			    end if
			    
			    return url
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetCocoa
			    
			    declare sub instanceSetRepresentedURL lib CarbonLib selector "setRepresentedURL:" ( id As Ptr, url As Ptr )
			    // Introduced in MacOS X 10.5.
			    
			    if value = nil then
			      instanceSetRepresentedURL( self, nil )
			    else
			      instanceSetRepresentedURL( self, value.id )
			    end if
			    
			  #endif
			  
			End Set
		#tag EndSetter
		RepresentedURL As NSURL
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackingScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentEdited"
			Group="Behavior"
			Type="Boolean"
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
			Name="MovableByBackground"
			Group="Behavior"
			Type="Boolean"
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
