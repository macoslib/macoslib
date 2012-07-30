#tag Module
Protected Module DateExtension
	#tag Method, Flags = &h0
		Function AsCFAbsoluteTime(extends d as Date) As double
		  
		  #if TargetMacOS
		    dim delta as double
		    
		    const kCFAbsoluteTimeIntervalSince1904 = "kCFAbsoluteTimeIntervalSince1904"
		    
		    dim p as Ptr = Carbon.Bundle.DataPointerNotRetained( kCFAbsoluteTimeIntervalSince1904 )
		    if p <> nil then
		      delta = p.Double( 0 )
		    else
		      raise new macoslibException( "Could not retrieve constant ""kCFAbsoluteTimeIntervalSince1904"" from Carbon bundle" )
		    end if
		    
		    return   d.TotalSeconds + delta
		  #endif
		End Function
	#tag EndMethod


End Module
#tag EndModule
