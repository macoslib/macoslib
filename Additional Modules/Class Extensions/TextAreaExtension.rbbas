#tag Module
Protected Module TextAreaExtension
	#tag Method, Flags = &h0
		Function Bold(extends t as TextArea, offset as Integer, length as Integer) As Boolean
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    
		    dim attributedText as Ptr = textStorage(t.TextViewRef)
		    dim selectionRange as Cocoa.NSRange
		    selectionRange.location = offset
		    selectionRange.length = Max(Min(length, length(attributedText) - offset), 0)
		    dim aRange as Cocoa.NSRange
		    if selectionRange.length > 0 then
		      return selectionHasTrait(attributedText, NSBoldFontMask, selectionRange)
		    else
		      return insertionHasTrait(t.TextViewRef, NSBoldFontMask)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bold(extends t as TextArea, offset as Integer, length as Integer, assigns value as Boolean)
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub applyFontTraits lib "Cocoa.framework" selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    
		    
		    dim text as Ptr = textStorage(t.TextViewRef)
		    dim traitMask as Integer
		    if value then
		      traitMask = NSBoldFontMask
		    else
		      traitMask = NSUnboldFontMask
		    end if
		    
		    dim range as Cocoa.NSRange
		    range.location = offset
		    range.length = Max(Min(length, length(text) - offset), 0)
		    if range.length > 0 then
		      applyFontTraits(text, traitMask, range)
		    else
		      setInsertionTrait(t.TextViewRef, traitMask)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function insertionHasTrait(textView as Ptr, traitMask as Integer) As Boolean
		  #if targetMacOS
		    declare function typingAttributes lib CocoaLib selector "typingAttributes" (obj_id as Ptr) as Ptr
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, key as Ptr) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, font as Ptr) as Integer
		    
		    dim textAttributes as Ptr = typingAttributes(textView)
		    dim font as Ptr = objectForKey(textAttributes, NSFontAttributeName)
		    return (traitsOfFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font) and traitMask) = traitMask
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Italic(extends t as TextArea, offset as Integer, length as Integer) As Boolean
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    
		    dim attributedText as Ptr = textStorage(t.TextViewRef)
		    dim selectionRange as Cocoa.NSRange
		    selectionRange.location = offset
		    selectionRange.length = Max(Min(length, length(attributedText) - offset), 0)
		    dim aRange as Cocoa.NSRange
		    if selectionRange.length > 0 then
		      return selectionHasTrait(attributedText, NSItalicFontMask, selectionRange)
		    else
		      return insertionHasTrait(t.TextViewRef, NSItalicFontMask)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Italic(extends t as TextArea, offset as Integer, length as Integer, assigns value as Boolean)
		  #if targetMacOS
		    declare function textStorage lib CocoaLib selector "textStorage" (obj_id as Ptr) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub applyFontTraits lib "Cocoa.framework" selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    
		    
		    dim text as Ptr = textStorage(t.TextViewRef)
		    dim traitMask as Integer
		    if value then
		      traitMask = NSItalicFontMask
		    else
		      traitMask = NSUnitalicFontMask
		    end if
		    
		    dim range as Cocoa.NSRange
		    range.location = offset
		    range.length = Max(Min(length, length(text) - offset), 0)
		    if range.length > 0 then
		      applyFontTraits(text, traitMask, range)
		    else
		      setInsertionTrait(t.TextViewRef, traitMask)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSFontAttributeName() As Ptr
		  //NSFontAttributeName returns an NSString id. 
		  
		  dim mainBundle as CFBundle = CFBundle.NewCFBundleFromID("com.apple.Cocoa")
		  dim p as Ptr = mainBundle.DataPointerNotRetained("NSFontAttributeName")
		  if p <> nil then
		    return p.Ptr(0)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RichText(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRichText lib CocoaLib selector "isRichText" (obj_id as Ptr) as Boolean
		    
		    return isRichText(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RichText(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRichText lib CocoaLib selector "setRichText:" (obj_id as Ptr, value as Boolean)
		    
		    setRichText t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RTFValue(extends t as TextArea) As String
		  #if targetCocoa
		    declare function RTFFromRange lib CocoaLib selector "RTFFromRange:" (obj_id as Ptr, range as Cocoa.NSRange) as Ptr
		    declare function length lib CocoaLib selector "length" (obj_id as Ptr) as Integer
		    declare sub getBytes lib CocoaLib selector "getBytes:length:" (obj_id as Ptr, buffer as Ptr, length as Integer)
		    
		    dim range as Cocoa.NSRange
		    range.length = Len(t.Text)
		    dim p as Ptr = RTFFromRange(t.TextViewRef, range)
		    if p <> nil then
		      dim m as new MemoryBlock(length(p))
		      getBytes(p, m, m.Size)
		      return m.StringValue(0, m.Size)
		    else
		      return ""
		    end if
		    
		  #else
		    #pragma unused t
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RTFValue(extends t as TextArea, assigns value as String)
		  #if targetCocoa
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (class_id as Ptr, bytes as CString, length as Integer) as Ptr
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withRTF:" (obj_id as Ptr, range as Cocoa.NSRange, rtfData as Ptr)
		    
		    //factory methods like dataWithBytes return a autoreleased object, so it should not be released.
		    dim data as Ptr = dataWithBytes(Cocoa.NSClassFromString("NSData"), value, LenB(value))
		    dim range as Cocoa.NSRange
		    range.length = Len(t.Text)
		    replaceCharactersInRange(t.TextViewRef, range, data)
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function selectionHasTrait(attributedText as Ptr,  traitMask as Integer, selectionRange as Cocoa.NSRange) As Boolean
		  //note that selectionRange.length is assumed to be > 0.
		  
		  #if targetMacOS
		    declare function attributeAtIndex lib CocoaLib selector "attribute:atIndex:longestEffectiveRange:inRange:" (obj_id as Ptr, attributeName as Ptr, index as Integer, ByRef aRange as Cocoa.NSRange, rangeLimit as Cocoa.NSRange) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function traitsOfFont lib CocoaLib selector "traitsOfFont:" (obj_id as Ptr, font as Ptr) as Integer
		    
		    dim aRange as Cocoa.NSRange
		    dim font as Ptr = attributeAtIndex(attributedText, NSFontAttributeName, selectionRange.location, aRange, selectionRange)
		    if font <> nil then
		      dim hasTrait as Boolean = (traitsOfFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font) and traitMask) = traitMask
		      return hasTrait and (aRange.location = selectionRange.location) and (aRange.length = selectionRange.Length)
		    else
		      return false
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setInsertionTrait(textView as Ptr, traitMask as Integer)
		  #if targetMacOS
		    declare sub setTypingAttributes lib CocoaLib selector "setTypingAttributes:" (obj_id as Ptr, attrs as Ptr)
		    declare function typingAttributes lib CocoaLib selector "typingAttributes" (obj_id as Ptr) as Ptr
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (obj_id as Ptr, key as Ptr) as Ptr
		    declare sub setObjectForKey lib Cocoalib selector "setObject:forKey:" (id as Ptr, value as Ptr, key as Ptr)
		    declare function convertFont lib CocoaLib selector "convertFont:toHaveTrait:" (id as Ptr, fontid as Ptr, mask as Integer) as Ptr
		    declare function sharedFontManager lib CocoaLib selector "sharedFontManager" (class_id as Ptr) as Ptr
		    declare function mutableCopy lib CocoaLib selector "mutableCopy" (obj_id as Ptr) as Ptr
		    
		    
		    dim textAttributes as Ptr  = typingAttributes(textView)
		    dim font as Ptr = objectForKey(textAttributes, NSFontAttributeName)
		    dim newFont as Ptr = convertFont(sharedFontManager(Cocoa.NSClassFromString("NSFontManager")), font, traitMask)
		    dim newTextAttributes as Ptr = mutableCopy(textAttributes)
		    setObjectForKey(newTextAttributes, newFont, NSFontAttributeName)
		    setTypingAttributes(textView, newTextAttributes)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setSelectionTrait(attributedText as Ptr, traitMask as Integer, range as Cocoa.NSRange)
		  #if targetMacOS
		    declare sub applyFontTraits lib CocoaLib selector "applyFontTraits:range:" (obj_id as Ptr, mask as int32, aRange as Cocoa.NSRange)
		    declare sub beginEditing lib CocoaLib selector "beginEditing" (obj_id as Ptr)
		    declare sub endEditing lib CocoaLib selector "endEditing" (obj_id as Ptr)
		    
		    beginEditing(attributedText)
		    applyFontTraits(attributedText, traitMask, range)
		    endEditing(attributedText)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    return isRulerVisible(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRulerVisible lib CocoaLib selector "setRulerVisible:"  (obj_id as Ptr, value as Boolean)
		    
		    setRulerVisible t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextViewRef(extends t as TextArea) As Ptr
		  #if targetCocoa
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    return documentView(t.Handle)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFindPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFindPanel lib CocoaLib selector "usesFindPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFindPanel(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFindPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFindPanel lib CocoaLib selector "setUsesFindPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFindPanel t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFontPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFontPanel lib CocoaLib selector "usesFontPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFontPanel(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFontPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFontPanel lib CocoaLib selector "setUsesFontPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFontPanel t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesRuler lib CocoaLib selector "usesRuler" (obj_id as Ptr) as Boolean
		    
		    return usesRuler(t.TextViewRef)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesRuler lib CocoaLib selector "setUsesRuler:"  (obj_id as Ptr, value as Boolean)
		    
		    setUsesRuler t.TextViewRef, value
		    
		  #else
		    #pragma unused t
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag Constant, Name = NSBoldFontMask, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSItalicFontMask, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSUnboldFontMask, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSUnitalicFontMask, Type = Double, Dynamic = False, Default = \"&h01000000", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
End Module
#tag EndModule
