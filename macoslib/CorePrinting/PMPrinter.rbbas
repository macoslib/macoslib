#tag Class
Class PMPrinter
Inherits PMObject
	#tag Method, Flags = &h0
		Sub SetDefault()
		  #if TargetMacOS
		    
		    declare function PMPrinterSetDefault lib framework ( printer As PMTypeRef ) As Integer
		    
		    dim errNum as integer = PMPrinterSetDefault( self )
		    if errNum <> 0 then
		      dim err as new OSError
		      err.ErrorNumber = errNum
		      err.Message = "Could not set this printer as default."
		      raise err
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function PMPrinterGetID lib framework ( printer As PMTypeRef ) As CFStringRef
			    
			    dim csf as CFStringRef = PMPrinterGetID( self )
			    return csf
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ID As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function PMPrinterIsDefault lib framework ( printer As PMTypeRef ) As Boolean
			    
			    return PMPrinterIsDefault( self )
			    
			  #endif
			End Get
		#tag EndGetter
		IsDefault As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function PMPrinterGetName lib framework ( printer As PMTypeRef ) As CFStringRef
			    
			    dim cfs as CFStringRef = PMPrinterGetName( self )
			    return cfs
			    
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty


End Class
#tag EndClass
