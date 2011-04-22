#tag Class
Class NSNotificationCenter
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddObserver()
		  'declare sub objc_msgSend lib CocoaLib alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, _
		  'obs as id, sel as SEL, name as CFStringRef, sender as id)
		  '
		  'static sel as SEL = Cocoa.Selector ("addObserver:selector:name:object:")
		  '
		  ''objc_msgSend (
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString(NSClassName)
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DefaultCenter() As NSNotificationCenter
		  #if targetCocoa
		    declare function defaultCenter lib CocoaLib selector "defaultCenter" (class_id as Ptr) as Ptr
		    
		    static c as new NSNotificationCenter(defaultCenter(NSClassFromString(NSClassName)))
		    return c
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSNotificationCenter", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
