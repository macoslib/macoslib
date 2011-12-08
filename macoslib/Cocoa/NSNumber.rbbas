#tag Class
Class NSNumber
Inherits NSValue
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function boolValue lib CocoaLib selector "boolValue" (obj_id as Ptr) as Boolean
			    
			    return boolValue(self)
			  #endif
			End Get
		#tag EndGetter
		BooleanValue As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function doubleValue lib CocoaLib selector "doubleValue" (obj_id as Ptr) as Double
			    
			    return doubleValue(self)
			  #endif
			End Get
		#tag EndGetter
		DoubleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function shortValue lib CocoaLib selector "shortValue" (obj_id as Ptr) as Int16
			    
			    return shortValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int16Value As Int16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function longLongValue lib CocoaLib selector "longLongValue" (obj_id as Ptr) as Int64
			    
			    return longLongValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int64Value As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function charValue lib CocoaLib selector "charValue" (obj_id as Ptr) as Int8
			    
			    return charValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int8Value As Int8
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function integerValue lib CocoaLib selector "integerValue" (obj_id as Ptr) as Integer
			    
			    return integerValue(self)
			  #endif
			End Get
		#tag EndGetter
		IntegerValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function floatValue lib CocoaLib selector "floatValue" (obj_id as Ptr) as Single
			    
			    return floatValue(self)
			  #endif
			End Get
		#tag EndGetter
		SingleValue As Single
	#tag EndComputedProperty


End Class
#tag EndClass
