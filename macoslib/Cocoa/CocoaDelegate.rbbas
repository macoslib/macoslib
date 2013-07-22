#tag Class
Class CocoaDelegate
Inherits NSObject
	#tag Method, Flags = &h1
		Protected Shared Function CocoaDelegateMap() As Dictionary
		  
		  // a static dictionary for delegates
		  
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  // This is an abstract class to construct Cocoa delegates. It must not be directly instantiated, instead it must be subclassed.
		  // A subclass MUST implement the events to provide a name for the Cocoa class and delegate methods
		  
		  mClassName = raiseEvent DelegateClassName // get the Class name and store it
		  
		  // allocate the instance
		  dim delegate_id as Ptr = Initialize(Allocate(RegisterClass(ClassName)))
		  super.Constructor(delegate_id, NSObject.hasOwnership) // construct the super object (NSObject)
		  
		  // store the instance in a static map
		  CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // if self is still present in the static map, remove it
		  
		  if CocoaDelegateMap.HasKey(self.id) then
		    CocoaDelegateMap.Remove(self.id)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FPtr(p as Ptr) As Ptr
		  //This function is a workaround for the inability to convert a Variant containing a delegate to Ptr:
		  //dim v as Variant = AddressOf Foo
		  //dim p as Ptr = v
		  //results in a TypeMismatchException
		  //So now I do
		  //dim v as Variant = FPtr(AddressOf Foo)
		  //dim p as Ptr = v
		  
		  return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RegisterClass(className as String, superclassName as String = "NSObject") As Ptr
		  
		  // Register a new Cocoa class
		  
		  #if TargetMacOS
		    declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    declare function objc_lookUpClass lib CocoaLib (name as CString) as Ptr
		    
		    // allocate the new class
		    dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      // perhaps the class already exists.  Check for this.
		      newClassId = objc_lookUpClass(className)
		      if newClassId <> nil then
		        return newClassId // OK the class already exists, just return it
		      else
		        return nil // some other error occurred, perhaps we should raise an exception for this
		      end if
		    end if
		    
		    // get methods for this class
		    dim methodList() as Tuple = raiseEvent DelegateMethods
		    
		    // add the methods
		    dim methodsAdded as Boolean = true
		    for each item as Tuple in methodList
		      methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2))
		    next
		    
		    // if no errors adding the methods register the class
		    if methodsAdded then
		      // register the new class
		      objc_registerClassPair newClassId
		      return newClassId
		    else
		      return nil // some error occurred adding the methods. perhaps one or more methods already exists...
		    end if
		    
		  #else
		    #pragma unused className
		    #pragma unused superClassName
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DelegateClassName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DelegateMethods() As Tuple()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mClassName
			End Get
		#tag EndGetter
		ClassName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mClassName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ClassName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
