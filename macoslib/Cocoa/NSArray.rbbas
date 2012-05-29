#tag Class
Class NSArray
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(cfa as CFArray)
		  //Make a copy of the original CFArray
		  
		  Super.Constructor( cfa.Clone.Reference, true )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As CFArray
		  
		  return  new CFArray( me.id, false )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(index as Integer) As Ptr
		  #if TargetMacOS
		    'declare function CFArrayGetCount lib CarbonLib (theArray as Ptr) as Integer
		    declare function objectAtIndex lib CocoaLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as Ptr
		    
		    if self <> nil then
		      if index < 0 or index >= me.Count then
		        raise new OutOfBoundsException
		      end if
		      
		      dim p as Ptr = objectAtIndex(me.id, index)
		      
		      return   p
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  dim up as Integer = me.Count - 1
		  
		  dim result() as Variant
		  dim v as objHasVariantValue
		  
		  for i as Integer = 0 to up
		    v = objHasVariantValue( Cocoa.RBObjectFromNSPtr( value( i )))
		    result.Append   v.VariantValue
		  next
		  
		  return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if Target32Bit
			    declare function _count lib CocoaLib selector "count" ( obj as Ptr ) as UInt32
			  #else
			    declare function _count lib CocoaLib selector "count" ( obj as Ptr ) as UInt64
			  #endif
			  
			  dim cnt as integer = _count( me.id )
			  
			  return  cnt
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="CFType"
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
