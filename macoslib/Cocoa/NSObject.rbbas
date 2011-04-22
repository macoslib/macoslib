#tag Class
Protected Class NSObject
	#tag Method, Flags = &h0
		Function ClassObjectID() As Ptr
		  //this method returns the id of the class object.  Typically it would be used in subclasses in the implementation 
		  //of Cocoa class methods in Rb.
		  
		  
		  #if targetCocoa
		    soft declare function klass lib Cocoa selector "class" (id as Ptr) as Ptr
		    
		    if self._id <> nil then
		      return klass(me._id)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(obj_id as Ptr)
		  me._id = obj_id
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self._id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private _id As Ptr
	#tag EndProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
