#tag Class
Class NSString
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(s as String)
		  if s.Encoding = nil then
		    dim e as new UnsupportedFormatException
		    e.Message = "Unable to convert string with nil encoding."
		    raise e
		  end if
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" ( cls as Ptr, value as CFStringRef ) as Ptr
		    
		    //note that this stringWithString expects the caller to take ownership of the returned NSString.
		    Super.Constructor(stringWithString( Cocoa.NSClassFromString("NSString" ), s))
		    
		  #else
		    #pragma unused s
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCanonicalMapping() As NSString
		  #if TargetMacOS
		    declare function decomposedStringWithCanonicalMapping lib CocoaLib selector "decomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return new NSString(decomposedStringWithCanonicalMapping(self))
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCompatibilityMapping() As NSString
		  
		  #if TargetMacOS
		    declare function decomposedStringWithCompatibilityMapping lib CocoaLib selector "decomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return new NSString(decomposedStringWithCompatibilityMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return self.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(s as String)
		  self.Constructor(s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as Ptr
		    
		    return new NSString(pathExtension(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCanonicalMapping() As NSString
		  #if TargetMacOS
		    declare function precomposedStringWithCanonicalMapping lib CocoaLib selector "precomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return new NSString(precomposedStringWithCanonicalMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCompatibilityMapping() As NSString
		  #if TargetMacOS
		    declare function precomposedStringWithCompatibilityMapping lib CocoaLib selector "precomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return new NSString(precomposedStringWithCompatibilityMapping(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return self.StringValue
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
			    
			    return length(self)
			  #endif
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    //I'd prefer not to use CFStringRef, but to use any of the NSString methods that
			    //require a buffer means that we copy data twice.  UTF8String or other CString
			    //methods aren't suitable because they don't handle text containing null characters.
			    
			    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
			    dim x as CFStringRef = CFRetain(self.id)
			    return x
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
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
			Name="Length"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
