#tag Class
Class NSProcessInfo
Inherits NSObject
	#tag Method, Flags = &h0
		Function Arguments() As NSArray
		  declare function arguments_ lib CocoaLib selector "arguments" (ref as Ptr) as Ptr
		  
		  return new NSArray (arguments_(self.id), false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("NSProcessInfo")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ProcessInfo() As NSProcessInfo
		  #if targetCocoa
		    declare function defaultCenter lib CocoaLib selector "processInfo" (class_id as Ptr) as Ptr
		    
		    static c as new NSProcessInfo(defaultCenter(NSClassFromString(NSClassName)))
		    return c
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSProcessInfo", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
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
