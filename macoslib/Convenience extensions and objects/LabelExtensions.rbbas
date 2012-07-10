#tag Module
Protected Module LabelExtensions
	#tag Method, Flags = &h0
		Sub SetLineBreak(extends TF as Label, assigns mode as integer)
		  //# Set the paragraph LineBreak option for a Label
		  
		  //@ Use the kNSLineBreak... options
		  
		  #if TargetMacOS
		    declare function attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
		    declare sub setAttributes lib CocoaLib selector "setAttributes:range:" (id as Ptr, attrs as Ptr, range as Cocoa.NSRange)
		    
		    dim ctrl as NSTextField = new NSTextField( Ptr( TF.Handle ), false )
		    dim p as Ptr
		    p = attributedStringValue( ctrl )
		    dim s() as string = Cocoa.ClassNameTreeForObjectPointer( p )
		    dim nsas as NSMutableAttributedString
		    
		    if p<>nil then
		      dim currentNSP as NSParagraphStyle
		      dim range as Cocoa.NSRange
		      dim newNSP as NSMutableParagraphStyle
		      
		      nsas = new NSMutableAttributedString( p )
		      currentNSP = new NSParagraphStyle( nsas.AttributeAtIndex( nsas.kNSParagraphStyleAttributeName, 0, range ))
		      newNSP = new NSMutableParagraphStyle( currentNSP.MutableCopy )
		      
		      newNSP.LineBreakMode = mode
		      
		      dim dict as new NSMutableDictionary
		      dict.Value( NSString( Cocoa.StringConstant( nsas.kNSParagraphStyleAttributeName ))) = newNSP
		      
		      setAttributes( nsas.id, dict.id, range )
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Constant, Name = kNSLineBreakByCharWrapping, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByClipping, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingHead, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingMiddle, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByTruncatingTail, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLineBreakByWordWrapping, Type = Double, Dynamic = False, Default = \"0", Scope = Public
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
