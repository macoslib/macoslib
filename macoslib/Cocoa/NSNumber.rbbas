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
			    declare function longValue lib CocoaLib selector "longValue" (obj_id as Ptr) as Int32
			    
			    return longValue(self)
			  #endif
			End Get
		#tag EndGetter
		Int32Value As Int32
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function stringValue lib CocoaLib selector "stringValue" (obj_id as Ptr) as Ptr
			    
			    return RetainedStringValue(stringValue(self))
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedShortValue lib CocoaLib selector "unsignedShortValue" (obj_id as Ptr) as Int16
			    
			    return unsignedShortValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt16Value As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedLongValue lib CocoaLib selector "unsignedLongValue" (obj_id as Ptr) as UInt32
			    
			    return unsignedLongValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt32Value As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedLongLongValue lib CocoaLib selector "unsignedLongLongValue" (obj_id as Ptr) as UInt64
			    
			    return unsignedLongLongValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt64Value As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function unsignedCharValue lib CocoaLib selector "unsignedCharValue" (obj_id as Ptr) as UInt8
			    
			    return unsignedCharValue(self)
			  #endif
			End Get
		#tag EndGetter
		UInt8Value As UInt8
	#tag EndComputedProperty


End Class
#tag EndClass
