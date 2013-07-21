#tag Class
Class NSDate
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(value as Date)
		  #if targetMacOS
		    declare function dateWithTimeIntervalSince1970 lib CocoaLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim d as new Date
		    
		    d.SQLDateTime = "1970-01-01 00:00:00"
		    dim seconds as Double = value.TotalSeconds - d.TotalSeconds - 3600.0*value.GMTOffset
		    dim p as Ptr = dateWithTimeIntervalSince1970( Cocoa.NSClassFromString( "NSDate" ), seconds )
		    super.Constructor(p)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Now() As NSDate
		  #if targetMacOS
		    declare function date lib CocoaLib selector "date" (class_id as Ptr) as Ptr
		    
		    return new NSDate(date(Cocoa.NSClassFromString("NSDate")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Date
		  #if targetMacOS
		    //Returns the interval between the receiver and the first instant of 1 January 1970, GMT.
		    declare function timeIntervalSince1970 lib CocoaLib selector "timeIntervalSince1970" (id as Ptr) as Double
		    
		    dim d as new Date
		    d.SQLDateTime = "1970-01-01 00:00:00"
		    d.TotalSeconds = d.TotalSeconds + timeIntervalSince1970(self.id) + 3600.0*d.GMTOffset
		    return d
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Operator_Convert(value as Date)
		  #if targetMacOS
		    declare function dateWithTimeIntervalSince1970 lib CocoaLib selector "dateWithTimeIntervalSince1970:" (class_id as Ptr, seconds as Double) as Ptr
		    
		    dim d as new Date
		    d.SQLDateTime = "1970-01-01 00:00:00"
		    dim seconds as Double = value.TotalSeconds - d.TotalSeconds - 3600.0*value.GMTOffset
		    dim p as Ptr = dateWithTimeIntervalSince1970(Cocoa.NSClassFromString("NSDate"), seconds)
		    super.Constructor(p)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  
		  dim d as Date = me //Use the Operator_Convert
		  
		  return  d
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
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
