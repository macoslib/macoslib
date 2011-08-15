#tag Class
Class NSMenuItem
Inherits NSObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function tag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
			    
			    return tag(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
			    
			    setTag(self, value)
			  #endif
			End Set
		#tag EndSetter
		Tag As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setTitle(self, value)
			  #endif
			End Set
		#tag EndSetter
		Title As String
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
			Name="Title"
			Group="Behavior"
			Type="String"
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
