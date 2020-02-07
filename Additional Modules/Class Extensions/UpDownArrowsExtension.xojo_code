#tag Module
Protected Module UpDownArrowsExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends u as UpDownArrows) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Integer) as NSControlSize
		    
		    return controlSize(u.handle)
		  #else
		    #pragma unused u
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends u as UpDownArrows, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Integer, value as NSControlSize)
		    
		    setControlSize(u.handle, value)
		  #else
		    #pragma unused u
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


End Module
#tag EndModule
