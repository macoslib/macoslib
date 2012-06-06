#tag Class
Class NSMutableIndexSet
Inherits NSIndexSet
	#tag Method, Flags = &h0
		Sub Add(newIndex as integer)
		  #if TargetMacOS
		    declare sub addIndex lib CocoaLib selector "addIndex:" (id as Ptr, idx as integer)
		    
		    addIndex  me.id, newIndex
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    me._id = NSObject.Initialize( NSObject.Allocate( "NSMutableIndexSet" ))
		  #endif
		End Sub
	#tag EndMethod


End Class
#tag EndClass
