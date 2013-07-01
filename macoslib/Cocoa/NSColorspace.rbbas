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
		    soft declare function deviceRGBColorSpace lib Cocoa selector "deviceRGBColorSpace" (class_id as Ptr) as Ptr
		    soft declare function NSClassFromString lib Cocoa (aClassName as CFStringRef) as Ptr
		    
		    dim s as new NSColorspace
		    s.m_id = deviceRGBColorSpace(NSClassFromString("NSColorSpace"))
		    return s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function sRGBColorSpace() As NSColorspace
		  #if TargetMacOS
		    soft declare function sRGBColorSpace lib Cocoa selector "sRGBColorSpace" (class_id as Ptr) as Ptr
		    soft declare function NSClassFromString lib Cocoa (aClassName as CFStringRef) as Ptr
		    
		    dim s as new NSColorspace
		    s.m_id = sRGBColorSpace(NSClassFromString("NSColorSpace"))
		    return s
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    if me.id = nil then
			      return ""
			    end if
			    
			    soft declare function localizedName lib Cocoa selector "localizedName" (id as Ptr) as CFStringRef
			    
			    return  localizedName(me.id)
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
	#tag EndComputedProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant


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
