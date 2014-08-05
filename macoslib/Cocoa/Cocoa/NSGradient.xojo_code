#tag Class
Class NSGradient
Inherits NSObject
	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F6C6F72207370616365206F662074686520636F6C6F7273206173736F636961746564207769746820746865204E534772616469656E742E
		Function ColorSpace() As Cocoa.NSColorspace
		  // Returns the color space of the colors associated with the NSGradient.
		  // In the current version of MacOSLib, the line for ColorSpace in cocoa.NSObjectFromNSPtr has to be de-commented in order to make this funtion work.
		  
		  #if TargetMacOS
		    Declare Function colorSpace lib cocoalib selector "colorSpace"  (id as ptr) as ptr
		    return cocoa.NSObjectFromNSPtr (colorSpace ( self ), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ColorArray() as NSColor)
		  // Original Name: initWithColors:
		  
		  // Initializes a newly allocated gradient object with an array of colors.
		  // First and last NSColor are positioned at 0 and 1.0 (start and end),
		  // others are evenly distributed.
		  
		  // Use: myGradient = new NSGradient (NSColorArray)
		  
		  
		  #if TargetMacOS
		    Declare Function initWithColors lib cocoalib selector "initWithColors:" (id as ptr, ColorArray as Ptr) as Ptr
		    
		    // InitWithColors demands an NSArray wirh NSColors, so we create one:
		    dim colors as new NSArray (ColorArray, false)
		    
		    super.Constructor (initWithColors (Allocate("NSGradient"), colors), false)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Attributes( Constructor = "forwarding to initWithColors:atLocations:colorSpace:" )  Sub Constructor(ColorArray() as NSColor, atLocations() as Double)
		  // // Original Name: initWithColorsAndLocations
		  // 
		  // // Initializes a newly allocated gradient object with the specified colors and color locations.
		  // // Locations are singles from 0.0 to 1.0
		  // // Use: myGradient = new NSGradient (NSColorArray, LocationsArray)
		  // 
		  
		  
		  // Note: This doesn‘t work. I couldn‘t figure out how to pass the values correctly.
		  // As a tweak use the  initWithColors:atLocations:colorSpace:constructor with a prechosen RGB ColorSpace
		  
		  self.Constructor (ColorArray, atLocations, NSColorspace.DeviceRGBColorSpace)
		  // 
		  // #if TargetMacOS
		  // Declare Function initWithColorsAndLocations lib "Cocoa" selector "initWithColorsAndLocations:" (id as ptr, ColorAndLocations as Ptr) as Ptr
		  // 
		  // 
		  // // InitWithColors in its original demands a comma-separated list of NSColors and their positions, so we create one:
		  // 
		  // dim colorblock As new MemoryBlock(20*(ColorArray.Ubound+1))
		  // 
		  // //colorblock is a memoryblock a la   r g b a r g b a r g b a + its position
		  // // Thanks to Jim McKay for this information!
		  // 
		  // for i as integer=0 to ColorArray.Ubound
		  // colorblock.SingleValue(i*20)=ColorArray(i).RedComponent
		  // colorblock.SingleValue(i*20+4)=ColorArray(i).GreenComponent
		  // colorblock.SingleValue(i*20+8)=ColorArray(i).BlueComponent
		  // colorblock.SingleValue(i*20+12)=ColorArray(i).AlphaComponent
		  // colorblock.SingleValue(i*20+16)=atlocations(i)
		  // next
		  // 
		  // 
		  // 
		  // super.Constructor ( initWithColorsAndLocations (Allocate("NSGradient"), colorblock), false)
		  // 
		  // 
		  // #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ColorArray() as NSColor, atLocations() as Double, ColSpace as NSColorSpace)
		  // Original Name: initWithColors:atLocations:colorSpace:
		  
		  // Initializes a newly allocated gradient object with the specified colors, color locations, and color space.
		  // Locations are singles from 0.0 to 1.0
		  // Use: myGradient = new NSGradient (NSColorArray, LocationsArray, ColorSpace)
		  
		  
		  #if TargetMacOS
		    Declare Function initwithColorsAtLocationColorSpace lib cocoalib selector "initWithColors:atLocations:colorSpace:" (id as ptr, ColorArray as Ptr, atLocations as Ptr, ColSpace as Ptr) as Ptr
		    
		    Declare Function colorSpace lib cocoalib selector "colorSpace"  (id as ptr) as ptr // to convert the Ptr to a new ColorSpace
		    // In order to make this work, the Constructor of MacOSLib‘s NSColorSpace Class has to be made public.
		    // In fact it seems to miss the correct constructors (InitWith… methods)
		    
		    // InitWithColors demands an NSArray wirh NSColors, so we create one:
		    dim colors as new NSArray (ColorArray, false)
		    
		    // and we build a single memoryblock from the atLocations array pointer
		    dim locs As new MemoryBlock(4*(atlocations.Ubound+1))
		    for i as integer=0 to atlocations.Ubound
		      locs.SingleValue(i*4)=atlocations(i)
		    next
		    
		    // As last one the Colorspace
		    dim cs as  NSColorspace = cocoa.NSObjectFromNSPtr (ColSpace , false)
		    
		    super.Constructor ( initwithColorsAtLocationColorSpace (Allocate("NSGradient"), colors, locs, colspace), false)
		    
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000, Description = 496E697469616C697A65732061206E65776C7920616C6C6F6361746564206772616469656E74206F626A65637420776974682074776F20636F6C6F72732E0A496E697469616C697A65732061206E65776C7920616C6C6F6361746564206772616469656E74206F626A65637420776974682074776F20636F6C6F72732E0A0A
		Sub Constructor(Startcolor as NSColor, EndColor as NSColor)
		  // Original Name: initWithStartingColor:endingColor:
		  
		  // Initializes a newly allocated gradient object with two colors.
		  // Use: myGradient = new NSGradient (StartColor, EndColor)
		  
		  
		  #if TargetMacOS
		    Declare Function InitWithStartingColor_EndingColor lib cocoalib selector "initWithStartingColor:endingColor:"  (id as ptr, Startcolor as ptr, EndColor as ptr) as Ptr
		    super.Constructor ( InitWithStartingColor_EndingColor ( Allocate("NSGradient"), startcolor, endcolor), false)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261777320612072616469616C206772616469656E74206265747765656E207468652073706563696669656420636972636C65732E
		Sub DrawFromCenterToCenter(StartCenter as NSPoint, startRadius as single, endCenter as NSPoint, endRadius as single, options as NSGradientDrawingOptions = NSGradientDrawingOptions.NSGradientStopsatBothLocations)
		  // Draws a radial gradient between the specified circles.
		  // Options can be set to extend both points to fill the entire painted area beyond their limits.
		  
		  #if TargetMacOS
		    Declare sub drawFromCenter_RadiusToCenter_Radius_Options lib cocoalib selector "drawFromCenter:radius:toCenter:radius:options:"  (id as ptr, startCenter as nspoint, startradius as single, endCenter as nspoint, endRadius as Single, options as NSGradientDrawingOptions)
		    drawFromCenter_RadiusToCenter_Radius_Options ( self, startCenter, startRadius, endCenter, endRadius, options )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44726177732061204E534772616469656E742066726F6D205374617274506F696E7420746F20746F506F696E7420616E6420657874656E64732074686520706F696E7473206265796F6E64206966206F7074696F6E732061726520736574206163636F7264696E676C792E
		Sub DrawFromPointToPoint(startingPoint as NSPoint, toPoint as NSPoint, options as NSGradientDrawingOptions = NSGradientDrawingOptions.NSGradientStopsatBothLocations)
		  // Draws a linear gradient between the specified start and end points.
		  // Options can be set to extend both points to fill the entire painted area beyond their limits.
		  
		  #if TargetMacOS
		    Declare sub drawFromPoint lib cocoalib selector "drawFromPoint:toPoint:options:"  (id as ptr, startingPoint as nspoint, toPoint as nspoint, options as NSGradientDrawingOptions)
		    
		    drawFromPoint ( self, startingPoint, toPoint, options )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696C6C7320746865207370656369666965642072656374616E676C6520776974682061206C696E656172206772616469656E742E
		Sub DrawInBezierPath(path as NSBezierPath, angle as Single)
		  // Fills the specified rectangle with a linear gradient.
		  // The angle of rotation determines which corner contains the start color; see Table 1 in Apple docs.
		  
		  #if TargetMacOS
		    Declare sub DrawInBezierPath lib cocoalib selector "drawInBezierPath:angle:"  (id as ptr, path as ptr, angle as single)
		    
		    
		    DrawInBezierPath ( self, path, angle )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261777320612072616469616C206772616469656E74207374617274696E67206174207468652063656E74657220706F696E74206F66207468652073706563696669656420706174682E
		Sub DrawInBezierPathRelativeCenter(path as NSBezierPath, relativeCenterPosition as NSPoint)
		  // Draws a radial gradient starting at the center point of the specified path.
		  // Relative center positions have to be between (-1.0, -1.0) and (1.0, 1.0)
		  
		  #if TargetMacOS
		    Declare sub DrawInBezierPathRelativeCenter lib cocoalib selector "drawInBezierPath:relativeCenterPosition:"  (id as ptr, path as ptr, relativeCenterPosition as NSPoint)
		    
		    
		    DrawInBezierPathRelativeCenter ( self, path, relativeCenterPosition )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696C6C7320746865207370656369666965642072656374616E676C6520776974682061206C696E656172206772616469656E742E
		Sub DrawInRect(myRect as nsRect, angle as Single)
		  // Fills the specified rectangle with a linear gradient.
		  // The angle of rotation determines which corner contains the start color; see Table 1 in Apple docs.
		  
		  #if TargetMacOS
		    Declare sub DrawinRect lib cocoalib selector "drawInRect:angle:"  (id as ptr, myrect as nsrect, angle as single)
		    
		    DrawInRect ( self, myrect, angle )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261777320612072616469616C206772616469656E74207374617274696E67206174207468652063656E746572206F6620746865207370656369666965642072656374616E676C652E
		Sub DrawInRectRelativeCenterPosition(myRect as nsRect, relativeCenterPosition as NSPoint)
		  // Draws a radial gradient starting at the center of the specified rectangle.
		  // The relative position is a NSPoint made from singles  between -1.0 and 1.0 
		  
		  #if TargetMacOS
		    Declare sub drawInRectRelativeCenterPosition lib cocoalib selector "drawInRect:relativeCenterPosition:"  (id as ptr, myrect as nsrect, relativeCenterPosition as NSPoint)
		    
		    drawInRectRelativeCenterPosition ( self, myrect, relativeCenterPosition )
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320696E666F726D6174696F6E2061626F75742074686520636F6C6F722073746F70206174207468652073706563696669656420696E64657820696E20746865207265636569766572E280997320636F6C6F722061727261792E
		Sub GetColor(byref getColor as NSColor, byref location as Single, atIndex as Integer)
		  // Returns information about the color stop at the specified index in the receiver’s color array.
		  
		  #if TargetMacOS
		    dim colorptr as ptr = getcolor
		    Declare sub getColorlocationatIndex lib CocoaLib selector "getColor:location:atIndex:"  (id as ptr, byref colorptr as ptr, byref location as single, atIndex as Integer)
		    getColorlocationatIndex ( self, colorptr, location, atIndex )
		    GetColor = cocoa.NSObjectFromNSPtr  (colorptr, true, true)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636F6C6F72206F66207468652072656E6465726564206772616469656E7420617420746865207370656369666965642072656C6174697665206C6F636174696F6E2E
		Function interpolatedColorAtLocation(location as single) As NSColor
		  // Returns the color of the rendered gradient at the specified relative location.
		  // index needs to be between 0.0 and 1.0
		  
		  
		  
		  #if TargetMacOS
		    Declare Function interpolatedColorAtLocation lib CocoaLib selector "interpolatedColorAtLocation:"  (id as ptr, location as single) as Ptr
		    
		    return cocoa.NSObjectFromNSPtr (interpolatedColorAtLocation ( self, location ), false)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F6620436F6C6F722053746F707320746861742068617665206265656E2064657369676E656420666F722074686973204E534772616469656E742E
		Function NumberofColorStops() As Integer
		  // Returns the number of Color Stops that have been designed for this NSGradient.
		  
		  #if TargetMacOS
		    Declare Function NumberOfColorStops lib cocoalib selector "numberOfColorStops"  (id as ptr) as integer
		    return numberOfColorStops ( self )
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Read Me
		This is the Cocoa.NSGradient Class for easy color gradients.
		See https://developer.apple.com/library/mac/documentation/Cocoa/Reference/NSGradient_class/Reference/Reference.html for details.
		
		To use it, create an instance of this Class first by passing the appropriate values to the Constructor method 
		(see initWith… tasks in Apple doc) and then have it draw inside an object with one of the Draw methods.
		
		To make the ColorSpace method work, the line for ColorSpace in cocoa.NSObjectFromNSPtr in MacOSLib has to be de-commented.
		
		Written 2014 by Ulrich Bogun for MacOSLib
	#tag EndNote


	#tag Enum, Name = NSGradientDrawingOptions, Type = Integer, Flags = &h0
		NSGradientStopsatBothLocations = 0
		  NSGradientDrawsBeforeStartingLocation = 1
		  NSGradientDrawsAfterEndingLocation = 2
		NSGradientDrawsAfterBothLocations = 3
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
