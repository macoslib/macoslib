#tag Class
Class CFNumber
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(value as Double)
		  #if targetMacOS
		    soft declare function CFNumberCreate Lib CarbonFramework (allocator as Ptr, theType as Integer, ByRef valuePtr as Double) as Ptr
		    
		    me.Adopt CFNumberCreate(nil, kCFNumberDoubleType, value), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Integer)
		  #if targetMacOS
		    soft declare function CFNumberCreate Lib CarbonFramework (allocator as Ptr, theType as Integer, ByRef valuePtr as Integer) as Ptr
		    
		    me.Adopt CFNumberCreate(nil, kCFNumberSInt32Type, value), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NaN() As CFNumber
		  const kCFNumberNaN = "kCFNumberNaN"
		  static v as CFNumber = SpecialValue(kCFNumberNaN)
		  return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PositiveInfinity() As CFNumber
		  const kCFNumberPositiveInfinity = "kCFNumberPositiveInfinity"
		  static v as CFNumber = SpecialValue(kCFNumberPositiveInfinity)
		  return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NegativeInfinity() As CFNumber
		  const kCFNumberNegativeInfinity = "kCFNumberNegativeInfinity"
		  static v as CFNumber = SpecialValue(kCFNumberNegativeInfinity)
		  return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SpecialValue(symbolName as String) As CFNumber
		  // Note: I (TT) have changed the behavior in case the symbolName can't be found:
		  // Instead of returning a number (0), it returns nil so that the failure can be detected.
		  
		  dim p as Ptr = CFBundle.CarbonFramework.DataPointer(symbolName)
		  if p = nil then
		    return nil
		  end if
		  
		  dim value as new CFNumber(p.Ptr(0), false)
		  return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFNumberGetTypeID lib CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFNumberGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Int64)
		  #if targetMacOS
		    soft declare function CFNumberCreate Lib CarbonFramework (allocator as Ptr, theType as Integer, ByRef valuePtr as Int64) as Ptr
		    
		    me.Adopt CFNumberCreate(nil, kCFNumberSInt64Type, value), true
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFNumberGetValue Lib CarbonFramework (number as Ptr, theType as Integer, ByRef valuePtr as Integer) as Boolean
			
			if not me.IsNULL then
			dim theValue as Integer
			if CFNumberGetValue(me.Reference, kCFNumberSInt32Type, theValue) then
			return theValue
			else
			return theValue //but it's an approximate value
			end if
			end if
			#endif
			End Get
		#tag EndGetter
		IntegerValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFNumberGetValue Lib CarbonFramework (number as Ptr, theType as Integer, ByRef valuePtr as Double) as Boolean
			
			if not me.IsNULL then
			dim theValue as Double
			if CFNumberGetValue(me.Reference, kCFNumberDoubleType, theValue) then
			return theValue
			else
			return theValue //but it's an approximate value
			end if
			end if
			#endif
			End Get
		#tag EndGetter
		DoubleValue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFNumberGetValue Lib CarbonFramework (number as Ptr, theType as Integer, ByRef valuePtr as Int64) as Boolean
			
			if not me.IsNULL then
			dim theValue as Int64
			if CFNumberGetValue(me.Reference, kCFNumberSInt64Type, theValue) then
			return theValue
			else
			return theValue //but it's an approximate value
			end if
			end if
			#endif
			End Get
		#tag EndGetter
		Int64Value As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFNumberIsFloatType Lib CarbonFramework (number as Ptr) as Boolean
			
			if not me.IsNULL then
			return CFNumberIsFloatType(me.Reference)
			end if
			#endif
			End Get
		#tag EndGetter
		IsFloat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if TargetMacOS
			soft declare function CFNumberGetType Lib CarbonFramework (number as Ptr) as Integer
			
			if not me.IsNULL then
			return CFNumberGetType(me.Reference)
			end if
			#endif
			End Get
		#tag EndGetter
		Type As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kCFNumberDoubleType, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFNumberSInt32Type, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFNumberSInt8Type, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFNumberSInt16Type, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCFNumberSInt64Type, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleValue"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFloat"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
