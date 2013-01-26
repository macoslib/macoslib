#tag Class
Class NSMutableString
Inherits NSString
	#tag Method, Flags = &h0
		Sub Append(s as NSString)
		  if s = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    //aString must not be nil.
		    declare sub appendString lib CocoaLib selector "appendString:" (id as Ptr, aString as Ptr )
		    
		    appendString(self, s)
		    
		  #else
		    #pragma unused s
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(s as String)
		  #if targetMacOS
		    declare sub appendString lib CocoaLib selector "appendString:" (obj_id as Ptr, aString as CFStringRef)
		    
		    appendString(self, s)
		  #else
		    #pragma unused s
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function initWithCapacity lib CocoaLib selector "initWithCapacity:" (id as Ptr, capacity as UInt32) as Ptr
		    
		    super.Constructor(initWithCapacity(NSObject.Allocate("NSMutableString" ), 0), hasOwnership)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(s as String)
		  self.Constructor()
		  self.Append(s)
		  
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
