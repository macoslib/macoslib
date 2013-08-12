#tag Class
Class NSMutableDictionary
Inherits NSDictionary
	#tag Method, Flags = &h0
		Sub AddEntries(d as NSDictionary)
		  
		  #if TargetMacOS
		    declare sub addEntriesFromDictionary lib Cocoalib selector "addEntriesFromDictionary:" ( id as Ptr, value as Ptr )
		    
		    if d is nil then
		      dim e as new NilObjectException
		      e.Message = CurrentMethodName + ": d cannot be nil."
		      raise e
		    end if
		    
		    addEntriesFromDictionary(self, d)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Delete all the values stored in the dictionary
		  
		  #if TargetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (id as Ptr)
		    
		    removeAllObjects(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(capacity as Integer =20)
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" ( cls as Ptr, capacity as UInt32 ) as Ptr
		    
		    Super.Constructor(dictionaryWithCapacity(Cocoa.NSClassFromString( "NSMutableDictionary" ), capacity))
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(keys as NSArray)
		  
		  #if targetMacOS
		    declare sub removeObjectsForKeys lib CocoaLib selector "removeObjectsForKeys:" (obj_id as Ptr, keys as Ptr)
		    
		    if keys <> nil then
		      removeObjectsForKeys self, keys
		    else
		      //no-op?
		    end if
		    
		  #else
		    #pragma unused keys
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Remove(key as Ptr)
		  #if targetMacOS
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" (obj_id as Ptr, key as Ptr)
		    
		    removeObjectForKey self, key
		    
		  #else
		    #pragma unused key
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub RemoveAll()
		  
		  #if targetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (obj_id as Ptr)
		    
		    removeAllObjects self
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Replace(otherDictionary as NSDictionary)
		  
		  #if targetMacOS
		    declare sub setDictionary lib CocoaLib selector "setDictionary:" (obj_id as Ptr, otherDictionary as Ptr)
		    
		    if otherDictionary <> nil then
		      setDictionary self, otherDictionary
		    else
		      //was this intended to be a no-op?  
		    end if
		    
		  #else
		    #pragma unused otherDictionary
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as Ptr, assigns newValue as Ptr)
		  
		  #if TargetMacOS
		    declare sub setObject lib Cocoalib selector "setObject:forKey:" ( id as Ptr, key as Ptr, value as Ptr )
		    
		    setObject(self, newValue, key)
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSDictionary"
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
