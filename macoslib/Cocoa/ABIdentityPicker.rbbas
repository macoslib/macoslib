#tag Class
Class ABIdentityPicker
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  #if TargetMacOS
		    RequireFramework   "AddressBook"
		    
		    me._id = NSObject.Initialize( NSObject.Allocate( "ABIdentityPicker" ))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunModal() As NSArray
		  
		  #if TargetMacOS
		    declare function runModalIdentityPicker lib "AddressBook" selector "runModalIdentityPicker" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( runModalIdentityPicker( me.id ))
		    
		    return  nsa
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub __RunModalWithin(parentWindow as Window)
		  
		  #if TargetMacOS
		    declare sub beginSheetModalForWindow lib "AddressBook" selector "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:" (id as Ptr, wnd as Ptr, deleg as Ptr, didEnd as Ptr, context as Ptr)
		    
		    
		    
		    'beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:
		  #endif
		  
		  #pragma unused parentWindow
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function allowsMultipleSelection lib "AddressBook" selector "allowsMultipleSelection" (id as Ptr) as Boolean
			    
			    return   allowsMultipleSelection( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setAllowsMultipleSelection lib "AddressBook" selector "setAllowsMultipleSelection:" (id as Ptr, value as boolean)
			    
			    setAllowsMultipleSelection( me.id, value )
			  #endif
			End Set
		#tag EndSetter
		AllowsMultipleSelection As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsMultipleSelection"
			Group="Behavior"
			Type="Boolean"
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
