#tag Class
Class NSBezierPath
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddClip()
		  #if targetMacOS
		    declare sub addClip lib Framework selector "addClip" (obj_id as Ptr)
		    
		    addClip(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  return Cocoa.NSClassFromString("NSBezierPath")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub ClipRect(rect as Cocoa.NSRect)
		  #if targetMacOS
		    declare sub clipRect lib Framework selector "clipRect:" (class_id as Ptr, aRect as Cocoa.NSRect)
		    
		    clipRect(ClassRef, rect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if targetMacOS
		    declare function bezierPath lib Framework selector "bezierPath" (class_id as Ptr) as Ptr
		    
		    self.Constructor(bezierPath(Cocoa.NSClassFromString("NSBezierPath")), not hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Create(p as Ptr) As NSBezierPath
		  #if targetMacOS
		    return new NSBezierPath(p, not hasOwnership)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateOval(rect as Cocoa.NSRect) As NSBezierPath
		  #if targetMacOS
		    //returns an NSBezierPath representing an oval drawn inside the bounding box rect.
		    
		    declare function bezierPathWithOvalInRect lib Framework selector "bezierPathWithOvalInRect:" (class_id as Ptr, rect as Cocoa.NSRect) as Ptr
		    
		    return Create(bezierPathWithOvalInRect(ClassRef, rect))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateRect(rect as Cocoa.NSRect) As NSBezierPath
		  #if targetMacOS
		    declare function bezierPathWithRect lib Framework selector "bezierPathWithRect:" (class_id as Ptr, rect as Cocoa.NSRect) as Ptr
		    
		    return Create(bezierPathWithRect(ClassRef, rect))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateRoundedRect(rect as Cocoa.NSRect, xRadius as Double, yRadius as Double) As NSBezierPath
		  #if targetMacOS
		    declare function bezierPath lib Framework selector "bezierPathWithRoundedRect:xRadius:yRadius:" (class_id as Ptr, rect as Cocoa.NSRect, xRadius as Double, yRadius as Double) as Ptr
		    
		    return Create(bezierPath(ClassRef, rect, xRadius, yRadius))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub FillRect(rect as Cocoa.NSRect)
		  #if targetMacOS
		    declare sub fillRect lib Framework selector "fillRect:" (class_id as Ptr, rect as Cocoa.NSRect)
		    
		    fillRect(ClassRef, rect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToPoint(point as Cocoa.NSPoint)
		  #if targetMacOS
		    declare sub moveToPoint lib Framework selector "moveToPoint:"  (obj_id as Ptr, point as Cocoa.NSPoint)
		    
		    moveToPoint(self, point)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub StrokeLine(startPoint as Cocoa.NSPoint, endPoint as Cocoa.NSPoint)
		  #if targetMacOS
		    declare sub strokeLine lib Framework selector "strokeLineFromPoint:toPoint:" (class_id as Ptr, point1 as Cocoa.NSPoint, point2 as Cocoa.NSPoint)
		    
		    strokeLine(ClassRef, startPoint, endPoint)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub StrokeRect(rect as Cocoa.NSRect)
		  #if targetMacOS
		    declare sub strokeRect lib Framework selector "strokeRect:" (class_id as Ptr, rect as Cocoa.NSRect)
		    
		    strokeRect(ClassRef, rect)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function defaultFlatness lib Framework selector "defaultFlatness" (class_id as Ptr) as Double
			    
			    return defaultFlatness(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setDefaultFlatness lib Framework selector "setDefaultFlatness:" (class_id as Ptr, value as Double)
			    
			    setDefaultFlatness(ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared DefaultFlatness As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function defaultLineCapStyle lib Framework selector "defaultLineCapStyle" (class_id as Ptr) as LineCapStyle
			    
			    return defaultLineCapStyle(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setDefaultLineCapStyle lib Framework selector "setDefaultLineCapStyle:" (class_id as Ptr, value as LineCapStyle)
			    
			    setDefaultLineCapStyle(ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared DefaultLineCapStyle As LineCapStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function defaultLineJoinStyle lib Framework selector "defaultLineJoinStyle" (class_id as Ptr) as LineJoinStyle
			    
			    return defaultLineJoinStyle(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setDefaultLineJoinStyle lib Framework selector "setDefaultLineJoinStyle:" (class_id as Ptr, value as LineJoinStyle)
			    
			    setDefaultLineJoinStyle(ClassRef, value)
			  #endif
			  
			  
			End Set
		#tag EndSetter
		Shared DefaultLineJoinStyle As LineJoinStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function defaultLineWidth lib Framework selector "defaultLineWidth" (class_id as Ptr) as Double
			    
			    return defaultLineWidth(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setDefaultLineWidth lib Framework selector "setDefaultLineWidth:" (class_id as Ptr, value as Double)
			    
			    setDefaultLineWidth(ClassRef, value)
			  #endif
			  
			  
			End Set
		#tag EndSetter
		Shared DefaultLineWidth As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function defaultMiterLimit lib Framework selector "defaultMiterLimit" (class_id as Ptr) as Double
			    
			    return defaultMiterLimit(ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setDefaultMiterLimit lib Framework selector "setDefaultMiterLimit:" (class_id as Ptr, value as Double)
			    
			    setDefaultMiterLimit(ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared DefaultMiterLimit As Double
	#tag EndComputedProperty


	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Private
	#tag EndConstant


	#tag Enum, Name = LineCapStyle, Type = Integer, Flags = &h0
		Butt = 0
		  Round = 1
		Square = 2
	#tag EndEnum

	#tag Enum, Name = LineJoinStyle, Type = Integer, Flags = &h0
		Miter = 0
		  Round = 1
		Bevel = 2
	#tag EndEnum

	#tag Enum, Name = WindingRule, Type = Integer, Flags = &h0
		NonZero = 0
		EvenOdd = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
