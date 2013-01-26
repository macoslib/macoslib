#tag Class
Class ABMultiValue
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllValues() As NSDictionary
		  //# Returns all the Label:Value in a Dictionary
		  
		  //@ Note that it is possible that a Label actually corresponds to several values, in which case, the value in the Dictionary will be an array
		  
		  dim dict as new NSMutableDictionary
		  dim label as string
		  dim NSlabel as NSString
		  dim value as variant
		  dim v as variant
		  dim nsma as NSMutableArray
		  
		  for i as integer=0 to me.Count - 1
		    NSlabel = me.LabelAtIndex( i )
		    label = me.LabelAtIndex( i )
		    value = me.ValueAtIndex( i )
		    
		    if dict.HasKey( NSlabel ) then //Multiple values for the same label
		      v = dict.Value( NSlabel )
		      if v isa NSMutableArray then //Already an array
		        NSMutableArray( v ).Append  value
		      else //Not an array. Create one
		        nsma = new NSMutableArray
		        nsma.Append   dict.Value( NSlabel )
		        nsma.Append    v
		        dict.Value( NSlabel ) = nsma
		      end if
		    else
		      dict.Value( NSlabel ) = value
		    end if
		  next
		  
		  return   dict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  #if TargetMacOS
		    declare function count lib "AddressBook.framework" selector "count" ( id as Ptr ) as integer
		    
		    return   count( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LabelAtIndex(index as integer) As NSString
		  #if TargetMacOS
		    declare function labelAtIndex lib "AddressBook.framework" selector "labelAtIndex:" (id as Ptr, idx as integer) as Ptr
		    
		    return new NSString(labelAtIndex( self, index))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrimaryIdentifier() As String
		  #if TargetMacOS
		    declare function primaryIdentifier lib "AddressBook.framework" selector "primaryIdentifier" (id as Ptr) as CFStringRef
		    
		    return   primaryIdentifier( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueAtIndex(index as integer) As variant
		  #if TargetMacOS
		    declare function valueAtIndex lib "AddressBook.framework" selector "valueAtIndex:" (id as Ptr, idx as integer) as Ptr
		    
		    dim p as Ptr = valueAtIndex( me.id, index )
		    return  Cocoa.NSObjectFromNSPtr( p, false, true )
		    
		  #endif
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
