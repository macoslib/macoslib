#tag Class
Protected Class UTI
	#tag Method, Flags = &h0
		 Shared Function AreEqual(uti1 as CFStringRef, uti2 as CFStringRef) As Boolean
		  #if targetMacOS
		    soft declare function UTTypeEqual lib CarbonLib (uti1 as CFStringRef, uti2 as CFStringRef) as Boolean
		    
		    return UTTypeEqual(uti1, uti2)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromExtension(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    static tagClass as Ptr = ResolveTagClass("kUTTagClassFilenameExtension")
		    
		    return CreateUTI(tag, tagClass, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromMIMEType(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    static tagClass as Ptr = ResolveTagClass("kUTTagClassMIMEType")
		    
		    return CreateUTI(tag, tagClass, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromOSType(tag as OSType, conformsTo as String = "") As String
		  #if targetMacOS
		    soft declare function UTCreateStringForOSType lib CarbonLib (inOSType as OSType) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, "new CFString()" takes care of that below
		    
		    static tagClass as Ptr = ResolveTagClass("kUTTagClassOSType")
		    
		    return CreateUTI(new CFString(UTCreateStringForOSType(tag), true), tagClass, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPasteboardType(tag as String, conformsTo as String = "") As String
		  #if targetMacOS
		    static tagClass as Ptr = ResolveTagClass("kUTTagClassNSPboardType")
		    
		    return CreateUTI(tag, tagClass, conformsTo)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CreateUTI(tag as CFStringRef, tagClass as Ptr, conformsTo as String = "") As String
		  #if targetMacOS
		    soft declare function UTTypeCreatePreferredIdentifierForTag lib CarbonLib (inTagClass as Ptr, inTag as CFStringRef, inConformingToUTI as CFStringRef) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, using "CFString" takes care of that automagically
		    
		    dim p as Ptr
		    if conformsTo = "" then
		      p = UTTypeCreatePreferredIdentifierForTag(tagClass, tag, nil)
		    else
		      p = UTTypeCreatePreferredIdentifierForTag(tagClass, tag, conformsTo)
		    end if
		    return new CFString(p, true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DeclaringBundleURL(uti as CFStringRef) As CFURL
		  #if targetMacOS
		    soft declare function UTTypeCopyDeclaringBundleURL lib CarbonLib (uti as CFStringRef) as Ptr
		    
		    dim theURL as new CFURL(UTTypeCopyDeclaringBundleURL(uti), true)
		    if theURL <> nil then
		      return theURL
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Description(uti as CFStringRef) As String
		  #if targetMacOS
		    soft declare function UTTypeCopyDescription lib CarbonLib (uti as CFStringRef) as Ptr
		    // Caution: If this would return a CFStringRef, we'd have to Retain its value!
		    // Instead, "new CFString()" takes care of that below
		    
		    return new CFString(UTTypeCopyDescription(uti), true)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OSType(uti as CFStringRef) As OSType
		  #if targetMacOS
		    soft declare function UTGetOSTypeFromString lib CarbonLib (uti as CFStringRef) as OSType
		    
		    return UTGetOSTypeFromString(uti)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveTagClass(symbol as String) As Ptr
		  #if targetMacOS
		    dim p as Ptr = Carbon.Bundle.DataPointerNotRetained(symbol)
		    if p <> nil then
		      return p.Ptr(0)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  http://code.google.com/p/macoslib
	#tag EndNote


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
End Class
#tag EndClass
