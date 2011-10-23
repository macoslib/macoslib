#tag Module
Protected Module TextAreaExtension
	#tag Method, Flags = &h0
		Function RichText(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRichText lib CocoaLib selector "isRichText" (obj_id as Ptr) as Boolean
		    
		    return isRichText(t.TextViewRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RichText(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRichText lib CocoaLib selector "setRichText:" (obj_id as Ptr, value as Boolean)
		    
		    setRichText t.TextViewRef, value
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
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RTFValue(extends t as TextArea, assigns value as String)
		  #if targetCocoa
		    declare function dataWithBytes lib CocoaLib selector "dataWithBytes:length:" (class_id as Ptr, bytes as CString, length as Integer) as Ptr
		    declare sub replaceCharactersInRange lib CocoaLib selector "replaceCharactersInRange:withRTF:" (obj_id as Ptr, range as Cocoa.NSRange, rtfData as Ptr)
		    declare sub release lib CocoaLib selector "release" (obj_id as Ptr)
		    
		    dim data as Ptr = dataWithBytes(Cocoa.NSClassFromString("NSData"), value, LenB(value))
		    dim range as Cocoa.NSRange
		    range.length = Len(t.Text)
		    replaceCharactersInRange(t.TextViewRef, range, data)
		    release(data)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function isRulerVisible lib CocoaLib selector "isRulerVisible" (obj_id as Ptr) as Boolean
		    
		    return isRulerVisible(t.TextViewRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setRulerVisible lib CocoaLib selector "setRulerVisible:"  (obj_id as Ptr, value as Boolean)
		    
		    setRulerVisible t.TextViewRef, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextViewRef(extends t as TextArea) As Ptr
		  #if targetCocoa
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    return documentView(t.Handle)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFindPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFindPanel lib CocoaLib selector "usesFindPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFindPanel(t.TextViewRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFindPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFindPanel lib CocoaLib selector "setUsesFindPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFindPanel t.TextViewRef, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseFontPanel(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesFontPanel lib CocoaLib selector "usesFontPanel" (obj_id as Ptr) as Boolean
		    
		    return usesFontPanel(t.TextViewRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseFontPanel(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesFontPanel lib CocoaLib selector "setUsesFontPanel:" (obj_id as Ptr, value as Boolean)
		    
		    setUsesFontPanel t.TextViewRef, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UseRuler(extends t as TextArea) As Boolean
		  #if targetCocoa
		    declare function usesRuler lib CocoaLib selector "usesRuler" (obj_id as Ptr) as Boolean
		    
		    return usesRuler(t.TextViewRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UseRuler(extends t as TextArea, assigns value as Boolean)
		  #if targetCocoa
		    declare sub setUsesRuler lib CocoaLib selector "setUsesRuler:"  (obj_id as Ptr, value as Boolean)
		    
		    setUsesRuler t.TextViewRef, value
		  #endif
		End Sub
	#tag EndMethod


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
