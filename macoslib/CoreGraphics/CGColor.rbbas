#tag Class
Class CGColor
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(colorSpace as CGColorSpace, components() as Double)
		  #if targetMacOS
		    soft declare function CGColorCreate lib CarbonFramework (colorspace as Ptr, component as Ptr) as Ptr
		    
		    //convert components to C array
		    
		    const sizeOfSingle = 4
		    dim m as new MemoryBlock(sizeOfSingle*(1 + UBound(components)))
		    dim offset as Integer = 0
		    for i as Integer = 0 to UBound(components)
		      m.SingleValue(offset) = components(i)
		      offset = offset + sizeOfSingle
		    next
		    
		    me.Adopt CGColorCreate(colorSpace, m), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSpace() As CGColorSpace
		  if me = nil then
		    return nil
		  end if
		  
		  #if targetMacOS
		    soft declare function CGColorGetColorSpace lib CarbonFramework (color as Ptr) as Ptr
		    
		    return new CGColorSpace(CGColorGetColorSpace(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CGColorGetTypeID lib CarbonFramework () as CFTypeID
		    
		    return CGColorGetTypeID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pattern() As CGPattern
		  #if targetMacOS
		    soft declare function CGColorGetPattern lib CarbonFramework (color as Ptr) as Ptr
		    
		    return new CGPattern(CGColorGetPattern(me), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(c as CGColor) As Boolean
		  //note that this method overloads, not overrides, CFType.Equal.
		  
		  if c is nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGColorEqualToColor lib CarbonFramework (color1 as Ptr, color2 as Ptr) as Boolean
		    
		    return CGColorEqualToColor(me, c)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Components() As Double()
		  #if targetMacOS
		    soft declare function CGColorGetComponents lib CarbonFramework (color as Ptr) as Ptr
		    
		    dim p as Ptr = CGColorGetComponents(me)
		    if p = nil then
		      dim noList() as Double
		      return noList
		    end if
		    
		    dim theList() as Double
		    const sizeOfSingle = 4
		    dim lastOffset as Integer = sizeOfSingle*me.ComponentCount - 1
		    for offset as Integer = 0 to lastOffset step sizeOfSingle
		      theList.Append p.Single(offset)
		    next
		    return theList
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as CGColor)
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGColorCreateCopy lib CarbonFramework (color as Ptr) as Ptr
		    
		    me.Adopt CGColorCreateCopy(c), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as CGColor, alpha as Double)
		  if c = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGColorCreateCopyWithAlpha lib CarbonFramework (color as Ptr, alpha as Single) as Ptr
		    
		    dim alphaSingle as Single = alpha
		    me.Adopt CGColorCreateCopyWithAlpha(me, alphaSingle), true
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0.0
			end if
			
			#if targetMacOS
			soft declare function CGColorGetAlpha lib CarbonFramework (color as Ptr) as Single
			
			return CGColorGetAlpha(me)
			#endif
			End Get
		#tag EndGetter
		Alpha As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGColorGetNumberOfComponents lib CarbonFramework (cs as Ptr) as Integer
			
			return CGColorGetNumberOfComponents(me)
			#endif
			End Get
		#tag EndGetter
		ComponentCount As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComponentCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
