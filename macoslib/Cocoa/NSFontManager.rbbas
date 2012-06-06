#tag Class
Class NSFontManager
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableFontFamilies() As String()
		  #if TargetMacOS
		    declare function availableFontFamilies lib CocoaLib selector "availableFontFamilies" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( availableFontFamilies( me.id ), false )
		    
		    return   nsa.VariantValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableFonts() As String()
		  #if TargetMacOS
		    declare function availableFonts lib CocoaLib selector "availableFonts" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( AvailableFonts( me.id ), false )
		    
		    return   nsa.VariantValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableMembersOfFontFamily(theFamily as string) As String()
		  #if TargetMacOS
		    declare function availableMembersOfFontFamily lib CocoaLib selector "availableMembersOfFontFamily:" (id as Ptr, name as CFStringRef) as Ptr
		    
		    dim nsa as NSArray = new NSArray( availableMembersOfFontFamily( me.id, theFamily ), false )
		    
		    return   nsa.ValuesAsArrayOfStrings
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CollectionNames() As String()
		  #if TargetMacOS
		    declare function collectionNames lib CocoaLib selector "collectionNames" (id as Ptr) as Ptr
		    
		    dim nsa as NSArray = new NSArray( collectionNames( me.id ), false )
		    
		    return   nsa.VariantValue
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From NSObject
		  // Constructor(obj_id as Ptr, hasOwnership as Boolean = false) -- From NSObject
		  Super.Constructor( SharedManager )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertFontToHaveTrait(font as NSFont, traitMask as integer) As NSFont
		  #if TargetMacOS
		    declare function convertFont lib CocoaLib selector "convertFont:toHaveTrait:" (id as Ptr, fontid as Ptr, mask as Integer) as Ptr
		    
		    return  new NSFont( convertFont( me.id, font.id, traitMask ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFont(familyName as string, size as double = 0.0, bold as Boolean = false, italic as Boolean = false) As NSFont
		  //Find a font
		  
		  #if targetMacOS
		    dim nsf as NSFont
		    dim p as Ptr
		    dim traits as integer
		    
		    declare function fontWithFamily lib CocoaLib selector "fontWithFamily:traits:weight:size:" ( id as Ptr, family as CFStringRef, traits as integer, weight as Integer, size as single ) as Ptr
		    
		    if familyName="System" then //Get System font
		      if bold then
		        nsf = NSFont.BoldSystemFontOfSize( size )
		      else
		        nsf = NSFont.SystemFontOfSize( size )
		      end if
		      
		      if italic then
		        nsf = ConvertFontToHaveTrait( nsf, kNSItalicFontMask )
		      end if
		      
		    elseif familyName="SmallSystem" then //Get small system font
		      if bold then
		        nsf = NSFont.BoldSystemFontOfSize( NSFont.SmallSystemFontSize )
		      else
		        nsf = NSFont.SystemFontOfSize( NSFont.SmallSystemFontSize )
		      end if
		      
		      if italic then
		        nsf = ConvertFontToHaveTrait( nsf, kNSItalicFontMask )
		      end if
		      
		    else //Get another font
		      if bold then
		        traits = kNSBoldFontMask
		      end if
		      if italic then
		        traits = traits OR kNSItalicFontMask
		      end if
		      nsf = new NSFont( fontWithFamily( me.id, familyName, traits, 5, size ), false )
		      
		    end if
		    
		    return  nsf
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFontFromFamily(familyName as string, traits as integer, size as double = 0.0) As NSFont
		  //Find a font
		  dim nsf as NSFont
		  dim p as Ptr
		  
		  declare function fontWithFamily lib CocoaLib selector "fontWithFamily:traits:weight:size:" ( id as Ptr, family as CFStringRef, traits as integer, weight as Integer, size as single ) as Ptr
		  
		  p = fontWithFamily( me.id, familyName, traits, 5, size )
		  
		  if p<>nil then
		    return  new NSFont( p, false )
		  else
		    return  nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SharedManager() As NSFontManager
		  #if targetMacOS
		    declare function _sharedFontManager lib CocoaLib selector "sharedFontManager" (Cls as Ptr) as Ptr
		    
		    return   new NSFontManager( _sharedFontManager( Cocoa.NSClassFromString( "NSFontManager" )), false )
		  #endif
		End Function
	#tag EndMethod


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
