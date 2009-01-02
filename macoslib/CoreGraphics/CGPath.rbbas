#tag Class
Class CGPath
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CGPathGetTypeID lib CarbonFramework () as CFTypeID
		    
		    return CGPathGetTypeID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(path as CGPath) As Boolean
		  if me = nil then
		    return (path = nil)
		  end if
		  if path = nil then
		    return (me = nil)
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathEqualToPath lib CarbonFramework (path1 as Ptr, path2 as Ptr) as Boolean
		    
		    return CGPathEqualToPath(me, path)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoundingBox() As CGRect
		  if me = nil then
		    return CGRectNull
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathGetBoundingBox lib CarbonFramework (path as Ptr) as CGRect
		    
		    return CGPathGetBoundingBox(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsPoint(p as CGPoint, eoFill as Boolean = false) As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathContainsPoint lib CarbonFramework (path as Ptr, m as Ptr, point as CGPoint, eoFill as Boolean) as Boolean
		    
		    return CGPathContainsPoint(me, nil, p, eoFill)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsPoint(p as CGPoint, m as CGAffineTransform, eoFill as Boolean = false) As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathContainsPoint lib CarbonFramework (path as Ptr, ByRef m as CGAffineTransform, point as CGPoint, eoFill as Boolean) as Boolean
		    
		    return CGPathContainsPoint(me, m, p, eoFill)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path as CGPath)
		  if path is nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathCreateCopy lib CarbonFramework (path as Ptr) as Ptr
		    
		    me.Adopt CGPathCreateCopy(path), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentPoint() As CGPoint
		  if me = nil then
		    return CGPointMake(0, 0)
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathGetCurrentPoint lib CarbonFramework (path as Ptr) as CGPoint
		    
		    return CGPathGetCurrentPoint(me)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRect(rect as CGRect) As Boolean
		  if me = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    soft declare function CGPathIsRect lib CarbonFramework (path as Ptr, ByRef rect as CGRect) as Boolean
		    
		    
		    return CGPathIsRect(me, rect)
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return false
			end if
			
			#if targetMacOS
			soft declare function CGPathIsEmpty lib CarbonFramework (path as Ptr) as Boolean
			
			return CGPathIsEmpty(me)
			#endif
			End Get
		#tag EndGetter
		IsEmpty As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsEmpty"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
