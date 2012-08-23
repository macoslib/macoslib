#tag Class
Class NSMutableDictionary
Inherits NSDictionary
	#tag Method, Flags = &h0
		Sub AppendDictionary(dictToAppend as NSDictionary)
		  
		  #if TargetMacOS
		    declare sub addEntriesFromDictionary lib Cocoalib selector "addEntriesFromDictionary:" ( id as Ptr, value as Ptr )
		    
		    addEntriesFromDictionary( me.id, dictToAppend.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  //# Delete all the values stored in the dictionary
		  
		  #if TargetMacOS
		    declare sub removeAllObjects lib CocoaLib selector "removeAllObjects" (id as Ptr)
		    
		    removeAllObjects   me.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    declare function dictionaryWithCapacity lib CocoaLib selector "dictionaryWithCapacity:" ( cls as Ptr, capacity as UInt32 ) as Ptr
		    
		    Super.Constructor( dictionaryWithCapacity( Cocoa.NSClassFromString( "NSMutableDictionary" ), 20 ), false )
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as NSObject)
		  
		  #if TargetMacos
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" ( id as Ptr, key as Ptr )
		    
		    removeObjectForKey   me.id, key.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as variant, assigns newValue as NSObject)
		  
		  #if TargetMacOS
		    declare sub setObject lib Cocoalib selector "setObject:forKey:" ( id as Ptr, key as Ptr, value as Ptr )
		    
		    dim truekey as NSObject
		    
		    if key IsA NSObject then
		      truekey = key
		    else
		      truekey = Cocoa.NSObjectFromVariant( key )
		    end if
		    
		    setObject( me.id, newValue.id, truekey.id )
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
