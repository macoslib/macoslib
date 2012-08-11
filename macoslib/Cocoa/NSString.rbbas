#tag Class
Class NSString
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(cf as CFStringRef)
		  #if TargetMacOS
		    soft declare function CFRetain lib CarbonLib (cf as CFStringRef) as Ptr
		    me._id = CFRetain( cf )
		    
		  #else
		    #pragma unused cf
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(immutableString as string)
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" ( cls as Ptr, value as CFStringRef ) as Ptr
		    
		    Super.Constructor( stringWithString( Cocoa.NSClassFromString( "NSMutableString" ), immutableString ), false )
		    
		  #else
		    #pragma unused immutableString
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCanonicalMapping() As NSString
		  
		  #if TargetMacOS
		    declare function decomposedStringWithCanonicalMapping lib CocoaLib selector "decomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return  new NSString( decomposedStringWithCanonicalMapping( self.id ), true )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decomposedStringWithCompatibilityMapping() As NSString
		  
		  #if TargetMacOS
		    declare function decomposedStringWithCompatibilityMapping lib CocoaLib selector "decomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return  new NSString( decomposedStringWithCompatibilityMapping( self.id ), true )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function InitFromString(ImmutableString as String) As NSString
		  
		  #if TargetMacOS
		    declare function stringWithString lib CocoaLib selector "stringWithString:" (class_id as Ptr, theString as CFStringRef) as Ptr
		    
		    dim p as Ptr = stringWithString( Cocoa.NSClassFromString("NSString"), ImmutableString )
		    dim result as NSString
		    
		    if p<>nil then
		      result = new NSString( p, false )
		    end if
		    
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		  return   me.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as Ptr
		    
		    return  new NSString( pathExtension( self.id ) )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCanonicalMapping() As NSString
		  
		  #if TargetMacOS
		    declare function precomposedStringWithCanonicalMapping lib CocoaLib selector "precomposedStringWithCanonicalMapping" (id as Ptr) as Ptr
		    
		    return  new NSString( precomposedStringWithCanonicalMapping( self.id ), true )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function precomposedStringWithCompatibilityMapping() As NSString
		  
		  #if TargetMacOS
		    declare function precomposedStringWithCompatibilityMapping lib CocoaLib selector "precomposedStringWithCompatibilityMapping" (id as Ptr) as Ptr
		    
		    return  new NSString( precomposedStringWithCompatibilityMapping( self.id ), true )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  
		  #if TargetMacOS
		    dim CFS as CoreFoundation.CFString = new CFString( self.id, false )
		    return   CFS.StringValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  me.StringValue
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
