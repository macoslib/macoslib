#tag Class
Class CTFrame
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return CTFrame.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CTFrameGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(context as CGContext)
		  #if TargetMacOS
		    declare sub CTFrameDraw lib CarbonLib (f as Ptr, ctx as Ptr)
		    
		    CTFrameDraw (self, context)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLinesWithOrigins(range as CFRange, ByRef origins() as CGPoint) As CFArray
		  #if TargetMacOS
		    declare sub GetLineOrigins lib CarbonLib (f as Ptr, range as CFRange, origins as Ptr)
		    
		    // In order to call GetLineOrigins, we need to know the number of lines
		    // in order to size the origins array properly.
		    dim lines as CFArray = Lines()
		    dim lineCount as Integer = lines.Count
		    dim mb as new MemoryBlock (lineCount * CGPoint.Size)
		    dim entireRange as CFRange ' -> zero means all lines
		    GetLineOrigins (self, entireRange, mb)
		    dim tmpOrigins() as CGPoint
		    redim tmpOrigins(lineCount-1)
		    for i as Integer = 0 to lineCount-1
		      tmpOrigins(i).x = mb.SingleValue (i * CGPoint.Size)
		      tmpOrigins(i).y = mb.SingleValue (i * CGPoint.Size + 4)
		    next
		    
		    return lines
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lines() As CFArray
		  #if TargetMacOS
		    declare function CTFrameGetLines lib CarbonLib (f as Ptr) as Ptr
		    
		    return new CFArray (CTFrameGetLines (self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path() As CGPath
		  #if TargetMacOS
		    declare function CTFrameGetPath lib CarbonLib (f as Ptr) as Ptr
		    
		    return new CGPath (CTFrameGetPath (self), not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringRange() As CFRange
		  #if TargetMacOS
		    declare function CTFrameGetStringRange lib CarbonLib (f as Ptr) as CFRange
		    
		    return CTFrameGetStringRange (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleStringRange() As CFRange
		  #if TargetMacOS
		    declare function CTFrameGetVisibleStringRange lib CarbonLib (f as Ptr) as CFRange
		    
		    return CTFrameGetVisibleStringRange (self)
		  #endif
		End Function
	#tag EndMethod


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
