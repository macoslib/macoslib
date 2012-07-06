#tag Class
Class NSMutableAttributedString
Inherits NSAttributedString
	#tag Method, Flags = &h0
		Function AddAttribute(attributeName as string, value as variant, forRange as NSRange) As boolean
		  
		  #if TargetMacOS
		    declare sub addAttribute lib CocoaLib selector "addAttribute:value:range:" (id as Ptr, name as CFStringRef, value as Ptr, aRange as NSRange)
		    
		    'dim mgr as NSFontManager = NSFontManager.SharedManager
		    dim nsf as NSFont
		    dim range as NSRange
		    
		    if NOT value isa NSObject then
		      raise  new MacOSError( -50, "Invalid value. Must be a subclass of NSObject." )
		    end if
		    
		    if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		      addAttribute( me.id, Cocoa.StringConstant( attributeName ), NSObject( value ).id, forRange )
		      
		    else
		      select case attributeName //Add some convenience methods
		      case me.kAttributeBold //Bold
		        nsf = me.AttributeAtIndex( "NSFontAttributeName", forRange.location, range )
		        if nsf=nil then
		          return  false
		        end if
		        nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSBoldFontMask )
		        if nsf=nil then
		          return  false
		        end if
		        addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, forRange )
		        
		      case me.kAttributeItalic //Italic
		        nsf = me.AttributeAtIndex( "NSFontAttributeName", forRange.location, range )
		        if nsf=nil then
		          return  false
		        end if
		        nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSItalicFontMask )
		        if nsf=nil then
		          return  false
		        end if
		        addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, forRange )
		        
		      else  //Other attribute
		        addAttribute( me.id, attributeName, NSObject( value ).id, forRange )
		        
		      end select
		    end if
		    
		    return  true
		  #endif
		  
		  'NSString *NSFontAttributeName;
		  'NSString *NSParagraphStyleAttributeName;
		  'NSString *NSForegroundColorAttributeName;
		  'NSString *NSUnderlineStyleAttributeName;
		  'NSString *NSSuperscriptAttributeName;
		  'NSString *NSBackgroundColorAttributeName;
		  'NSString *NSAttachmentAttributeName;
		  'NSString *NSLigatureAttributeName;
		  'NSString *NSBaselineOffsetAttributeName;
		  'NSString *NSKernAttributeName;
		  'NSString *NSLinkAttributeName;
		  'NSString *NSStrokeWidthAttributeName;
		  'NSString *NSStrokeColorAttributeName;
		  'NSString *NSUnderlineColorAttributeName;
		  'NSString *NSStrikethroughStyleAttributeName;
		  'NSString *NSStrikethroughColorAttributeName;
		  'NSString *NSShadowAttributeName;
		  'NSString *NSObliquenessAttributeName;
		  'NSString *NSExpansionAttributeName;
		  'NSString *NSCursorAttributeName;
		  'NSString *NSToolTipAttributeName;
		  'NSString *NSMarkedClauseSegmentAttributeName;
		  'NSString *NSWritingDirectionAttributeName;
		  'NSString *NSVerticalGlyphFormAttributeName;
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendAttributedString(attrString as NSAttributedString)
		  
		  #if TargetMacOS
		    declare sub appendAttributedString lib CocoaLib selector "appendAttributedString:" (id as Ptr, attrS as Ptr)
		    
		    appendAttributedString( me.id, attrString.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableString() As NSMutableString
		  
		  #if TargetMacOS
		    declare Function mutableString lib CocoaLib selector "mutableString" (id as Ptr) as Ptr
		    
		    dim p as Ptr = mutableString( me.id )
		    
		    return   new NSMutableString( p, false )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetAttributes(forRange as NSRange, attrs as NSDictionary) As boolean
		  '
		  '#if TargetMacOS
		  'declare sub addAttribute lib CocoaLib selector "addAttribute:value:range:" (id as Ptr, name as CFStringRef, value as Ptr, aRange as NSRange)
		  '
		  ''dim mgr as NSFontManager = NSFontManager.SharedManager
		  'dim nsf as NSFont
		  'dim range as NSRange
		  '
		  'if NOT value isa NSObject then
		  'raise  new MacOSError( -50, "Invalid value. Must be a subclass of NSObject." )
		  'end if
		  '
		  'if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		  'addAttribute( me.id, Cocoa.StringConstant( attributeName ), NSObject( value ).id, forRange )
		  '
		  'else
		  'select case attributeName //Add some convenience methods
		  'case me.kAttributeBold //Bold
		  'nsf = me.AttributeAtIndex( "NSFontAttributeName", forRange.location, range )
		  'if nsf=nil then
		  'return  false
		  'end if
		  'nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSBoldFontMask )
		  'if nsf=nil then
		  'return  false
		  'end if
		  'addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, forRange )
		  '
		  'case me.kAttributeItalic //Italic
		  'nsf = me.AttributeAtIndex( "NSFontAttributeName", forRange.location, range )
		  'if nsf=nil then
		  'return  false
		  'end if
		  'nsf = NSFontManager.SharedManager.ConvertFontToHaveTrait( nsf, NSFontManager.kNSItalicFontMask )
		  'if nsf=nil then
		  'return  false
		  'end if
		  'addAttribute( me.id, Cocoa.StringConstant( "NSFontAttributeName" ), nsf.id, forRange )
		  '
		  'else  //Other attribute
		  'addAttribute( me.id, attributeName, NSObject( value ).id, forRange )
		  '
		  'end select
		  'end if
		  '
		  'return  true
		  '#endif
		  '
		  ''NSString *NSFontAttributeName;
		  ''NSString *NSParagraphStyleAttributeName;
		  ''NSString *NSForegroundColorAttributeName;
		  ''NSString *NSUnderlineStyleAttributeName;
		  ''NSString *NSSuperscriptAttributeName;
		  ''NSString *NSBackgroundColorAttributeName;
		  ''NSString *NSAttachmentAttributeName;
		  ''NSString *NSLigatureAttributeName;
		  ''NSString *NSBaselineOffsetAttributeName;
		  ''NSString *NSKernAttributeName;
		  ''NSString *NSLinkAttributeName;
		  ''NSString *NSStrokeWidthAttributeName;
		  ''NSString *NSStrokeColorAttributeName;
		  ''NSString *NSUnderlineColorAttributeName;
		  ''NSString *NSStrikethroughStyleAttributeName;
		  ''NSString *NSStrikethroughColorAttributeName;
		  ''NSString *NSShadowAttributeName;
		  ''NSString *NSObliquenessAttributeName;
		  ''NSString *NSExpansionAttributeName;
		  ''NSString *NSCursorAttributeName;
		  ''NSString *NSToolTipAttributeName;
		  ''NSString *NSMarkedClauseSegmentAttributeName;
		  ''NSString *NSWritingDirectionAttributeName;
		  ''NSString *NSVerticalGlyphFormAttributeName;
		End Function
	#tag EndMethod


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
