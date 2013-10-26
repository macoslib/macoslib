#tag Class
Protected Class NSRegExOptions
	#tag Method, Flags = &h1
		Protected Function Operator_Convert() As UInt32
		  dim r as UInt32
		  
		  if not CaseSensitive then r = r or NSRegularExpression.NSRegularExpressionCaseInsensitive
		  if DotMatchNewlines then r = r or NSRegularExpression.NSRegularExpressionDotMatchesLineSeparators
		  if IgnoreWhitespace then r = r or NSRegularExpression.NSRegularExpressionAllowCommentsAndWhitespace
		  if TreatPatternAsLiteral then r = r or NSRegularExpression.NSRegularExpressionIgnoreMetacharacters
		  if not TreatTargetAsOneLine then r = r or NSRegularExpression.NSRegularExpressionAnchorsMatchLines
		  if UnixLineSeparatorsOnly then r = r or NSRegularExpression.NSRegularExpressionUseUnixLineSeparators
		  if UnicodeWordBoundaries then r = r or NSRegularExpression.NSRegularExpressionUseUnicodeWordBoundaries
		  
		  return r
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CaseSensitive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		DotMatchNewlines As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreWhitespace As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TreatPatternAsLiteral As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TreatTargetAsOneLine As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UnicodeWordBoundaries As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UnixLineSeparatorsOnly As Boolean
	#tag EndProperty


End Class
#tag EndClass
