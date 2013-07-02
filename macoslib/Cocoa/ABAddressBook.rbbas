#tag Class
Class ABAddressBook
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    declare function m_addressBook lib "AddressBook.framework" selector "addressBook" ( Cls as Ptr ) as Ptr
		    
		    RequireFramework   "AddressBook"
		    
		    dim Cls as Ptr = Cocoa.NSClassFromString( "ABAddressBook" )
		    
		    me.m_id = m_addressBook( Cls )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Groups() As NSArray
		  
		  #if TargetMacOS
		    declare function m_groups lib "AddressBook.framework" selector "groups" (id as Ptr ) as Ptr
		    
		    dim p as Ptr = m_groups( me.id )
		    if p<>nil then
		      return   new NSArray( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function People() As NSArray
		  
		  #if TargetMacOS
		    declare function m_people lib "AddressBook.framework" selector "people" (id as Ptr ) as Ptr
		    
		    dim p as Ptr = m_people( me.id )
		    if p<>nil then
		      return   new NSArray( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function recordForUniqueId(UID as String) As variant
		  
		  #if TargetMacOS
		    declare function recordForUniqueId lib "AddressBook" selector "recordForUniqueId:" (id as Ptr, UID as CFStringRef) as Ptr
		    
		    dim p as Ptr = recordForUniqueId( me.id, UID )
		    
		    if p<>nil then
		      return   Cocoa.NSObjectFromNSPtr( p )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedAddressBook() As ABAddressBook
		  
		  return   new ABAddressBook
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
