#tag Class
Class NSBezierPath
Inherits NSObject
	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Sub addClip()
		  // Intersects the area enclosed by the receiver's path with the clipping path of the current graphics context and makes the resulting shape the current clipping path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub addClip lib Cocoalib selector "addClip" (obj_ID as Ptr) 
		    addClip (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Sub appendBezierPath(aPath as NSBezierPath)
		   // Appends the contents of the specified path object to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		    appendBezierPath (self, aPath)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320616E2061726320746F20746865207265636569766572E280997320706174682E
		Sub appendBezierPathWithArcFromPointtoPoint(fromPoint as NSPoint, toPoint as NSPoint, radius as Single)
		   // Appends an arc to the receiver’s path.
		  
		  // fromPoint:
		  // The middle point of the angle.
		  // toPoint:
		  // The end point of the angle.
		  // radius:
		  // The radius of the circle inscribed in the angle.
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArc lib Cocoalib selector "appendBezierPathWithArcFromPoint:toPoint:radius:" (obj_ID as Ptr, fromPoint as NSPoint, toPoint as NSPoint, radius as Single)
		    appendBezierPathWithArc (self, fromPoint, toPoint, radius)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320616E20617263206F66206120636972636C6520746F20746865207265636569766572E280997320706174682E
		Sub appendBezierPathWithArcWithCenter(center as NSPoint, radius as Single, startAngle as Single, endAngle as Single)
		   // Appends an arc of a circle to the receiver’s path.
		  
		  // center:
		  // Specifies the center point of the circle used to define the arc.
		  // radius:
		  // Specifies the radius of the circle used to define the arc.
		  // startAngle:
		  // Specifies the starting angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // endAngle:
		  // Specifies the end angle of the arc, measured in degrees counterclockwise from the x-axis.
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArcWithCenter lib Cocoalib selector "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:" _
		    (obj_ID as Ptr, center as NSPoint, radius as Single, startAngle as Single, endAngle as Single )
		    appendBezierPathWithArcWithCenter (self, center, radius, startAngle, endAngle)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320616E20617263206F66206120636972636C6520746F20746865207265636569766572E280997320706174682E
		Sub appendBezierPathWithArcWithCenter(center as NSPoint, radius as Single, startAngle as Single, endAngle as Single, clockwise as boolean)
		   // Appends an arc of a circle to the receiver’s path.
		  
		  // center:
		  // Specifies the center point of the circle used to define the arc.
		  // radius:
		  // Specifies the radius of the circle used to define the arc.
		  // startAngle:
		  // Specifies the starting angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // endAngle:
		  // Specifies the end angle of the arc, measured in degrees counterclockwise from the x-axis.
		  // clockwise
		  // True if you want the arc to be drawn in a clockwise direction; otherwise False to draw the arc in a counterclockwise direction.
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithArcWithCenterclockwise lib Cocoalib selector "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:" _
		    (obj_ID as Ptr, center as NSPoint, radius as Single, startAngle as Single, endAngle as Single, clockwise as boolean )
		    appendBezierPathWithArcWithCenterclockwise (self, center, radius, startAngle, endAngle, clockwise)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320616E206F76616C207061746820746F207468652072656365697665722C20696E7363726962696E6720746865206F76616C20696E20746865207370656369666965642072656374616E676C652E
		Sub appendBezierPathWithOvalinRect(aRect as NSRect)
		   // Appends an oval path to the receiver, inscribing the oval in the specified rectangle.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithOvalInRect lib Cocoalib selector "appendBezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect)
		    appendBezierPathWithOvalInRect (self, aRect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320616E2061726320746F20746865207265636569766572E280997320706174682E
		Attributes( "Not implemented" )  Sub appendBezierPathWithPackedGlyphs(aRect as NSRect)
		   // PlaceHolder, not implemented yet
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPathWithOvalInRect lib Cocoalib selector "appendBezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect)
		  // appendBezierPathWithOvalInRect (self, aRect)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Sub appendBezierPathWithPoints(points() as NSPoint, count as integer = -1)
		   // Appends the contents of the specified path object to the receiver’s path.
		  
		  //set up an array we can pass
		  dim pointsarray as new NSArray ("NSPoint")
		  pointsarray = NSArray.CreateFromObjectsArray (points)
		  
		  // and add count. Check user‘s entry before so it won‘t crash (or calculate anyway if the user did not enter a count)
		  
		  dim realcount as Integer
		  if count > pointsarray.count or count < 1 then
		    realcount = pointsarray.Count
		  else
		    realcount = count
		  end if
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithPoints lib Cocoalib selector "appendBezierPathWithPoints:count:" (obj_ID as Ptr, points as Ptr, count as integer) 
		    appendBezierPathWithPoints (self, pointsarray, realcount)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E647320612072656374616E67756C6172207061746820746F20746865207265636569766572E280997320706174682E
		Sub appendBezierPathWithRect(aRect as NSRect)
		   // Appends a rectangular path to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithRect lib Cocoalib selector "appendBezierPathWithRect:" (obj_ID as Ptr, aRect as NSRect) 
		    appendBezierPathWithRect (self, aRect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E6473206120726F756E6465642072656374616E67756C6172207061746820746F20746865207265636569766572E280997320706174682E
		Sub appendBezierPathWithRoundedRect(aRect as NSRect, xRadius as Single, yRadius as Single)
		   // Appends a rounded rectangular path to the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub appendBezierPathWithRoundedRect lib Cocoalib selector "appendBezierPathWithRoundedRect:xRadius:yRadius:" (obj_ID as Ptr, aRect as NSRect, xRadius as Single, yRadius as Single) 
		    appendBezierPathWithRoundedRect (self, aRect, xRadius, yRadius)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Attributes( "Not implemented" )  Sub appendBezierWithGlyph(aPath as NSBezierPath)
		   // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphinFont(aPath as NSBezierPath)
		   // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphs(aPath as NSBezierPath)
		   // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Attributes( "Not implemented" )  Sub appendBezierWithGlyphsinFont(aPath as NSBezierPath)
		   // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865206172656120656E636C6F736564206279207468652072656365697665722773207061746820776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		Attributes( "Not implemented" )  Sub appendBezierWithPackedGlyphs(aPath as NSBezierPath)
		   // Placeholder, not implemented yet!
		  
		  
		  
		  // #if TargetMacOS
		  // Declare Sub appendBezierPath lib Cocoalib selector "appendBezierPath:" (obj_ID as Ptr, aPath as Ptr) 
		  // appendBezierPath (self, aPath)
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E6577204E5342657A69657250617468206F626A6563742E
		 Shared Function bezierPath() As NSBezierPath
		  // Creates and returns a new NSBezierPath object.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPath lib Cocoalib selector "bezierPath" (id as ptr) as Ptr
		     return cocoa.NSObjectFromNSPtr (bezierPath (ClassRef), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E73206120E2809C666C617474656E6564E2809D20636F7079206F66207468652072656365697665722E
		Function bezierPathByFlatteningPath() As NSBezierPath
		  // Creates and returns a “flattened” copy of the receiver.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathByFlatteningPath lib Cocoalib selector "bezierPathByFlatteningPath" (obj_ID as Ptr) as Ptr
		    dim bezierRef as Ptr = bezierPathByFlatteningPath (self)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E6577204E5342657A69657250617468206F626A65637420776974682074686520726576657273656420636F6E74656E7473206F6620746865207265636569766572E280997320706174682E
		Function bezierPathByReversingPath() As NSBezierPath
		  // Creates and returns a new NSBezierPath object with the reversed contents of the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathByReversingPath lib Cocoalib selector "bezierPathByReversingPath" (obj_ID as Ptr) as Ptr
		    dim bezierRef as Ptr = bezierPathByReversingPath (self)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function bezierPathWithOvalInRect(aRect as NSRect) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with an oval path inscribed in the specified rectangle.
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithOvalInRect lib Cocoalib selector "bezierPathWithOvalInRect:" (obj_ID as Ptr, aRect as NSRect) as Ptr
		    dim bezierRef as Ptr = bezierPathWithOvalInRect (classref, aRect)
		    return new NSBezierPath(bezierRef)
		    
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E6577204E5342657A69657250617468206F626A65637420696E697469616C697A6564207769746820612072656374616E67756C617220706174682E
		 Shared Function bezierPathWithRect(aRect as NSRect) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with a rectangular path.
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithRect lib Cocoalib selector "bezierPathWithRect:" (obj_ID as Ptr, arect as nsrect) as Ptr
		    dim bezierRef as Ptr = bezierPathWithRect (classref, aRect)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E642072657475726E732061206E6577204E5342657A69657250617468206F626A65637420696E697469616C697A65642077697468206120726F756E6465642072656374616E67756C617220706174682E
		 Shared Function bezierPathWithRoundedRect(aRect as NSRect, xRadius as Single, yRadius as Single) As NSBezierPath
		  // Creates and returns a new NSBezierPath object initialized with a rounded rectangular path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bezierPathWithRoundedRect lib Cocoalib selector "bezierPathWithRoundedRect:xRadius:yRadius:" (obj_ID as Ptr, arect as nsrect, xRadius as Single, yRadius as Single) as Ptr
		    dim bezierRef as Ptr = bezierPathWithRoundedRect (classref, aRect, xRadius, yRadius)
		    return new NSBezierPath(bezierRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520626F756E64696E6720626F78206F6620746865207265636569766572E280997320706174682E
		Function bounds() As NSRect
		  // Returns the bounding box of the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function bounds lib Cocoalib selector "bounds" (obj_ID as Ptr) as NSRect
		    return bounds (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSBezierPath")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E746572736563747320746865207370656369666965642072656374616E676C6520776974682074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E7465787420616E64206D616B65732074686520726573756C74696E67207368617065207468652063757272656E7420636C697070696E6720706174682E
		 Shared Sub clipRect(aRect as NSRect)
		  // Intersects the specified rectangle with the clipping path of the current graphics context and makes the resulting shape the current clipping path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub clipRect lib Cocoalib selector "clipRect:" (id as ptr, aRect as NSRect) 
		     clipRect (ClassRef, aRect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436C6F73657320746865206D6F737420726563656E746C7920616464656420737562706174682E
		Sub closePath()
		  // Closes the most recently added subpath.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub closePath lib Cocoalib selector "closePath" (obj_ID as Ptr)
		    closePath (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  //Holding the constructor private so one can only create a Bezier with the appropriate Class methods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120426F6F6C65616E2076616C756520696E6469636174696E6720776865746865722074686520726563656976657220636F6E7461696E73207468652073706563696669656420706F696E742E
		Function containsPoint(aPoint as NSPoint) As boolean
		  // Returns a Boolean value indicating whether the receiver contains the specified point.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function containsPoint lib Cocoalib selector "containsPoint:" (obj_ID as Ptr, aPoint as NSPoint) as boolean
		    return containsPoint (self, aPoint)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520626F756E64696E6720626F78206F6620746865207265636569766572E280997320706174682E
		Function controlPointBounds() As NSRect
		  // Returns the bounding box of the receiver’s path, including any control points.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function controlPointBounds lib Cocoalib selector "controlPointBounds" (obj_ID as Ptr) as NSRect
		    return controlPointBounds (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207265636569766572E28099732063757272656E7420706F696E74202874686520747261696C696E6720706F696E74206F7220656E64696E6720706F696E7420696E20746865206D6F737420726563656E746C79206164646564207365676D656E74292E
		Function currentPoint() As NSPoint
		  // Returns the receiver’s current point (the trailing point or ending point in the most recently added segment).
		  
		  
		  
		  #if TargetMacOS
		    Declare Function currentPoint lib Cocoalib selector "currentPoint" (obj_ID as Ptr) as NSPoint
		    return currentPoint (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4164647320612042657A69657220637562696320637572766520746F20746865207265636569766572E280997320706174682E
		Sub curveToPoint(aPoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		   // Adds a Bezier cubic curve to the receiver’s path.
		  
		  // aPoint:
		  // The destination point of the curve segment, specified in the current coordinate system
		  // controlPoint1:
		  // The point that determines the shape of the curve near the current point.
		  // controlPoint2:
		  // The point that determines the shape of the curve near the destination point.
		  
		  
		  #if TargetMacOS
		    Declare Sub curveToPoint lib Cocoalib selector "curveToPoint:controlPoint1:controlPoint2:" (obj_ID as Ptr, Apoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		    curveToPoint (self, aPoint, controlPoint1, controlPoint2)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652074797065206F66207061746820656C656D656E74206174207468652073706563696669656420696E6465782E
		Function elementAtIndex(index as integer) As NSBezierPathElement
		  // Returns the type of path element at the specified index.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function elementAtIndex lib Cocoalib selector "elementAtIndex:" (obj_ID as Ptr, index as Integer) as NSBezierPathElement
		    return elementAtIndex (self, index)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 476574732074686520656C656D656E74207479706520616E642028616E64206F7074696F6E616C6C792920746865206173736F63696174656420706F696E747320666F7220746865207061746820656C656D656E74206174207468652073706563696669656420696E6465782E
		Attributes( "Not working yet" )  Function elementAtIndex(index as integer, byref points() as NSPoint) As NSBezierPathElement
		  // Gets the element type and (and optionally) the associated points for the path element at the specified index.
		  
		  //set up an array we can pass
		  
		  // not working yet!
		  
		  // dim pointsarray as new NSArray ("NSPoint")
		  // pointsarray = NSArray.CreateFromObjectsArray (points)
		  // 
		  // 
		  // #if TargetMacOS
		  // Declare Function elementAtIndex lib Cocoalib selector "elementAtIndex:associatedPoints:" (obj_ID as Ptr, points as ptr) as NSBezierPathElement
		  // dim tempElement as NSBezierPathElement = elementAtIndex (self, index, pointsarray)
		  // points = pointsarray
		  // return tempElement
		  // #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520746F74616C206E756D626572206F66207061746820656C656D656E747320696E20746865207265636569766572277320706174682E
		Function elementCount() As Integer
		  // Returns the total number of path elements in the receiver's path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function elementCount lib Cocoalib selector "elementCount" (obj_ID as Ptr) as Integer
		    return elementCount (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5061696E74732074686520726567696F6E20656E636C6F73656420627920746865207265636569766572E280997320706174682E
		Sub fill()
		  // Paints the region enclosed by the receiver’s path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub fill lib Cocoalib selector "fill" (obj_ID as Ptr)
		    fill (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub fillRect(aRect as NSRect)
		  // Fills the specified rectangular path with the current fill color.
		  
		  
		  #if TargetMacOS
		    Declare Sub fillRect lib Cocoalib selector "fillRect:" (id as ptr, aRect as NSRect)
		    fillRect (ClassRef, aRect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520746F74616C206E756D626572206F66207061746820656C656D656E747320696E20746865207265636569766572277320706174682E
		Attributes( "not working yet!" )  Sub getLineDash(byref pattern() as single, byref count as Integer, byref Phase as single)
		  // Returns the line-stroking pattern for the receiver.
		  
		  // not working!
		  
		  dim patternarray as new memoryblock (pattern.ubound + 1 * 4)
		  dim patternpointer as ptr = patternarray
		  
		  #if TargetMacOS
		    Declare Sub getLineDash lib Cocoalib selector "getLineDash:count:phase:" (obj_ID as Ptr, byref patternpointer as Ptr, byref count as integer, byref phase as single)
		    getLineDash (self, patternpointer, count, phase)
		    patternarray = Cocoa.NSObjectFromNSPtr (patternpointer)
		    msgbox str(patternarray.Size)+", "+str(count) +", "+str(phase)
		    // pattern = returnarray
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520626F756E64696E6720626F78206F6620746865207265636569766572E280997320706174682E
		Function isEmpty() As Boolean
		  // Returns a Boolean value indicating whether the receiver is empty.
		  
		  
		  
		  #if TargetMacOS
		    Declare Function isEmpty lib Cocoalib selector "isEmpty" (obj_ID as Ptr) as Boolean
		    return isEmpty (self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E64732061207374726169676874206C696E6520746F20746865207265636569766572E28099732070617468
		Sub linetoPoint(aPoint as NSPoint)
		  // Appends a straight line to the receiver’s path
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub lineToPoint lib Cocoalib selector "lineToPoint:" (obj_ID as Ptr, aPoint as NSPoint)
		    lineToPoint (self, aPoint)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520626F756E64696E6720626F78206F6620746865207265636569766572E280997320706174682E
		Sub moveToPoint(aPoint as NSPoint)
		  // Moves the receiver’s current point to the specified location.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub moveToPoint lib Cocoalib selector "moveToPoint:" (obj_ID as Ptr, Apoint as NSPoint)
		    moveToPoint (self, aPoint)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4164647320612042657A69657220637562696320637572766520746F20746865207265636569766572E280997320706174682066726F6D207468652063757272656E7420706F696E7420746F2061206E6577206C6F636174696F6E2C2077686963682069732073706563696669656420617320612072656C61746976652064697374616E63652066726F6D207468652063757272656E7420706F696E742E
		Sub relativeCurveToPoint(aPoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		   // Adds a Bezier cubic curve to the receiver’s path from the current point to a new location, which is specified as a relative distance from the current point.
		  
		  // aPoint:
		  // The destination point of the curve segment, specified in the current coordinate system
		  // controlPoint1:
		  // The point that determines the shape of the curve near the current point.
		  // controlPoint2:
		  // The point that determines the shape of the curve near the destination point.
		  // All points are interpreted as a relative offset from the current point.
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeCurveToPoint lib Cocoalib selector "relativeCurveToPoint:controlPoint1:controlPoint2:" (obj_ID as Ptr, Apoint as NSPoint, controlPoint1 as NSPoint, controlPoint2 as NSPoint)
		    relativeCurveToPoint (self, aPoint, controlPoint1, controlPoint2)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E64732061207374726169676874206C696E65207365676D656E7420746F20746865207265636569766572E28099732070617468207374617274696E67206174207468652063757272656E7420706F696E7420616E64206D6F76696E6720746F7761726473207468652073706563696669656420706F696E742C2072656C617469766520746F207468652063757272656E74206C6F636174696F6E2E
		Sub relativeLinetoPoint(aPoint as NSPoint)
		  // Appends a straight line segment to the receiver’s path starting at the current point and moving towards the specified point, relative to the current location.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeLineToPoint lib Cocoalib selector "relativeLineToPoint:" (obj_ID as Ptr, aPoint as NSPoint)
		    relativeLineToPoint (self, aPoint)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D6F76657320746865207265636569766572E28099732063757272656E7420706F696E7420746F2061206E657720706F696E742077686F7365206C6F636174696F6E20697320746865207370656369666965642064697374616E63652066726F6D207468652063757272656E7420706F696E742E
		Sub relativeMoveToPoint(aPoint as NSPoint)
		  // Moves the receiver’s current point to a new point whose location is the specified distance from the current point.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub relativeMoveToPoint lib Cocoalib selector "relativeMoveToPoint:" (obj_ID as Ptr, Apoint as NSPoint)
		    relativeMoveToPoint (self, aPoint)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C207061746820656C656D656E74732066726F6D207468652072656365697665722C206566666563746976656C7920636C656172696E672074686520706174682E
		Sub removeAllPoints()
		  // Removes all path elements from the receiver, effectively clearing the path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub removeAllPoints lib Cocoalib selector "removeAllPoints" (obj_ID as Ptr)
		    removeAllPoints (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4368616E6765732074686520706F696E7473206173736F63696174656420776974682074686520737065636966696564207061746820656C656D656E742E
		Sub setAssociatedPoints(points () as NSPoint, atIndex as Integer)
		  // Changes the points associated with the specified path element.
		  
		  // points
		  // A C-style array containing up to three NSPoint data types. This parameter must contain the correct number of points for the path element at the specified index. Move, close path, and line segment commands require one point. Curve operations require three points.
		  // index
		  // The index of the path element you want to modify.
		  
		  //set up an array we can pass
		  dim pointsarray as new NSArray ("NSPoint")
		  pointsarray = NSArray.CreateFromObjectsArray (points)
		  
		  // and add count. Check user‘s entry before so it won‘t crash (or calculate anyway if the user did not enter a count)
		  
		  
		  #if TargetMacOS
		    Declare Sub setAssociatedPoints lib Cocoalib selector "setAssociatedPoints:atIndex:" (obj_ID as Ptr, points as Ptr, atIndex as Integer)
		    setAssociatedPoints (self, pointsarray, atIndex)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265706C616365732074686520636C697070696E672070617468206F66207468652063757272656E7420677261706869637320636F6E74657874207769746820746865206172656120696E7369646520746865207265636569766572277320706174682E
		Sub setClip()
		  // Replaces the clipping path of the current graphics context with the area inside the receiver's path.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub setClip lib Cocoalib selector "setClip" (obj_ID as Ptr) 
		    setClip (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206C696E652D7374726F6B696E67207061747465726E20666F72207468652072656365697665722E
		Sub setLineDash(pattern() as single, count as Integer, Phase as single)
		  // Sets the line-stroking pattern for the receiver.
		  
		  // pattern:
		  // A C-style array of floating point values that contains the lengths (measured in points) of the line segments and gaps in the pattern. The values in the array alternate, starting with the first line segment length, followed by the first gap length, followed by the second line segment length, and so on
		  // count:
		  // The number of values in pattern.
		  // phase:
		  // The offset at which to start drawing the pattern, measured in points along the dashed-line pattern. For example, a phase of 6 in the pattern 5-2-3-2 would cause drawing to begin in the middle of the first gap
		  
		  
		  // create a memoryblock from pattern() to pass it to the Sub
		  
		  const sizeofsingle=4
		  dim patternCount as Integer = pattern.ubound+1
		  dim m as new MemoryBlock(patternCount * sizeOfSingle)
		  for i as integer = 0 to patternCount-1
		    m.SingleValue(i*sizeOfSingle) = pattern(i)
		  next
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub setLineDash lib Cocoalib selector "setLineDash:count:phase:" (obj_ID as Ptr, pattern as ptr, count as integer, phase as single)
		    setLineDash (self, m, count, phase)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44726177732061206C696E6520616C6F6E6720746865207265636569766572E28099732070617468207573696E67207468652063757272656E74207374726F6B6520636F6C6F7220616E642064726177696E6720617474726962757465732E
		Sub stroke()
		  // Draws a line along the receiver’s path using the current stroke color and drawing attributes.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub stroke lib Cocoalib selector "stroke" (obj_ID as Ptr)
		    stroke (self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5374726F6B65732061206C696E65206265747765656E2074776F20706F696E7473207573696E67207468652063757272656E74207374726F6B6520636F6C6F7220616E64207468652064656661756C742064726177696E6720617474726962757465732E
		 Shared Sub strokeLine(point1 as NSPoint, point2 as NSPoint)
		  // Strokes a line between two points using the current stroke color and the default drawing attributes.
		  
		  
		  #if TargetMacOS
		    Declare Sub strokeLine lib Cocoalib selector "strokeLineFromPoint:toPoint:" (id as ptr, Point1 as NSPoint, Point2 as NSPoint)
		    strokeLine (ClassRef, point1, point2)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5374726F6B6573207468652070617468206F6620746865207370656369666965642072656374616E676C65207573696E67207468652063757272656E74207374726F6B6520636F6C6F7220616E64207468652064656661756C742064726177696E6720617474726962757465732E
		 Shared Sub strokeRect(aRect as NSRect)
		  // Strokes the path of the specified rectangle using the current stroke color and the default drawing attributes.
		  
		  
		  #if TargetMacOS
		    Declare Sub strokeRect lib Cocoalib selector "strokeRect:" (id as ptr, aRect as NSRect)
		    strokeRect (ClassRef, aRect)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44726177732061206C696E6520616C6F6E6720746865207265636569766572E28099732070617468207573696E67207468652063757272656E74207374726F6B6520636F6C6F7220616E642064726177696E6720617474726962757465732E
		Sub transform(aTransform as Cocoa.NSAffineTransform)
		  // Transforms all points in the receiver using the specified transform.
		  
		  
		  
		  #if TargetMacOS
		    Declare Sub transformUsingAffineTransform lib Cocoalib selector "transformUsingAffineTransform:" (obj_ID as Ptr, aTransform as ptr)
		    transformUsingAffineTransform (self, aTransform)
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		This is the implementation of Cocoa.NSBezierPath. See
		https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSBezierPath_Class/Reference/Reference.html#
		
		To use it, either set up a new instance with one of the Class‘ bezierPath… shared methods
		or set the class‘ defualt properties and draw directly to the parent.
		Check the NSBezierpathwindow for some examples in the Canvas‘ paint code.
		
		The glyph functions are not yet implemented
		
		Written 2014 by Ulrich Bogun for MacOSLib
		with a lot of help from Jim McKay
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default flatness value for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default flatness value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultFlatness lib Cocoalib selector "defaultFlatness" (id as ptr) as single
			    return defaultFlatness (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default flatness value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultFlatness lib Cocoalib selector "setDefaultFlatness:" (id as ptr, avalue as single)
			     setdefaultFlatness (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultFlatness As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default Line Cap Style for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line cap style for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineCapStyle lib Cocoalib selector "defaultLineCapStyle" (id as ptr) as NSLineCapStyle
			    return defaultLineCapStyle (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default Line Cap Style value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineCapStyle lib Cocoalib selector "setDefaultLineCapStyle:" (id as ptr, avalue as NSLineCapStyle)
			     setDefaultLineCapStyle (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineCapStyle As NSLineCapStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default line join style for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line join style for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineJoinStyle lib Cocoalib selector "defaultLineJoinStyle" (id as ptr) as NSLineJoinStyle
			    return defaultLineJoinStyle (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default Line Join Style value for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineJoinStyle lib Cocoalib selector "setDefaultLineJoinStyle:" (id as ptr, avalue as NSLineJoinStyle)
			     setDefaultLineJoinStyle (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineJoinStyle As NSLineJoinStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the default line width for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default line width for the all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultLineWidth lib Cocoalib selector "defaultLineWidth" (id as ptr) as Single
			    return defaultLineWidth (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default lie width for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultLineWidth lib Cocoalib selector "setDefaultLineWidth:" (id as ptr, avalue as single)
			     setDefaultLineWidth (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultLineWidth As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Sets the default miter limit for all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default miter limit for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultMiterLimit lib Cocoalib selector "defaultMiterLimit" (id as ptr) as Single
			    return defaultMiterLimit (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default miter limit for all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultMiterLimit lib Cocoalib selector "setDefaultMiterLimit:" (id as ptr, avalue as single)
			     setDefaultMiterLimit (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultMiterLimit As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Gets or sets the winding rule used to fill all paths.
		#tag EndNote
		#tag Getter
			Get
			  // Returns the default winding rule used to fill all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function defaultWindingRule lib Cocoalib selector "defaultWindingRule" (id as ptr) as NSWindingRule
			    return defaultWindingRule (ClassRef)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the default winding rule used to fill all paths.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setDefaultWindingRule lib Cocoalib selector "setDefaultWindingRule:" (id as ptr, avalue as NSWindingRule)
			     setDefaultWindingRule (ClassRef, value)
			  #endif
			End Set
		#tag EndSetter
		Shared defaultWindingRule As NSWindingRule
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the flatness value of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function flatness lib Cocoalib selector "flatness" (id as ptr) as single
			    return flatness (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the flatness value for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setFlatness lib Cocoalib selector "setFlatness:" (id as ptr, avalue as single)
			     setFlatness (Self, value)
			  #endif
			End Set
		#tag EndSetter
		Flatness As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the line cap style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function lineCapStyle lib Cocoalib selector "lineCapStyle" (id as ptr) as NSLineCapStyle
			    return lineCapStyle (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line cap style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineCapStyle lib Cocoalib selector "setLineCapStyle:" (id as ptr, avalue as NSLineCapStyle)
			     setLineCapStyle (Self, value)
			  #endif
			End Set
		#tag EndSetter
		LineCapStyle As NSLineCapStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the receiver’s line join style.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function LineJoinStyle lib Cocoalib selector "LineJoinStyle" (id as ptr) as NSLineJoinStyle
			    return LineJoinStyle (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line join style for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineJoinStyle lib Cocoalib selector "setLineJoinStyle:" (id as ptr, avalue as NSLineJoinStyle)
			     setLineJoinStyle (Self, value)
			  #endif
			End Set
		#tag EndSetter
		LineJoinStyle As NSLineJoinStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the line width of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function lineWidth lib Cocoalib selector "lineWidth" (id as ptr) as Single
			    return lineWidth (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the line width of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setLineWidth lib Cocoalib selector "setLineWidth:" (id as ptr, avalue as single)
			     setLineWidth (Self, value)
			  #endif
			End Set
		#tag EndSetter
		LineWidth As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the miter limit of the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Function miterLimit lib Cocoalib selector "miterLimit" (id as ptr) as Single
			    return miterLimit (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the miter limit for the receiver's path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setMiterLimit lib Cocoalib selector "setMiterLimit:" (id as ptr, avalue as single)
			     setMiterLimit (Self, value)
			  #endif
			End Set
		#tag EndSetter
		MiterLimit As single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Gets the winding rule for the path. This value may be either NSNonZeroWindingRule or NSEvenOddWindingRule.
			  
			  
			  #if TargetMacOS
			    Declare Function windingRule lib Cocoalib selector "windingRule" (id as ptr) as NSWindingRule
			    return windingRule (Self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets the winding rule used to fill the receiver’s path.
			  
			  
			  
			  #if TargetMacOS
			    Declare Sub setWindingRule lib Cocoalib selector "setWindingRule:" (id as ptr, avalue as NSWindingRule)
			     setWindingRule (Self, value)
			  #endif
			End Set
		#tag EndSetter
		WindingRule As NSWindingRule
	#tag EndComputedProperty


	#tag Enum, Name = NSBezierPathElement, Type = Integer, Flags = &h0
		NSMoveToBezierPathElement
		  NSLineToBezierPathElement
		  NSCurveToBezierPathElement
		NSClosePathBezierPathElement
	#tag EndEnum

	#tag Enum, Name = NSLineCapStyle, Type = Integer, Flags = &h0
		NSButtLineCapStyle   = 0
		  NSRoundLineCapStyle  = 1
		NSSquareLineCapStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSLineJoinStyle, Type = Integer, Flags = &h0
		NSMiterLineJoinStyle = 0
		  NSRoundLineJoinStyle = 1
		NSBevelLineJoinStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSWindingRule, Type = Integer, Flags = &h0
		NSNonZeroWindingRule = 0
		NSEvenOddWindingRule = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flatness"
			Group="Behavior"
			Type="single"
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
			Name="LineWidth"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MiterLimit"
			Group="Behavior"
			Type="single"
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
