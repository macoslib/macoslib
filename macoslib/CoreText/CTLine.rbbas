#tag Class
Class CTLine
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return CTLine.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CTLineGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(attributedText as CFAttributedString)
		  #if TargetMacOS
		    declare function CTLineCreateWithAttributedString lib CarbonLib (attrStr as Ptr) as Ptr
		    
		    super.Constructor (CTLineCreateWithAttributedString (attributedText), CFType.hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(txt as String)
		  #if TargetMacOS
		    dim cfa as new CFAttributedString (txt)
		    self.Constructor (cfa)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(context as CGContext)
		  #if TargetMacOS
		    declare sub CTLineDraw lib CarbonLib (f as Ptr, ctx as Ptr)
		    
		    CTLineDraw (self, context)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetOffsetForStringIndex(charIndex as Integer, ByRef secondaryOffset as Single) As Single
		  #if TargetMacOS
		    declare function CTLineGetOffsetForStringIndex lib CarbonLib (r as Ptr, charIndex as Integer, ByRef secondaryOffset as Single) as Single
		    
		    return CTLineGetOffsetForStringIndex (self, charIndex, secondaryOffset)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function GetTypographicBounds(ByRef ascent as Single, ByRef descent as Single, ByRef leading as Single) As Double
		  #if TargetMacOS
		    declare function CTLineGetTypographicBounds lib CarbonLib (r as Ptr, ByRef ascent as Single, ByRef descent as Single, ByRef leading as Single) as Double
		    
		    return CTLineGetTypographicBounds (self, ascent, descent, leading)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ImageBounds(context as CGContext) As CGRect
		  #if TargetMacOS
		    declare function CTLineGetImageBounds lib CarbonLib (r as Ptr, ctx as Ptr) as CGRect
		    
		    return CTLineGetImageBounds (self, context)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JustifiedLine(justificationFactor as Single, justificationWidth as Double) As CTLine
		  #if TargetMacOS
		    declare function CTLineCreateJustifiedLine lib CarbonLib (r as Ptr, justificationFactor as Single, justificationWidth as Double) as Ptr
		    return new CTLine (CTLineCreateJustifiedLine (self, justificationFactor, justificationWidth), hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function PenOffsetForFlush(flushFactor as Single, flushWidth as Double) As Double
		  #if TargetMacOS
		    declare function CTLineGetPenOffsetForFlush lib CarbonLib (r as Ptr, flushFactor as Single, flushWidth as Double) as Double
		    
		    return CTLineGetPenOffsetForFlush (self, flushFactor, flushWidth)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringIndexForPosition(position as CGPoint) As Integer
		  #if TargetMacOS
		    declare function CTLineGetStringIndexForPosition lib CarbonLib (r as Ptr, position as CGPoint) as Integer
		    
		    return CTLineGetStringIndexForPosition (self, position)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringRange() As CFRange
		  #if TargetMacOS
		    declare function CTLineGetStringRange lib CarbonLib (r as Ptr) as CFRange
		    
		    return CTLineGetStringRange (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function TrailingWhitespaceWidth() As Double
		  #if TargetMacOS
		    declare function CTLineGetTrailingWhitespaceWidth lib CarbonLib (r as Ptr) as Double
		    
		    return CTLineGetTrailingWhitespaceWidth (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TruncatedLine(width as Double, truncationType as Integer, truncationToken as CTLine) As CTLine
		  #if TargetMacOS
		    declare function CTLineCreateTruncatedLine lib CarbonLib (r as Ptr, width as Double, truncationType as Integer, truncationToken as Ptr) as Ptr
		    dim tok as Ptr
		    if truncationToken <> nil then tok = truncationToken
		    return new CTLine (CTLineCreateTruncatedLine (self, width, truncationType, tok), hasOwnership)
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
