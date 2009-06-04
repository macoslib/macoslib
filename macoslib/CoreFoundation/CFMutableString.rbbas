#tag Class
Class CFMutableString
Inherits CFString
	#tag Method, Flags = &h0
		Sub Constructor(s as String)
		  me.Constructor
		  me.Append s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(s as String)
		  #if TargetMacOS
		    declare Sub CFStringAppend Lib CarbonLib (theString as Ptr, cfStr as CFStringRef, encoding as Integer)
		    
		    const kCFTextEncodingUnknown = &hffff
		    
		    dim enc as TextEncoding = Encoding(s)
		    
		    if enc <> nil then
		      CFStringAppend me.Reference, s, enc.Code
		    else
		      CFStringAppend me.Reference, s, kCFTextEncodingUnknown
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToUppercase()
		  #if TargetMachO
		    Declare Sub CFStringUppercase Lib CarbonLib (theString as Ptr, locale as Integer)
		    Declare Function CFLocaleGetSystem Lib CarbonLib () as Integer
		    
		    dim systemLocale as Integer
		    
		    systemLocale = CFLocaleGetSystem()
		    if systemLocale <> 0 then
		      CFStringUppercase me.Reference, systemLocale
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToLowercase()
		  #if TargetMachO
		    Declare Sub CFStringLowercase Lib CarbonLib (theString as Ptr, locale as Integer)
		    Declare Function CFLocaleGetSystem Lib CarbonLib () as Integer
		    
		    dim systemLocale as Integer
		    
		    systemLocale = CFLocaleGetSystem()
		    if systemLocale <> 0 then
		      CFStringLowercase me.Reference, systemLocale
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(maxLength as Integer = 0)
		  // maxLength=0 means unlimited
		  
		  #if TargetMacOS
		    declare function CFStringCreateMutable Lib CarbonLib (alloc as Ptr, maxLength as Integer) as Ptr
		    
		    dim theRef as Ptr
		    theRef = CFStringCreateMutable(nil, maxLength)
		    super.Constructor theRef, true
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFString"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="CFString"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="CFString"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="CFString"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="CFString"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="CFString"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
