#tag Class
Class NSMenu
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(title as String = "")
		  #if targetCocoa
		    declare function initWithTitle lib CocoaLib selector "initWithTitle:" (obj_id as Ptr, title as CFStringRef) as Ptr
		    
		    dim menuRef as Ptr = initWithTitle(Allocate("NSMenu"), title)
		    self.Constructor(menuRef, NSObject.hasOwnership)
		  #endif
		End Sub
	#tag EndMethod


End Class
#tag EndClass
