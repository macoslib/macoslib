#tag Window
Begin Window AxialShadingExample
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Core Graphics Axial Shading"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Shading = new CGShading(CGColorSpace.GenericRGB, CGPointMake(0.0, 0.5), CGPointMake(1.0, 0.5), NewCallbackFunction(CGColorSpace.GenericRGB), false, false)
		  
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
		  context.BeginPath
		  static Pi as Double = 4.0*ATan(1.)
		  context.AddArc 0.5, 0.5, 0.3, 0.0, Pi, 0
		  context.ClosePath
		  context.Clip
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
		Private Shared Sub CalculateShadingValues(info as Ptr, inSingleArray as Ptr, outSingleArray as Ptr)
		  if info = nil then
		    return
		  end if
		  if inSingleArray = nil then
		    return
		  end if
		  if outSingleArray = nil then
		    return
		  end if
		  
		  dim lastColorComponentIndex as Integer = info.Int32(0) - 2
		  dim c() as Double = Array(1.0, 0.0, 0.5, 0.0)
		  dim v as Single = inSingleArray.Single(0)
		  dim offset as Integer = 0
		  const sizeOfSingle = 4
		  for k as Integer = 0 to lastColorComponentIndex
		    outSingleArray.Single(offset) = c(k)*v
		    offset = offset + sizeOfSingle
		  next
		  outSingleArray.Single(offset) = 1.0 //sets the alpha value for the color
		  offset = offset + sizeOfSingle
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
		This is the example "Painting an Axial Shading" from the Quartz 2D Programming Guide at developer.apple.com.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shading As CGShading
	#tag EndProperty


#tag EndWindowCode

