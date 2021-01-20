#tag Window
Begin Window RadialShadingExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Core Graphics Radial Shading"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.Shading = new CGShading(CGColorSpace.GenericRGB, CGPointMake(0.25, 0.3), 0.1, CGPointMake(0.7, 0.7), .25, NewCallbackFunction(CGColorSpace.GenericRGB), false, false)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim context as new CGContextGraphicsPort(g)
		  dim t as CGAffineTransform = CoreGraphics.CGAffineTransformMakeScale(g.Width, g.Height)
		  context.ConcatCTM t
		  context.SaveGState
		  context.ClipToRect CGRectMake(0.0, 0.0, 1.0, 1.0)
		  context.SetFillColor &cffffff, 1
		  context.FillRect CGRectMake(0.0, 0.0, 1.0, 1.0)
		  context.DrawShading self.Shading
		  context.RestoreGState
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Shared Sub CalculateShadingValues(info as Ptr, inDoubleArray as Ptr, outDoubleArray as Ptr)
		  if info = nil then
		    break
		  end if
		  if inDoubleArray = nil then
		    break
		  end if
		  if outDoubleArray = nil then
		    break
		  end if
		  
		  dim lastColorComponentIndex as Integer = info.Int32(0) - 2
		  dim frequency() as Double = Array(55.0, 220.0, 110.0, 0.0)
		  dim x as Double = inDoubleArray.Double(0)
		  dim offset as Integer = 0
		  
		  for k as Integer = 0 to lastColorComponentIndex
		    outDoubleArray.Double(offset) = (1.0 + Sin(x*frequency(k)))/2.0
		    offset = offset + SizeOfDouble
		  next
		  outDoubleArray.Double(offset) = 1.0 //sets the alpha value
		  offset = offset + SizeOfDouble
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewCallbackFunction(colorspace as CGColorSpace) As CGFunction
		  dim inputValueRange() as Double = Array(0.0, 1.0)
		  dim outputValueRange() as Double = Array(0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0)
		  
		  dim callbacks as CGFunctionCallbacks
		  callbacks.version = 0
		  callbacks.evaluate = AddressOf CalculateShadingValues
		  callbacks.releaseInfo = nil
		  
		  dim components as new MemoryBlock(4)
		  components.Long(0) = colorspace.ComponentCount + 1
		  return new CGFunction(components, inputValueRange, outputValueRange, callbacks)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Example Source
		This is the example "Painting a Radial Shading" from the Quartz 2D Programming Guide at developer.apple.com.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shading As CGShading
	#tag EndProperty


#tag EndWindowCode

