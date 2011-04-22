#tag Class
Class NSApplication
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString(NSClassName)
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterServices()
		  // Unfinished (by TT) - needs values passed
		  // Also, it hasn't been tested yet if this actually does the right thing.
		  
		  'declare sub registerServices_ lib CocoaLib selector "registerServicesMenuSendTypes:returnTypes:" (ref as Ptr, send as Ptr, receive as Ptr)
		  '
		  'dim type as CFType
		  '
		  'const typeName = "NSURLPboardType"
		  'dim p as Ptr = CFBundle.CocoaFramework.DataPointerNotRetained(typeName)
		  'if p <> nil then
		  'type = new CFString (p.Ptr(0), false)
		  'end if
		  '
		  'dim a as new CFArray(Array(type))
		  'registerServices_ me.Reference, a.Reference, a.Reference
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedApplication() As NSApplication
		  declare function sharedApplication_ lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		  
		  static c as new NSApplication(Cocoa.NSClassFromString(NSClassName))
		  return c
		End Function
	#tag EndMethod


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSApplication", Scope = Public
	#tag EndConstant


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
