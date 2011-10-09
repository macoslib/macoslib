#tag Class
Class QTCaptureConnection
Inherits NSObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isEnabled lib QTKit.framework selector "isEnabled" (obj_id as Ptr) as Boolean
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setEnabled lib QTKit.framework selector "setEnabled:" (obj_id as Ptr, value as Boolean)
			    
			    setEnabled(self, value)
			  #endif
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function mediaType lib QTKit.framework selector "mediaType" (obj_id as Ptr) as Ptr
			    
			    return CFStringRetain(mediaType(self))
			  #endif
			End Get
		#tag EndGetter
		MediaType As String
	#tag EndComputedProperty


End Class
#tag EndClass
