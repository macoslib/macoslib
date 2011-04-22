#tag Class
Class NSObject
	#tag Method, Flags = &h0
		 Shared Function Allocate(NSClassName as String) As Ptr
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    
		    return alloc(Cocoa.NSClassFromString(NSClassName))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Autorelease()
		  #if targetCocoa
		    declare sub autorelease lib CocoaLib selector "autorelease" (id as Ptr)
		    
		    autorelease self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClassObjectID() As Ptr
		  //this method returns the id of the class object.  Typically it would be used in subclasses in the implementation
		  //of Cocoa class methods in Rb.
		  
		  
		  #if targetCocoa
		    soft declare function klass lib CocoaLib selector "class" (id as Ptr) as Ptr
		    
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

	#tag Method, Flags = &h0
		 Shared Function Initialize(obj_id as Ptr) As Ptr
		  #if targetCocoa
		    declare function init lib CocoaLib selector "init" (id as Ptr) as Ptr
		    
		    return init(obj_id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if targetCocoa
		    declare sub release lib CocoaLib (id as Ptr)
		    
		    if self.id <> nil then
		      release self.id
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Retain() As NSObject
		  #if targetCocoa
		    declare function retain lib CocoaLib selector "retain" (id as Ptr) as Ptr
		    
		    if self.id <> nil then
		      dim p as Ptr = retain(self.id)
		      #pragma unused p
		      return self
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function description lib CocoaLib selector "description" (id as Ptr) as CFStringRef
			    
			    if self.id <> nil then
			      return description(self.id)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

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


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
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
