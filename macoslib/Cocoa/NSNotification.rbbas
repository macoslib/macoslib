#tag Class
Class NSNotification
Inherits NSObject
	#tag Method, Flags = &h0
		Function AssociatedObject() As Ptr
		  #if targetMacOS
		    declare function object_ lib CocoaLib selector "object" (obj_id as Ptr) as Ptr
		    
		    return object_(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Dictionary
		  //# Converts the NSNotification into a RS Dictionary object. Used for Convenience Methods
		  
		  dim dict as new Dictionary
		  
		  dict.Value( "Name" ) = me.Name
		  dict.Value( "AssociatedObject" ) = me.AssociatedObject
		  if me.UserInfo<>nil then
		    dict.Value( "UserInfo" ) = me.UserInfo.VariantValue
		  end if
		  
		  return   dict
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserInfo() As CFDictionary
		  #if targetMacOS
		    declare function userInfo lib CocoaLib selector "userInfo" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = userInfo(self)
		    if p <> nil then
		      return new CFDictionary(p, not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty


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
