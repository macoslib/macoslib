#tag Class
Class NSKnobSlider
Inherits NSSlider
	#tag Event
		Sub Open()
		  
		  me.Type = 1
		  
		  RaiseEvent  Open
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
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
			Name="AllowsTickMarkValuesOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="NSSlider"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AltIncrementValue"
			Group="Behavior"
			Type="Double"
			InheritedFrom="NSSlider"
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
			Name="Bold"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
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
			InitialValue="32"
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
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
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
			InitialValue="0"
			InheritedFrom="Object"
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
			Name="MaxValue"
			Visible=true
			Group="Initial State"
			InitialValue="100"
			Type="Double"
			InheritedFrom="NSSlider"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinValue"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Double"
			InheritedFrom="NSSlider"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfTickMarks"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="NSSlider"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="NSSlider"
			#tag EnumValues
				"0 - Regular"
				"1 - Small"
				"2 - Mini"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
			InheritedFrom="NSControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Group="Position"
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
			Group="Position"
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
			Name="TickPosition"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="NSSlider"
			#tag EnumValues
				"1 - Top Left"
				"0 - Bottom Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="NSSlider"
			#tag EnumValues
				"0 - Linear"
				"1 - Circular"
			#tag EndEnumValues
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
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Double"
			InheritedFrom="NSSlider"
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
			InitialValue="32"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
