#tag Class
Class NSDictionary
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(keys as NSArray, values as NSArray)
		  
		  #if TargetMacOS
		    declare function dictionaryWithObjectsforKeys lib CocoaLib selector "dictionaryWithObjects:forKeys:" ( cls as Ptr, nsa1 as Ptr, nsa2 as Ptr ) as Ptr
		    
		    Super.Constructor( dictionaryWithObjectsforKeys( Cocoa.NSClassFromString( "NSDictionary" ), values.id, keys.id ), false )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key as NSObject) As Boolean
		  
		  return   ( me.Value( key ) <> nil )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as NSObject, defaultValue as variant) As Variant
		  //# Get a value corresponding to a key of the passed defaukt value if not found
		  
		  #if TargetMacOS
		    Declare function objectForKey lib CocoaLib selector "objectForKey:" ( id as Ptr, key as Ptr ) as Ptr
		    
		    dim p as Ptr = objectForKey( me.id, key.id )
		    
		    if p=nil then
		      return  defaultValue
		    end if
		    
		    return   Cocoa.RBObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as NSObject) As Variant
		  //# Get a value corresponding to a key
		  
		  #if TargetMacOS
		    Declare function objectForKey lib CocoaLib selector "objectForKey:" ( id as Ptr, key as Ptr ) as Ptr
		    
		    dim p as Ptr = objectForKey( me.id, key.id )
		    
		    if p=nil then
		      return   nil
		    end if
		    
		    return   Cocoa.RBObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function _count lib CocoaLib selector "count" ( id as Ptr ) as UInt32
			    
			    return   _count( me.id )
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


End Class
#tag EndClass
