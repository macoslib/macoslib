#tag Class
Class NSColorspace
Inherits NSObject
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DeviceRGBColorSpace() As NSColorspace
		  #if TargetMacOS
		    declare function deviceRGBColorSpace lib CocoaLib selector "deviceRGBColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(deviceRGBColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function sRGBColorSpace() As NSColorspace
		  #if TargetMacOS
		    declare function sRGBColorSpace lib CocoaLib selector "sRGBColorSpace" (class_id as Ptr) as Ptr
		    
		    return new NSColorspace(sRGBColorSpace(NSClassFromString("NSColorSpace")))
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function localizedName lib CocoaLib selector "localizedName" (id as Ptr) as CFStringRef
			    
			    return localizedName(self)
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
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
			Name="LocalizedName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
