#tag Class
Class NSURL
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  if not (f is nil) then
		    me.Constructor  f.URLPath
		  else
		    raise  new NilObjectException
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theURL as String)
		  #if targetMacOS
		    declare function URLWithString lib CocoaLib selector "URLWithString:" ( id as Ptr, URLString as CFStringRef ) as Ptr
		    
		    super.Constructor URLWithString( Cocoa.NSClassFromString( "NSURL" ), theURL ), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as Ptr
		    
		    return  new NSString( pathExtension( self.id ), false )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  me.absoluteString
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function absoluteString lib CocoaLib selector "absoluteString" ( id as Ptr ) as CFStringRef
			    
			    return   absoluteString( me.id )
			  #endif
			End Get
		#tag EndGetter
		absoluteString As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not ( self = nil ) then
			    return  new FolderItem( me.absoluteString, FolderItem.PathTypeURL )
			  end if
			End Get
		#tag EndGetter
		Item As FolderItem
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="absoluteString"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
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
