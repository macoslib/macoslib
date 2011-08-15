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
