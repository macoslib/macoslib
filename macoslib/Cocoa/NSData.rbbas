#tag Class
Class NSData
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Constructor(theData as MemoryBlock)
		  // This one also takes Strings. No need for an extra constructor taking Strings therefore
		  
		  #if targetMacOS
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (cls as Ptr, bytes as Ptr, length as Integer) as Ptr
		    
		    if not (theData is nil) then
		      if theData.Size < 0 then
		        // this comes from a Ptr - you need to use the CFType constructor with the additional Boolean parm!
		        raise new TypeMismatchException
		      end if
		      
		      super.Constructor  dataWithBytes( Cocoa.NSClassFromString( "NSData" ), theData, theData.Size), false
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(dataAsString as String)
		  // Redundent, but clearer with autocomplete
		  
		  #if targetMacOS
		    dim mb as MemoryBlock = dataAsString
		    self.Constructor  mb
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  me.Data
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    #if Target32Bit
			      declare sub getBytes lib CocoaLib selector "getBytes:length:" ( id as Ptr, buffer as Ptr, length as UInt32 )
			    #else
			      declare sub getBytes lib CocoaLib selector "getBytes:length:" ( id as Ptr, buffer as Ptr, length as UInt64 )
			    #endif
			    
			    dim dataLength as Integer = me.Length
			    if dataLength > 0 then
			      dim m as new MemoryBlock( dataLength )
			      getBytes   me.id, m, dataLength
			      return m
			    end if
			  #endif
			  
			  return new MemoryBlock(0)
			End Get
		#tag EndGetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function m_length lib CocoaLib selector "length" (id as Ptr) as Integer
			    
			    return  m_length( me.id )
			  #endif
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
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
