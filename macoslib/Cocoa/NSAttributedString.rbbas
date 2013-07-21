#tag Class
Class NSAttributedString
Inherits NSObject
	#tag Method, Flags = &h0
		Function AttributeAtIndex(attributeName as string, atIndex as integer, Byref range as NSRange) As variant
		  #if TargetMacOS
		    declare function m_attribute lib CocoaLib selector "attribute:atIndex:effectiveRange:" (id as Ptr, attr as CFStringRef, idx as integer, byref range as NSRange) as Ptr
		    
		    dim p as Ptr
		    if attributeName.Left( 2 )="NS" AND attributeName.Right( 13 )="AttributeName" then //Cocoa constant
		      p = m_attribute( me.id, Cocoa.StringConstant( attributeName ), atIndex, range )
		    else
		      p = m_attribute( me.id, attributeName, atIndex, range )
		    end if
		    
		    if p = nil then
		      return nil
		    else
		      return Cocoa.NSObjectFromNSPtr( p )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributedSubstringFromRange(range as NSRange) As NSAttributedString
		  #if TargetMacOS
		    declare function attributedSubstringFromRange lib CocoaLib selector "attributedSubstringFromRange:" ( id as Ptr, range as NSRange ) as Ptr
		    
		    dim p as Ptr = attributedSubstringFromRange( self, range )
		    
		    return new NSAttributedString( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributesAtIndex_LongestEffectiveRange(atIndex as integer, byref effectiveRange as NSRange, maxRange as NSRange) As NSDictionary
		  #if TargetMacOS
		    declare function attributesAtIndex lib CocoaLib selector "attributesAtIndex:longestEffectiveRange:inRange:" (id as Ptr, idx as integer, byref range as NSRange, maxRange as NSRange) as Ptr
		    
		    dim p as Ptr = attributesAtIndex( self, atIndex, effectiveRange, maxRange )
		    return new NSDictionary( p )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(cfa as CFAttributedString)
		  // Adopts a CFAttributedString
		  
		  super.Constructor (cfa, not hasOwnership)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String)
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:" (id as Ptr, theString as CFStringRef) as Ptr
		    
		    dim p as Ptr = initWithString (Allocate ("NSAttributedString"), text)
		    super.Constructor (p, hasOwnership)
		  #else
		    #pragma unused text
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(text as String, attr as NSDictionary)
		  #if TargetMacOS
		    declare function initWithString lib CocoaLib selector "initWithString:attributes:" (id as Ptr, theString as CFStringRef, attr as Ptr) as Ptr
		    
		    dim p as Ptr = initWithString (Allocate ("NSAttributedString"), text, attr)
		    super.Constructor (p, hasOwnership)
		  #else
		    #pragma unused text
		    #pragma unused attr
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromHTML(HTMLdata as NSData, baseURL as NSURL = nil) As NSAttributedString
		  
		  #if TargetMacOS
		    declare function initWithHTML lib CocoaLib selector "initWithHTML:documentAttributes:" ( id as Ptr, data as Ptr, docAttr as Ptr) as Ptr
		    declare function initWithHTMLandBase lib CocoaLib selector "initWithHTML:baseURL:documentAttributes:" ( id as Ptr, data as Ptr, baseURL as Ptr, docAttr as Ptr) as Ptr
		    
		    dim p as Ptr = Allocate( "NSAttributedString" )
		    if baseURL = nil then
		      p = initWithHTML( p, HTMLData, nil )
		    else
		      p = initWithHTMLandBase( p, HTMLData, baseURL, nil )
		    end if
		    if p <> nil then
		      return new NSAttributedString( p )
		    end if
		    
		  #else
		    #pragma unused HTMLData
		    #pragma unused baseURL
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromRTF(RTFdata as NSData) As NSAttributedString
		  #if TargetMacOS
		    declare function initWithRTF lib CocoaLib selector "initWithRTF:documentAttributes:" ( id as Ptr, data as Ptr, docAttr as Ptr) as Ptr
		    
		    dim p as Ptr = Allocate( "NSAttributedString" )
		    p = initWithRTF( p, RTFData, nil )
		    if p <> nil then
		      return  new NSAttributedString( p )
		    end if
		    
		  #else
		    #pragma unused RTFdata
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString_NoAttributes(text as String) As NSAttributedString
		  return new NSAttributedString (text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString_WithAttributes(text as String, attr as NSDictionary) As NSAttributedString
		  return new NSAttributedString (text, attr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As integer
		  #if TargetMacOS
		    declare function m_length lib Cocoalib selector "length" (id as Ptr) as integer
		    
		    return  m_length( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as NSAttributedString) As NSAttributedString
		  //Concatenate 2 NSAttributedStrings
		  
		  #if TargetMacOS
		    dim base as NSMutableAttributedString
		    
		    base = new NSMutableAttributedString( self.MutableCopy, hasOwnership )
		    
		    base.BeginEditing
		    base.AppendAttributedString  aString
		    base.FixAttributes
		    base.EndEditing
		    
		    return   base //Return a NSMutableAttributedString
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function QuickCreate(text as string, baseStyles as NSDictionary, paramarray styles as Tuple) As NSAttributedString
		  
		  dim nsdict as NSMutableDictionary
		  dim result as NSAttributedString
		  
		  nsdict = StyleDictionaryFromTuples( styles, baseStyles )
		  
		  'if baseStyles<>nil then
		  'nsdict = new NSMutableDictionary( baseStyles.MutableCopy, true )
		  'else
		  'nsdict = new NSMutableDictionary
		  'end if
		  '
		  'for i as integer=0 to styles.Ubound
		  't = styles( i )
		  '
		  'select case t(0)
		  'case "font"
		  'dim fontfamily as string
		  'dim isBold as Boolean
		  'dim isItalic as Boolean
		  'dim textColor as color = &c000000
		  'dim size as double = 12.0
		  'dim nsf as NSFont
		  'dim IsSuperScript as Boolean
		  'dim IsSubscript as Boolean
		  '
		  'for j = 1 to t.Count - 1
		  'select case Vartype( t(j))
		  'case Variant.TypeString
		  'select case t(j)
		  'case "bold"
		  'isBold = true
		  'case "italic"
		  'isItalic = true
		  'case "sup", "super", "superscript"
		  'IsSuperScript = true
		  'case "sub", "subscript"
		  'IsSubscript = true
		  'else
		  'fontfamily = t(j)
		  'end select
		  'case Variant.TypeInteger, Variant.TypeDouble
		  'size = t(j)
		  'case Variant.TypeColor
		  'textColor = t(j)
		  'else
		  '
		  'end select
		  'next
		  '
		  'nsf = NSFontManager.SharedManager.GetFont( fontfamily, size, isBold, isItalic )
		  'nsdict.Value( Cocoa.StringConstant( "NSFontAttributeName" )) = nsf
		  'nsdict.Value( Cocoa.StringConstant( "NSForegroundColorAttributeName" )) = new NSColor( textColor )
		  '
		  'case "underline", "strikethrough"
		  'dim underlineStyle as integer
		  'dim underlineColor as Color
		  'dim hasUnderlineColor as Boolean
		  'dim underlinePattern as integer
		  'dim underlineByWord as Boolean //Mask = 32768, i.e. &h8000
		  'dim StyleValue as integer
		  '
		  'for j = 1 to t.Count - 1
		  'select case Vartype( t(j))
		  'case Variant.TypeString
		  'select case t(j)
		  'case "single"
		  'underlineStyle = 1
		  'case "thick"
		  'underlineStyle = 2
		  'case "double"
		  'underlineStyle = 9
		  'case "solid"
		  'underlinePattern = 0
		  'case "dash"
		  'underlinePattern = &h200
		  'case "dashdot"
		  'underlinePattern = &h300
		  'case "dashdotdot"
		  'underlinePattern = &h400
		  'case "dot"
		  'underlinePattern = &h100
		  'case "byword"
		  'underlineByWord = true
		  'end select
		  '
		  'case Variant.TypeColor
		  'underlineColor = t(j)
		  'hasUnderlineColor = true
		  'else
		  '
		  'end select
		  'next
		  '
		  'StyleValue = underlineStyle OR underlinePattern
		  'if underlineByWord then
		  'StyleValue = StyleValue OR &h8000
		  'end if
		  'if t(0)="underline" then
		  'nsdict.Value( Cocoa.StringConstant( "NSUnderlineStyleAttributeName" )) = new NSNumber( StyleValue )
		  'else
		  'nsdict.Value( Cocoa.StringConstant( "NSStrikethroughStyleAttributeName" )) = new NSNumber( StyleValue )
		  'end if
		  '
		  'if hasUnderlineColor then
		  'if t(0)="underline" then
		  'nsdict.Value( Cocoa.StringConstant( "NSUnderlineColorAttributeName" )) = new NSColor( underlineColor )
		  'else
		  'nsdict.Value( Cocoa.StringConstant( "NSStrikethroughColorAttributeName" )) = new NSColor( underlineColor )
		  'end if
		  'end if
		  '
		  'case "link"
		  'nsdict.Value( Cocoa.StringConstant( "NSLinkAttributeName" )) = NSString( t(1))
		  '
		  'case "tooltip"
		  'nsdict.Value( Cocoa.StringConstant( "NSToolTipAttributeName" )) = NSString( t(1))
		  '
		  'case "spacing"
		  '
		  'else
		  '
		  'end select
		  '
		  'next
		  '
		  'nsdict.Value( Cocoa.StringConstant( "NSParagraphStyleAttributeName" )) = NSParagraphStyle.Default
		  '
		  result = NSAttributedString.CreateFromString_WithAttributes( text, nsdict )
		  if nsdict.HasKey(new NSString( "macoslibSuperScript" )) OR nsdict.HasKey(new NSString( "macoslibSubScript" )) then
		    dim nsmas as NSMutableAttributedString = new NSMutableAttributedString( result.MutableCopy, true )
		    if nsdict.HasKey(new NSString( "macoslibSuperScript" )) then
		      nsmas.Superscript()
		    else //Cannot be both true
		      nsmas.Subscript()
		    end if
		    
		    result = nsmas
		  end if
		  
		  return  result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As string
		  #if TargetMacOS
		    declare function m_string lib Cocoalib selector "string" (id as Ptr) as CFStringRef
		    
		    return  m_string( self )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StyleDictionaryFromTuples(baseStyles as NSDictionary = nil, paramarray styles() as Tuple) As NSMutableDictionary
		  return StyleDictionaryFromTuples( styles, baseStyles )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StyleDictionaryFromTuples(styles() as Tuple, baseStyles as NSDictionary = nil) As NSMutableDictionary
		  dim t as Tuple
		  dim j as integer
		  'dim nsps as NSParagraphStyle
		  dim nsdict as NSMutableDictionary
		  
		  if baseStyles<>nil then
		    nsdict = new NSMutableDictionary( baseStyles.MutableCopy, true )
		  else
		    nsdict = new NSMutableDictionary
		  end if
		  
		  for i as integer=0 to styles.Ubound
		    t = styles( i )
		    
		    select case t(0)
		    case "font"
		      dim fontfamily as string
		      dim isBold as Boolean
		      dim isItalic as Boolean
		      dim textColor as color = &c000000
		      dim size as double = 12.0
		      dim nsf as NSFont
		      dim IsSuperScript as Boolean
		      dim IsSubscript as Boolean
		      
		      for j = 1 to t.Count - 1
		        select case Vartype( t(j))
		        case Variant.TypeString
		          select case t(j)
		          case "bold"
		            isBold = true
		          case "italic"
		            isItalic = true
		          case "sup", "super", "superscript"
		            IsSuperScript = true
		          case "sub", "subscript"
		            IsSubscript = true
		          else
		            fontfamily = t(j)
		          end select
		        case Variant.TypeInteger, Variant.TypeDouble
		          size = t(j)
		        case Variant.TypeColor
		          textColor = t(j)
		        else
		          
		        end select
		      next
		      
		      nsf = NSFontManager.SharedManager.GetFont( fontfamily, size, isBold, isItalic )
		      nsdict.Value( Cocoa.StringConstant( "NSFontAttributeName" )) = nsf
		      nsdict.Value( Cocoa.StringConstant( "NSForegroundColorAttributeName" )) = new NSColor( textColor )
		      
		      if IsSuperscript then
		        nsdict.Value( "macoslibSuperScript" ) = new  NSNumber( true )
		      else //Cannot be both true
		        nsdict.Value( "macoslibSubScript" ) = new  NSNumber( true )
		      end if
		      
		    case "underline", "strikethrough"
		      dim underlineStyle as integer
		      dim underlineColor as Color
		      dim hasUnderlineColor as Boolean
		      dim underlinePattern as integer
		      dim underlineByWord as Boolean //Mask = 32768, i.e. &h8000
		      dim StyleValue as integer
		      
		      for j = 1 to t.Count - 1
		        select case Vartype( t(j))
		        case Variant.TypeString
		          select case t(j)
		          case "single"
		            underlineStyle = 1
		          case "thick"
		            underlineStyle = 2
		          case "double"
		            underlineStyle = 9
		          case "solid"
		            underlinePattern = 0
		          case "dash"
		            underlinePattern = &h200
		          case "dashdot"
		            underlinePattern = &h300
		          case "dashdotdot"
		            underlinePattern = &h400
		          case "dot"
		            underlinePattern = &h100
		          case "byword"
		            underlineByWord = true
		          end select
		          
		        case Variant.TypeColor
		          underlineColor = t(j)
		          hasUnderlineColor = true
		        else
		          
		        end select
		      next
		      
		      StyleValue = underlineStyle OR underlinePattern
		      if underlineByWord then
		        StyleValue = StyleValue OR &h8000
		      end if
		      if t(0)="underline" then
		        nsdict.Value( Cocoa.StringConstant( "NSUnderlineStyleAttributeName" )) = new NSNumber( StyleValue )
		      else
		        nsdict.Value( Cocoa.StringConstant( "NSStrikethroughStyleAttributeName" )) = new NSNumber( StyleValue )
		      end if
		      
		      if hasUnderlineColor then
		        if t(0)="underline" then
		          nsdict.Value( Cocoa.StringConstant( "NSUnderlineColorAttributeName" )) = new NSColor( underlineColor )
		        else
		          nsdict.Value( Cocoa.StringConstant( "NSStrikethroughColorAttributeName" )) = new NSColor( underlineColor )
		        end if
		      end if
		      
		    case "link"
		      nsdict.Value( Cocoa.StringConstant( "NSLinkAttributeName" )) = NSString( t(1))
		      
		    case "tooltip"
		      nsdict.Value( Cocoa.StringConstant( "NSToolTipAttributeName" )) = NSString( t(1))
		      
		    case "spacing"
		      
		    else
		      
		    end select
		    
		  next
		  
		  nsdict.Value( Cocoa.StringConstant( "NSParagraphStyleAttributeName" )) = NSParagraphStyle.Default
		  
		  
		  return  nsdict
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
