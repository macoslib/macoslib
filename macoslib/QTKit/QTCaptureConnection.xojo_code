#tag Class
Class QTCaptureConnection
Inherits NSObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If targetMacOS and targetX86
			    declare function isEnabled lib QTKit.framework selector "isEnabled" (obj_id as Ptr) as Boolean
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #If targetMacOS and targetX86
			    declare sub setEnabled lib QTKit.framework selector "setEnabled:" (obj_id as Ptr, value as Boolean)
			    
			    setEnabled(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If targetMacOS and targetX86
			    declare function mediaType lib QTKit.framework selector "mediaType" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(mediaType(self))
			  #endif
			End Get
		#tag EndGetter
		MediaType As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MediaType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
