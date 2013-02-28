#tag Class
Class NSFont
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function BoldSystemFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function boldSystemFontOfSize lib CocoaLib selector "boldSystemFontOfSize:" (Cls as Ptr, size as single) as Ptr
		    
		    dim p as Ptr
		    p = boldSystemFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ControlContentFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function controlContentFontOfSize lib CocoaLib selector "controlContentFontOfSize:" (Cls as Ptr, size as single) as Ptr
		    
		    dim p as Ptr
		    p = controlContentFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToHaveTrait(font as NSFont, traitMask as integer) As NSFont
		  //# Return a NSFont where traitMask is activated (if available).
		  
		  //@ Use the NSFont.kNS... constants to specify one or more traits (combine values with OR)
		  
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toHaveTrait:" (id as Ptr, fontid as Ptr, mask as Integer) as Ptr
		    
		    return  new NSFont( convertFont( me.id, font.id, traitMask ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoveredCharacterSet() As NSCharacterSet
		  #if TargetMacOS
		    declare function coveredCharacterSet lib CocoaLib selector "coveredCharacterSet" (Cls as Ptr) as Ptr
		    
		    dim p as Ptr
		    p = coveredCharacterSet( me.id )
		    
		    if p<>nil then
		      return new NSCharacterSet( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayName() As string
		  #if TargetMacOS
		    declare function displayName lib CocoaLib selector "displayName" (Cls as Ptr) as CFStringRef
		    
		    return   displayName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FamilyName() As string
		  #if TargetMacOS
		    declare function familyName lib CocoaLib selector "familyName" (Cls as Ptr) as CFStringRef
		    
		    return   familyName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontName() As string
		  #if TargetMacOS
		    declare function fontName lib CocoaLib selector "fontName" (Cls as Ptr) as CFStringRef
		    
		    return   fontName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SmallSystemFontSize() As double
		  #if TargetMacOS
		    declare function smallSystemFontSize lib CocoaLib selector "smallSystemFontSize" (Cls as Ptr) as single
		    
		    return   smallSystemFontSize( Cocoa.NSClassFromString( "NSFont" ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SystemFontOfSize(size as double = 0.0) As NSFont
		  #if TargetMacOS
		    declare function systemFontOfSize lib CocoaLib selector "systemFontOfSize:" (Cls as Ptr, size as single) as Ptr
		    
		    dim p as Ptr
		    p = systemFontOfSize( Cocoa.NSClassFromString( "NSFont" ), size )
		    
		    if p<>nil then
		      return new NSFont( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SystemFontSize() As double
		  #if TargetMacOS
		    declare function systemFontSize lib CocoaLib selector "systemFontSize" (Cls as Ptr) as single
		    
		    return   systemFontSize( Cocoa.NSClassFromString( "NSFont" ))
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = How to load a font by name
		Use NSFontManager.SharedManager.GetFont(...)
		
	#tag EndNote


	#tag Constant, Name = kNSBoldFontMask, Type = Double, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCompressedFontMask, Type = Double, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSCondensedFontMask, Type = Double, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSExpandedFontMask, Type = Double, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSFixedPitchFontMask, Type = Double, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSItalicFontMask, Type = Double, Dynamic = False, Default = \"&h1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNarrowFontMask, Type = Double, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSNonStandardCharacterSetFontMask, Type = Double, Dynamic = False, Default = \"&h8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSPosterFontMask, Type = Double, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSSmallCapsFontMask, Type = Double, Dynamic = False, Default = \"&h80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnboldFontMask, Type = Double, Dynamic = False, Default = \"&h4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNSUnitalicFontMask, Type = Double, Dynamic = False, Default = \"&h1000000", Scope = Public
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
