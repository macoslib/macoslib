#tag Module
Protected Module macoslib_32_64bits_savviness
	#tag Method, Flags = &h0
		Function bsIntegerValue(extends mb as MemoryBlock, offset as integer) As Integer
		  //# Get a Ptr from a MemoryBlock in a 32/64bits-savvy way at the given ''offset''.
		  
		  //@param offset
		  //    The offset of the Integer value. 0 is the first value but the second Integer is at offset 4 on a 32bits platform or 8 on a 64bits platform.
		  //@param/
		  
		  //@discussion
		  //    The ''bs'' prefix stands for ''bits-savvy''.
		  //@discussion/
		  
		  if SizeOfInteger=4 then //32 bits
		    return  mb.Int32Value( offset )
		    
		  else //64 bits
		    return  mb.Int64Value( offset )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bsIntegerValueFromCArray(extends mb as MemoryBlock, ArrayIndex as integer) As integer
		  //# Get an integer from a MemoryBlock in a 32/64bits-savvy way. The MemoryBlock is treated as a C-Array.
		  
		  //@param ArrayIndex
		  //    The index of the integer value. 0 is the first value, 1 the second...
		  //@param/
		  
		  //@discussion
		  //    The ''bs'' prefix stands for ''bits-savvy''.
		  //@discussion/
		  
		  
		  //Note: ShiftLeft is quicker than a multiplication
		  if SizeOfInteger=4 then
		    return  mb.Int32Value( Bitwise.ShiftLeft( ArrayIndex, 2 ))
		    
		  else //64 bits
		    return  mb.Int64Value( Bitwise.ShiftLeft( ArrayIndex, 3 ))
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bsPtrValue(extends mb as MemoryBlock, offset as integer) As Ptr
		  //# Get a Ptr from a MemoryBlock in a 32/64bits-savvy way at the given ''offset''.
		  
		  //@param offset
		  //    The offset of the Ptr value. 0 is the first value but the second Ptr is at offset 4 on a 32bits platform or 8 on a 64bits platform.
		  //@param/
		  
		  //@discussion
		  //    The ''bs'' prefix stands for ''bits-savvy''.
		  //@discussion/
		  
		  #if Target64Bit //On 32bits platform, a UInt64 cannot be casted to a Ptr
		    return  Ptr( mb.UInt64Value( offset ))
		  #else
		    return  Ptr( mb.UInt32Value( offset ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function bsPtrValueFromCArray(extends mb as MemoryBlock, ArrayIndex as integer) As Ptr
		  //# Get a Ptr from a MemoryBlock in a 32/64bits-savvy way. The MemoryBlock is treated as a C-Array.
		  
		  //@param ArrayIndex
		  //    The index of the Ptr value. 0 is the first value, 1 the second...
		  //@param/
		  
		  //@discussion
		  //    The ''bs'' prefix stands for ''bits-savvy''.
		  //@discussion/
		  
		  //Note: ShiftLeft is quicker than a multiplication
		  
		  #if Target64Bit //On 32bits platform, a UInt64 cannot be casted to a Ptr
		    return  Ptr( mb.UInt64Value( Bitwise.ShiftLeft( ArrayIndex, 3 )))
		  #else
		    return  Ptr( mb.UInt32Value( Bitwise.ShiftLeft( ArrayIndex, 2 )))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SizeOfDouble() As integer
		  //# Returns the size of an Double
		  
		  return  8
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SizeOfInteger() As integer
		  //# Returns the size of an Integer (the same code as SizeOfPointer)
		  
		  #if Target64Bit
		    return  8
		  #else
		    return  4
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SizeOfPointer() As integer
		  //# Returns the size of a Ptr (the same code as SizeOfInteger)
		  
		  #if Target64Bit
		    return  8
		  #else
		    return  4
		  #endif
		  
		End Function
	#tag EndMethod


End Module
#tag EndModule
