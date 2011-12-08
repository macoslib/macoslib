#tag Class
Class NSNumber
Inherits NSValue
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  #if targetMacOS
		    static p as Ptr = Cocoa.NSClassFromString("NSNumber")
		    return p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Boolean)
		  #if targetMacOS
		    declare function numberWithBool lib CocoaLib selector "numberWithBool:" (class_id as Ptr, value as Boolean) as Ptr
		    
		    self.Constructor(numberWithBool(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Double)
		  #if targetMacOS
		    declare function numberWithDouble lib CocoaLib selector "numberWithDouble:" (class_id as Ptr, value as Double) as Ptr
		    
		    self.Constructor(numberWithDouble(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int16)
		  #if targetMacOS
		    declare function numberWithShort lib CocoaLib selector "numberWithShort:" (class_id as Ptr, value as Int16) as Ptr
		    
		    self.Constructor(numberWithShort(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int32)
		  #if targetMacOS
		    declare function numberWithLong lib CocoaLib selector "numberWithLong:" (class_id as Ptr, value as Int32) as Ptr
		    
		    self.Constructor(numberWithLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int64)
		  #if targetMacOS
		    declare function numberWithLongLong lib CocoaLib selector "numberWithLongLong:" (class_id as Ptr, value as Int64) as Ptr
		    
		    self.Constructor(numberWithLongLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Int8)
		  #if targetMacOS
		    declare function numberWithChar lib CocoaLib selector "numberWithChar:" (class_id as Ptr, value as Int8) as Ptr
		    
		    self.Constructor(numberWithChar(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as Single)
		  #if targetMacOS
		    declare function numberWithFloat lib CocoaLib selector "numberWithFloat:" (class_id as Ptr, value as Single) as Ptr
		    
		    self.Constructor(numberWithFloat(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt16)
		  #if targetMacOS
		    declare function numberWithUnsignedShort lib CocoaLib selector "numberWithUnsignedShort:" (class_id as Ptr, value as UInt16) as Ptr
		    
		    self.Constructor(numberWithUnsignedShort(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt32)
		  #if targetMacOS
		    declare function numberWithUnsignedLong lib CocoaLib selector "numberWithUnsignedLong:" (class_id as Ptr, value as UInt32) as Ptr
		    
		    self.Constructor(numberWithUnsignedLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt64)
		  #if targetMacOS
		    declare function numberWithUnsignedLongLong lib CocoaLib selector "numberWithUnsignedLongLong:" (class_id as Ptr, value as UInt64) as Ptr
		    
		    self.Constructor(numberWithUnsignedLongLong(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value as UInt8)
		  #if targetMacOS
		    declare function numberWithUnsignedChar lib CocoaLib selector "numberWithUnsignedChar:" (class_id as Ptr, value as UInt8) as Ptr
		    
		    self.Constructor(numberWithUnsignedChar(ClassRef, value))
		  #endif
		End Sub
	#tag EndMethod


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


	#tag ViewBehavior
		#tag ViewProperty
			Name="BooleanValue"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			Type="Integer"
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
			Name="objCType"
			Group="Behavior"
			Type="String"
			InheritedFrom="NSValue"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SingleValue"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Group="Behavior"
			Type="String"
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
