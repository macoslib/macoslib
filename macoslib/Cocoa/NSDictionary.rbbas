#tag Class
Class NSDictionary
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllKeys() As NSArray
		  #if TargetMacOS
		    declare function _allKeys lib CocoaLib selector "allKeys" (id as Ptr) as Ptr
		    
		    return new NSArray(_allKeys(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllValues() As NSArray
		  #if TargetMacOS
		    declare function _allValues lib CocoaLib selector "allValues" (id as Ptr) as Ptr
		    
		    return new NSArray(_allValues(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(cfd as CFDictionary)
		  // Adopts a CFDictionary
		  // Note: This shall _not_ create a copy of the passed CFDictionary. For that, there's the Copy function
		  Super.Constructor(cfd)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(keys as NSArray, values as NSArray)
		  #if TargetMacOS
		    declare function dictionaryWithObjectsforKeys lib CocoaLib selector "dictionaryWithObjects:forKeys:" ( cls as Ptr, nsa1 as Ptr, nsa2 as Ptr ) as Ptr
		    
		    Super.Constructor( dictionaryWithObjectsforKeys( Cocoa.NSClassFromString( "NSDictionary" ), values.id, keys.id ), false )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(id as Ptr, hasOwnership as boolean = false)
		  Super.Constructor( id, hasOwnership, "NSDictionary" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSDictionary
		  #if TargetMacOS
		    declare function _copy lib CocoaLib selector "copy" (id as Ptr) as Ptr
		    
		    return   new NSDictionary( _copy( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromDictionary(dict as Dictionary) As NSDictionary
		  #if TargetMacOS
		    dim md as new NSMutableDictionary
		    
		    if dict=nil then
		      return   nil
		    end if
		    
		    for i as integer=0 to dict.Count - 1
		      md.Value( Cocoa.NSObjectFromVariant( dict.Key( i ))) = Cocoa.NSObjectFromVariant( dict.value( dict.key( i )))
		    next
		    
		    return   md.Copy
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromFile(file as FolderItem) As NSDictionary
		  //# Create a new NSDictionary from a file (like as .plist file)
		  
		  #if TargetMacOS
		    declare function dictionaryWithContentsOfFile lib CocoaLib selector "dictionaryWithContentsOfFile:" (cls as Ptr, path as CFStringRef) as Ptr
		    
		    dim p as Ptr = dictionaryWithContentsOfFile( Cocoa.NSClassFromString( "NSDictionary" ), file.POSIXPath )
		    
		    if p<>nil then
		      return   new NSDictionary( p, false )
		    end if
		    
		  #endif
		End Function
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
		    
		    return   Cocoa.NSObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as variant) As Variant
		  //# Get a value corresponding to a key
		  
		  #if TargetMacOS
		    Declare function objectForKey lib CocoaLib selector "objectForKey:" ( id as Ptr, key as Ptr ) as Ptr
		    
		    dim trueKey as NSObject
		    
		    if key isa NSObject then
		      trueKey = Key
		    else
		      trueKey = Cocoa.NSObjectFromVariant( key )
		    end if
		    
		    dim p as Ptr = objectForKey( me.id, truekey.id )
		    
		    if p=nil then
		      return   nil
		    end if
		    
		    return   Cocoa.NSObjectFromNSPtr( p, false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  // Create a RS Dictionary
		  
		  #if TargetMacOS
		    dim dict as new Dictionary
		    
		    dim keys as NSArray = me.AllKeys
		    dim values as NSArray = me.AllValues
		    dim oneKey, oneValue as objHasVariantValue
		    
		    for i as integer = 0 to keys.Count - 1
		      oneKey = Cocoa.NSObjectFromNSPtr( keys.Value( i ))
		      oneValue = Cocoa.NSObjectFromNSPtr( values.Value( i ))
		      
		      dict.Value( oneKey.VariantValue ) = oneValue.VariantValue
		    next
		    
		    return  dict
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToFile(file as FolderItem) As Boolean
		  //# Write the NSDictionary to 'file'. Returns true on success
		  
		  #if TargetMacOS
		    declare function writeToFile lib CocoaLib selector "writeToFile:atomically:" ( id as Ptr, path as CFStringRef, atomically as Boolean ) as Boolean
		    
		    return   writeToFile( me.id, file.POSIXPath, true ) //Always write atomically
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


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
