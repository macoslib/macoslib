#tag Class
Class NSApplication
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function ClassRef() As id
		  static ref as id = Cocoa.ClassRef("NSApplication")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // use NSApplication.SharedApplication instead!
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
		Sub RegisterServices()
		  // Unfinished (by TT) - needs values passed
		  // Also, it hasn't been tested yet if this actually does the right thing.
		  
		  declare sub registerServices_ lib CocoaLib selector "registerServicesMenuSendTypes:returnTypes:" (ref as id, send as Ptr, receive as Ptr)
		  
		  dim type as CFType
		  
		  const typeName = "NSURLPboardType"
		  dim p as Ptr = CFBundle.CocoaFramework.DataPointerNotRetained(typeName)
		  if p <> nil then
		    type = new CFString (p.Ptr(0), false)
		  end if
		  
		  dim a as new CFArray(Array(type))
		  registerServices_ me.Reference, a.Reference, a.Reference
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedApplication() As NSApplication
		  declare function sharedApplication_ lib CocoaLib selector "sharedApplication" (ref as id) as UInt32
		  
		  static c as NSApplication
		  if c = nil then
		    dim cid as id = Cocoa.To_id (sharedApplication_ (ClassRef))
		    c = new NSApplication (cid)
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
