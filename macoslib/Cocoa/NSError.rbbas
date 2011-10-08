#tag Class
Class NSError
Inherits NSObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function code lib CocoaLib selector "code" (obj_id as Ptr) as Integer
			    
			    return code(self)
			  #endif
			End Get
		#tag EndGetter
		Code As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function localizedDescription lib CocoaLib selector "localizedDescription" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr =  localizedDescription(self)
			    if p <> nil then
			      return CFStringRetain(p)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function domain lib CocoaLib selector "domain" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr =  domain(self)
			    if p <> nil then
			      return CFStringRetain(p)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Domain As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function localizedFailureReason lib CocoaLib selector "localizedFailureReason" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr =  localizedFailureReason(self)
			    if p <> nil then
			      return CFStringRetain(p)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		FailureReason As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Code"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Domain"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailureReason"
			Group="Behavior"
			Type="String"
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
