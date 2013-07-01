#tag Class
Class NSArray
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(cfa as CFArray)
		  // Adopts a CFArray
		  // Note: This shall m_not_ create a copy of the passed CFArray. For that, there's the Copy function.
		  Super.Constructor( cfa, false )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(strings() as String)
		  // Convenience method to create an NSArray from strings
		  me.Constructor (new CFArray(Strings))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSArray
		  #if TargetMacOS
		    declare function m_copy lib CocoaLib selector "copy" (id as Ptr) as Ptr
		    
		    return   new NSArray( m_copy( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromArrayOfStrings(Strings() as String) As NSArray
		  #if TargetMacOS
		    dim cfa as new CFArray( Strings )
		    dim nsa as new NSArray( cfa )
		    
		    return  nsa
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromNSArray(theArray as NSArray, indexSet as NSIndexSet) As NSArray
		  #if TargetMacOS
		    declare function objectsAtIndexes lib CocoaLib selector "objectsAtIndexes:" (id as Ptr, indexes as Ptr) as Ptr
		    
		    dim p as Ptr = objectsAtIndexes( theArray.id, indexSet.id )
		    
		    if p=nil then
		      return  nil
		    else
		      return  new NSArray( p, false )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromObjectsArray(theArray as variant) As NSArray
		  dim nsma as new NSMutableArray
		  
		  select case theArray.ArrayElementType
		  case Variant.TypeBoolean
		    dim arb() as Boolean = theArray
		    for each b as Boolean in arb
		      nsma.Append   new NSNumber( b )
		    next
		    
		  case Variant.TypeInteger
		    dim ari() as Integer = theArray
		    for each i as integer in ari
		      nsma.Append   new NSNumber( i )
		    next
		    
		  case Variant.TypeString
		    dim ars() as string = theArray
		    for each item as String in ars
		      dim s as NSString = item
		      nsma.Append s
		    next
		    
		  case Variant.TypeDouble, Variant.TypeSingle
		    dim ard() as double = theArray
		    for each d as double in ard
		      nsma.Append   new NSNumber( d )
		    next
		    
		  case Variant.TypeDate
		    dim ardate() as Date = theArray
		    for each dd as date in ardate
		      nsma.Append   new NSDate( dd )
		    next
		    
		  case 9
		    dim arv() as variant = theArray
		    for each v as variant in arv
		      'nsma.Append   NSArray.CreateFromObjectsArray( v )
		      nsma.Append   Cocoa.NSObjectFromVariant( v ) // Modified by Kem Tekinay. The line above is just wrong.
		    next
		  end select
		  
		  return  nsma.Copy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSValue(index as Integer) As variant
		  //# Same as Value but returns the corresponding NSObject (if declared in Cocoa.NSObjectFromNSPtr)
		  
		  #if TargetMacOS
		    'declare function CFArrayGetCount lib CarbonLib (theArray as Ptr) as Integer
		    
		    // Introduced in MacOS X 10.0.
		    declare function objectAtIndex lib CocoaLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as Ptr
		    
		    if self <> nil then
		      if index < 0 or index >= me.Count then
		        raise new OutOfBoundsException
		      end if
		      
		      dim p as Ptr = objectAtIndex(me.id, index)
		      
		      return   Cocoa.NSObjectFromNSPtr( p )
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As CFArray
		  
		  return   new CFArray( me.id, false )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValues() As string()
		  #if TargetMacOS
		    dim result() as string
		    for i as integer = 0 to me.Count - 1
		      dim p as Ptr = me.Value( i )
		      if Cocoa.InheritsFromClass(p, "NSString") then
		        dim nss as new NSString(p)
		        result.Append nss.StringValue
		      else
		        raise new TypeMismatchException
		      end if
		    next
		    
		    return result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(index as Integer) As Ptr
		  #if TargetMacOS
		    'declare function CFArrayGetCount lib CarbonLib (theArray as Ptr) as Integer
		    
		    // Introduced in MacOS X 10.0.
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
		    v = objHasVariantValue( Cocoa.NSObjectFromNSPtr( value( i )))
		    result.Append   v.VariantValue
		  next
		  
		  return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if Target32Bit
			    declare function m_count lib CocoaLib selector "count" ( obj as Ptr ) as UInt32
			  #else
			    declare function m_count lib CocoaLib selector "count" ( obj as Ptr ) as UInt64
			  #endif
			  
			  dim cnt as integer = m_count( me.id )
			  
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
