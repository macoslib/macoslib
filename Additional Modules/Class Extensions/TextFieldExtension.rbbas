#tag Module
Protected Module TextFieldExtension
	#tag Method, Flags = &h0
		Function AttributedStringValue(extends TF as TextField) As AttributedString
		  
		  #if TargetMacOS
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue:" (id as Ptr) as Ptr
		    'DReport   Cocoa.ClassNameTreeForObjectPointer( Ptr( TF.Handle ))
		    
		    dim ctrl as Ptr = TF.TextViewRef //Ptr( TF.Handle )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    
		    if p<>nil then
		      return   new AttributedString( new NSAttributedString( p ))
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLineBreak(extends TF as TextField, assigns mode as integer)
		  
		  #if TargetMacOS
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
		    declare sub setAttributes lib CocoaLib selector "setAttributes:range:" (id as Ptr, attrs as Ptr, range as Cocoa.NSRange)
		    
		    dim ctrl as Ptr = Ptr( TF.Handle )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    dim s() as string = Cocoa.ClassNameTreeForObjectPointer( p )
		    #pragma unused s
		    
		    dim nsas as NSMutableAttributedString
		    
		    if p<>nil then
		      dim currentNSP as NSParagraphStyle
		      dim range as Cocoa.NSRange
		      dim newNSP as NSMutableParagraphStyle
		      
		      nsas = new NSMutableAttributedString( p )
		      currentNSP = new NSParagraphStyle( nsas.AttributeAtIndex( nsas.kNSParagraphStyleAttributeName, 0, range ))
		      newNSP = new NSMutableParagraphStyle( currentNSP.MutableCopy )
		      
		      newNSP.LineBreakMode = mode
		      
		      'call   nsas.AddAttribute( nsas.kNSParagraphStyleAttributeName, newNSP, Cocoa.NSMakeRange( 0, nsas.Length ))
		      dim dict as new NSMutableDictionary
		      dict.Value(new NSString( Cocoa.StringConstant( nsas.kNSParagraphStyleAttributeName ))) = newNSP
		      'call   nsas.AddAttribute( nsas.kNSParagraphStyleAttributeName, newNSP, range )
		      
		      setAttributes( nsas.id, dict.id, range )
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TextViewRef(extends t as TextField) As Ptr
		  #if targetCocoa
		    declare function documentView lib CocoaLib selector "documentView" (obj_id as Integer) as Ptr
		    
		    return documentView(t.Handle)
		    
		  #else
		    #pragma unused t
		  #endif
		End Function
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
