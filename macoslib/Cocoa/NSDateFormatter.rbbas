#tag Class
Class NSDateFormatter
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  #if targetCocoa
		    super.Constructor(Initialize(Allocate("NSDateFormatter")))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateFormat() As String
		  #if targetCocoa
		    declare function dateFormat lib CocoaLib selector "dateFormat" (id as Ptr) as CFStringRef
		    
		    return dateFormat(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DateFormat(assigns value as String)
		  #if targetCocoa
		    declare sub setDateFormat lib CocoaLib selector "setDateFormat:" (id as Ptr, s as CFStringRef)
		    
		    setDateFormat self.id, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(d as NSDate) As String
		  if d = nil then
		    return ""
		  end if
		  
		  #if targetCocoa
		    declare function stringFromDate lib CocoaLib selector "stringFromDate:" (id as Ptr, d as Ptr) as CFStringRef
		    
		    return stringFromDate(self.id, d)
		  #endif
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
