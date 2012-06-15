#tag Class
Class NSEvent
Inherits NSObject
	#tag Method, Flags = &h0
		Function LocationInWindow() As NSPoint
		  
		  #if TargetMacOS
		    declare function locationInWindow lib CocoaLib selector "locationInWindow" (id as Ptr) as NSPoint
		    
		    return  locationInWindow( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocationLocalToNSView(theView as NSControl, useRSCoordinates as boolean = false) As NSPoint
		  //Get the mouse coordinates local to the given NSControl. If useRSCoordinates is true, origin is set to the top-left corner
		  
		  #if TargetMacOS
		    declare function convertPoint lib CocoaLib selector "convertPoint:fromView:" ( id as Ptr, loc as NSPoint, fromView as Ptr ) as NSPoint
		    
		    dim pt as NSPoint = me.LocationInWindow
		    dim result as NSPoint = convertPoint( theView.id, pt, nil )
		    
		    if useRSCoordinates then //Flip coordinates
		      result.y = theView.Height - result.y
		    end if
		    
		    return   result
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function characters lib CocoaLib selector "characters" (obj_id as Ptr) as CFStringRef
			    
			    if Array(EventType.KeyDown, EventType.KeyUp).IndexOf(self.Type) > -1 then
			      return characters(self)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Characters As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function type lib CocoaLib selector "type" (obj_id as Ptr) as EventType
			    
			    return type(self)
			  #endif
			  
			  
			End Get
		#tag EndGetter
		Type As EventType
	#tag EndComputedProperty


	#tag Enum, Name = EventType, Type = Integer, Flags = &h0
		LeftMouseDown=1
		  LeftMouseUp=2
		  KeyDown=10
		KeyUp=11
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Characters"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
