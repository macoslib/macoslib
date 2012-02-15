#tag Class
Class CFStringTokenizer
Inherits CFType
	#tag Event
		Function ClassID() As UInt32
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AdvanceToNextToken()
		  #if targetMacOS
		    // Only available in 10.5 and later!
		    soft declare sub CFStringTokenizerAdvanceToNextToken lib CarbonLib (handle as Ptr)
		    
		    CFStringTokenizerAdvanceToNextToken (self.Reference)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFStringTokenizerGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(input as CFStringRef, options as UInt32, locale as CFLocale)
		  // Recommeded defaults:
		  //   options: pass one of the kCFStringTokenizerUnit... constants
		  //   locale: pass CoreFoundation.CFLocale.UserLocale()
		  
		  #if targetMacOS
		    // Only available in 10.5 and later!
		    soft declare function CFStringTokenizerCreate lib CarbonLib (alloc as Ptr, input as CFStringRef, range as CFRange, options as UInt32, locale as Ptr) as Ptr
		    
		    inputLength = input.Len
		    
		    dim lr as Ptr
		    if locale <> nil then
		      lr = locale.Reference
		    end
		    dim p as Ptr = CFStringTokenizerCreate (nil, input, CFRangeMake(0, inputLength), options, lr)
		    
		    self.Constructor(p, hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCurrentTokenRange(ByRef startOut as Integer, ByRef lengthOut as Integer) As Boolean
		  #if targetMacOS
		    // Only available in 10.5 and later!
		    soft declare function CFStringTokenizerGetCurrentTokenRange lib CarbonLib (handle as Ptr) as UInt64 // do not use CFRange instead of UInt64 here, or it'll fail on PowerPC!
		    
		    dim res as UInt64 = CFStringTokenizerGetCurrentTokenRange (self.Reference)
		    
		    dim start as Int32 = Bitwise.BitAnd (res, &hFFFFFFFF)
		    dim length as Int32 = Bitwise.ShiftRight(res, 32)
		    
		    if start >= 0 then
		      startOut = start + 1
		    else
		      // no more tokens
		      startOut = inputLength + 1
		    end
		    lengthOut = length
		    
		    return start >= 0
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetString(input as String)
		  #if targetMacOS
		    // Only available in 10.5 and later!
		    soft declare sub CFStringTokenizerSetString lib CarbonLib (handle as Ptr, input as CFStringRef, range as CFRange)
		    
		    inputLength = input.Len
		    CFStringTokenizerSetString (self.Reference, input, CFRangeMake(0, inputLength))
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		Originally written 15 Fev 2012 by Thomas Tempelmann
		
		This class can not be used on OS X 10.4 (Tiger), i.e. requires 10.5 or later
	#tag EndNote


	#tag Property, Flags = &h21
		Private inputLength As Integer
	#tag EndProperty


	#tag Constant, Name = kCFStringTokenizerAttributeLanguage, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerAttributeLatinTranscription, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerUnitLineBreak, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerUnitParagraph, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerUnitSentence, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerUnitWord, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFStringTokenizerUnitWordBoundary, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
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
			Name="StringValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
