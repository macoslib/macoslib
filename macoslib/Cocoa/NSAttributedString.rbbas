#tag Class
Class NSAttributedString
Inherits NSObject
	#tag Method, Flags = &h0
		Function AttributeAtIndex(attributeName as string, atIndex as integer, Byref range as NSRange) As variant
		  
		  #if TargetMacOS
		    declare function _attribute lib CocoaLib selector "attribute:atIndex:effectiveRange:" (id as Ptr, attr as CFStringRef, idx as integer, byref range as NSRange) as Ptr
		    
		    dim p as Ptr
		    if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		      p = _attribute( me.id, Cocoa.StringConstant( attributeName ), atIndex, range )
		    else
		      p = _attribute( me.id, attributeName, atIndex, range )
		    end if
		    
		    if p=nil then
		      return  nil
		    else
		      return   Cocoa.NSObjectFromNSPtr( p )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributedSubstringFromRange(range as NSRange) As NSAttributedString
		  #if TargetMacOS
		    declare function attributedSubstringFromRange lib CocoaLib selector "attributedSubstringFromRange:" ( id as Ptr, range as NSRange ) as Ptr
		    
		    dim p as Ptr = attributedSubstringFromRange( me.id, range )
		    
		    return   new NSAttributedString( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributesAtIndex_LongestEffectiveRange(atIndex as integer, byref effectiveRange as NSRange, maxRange as NSRange) As NSDictionary
		  #if TargetMacOS
		    declare function attributesAtIndex lib CocoaLib selector "attributesAtIndex:longestEffectiveRange:inRange:" (id as Ptr, idx as integer, byref range as NSRange, maxRange as NSRange) as Ptr
		    
		    dim p as Ptr = attributesAtIndex( me.id, atIndex, effectiveRange, maxRange )
		    return   new NSDictionary( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString_NoAttributes(value as String) As NSAttributedString
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:" (id as Ptr, theString as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    p = NSAttributedString.Allocate( "NSAttributedString" )
		    p = initWithString( p, value )
		    
		    return   new NSAttributedString( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString_WithAttributes(value as String, attr as Dictionary) As NSAttributedString
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:attributes:" (id as Ptr, theString as CFStringRef, attr as Ptr) as Ptr
		    
		    dim p as Ptr
		    dim NSDict as NSDictionary = NSDictionary.CreateFromRSDictionary( attr )
		    p = NSAttributedString.Allocate( "NSAttributedString" )
		    p = initWithString( p, value, NSDict )
		    
		    return   new NSAttributedString( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString_WithAttributes(value as String, paramarray attrs() as pair) As NSAttributedString
		  //Same as CreateFromString_WithAttributes but Dictionary values are given a Pair()
		  
		  #if TargetMacOS
		    dim attr as new Dictionary
		    attr.AppendPairs  attrs
		    
		    return  NSAttributedString.CreateFromString_WithAttributes( value, attr )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As integer
		  #if TargetMacOS
		    declare function _length lib Cocoalib selector "length" (id as Ptr) as integer
		    
		    return   _length( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As string
		  #if TargetMacOS
		    declare function _string lib Cocoalib selector "string" (id as Ptr) as CFStringRef
		    
		    return   _string( me.id )
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = kAttributeBold, Type = String, Dynamic = False, Default = \"macoslib_Bold", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAttributeItalic, Type = String, Dynamic = False, Default = \"macoslib_Italic", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSAttachmentAttributeName, Type = String, Dynamic = False, Default = \"NSAttachmentAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSBackgroundColorAttributeName, Type = String, Dynamic = False, Default = \"NSBackgroundColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSBaselineOffsetAttributeName, Type = String, Dynamic = False, Default = \"NSBaselineOffsetAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCursorAttributeName, Type = String, Dynamic = False, Default = \"NSCursorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSExpansionAttributeName, Type = String, Dynamic = False, Default = \"NSExpansionAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSFontAttributeName, Type = String, Dynamic = False, Default = \"NSFontAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSForegroundColorAttributeName, Type = String, Dynamic = False, Default = \"NSForegroundColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSKernAttributeName, Type = String, Dynamic = False, Default = \"NSKernAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLigatureAttributeName, Type = String, Dynamic = False, Default = \"NSLigatureAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSLinkAttributeName, Type = String, Dynamic = False, Default = \"NSLinkAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSMarkedClauseSegmentAttributeName, Type = String, Dynamic = False, Default = \"NSMarkedClauseSegmentAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSObliquenessAttributeName, Type = String, Dynamic = False, Default = \"NSObliquenessAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSParagraphStyleAttributeName, Type = String, Dynamic = False, Default = \"NSParagraphStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSShadowAttributeName, Type = String, Dynamic = False, Default = \"NSShadowAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrikethroughColorAttributeName, Type = String, Dynamic = False, Default = \"NSStrikethroughColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrikethroughStyleAttributeName, Type = String, Dynamic = False, Default = \"NSStrikethroughStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrokeColorAttributeName, Type = String, Dynamic = False, Default = \"NSStrokeColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSStrokeWidthAttributeName, Type = String, Dynamic = False, Default = \"NSStrokeWidthAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSuperscriptAttributeName, Type = String, Dynamic = False, Default = \"NSSuperscriptAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSToolTipAttributeName, Type = String, Dynamic = False, Default = \"NSToolTipAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnderlineColorAttributeName, Type = String, Dynamic = False, Default = \"NSUnderlineColorAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnderlineStyleAttributeName, Type = String, Dynamic = False, Default = \"NSUnderlineStyleAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSVerticalGlyphFormAttributeName, Type = String, Dynamic = False, Default = \"NSVerticalGlyphFormAttributeName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSWritingDirectionAttributeName, Type = String, Dynamic = False, Default = \"NSWritingDirectionAttributeName", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
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
