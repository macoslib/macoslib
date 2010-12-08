#tag Class
Class NSNotificationCenter
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddObserver()
		  declare sub objc_msgSend lib CocoaLib alias "objc_msgSend" (theReceiver as Cocoa.id, theSelector as Cocoa.SEL, _
		  obs as id, sel as SEL, name as CFStringRef, sender as id)
		  
		  static sel as SEL = Cocoa.Selector ("addObserver:selector:name:object:")
		  
		  'objc_msgSend (
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As id
		  static ref as id = Cocoa.ClassRef("NSNotificationCenter")
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.Constructor (ClassRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(objRef as id)
		  super.Constructor
		  me.objRef = objRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DefaultCenter() As NSNotificationCenter
		  declare function objc_msgSend lib CocoaLib alias "objc_msgSend" (theReceiver as id, theSelector as SEL) as Integer
		  
		  static c as NSNotificationCenter
		  if c = nil then
		    dim cid as id = Cocoa.To_id (objc_msgSend (ClassRef, Cocoa.Selector("defaultCenter")))
		    c = new NSNotificationCenter (cid)
		  end
		  return c
		End Function
	#tag EndMethod


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
