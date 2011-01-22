#tag Class
Class NSProcessInfo
Inherits NSObject
	#tag Method, Flags = &h0
		Function Arguments() As NSArray
		  declare function arguments_ lib CocoaLib selector "arguments" (ref as id) as Ptr
		  
		  return new NSArray (arguments_(me.Reference), false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As id
		  static ref as id = Cocoa.ClassRef("NSProcessInfo")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // use NSProcessInfo.ProcessInfo instead!
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(objRef as id)
		  // We're using an already existing ID, hence no call to super.Constructor(id)
		  super.Constructor
		  me.objRef = objRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ProcessInfo() As NSProcessInfo
		  declare function processInfo_ lib CocoaLib selector "processInfo" (ref as id) as UInt32
		  
		  static c as NSProcessInfo
		  if c = nil then
		    dim cid as id = Cocoa.To_id (processInfo_ (ClassRef))
		    c = new NSProcessInfo (cid)
		  end
		  return c
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
