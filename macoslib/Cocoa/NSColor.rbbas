#tag Class
Class NSColor
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function AlternateSelectedControlColor() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_alternateSelectedControlColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function AlternateSelectedControlTextColor() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_alternateSelectedControlTextColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Black() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_blackColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Blue() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_blueColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Brown() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_brownColor)
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function ClassMethodDelegate(class_id as Ptr) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		 Shared Function Clear() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_clearColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ComputeColorValue() As Color
		  #if TargetMacOS
		    dim c as NSColor = me.ConvertColorspace("NSCalibratedRGBColorSpace")
		    
		    soft declare sub getRGBComponents lib Cocoa selector "getRed:green:blue:alpha:" (id as Ptr, ByRef red as Single, ByRef green as Single, ByRef blue as Single, alpha as Ptr)
		    
		    dim red as Single
		    dim green as Single
		    dim blue as Single
		    
		    if c<>nil then
		      getRGBComponents c.id, red, green, blue, nil
		    else
		      getRGBComponents me.id, red, green, blue, nil
		    end if
		    
		    return RGB(255.0*red, 255.0*green, 255.0*blue)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as Color, alpha as Double = 1.0)
		  #if TargetMacOS
		    soft declare function NSClassFromString lib Cocoa (aClassName as CFStringRef) as Ptr
		    soft declare function colorFromRGBA lib Cocoa selector "colorWithCalibratedRed:green:blue:alpha:" (class_id as Ptr, red as Single, green as Single, blue as Single, alpha as Single) as Ptr
		    
		    me.m_id = colorFromRGBA(NSClassFromString("NSColor"), c.Red/255, c.Green/255, c.Blue/255, alpha)
		    
		  #else
		    #pragma unused c
		    #pragma unused alpha
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(obj_id as Ptr)
		  me.m_id = obj_id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ControlTint(controlTint as Integer) As NSColor
		  #if TargetMacOS
		    soft declare function NSClassFromString lib Cocoa (aClassName as CFStringRef) as Ptr
		    soft declare function colorForControlTint lib Cocoa selector "colorForControlTint:" (id as Ptr, controlTint as Integer) as Ptr
		    
		    
		    dim c as new NSColor
		    c.m_id = colorForControlTint(NSClassFromString(NSClassName), controlTint)
		    return c
		    
		  #else
		    #pragma unused controlTint
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ControlTintBlue() As NSColor
		  const NSBlueControlTint = 1
		  return ControlTint(NSBlueControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ControlTintClear() As NSColor
		  const NSClearControlTint = 7
		  return ControlTint(NSClearControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ControlTintDefault() As NSColor
		  const NSDefaultControlTint  = 0
		  return ControlTint(NSDefaultControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ControlTintGraphite() As NSColor
		  const NSGraphiteControlTint  = 6
		  return ControlTint(NSGraphiteControlTint)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertColorspace(spaceName as String) As NSColor
		  #if TargetMacOS
		    soft declare function colorUsingColorSpaceName lib Cocoa selector "colorUsingColorSpaceName:" (id as Ptr, colorSpace as CFStringRef) as Ptr
		    
		    dim p as Ptr = colorUsingColorSpaceName(me.id, spaceName)
		    if p <> nil then
		      if p = me.id then
		        return me
		      else
		        dim c as new NSColor
		        c.m_id = p
		        return c
		      end if
		    else
		      //conversion could not be done
		      return nil
		    end if
		    
		  #else
		    #pragma unused spaceName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Cyan() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_cyanColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DarkGray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_darkGrayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Gray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_grayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Green() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_greenColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LightGray() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_lightGrayColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Magenta() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_magentaColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeObjectFromClassMethod(d as ClassMethodDelegate) As NSColor
		  #if TargetMacOS
		    soft declare function NSClassFromString lib Cocoa (aClassName as CFStringRef) as Ptr
		    
		    dim c as new NSColor
		    c.m_id = d.Invoke(NSClassFromString(NSClassName))
		    return c
		    
		  #else
		    #pragma unused d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_alternateSelectedControlColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function alternateSelectedControlColor lib Cocoa selector "alternateSelectedControlColor" (id as Ptr) as Ptr
		    
		    return alternateSelectedControlColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_alternateSelectedControlTextColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function alternateSelectedControlTextColor lib Cocoa selector "alternateSelectedControlTextColor" (id as Ptr) as Ptr
		    
		    return alternateSelectedControlTextColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blackColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function blackColor lib Cocoa selector "blackColor" (id as Ptr) as Ptr
		    
		    return blackColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_blueColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function blueColor lib Cocoa selector "blueColor" (id as Ptr) as Ptr
		    
		    return blueColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_brownColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function brownColor lib Cocoa selector "brownColor" (id as Ptr) as Ptr
		    
		    return brownColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_clearColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function clearColor lib Cocoa selector "clearColor" (id as Ptr) as Ptr
		    
		    return clearColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_cyanColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function cyanColor lib Cocoa selector "cyanColor" (id as Ptr) as Ptr
		    
		    return cyanColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_darkGrayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function darkGrayColor lib Cocoa selector "darkGrayColor" (id as Ptr) as Ptr
		    
		    return darkGrayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_grayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function grayColor lib Cocoa selector "grayColor" (id as Ptr) as Ptr
		    
		    return grayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_greenColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function greenColor lib Cocoa selector "greenColor" (id as Ptr) as Ptr
		    
		    return greenColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_lightGrayColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function lightGrayColor lib Cocoa selector "lightGrayColor" (id as Ptr) as Ptr
		    
		    return lightGrayColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_magentaColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function magentaColor lib Cocoa selector "magentaColor" (id as Ptr) as Ptr
		    
		    return magentaColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_orangeColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function orangeColor lib Cocoa selector "orangeColor" (id as Ptr) as Ptr
		    
		    return orangeColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_purpleColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function purpleColor lib Cocoa selector "purpleColor" (id as Ptr) as Ptr
		    
		    return purpleColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_redColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function redColor lib Cocoa selector "redColor" (id as Ptr) as Ptr
		    
		    return redColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_whiteColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function whiteColor lib Cocoa selector "whiteColor" (id as Ptr) as Ptr
		    
		    return whiteColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function m_yellowColor(class_id as Ptr) As Ptr
		  #if TargetMacOS
		    soft declare function yellowColor lib Cocoa selector "yellowColor" (id as Ptr) as Ptr
		    
		    return yellowColor(class_id)
		    
		  #else
		    #pragma unused class_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(c as NSColor) As Integer
		  if c is nil then
		    return 1
		  else
		    return Integer(me.id) - Integer(c.id)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Color
		  return self.ColorValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Orange() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_orangeColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Purple() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_purpleColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Red() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_redColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  return  ColorValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function White() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_whiteColor)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Yellow() As NSColor
		  #if TargetMacOS
		    return MakeObjectFromClassMethod(AddressOf m_yellowColor)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    soft declare function colorSpaceName lib Cocoa selector "colorSpaceName" (id as Ptr) as CFStringRef
			    
			    return colorSpaceName(me.id)
			  #endif
			End Get
		#tag EndGetter
		ColorspaceName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //On my machine, the first invocation of ComputeColorValue takes 1000 µs; subsequent invocations take around 20µs.  With caching, subsequent invocations
			  //take around 1 µs.  Since the caching is internal, simply implemented and NSColor as implemented here is immutable, I figure it's worth the one-time effort.
			  
			  if not self.rbcolorcomputed then
			    self.rbcolor = self.ComputeColorValue
			    self.rbcolorcomputed = true
			  end if
			  
			  return self.rbcolor
			End Get
		#tag EndGetter
		ColorValue As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private rbcolor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private rbcolorcomputed As Boolean
	#tag EndProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSColor", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ColorspaceName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorValue"
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
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
End Class
#tag EndClass
