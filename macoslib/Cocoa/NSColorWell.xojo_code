#tag Class
Class NSColorWell
Inherits NSControl
	#tag Event
		Sub Action()
		  // unused event
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function NSClassName() As String
		  return "NSColorWell"
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  self.Bordered = self.initialbordered
		  
		  raiseEvent Open
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Activate(exclusive as boolean = false)
		  //# Activates the NSColorWell, displays the color panel, and makes the current color the same as its own.
		  
		  #if targetCocoa
		    declare sub activate lib CocoaLib selector "activate:" (id as Ptr, exclusive as Boolean)
		    
		    activate(self.id, exclusive)
		  #else
		    #pragma unused exclusive
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deactivate()
		  //# Deactivates the NSColorWell and redraws it.
		  
		  #if targetCocoa
		    declare sub deactivate lib CocoaLib selector "deactivate" (id as Ptr)
		    
		    deactivate(self.id)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawWellInside(insideRect as Cocoa.NSRect)
		  //# Draws the colored area inside the NSColorWell at the specified location without drawing borders.
		  
		  #if targetCocoa
		    declare sub drawWellInside lib CocoaLib selector "drawWellInside:" (id as Ptr, insideRect as Cocoa.NSRect)
		    
		    drawWellInside(self.id, insideRect)
		  #else
		    #pragma unused insideRect
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsActive() As Boolean
		  //# Returns a Boolean value indicating whether the NSColorWell is active.
		  
		  #if targetCocoa
		    declare function isActive lib CocoaLib selector "isActive" (id as Ptr) as Boolean
		    
		    return isActive(self.id)
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns a Boolean value indicating whether the NSColorWell has a border.
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function isBordered lib CocoaLib selector "isBordered" (id as Ptr) as Boolean
			      
			      return isBordered(self.id)
			      
			    else
			      return self.initialbordered
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Places or removes a border on the NSColorWell and redraws the NSColorWell.
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setBordered lib CocoaLib selector "setBordered:"  (id as Ptr, bordered as Boolean)
			      
			      setBordered self.id, value
			    else
			      self.initialbordered = value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Bordered As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //# Returns the color of the NSColorWell.
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare function colour lib CocoaLib selector "color" (id as Ptr) as Ptr
			      
			      return new NSColor(colour(self.id))
			    else
			      return &cFFFFFF
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //# Sets the color of the NSColorWell and redraws the NSColorWell.
			  
			  #if targetCocoa
			    if self.id <> nil then
			      declare sub setColour lib CocoaLib selector "setColor:"  (id as Ptr, colour as Ptr)
			      
			      setColour self.id, new NSColor(value)
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Colour As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private initialbordered As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="NSTextAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Right"
				"2 - Center"
				"3 - Justified"
				"4 - Natural"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bordered"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="27"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="48"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
