#tag Class
Class CFCalendar
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function TypeID lib CarbonLib alias "CFCalendarGetTypeID" () as UInt32
		    static id as CFTypeID = CFTypeID(TypeID)
		    return id
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			#if targetMacOS
			soft declare function CFCalendarGetIdentifier lib CarbonFramework (calendar as Ptr) as CFStringRef
			
			dim theIdentifier as CFStringRef = CFCalendarGetIdentifier(me)
			soft declare function CFRetain lib CarbonLib (cf as CFStringRef) as Ptr
			theIdentifier.Retain
			return theIdentifier
			#endif
			
			End Get
		#tag EndGetter
		Identifier As String
	#tag EndComputedProperty


End Class
#tag EndClass
