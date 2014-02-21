#tag Module
Protected Module CorePrinting
	#tag Method, Flags = &h1
		Protected Function DefaultPrinter() As String
		  // Raises an exception if an unexpected OS error occured.
		  
		  #if TargetMacOS
		    
		    declare function PMServerCreatePrinterList lib framework (server as Ptr, byref printerList as Ptr) as Integer
		    declare function PMPrinterIsDefault lib framework (printer as Ptr) as Integer
		    declare function PMPrinterGetName lib framework (printer as Ptr) as CFStringRef
		    declare function CFArrayGetCount lib cfframework (theArray as Ptr) as Integer
		    declare function CFArrayGetValueAtIndex lib cfframework (theArray as Ptr, idx as Integer) as Ptr
		    
		    dim osErr As Integer
		    dim pListRef As Ptr
		    
		    osErr = PMServerCreatePrinterList(nil, pListRef)
		    If osErr <> 0 then
		      raise new macoslibException ("PMServerCreatePrinterList failed: " + str(osErr))
		      return ""
		    end
		    
		    dim pCount as Integer = CFArrayGetCount(pListRef)
		    for i as Integer = 0 to pCount-1
		      dim pr As Ptr = CFArrayGetValueAtIndex(pListRef, i)
		      If PMPrinterIsDefault(pr) <> 0 then
		        dim defaultPrinterName as String = PMPrinterGetName(pr)
		        return defaultPrinterName
		      end
		    next
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetDefaultPrinter(printerName as String) As Boolean
		  // Returns true if setting default printer worked.
		  // Return false if printer isn't found.
		  // Raises an exception if an unexpected OS error occured.
		  
		  #if TargetMacOS
		    
		    declare function PMServerCreatePrinterList lib framework (server as Ptr, byref printerList as Ptr) as Integer
		    declare function PMPrinterGetName lib framework (printer as Ptr) as CFStringRef
		    declare function PMPrinterSetDefault lib framework (printer as Ptr) as Integer
		    declare function CFArrayGetCount lib cfframework (theArray as Ptr) as Integer
		    declare function CFArrayGetValueAtIndex lib cfframework (theArray as Ptr, idx as Integer) as Ptr
		    
		    dim osErr As Integer
		    dim pListRef As Ptr
		    
		    osErr = PMServerCreatePrinterList(nil, pListRef)
		    If osErr <> 0 then
		      raise new macoslibException ("PMServerCreatePrinterList failed: " + str(osErr))
		      return false
		    end
		    
		    dim targetPrinter as Ptr = nil
		    dim pCount as integer = CFArrayGetCount(pListRef)
		    for i as Integer = 0 to pCount-1
		      dim pr As Ptr = CFArrayGetValueAtIndex(pListRef, i)
		      dim pName as string = PMPrinterGetName(pr)
		      if pName = printerName then
		        targetPrinter = pr
		        exit
		      end
		    next
		    
		    if targetPrinter = nil then
		      // Can't find printer
		      return false
		    end
		    
		    osErr = PMPrinterSetDefault(targetPrinter)
		    If osErr <> 0 then
		      raise new macoslibException ("PMPrinterSetDefault failed: " + str(osErr))
		      return false
		    end
		    
		    return true
		    
		  #else
		    
		    #pragma unused printerName
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = See also
		NSPrinter class
	#tag EndNote


	#tag Constant, Name = cfframework, Type = String, Dynamic = False, Default = \"CoreFoundation", Scope = Private
	#tag EndConstant

	#tag Constant, Name = framework, Type = String, Dynamic = False, Default = \"ApplicationServices", Scope = Protected
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
