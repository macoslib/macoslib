#tag Class
Class CFUUID
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return  me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return  me.StringValue
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFUUIDGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(mb as MemoryBlock)
		  #if TargetMacOS
		    soft declare function CFUUIDCreateFromUUIDBytes lib CarbonLib (alloc as Ptr, bytes as CFUUIDBytesStructure ) as Ptr
		    
		    dim bytes as CFUUIDBytesStructure
		    bytes.StringValue( mb.LittleEndian ) = mb.StringValue( 0, 16 )
		    
		    Super.Constructor   CFUUIDCreateFromUUIDBytes( nil, bytes ), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(uuid as String)
		  #if TargetMacOS
		    soft declare function CFUUIDCreateFromString lib CarbonLib (alloc as Ptr, uuidStr as CFStringRef ) as Ptr
		    
		    Super.Constructor   CFUUIDCreateFromString( nil, uuid ), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBytes() As MemoryBlock
		  #if TargetMacOS
		    soft declare function CFUUIDGetUUIDBytes lib CarbonLib (ref as Ptr) as CFUUIDBytesStructure
		    
		    dim bytes as CFUUIDBytesStructure = CFUUIDGetUUIDBytes( me.Reference )
		    dim mb as new MemoryBlock( 16 )
		    
		    mb.StringValue( 0, 16 ) = bytes.StringValue( mb.LittleEndian )
		    return   mb
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  #if TargetMacOS
		    soft declare function CFUUIDCreateString lib CarbonLib (alloc as ptr, uuid as Ptr) as CFStringRef
		    
		    return   CFUUIDCreateString( nil, me.Reference )
		  #endif
		End Function
	#tag EndMethod


	#tag Structure, Name = CFUUIDBytesStructure, Flags = &h0
		byte0 as Int8
		  byte1 as Int8
		  byte2 as Int8
		  byte3 as Int8
		  byte4 as Int8
		  byte5 as Int8
		  byte6 as Int8
		  byte7 as Int8
		  byte8 as Int8
		  byte9 as Int8
		  byte10 as Int8
		  byte11 as Int8
		  byte12 as Int8
		  byte13 as Int8
		  byte14 as Int8
		byte15 as Int8
	#tag EndStructure


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
