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


End Class
#tag EndClass
