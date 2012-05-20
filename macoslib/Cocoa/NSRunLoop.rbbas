#tag Class
Class NSRunLoop
Inherits NSObject
	#tag Method, Flags = &h0
		Function CFRunLoop() As CFRunLoop
		  #if targetCocoa
		    declare function getCFRunLoop lib CocoaLib selector "getCFRunLoop" (obj_id as Ptr) as Ptr
		    
		    return new CFRunLoop(getCFRunLoop(self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Current() As NSRunLoop
		  #if targetCocoa
		    declare function currentRunLoop lib CocoaLib selector "currentRunLoop" (class_id as Ptr) as Ptr
		    
		    return new NSRunLoop(currentRunLoop(Cocoa.NSClassFromString("NSRunLoop")), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Main() As NSRunLoop
		  #if targetCocoa
		    declare function mainRunLoop lib CocoaLib selector "mainRunLoop" (class_id as Ptr) as Ptr
		    
		    return new NSRunLoop(mainRunLoop(Cocoa.NSClassFromString("NSRunLoop")), not hasOwnership)
		  #endif
		End Function
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
