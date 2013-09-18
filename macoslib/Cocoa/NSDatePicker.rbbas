#tag Class
Class NSDatePicker
Inherits NSControl
	#tag Event
		Function NSClassName() As String
		  return "NSDatePicker"
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BackgroundColor() As Color
		  #if targetCocoa
		    declare function backgroundColor lib CocoaLib selector "backgroundColor" (id as Ptr) as Ptr
		    
		    return new NSColor(backgroundColor(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BackgroundColor(assigns value as Color)
		  #if targetCocoa
		    declare sub setBackgroundColor lib CocoaLib selector "setBackgroundColor:" (id as Ptr, c as Ptr)
		    
		    setBackgroundColor self,  new NSColor(value)
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateValue() As NSDate
		  #if targetCocoa
		    declare function dateValue lib CocoaLib selector "dateValue" (id as Ptr) as Ptr
		    
		    dim p as Ptr = dateValue(self.id)
		    if p <> nil then
		      return new NSDate(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DateValue(assigns value as NSDate)
		  #if targetCocoa
		    declare sub setDateValue lib CocoaLib selector "setDateValue:" (id as Ptr, newStartDate as Ptr)
		    
		    setDateValue self.id, value
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isBezeled lib CocoaLib selector "isBezeled" (id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return isBezeled(self.id)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setBezeled lib CocoaLib selector "setBezeled:" (id as Ptr, value as Boolean)
			    
			    if self.id <> nil then
			      setBezeled self.id, value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Bezeled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isBordered lib CocoaLib selector "isBordered" (id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return isBordered(self.id)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setBordered lib CocoaLib selector "setBordered:" (id as Ptr, value as Boolean)
			    
			    if self.id <> nil then
			      setBordered self.id, value
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
			  #if targetCocoa
			    declare function getCalendar lib CocoaLib selector "calendar" (id as Ptr) as Ptr
			    
			    if self.id <> nil then
			      dim p as Ptr = getCalendar(self.id)
			      if p <> nil then
			        return new NSCalendar(p)
			      else
			        return nil
			      end if
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setCalendar lib CocoaLib selector "setCalendar:" (id as Ptr, newCalendar as Ptr)
			    
			    if self.id <> nil then
			      if value <> nil then
			        setCalendar self.id, value
			      else
			        setCalendar self.id, nil
			      end if
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Calendar As NSCalendar
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function drawsBackground lib CocoaLib selector "drawsBackground" (id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return drawsBackground(self)
			    else
			      return false
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setDrawsBackground lib CocoaLib selector "setDrawsBackground:" (id as Ptr, flag as Boolean)
			    
			    setDrawsBackground self, value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		DrawsBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function getLocale lib CocoaLib selector "locale" (id as Ptr) as Ptr
			    
			    if self.id <> nil then
			      dim p as Ptr = getLocale(self.id)
			      if p <> nil then
			        return new NSLocale(p)
			      else
			        return nil
			      end if
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setLocale lib CocoaLib selector "setLocale:" (id as Ptr, newLocale as Ptr)
			    
			    if self.id <> nil then
			      if value <> nil then
			        setLocale self.id, value
			      else
			        setLocale self.id, nil
			      end if
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Locale As NSLocale
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function maxDate lib CocoaLib selector "maxDate" (id as Ptr) as Ptr
			    
			    if self.id <> nil then
			      dim p as Ptr = maxDate(self.id)
			      if p <> nil then
			        return new NSDate(p)
			      else
			        return nil
			      end if
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setMaxDate lib CocoaLib selector "setMaxDate:" (id as Ptr, d as Ptr)
			    
			    if self.id <> nil then
			      if value <> nil then
			        setMaxDate self.id, value
			      else
			        setMaxDate self.id, nil
			      end if
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MaxDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function minDate lib CocoaLib selector "minDate" (id as Ptr) as Ptr
			    
			    if self.id <> nil then
			      dim p as Ptr = minDate(self.id)
			      if p <> nil then
			        return new NSDate(p)
			      else
			        return nil
			      end if
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setMinDate lib CocoaLib selector "setMinDate:" (id as Ptr, d as Ptr)
			    
			    if self.id <> nil then
			      if value <> nil then
			        setMinDate self.id, value
			      else
			        setMinDate self.id, nil
			      end if
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		MinDate As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function datePickerMode lib CocoaLib selector "datePickerMode" (id as Ptr) as NSDatePickerMode
			    
			    if self.id <> nil then
			      return datePickerMode(self.id)
			    else
			      return NSDatePickerMode.SingleMode
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setDatePickerMode lib CocoaLib selector "setDatePickerMode:" (id as Ptr, newMode as NSDatePickerMode)
			    
			    if self.id <> nil then
			      setDatePickerMode self.id, value
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Mode As NSDatePickerMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function datePickerStyle lib CocoaLib selector "datePickerStyle" (id as Ptr) as Integer
			    
			    if self.id <> nil then
			      return datePickerStyle(self)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setDatePickerStyle lib CocoaLib selector "setDatePickerStyle:" (id as Ptr, value as Integer)
			    if self.id <> nil then
			      setDatePickerStyle self, value
			    else
			      //
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Style As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function getTimeZone lib CocoaLib selector "timeZone" (id as Ptr) as Ptr
			    
			    if self.id <> nil then
			      dim p as Ptr = getTimeZone(self.id)
			      if p <> nil then
			        return new NSTimeZone(p)
			      else
			        return nil
			      end if
			    else
			      return nil
			    end if
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetCocoa
			    declare sub setTimeZone lib CocoaLib selector "setTimeZone:" (id as Ptr, newTimeZone as Ptr)
			    
			    if self.id <> nil then
			      if value <> nil then
			        setTimeZone self.id, value
			      else
			        setTimeZone self.id, nil
			      end if
			    end if
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		TimeZone As NSTimeZone
	#tag EndComputedProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSClockAndCalendar, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextField, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSTextFieldAndStepper, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag Enum, Name = NSDatePickerMode, Type = Integer, Flags = &h0
		SingleMode = 0
		RangeMode = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExpansionToolTips"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bezeled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bordered"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawsBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FloatValue"
			Group="Behavior"
			Type="Single"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Style"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0.0"
			Type="double"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underlined"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
