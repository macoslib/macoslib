#tag Class
Class NSEvent
Inherits NSObject
	#tag Method, Flags = &h0
		Function LocationInWindow() As NSPoint
		  
		  #if TargetMacOS
		    declare function locationInWindow lib CocoaLib selector "locationInWindow" (id as Ptr) as NSPoint
		    
		    return  locationInWindow( self )
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

	#tag Method, Flags = &h0
		Function LocationLocalToNSView(theView as Ptr, RSCoordinatesRelativeTo as RectControl = nil) As NSPoint
		  //Get the mouse coordinates local to the given NSControl. If useRSCoordinates is true, origin is set to the top-left corner
		  
		  #if TargetMacOS
		    declare function convertPoint lib CocoaLib selector "convertPoint:fromView:" ( id as Ptr, loc as NSPoint, fromView as Ptr ) as NSPoint
		    
		    dim pt as NSPoint = me.LocationInWindow
		    dim result as NSPoint = convertPoint( theView, pt, nil )
		    
		    if RSCoordinatesRelativeTo<>nil then //Flip coordinates
		      result.y = RSCoordinatesRelativeTo.Height - result.y
		    end if
		    
		    return   result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MouseLocation() As NSPoint
		  
		  #if TargetMacOS
		    declare function mouseLocation lib CocoaLib selector "mouseLocation" (id as Ptr) as NSPoint
		    
		    return  mouseLocation( Cocoa.NSClassFromString( "NSEvent" ))
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
			  
			  #if TargetMacOS then
			    return EncodeHex( self.CharactersIgnoringModifiers )
			  #endif
			End Get
		#tag EndGetter
		CharactersHex As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function charactersIgnoringModifiers lib CocoaLib selector "charactersIgnoringModifiers" (obj_id as Ptr) as CFStringRef
			    
			    if Array(EventType.KeyDown, EventType.KeyUp).IndexOf(self.Type) > -1 then
			      return charactersIgnoringModifiers(self)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		CharactersIgnoringModifiers As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function isARepeat lib CocoaLib selector "isARepeat" (obj_id as Ptr) as Boolean
			    
			    return IsARepeat(self)
			  #endif
			End Get
		#tag EndGetter
		IsARepeat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getKeyCode lib CocoaLib selector "keyCode" (obj_id as Ptr) as UInt64
			    
			    return getKeyCode( self )
			  #endif
			End Get
		#tag EndGetter
		KeyCode As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getModifierFlags lib CocoaLib selector "modifierFlags" (obj_id as Ptr) as UInt64
			    
			    return getModifierFlags(self)
			  #endif
			End Get
		#tag EndGetter
		ModifierFlags As UInt64
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getWindow lib CocoaLib selector "window" (obj_id as Ptr) as Ptr
			    
			    return New NSWindow( getWindow(self) )
			  #endif
			End Get
		#tag EndGetter
		Window As NSWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS then
			    declare function getWindowNumber lib CocoaLib selector "windowNumber" (obj_id as Ptr) as Integer
			    
			    return getWindowNumber(self)
			  #endif
			End Get
		#tag EndGetter
		WindowNumber As Integer
	#tag EndComputedProperty


	#tag Enum, Name = EventType, Flags = &h0
		LeftMouseDown=1
		  LeftMouseUp=2
		  RightMouseDown=3
		  RightMouseUp=4
		  MouseMoved=5
		  LeftMouseDragged=6
		  RightMouseDragged=7
		  MouseEntered=8
		  MouseExited=9
		  KeyDown=10
		  KeyUp=11
		  FlagsChanged=12
		  AppKitDefined=13
		  SystemDefined=14
		  ApplicationDefined=15
		  Periodic=16
		  CursorUpdate=17
		  ScrollWheel=22
		  TabletPoint=23
		  TabletProximity=24
		  OtherMouseDown=25
		  OtherMouseUp=26
		  OtherMouseDragged=27
		  EventTypeGesture=29
		  EventTypeMagnify=30
		  EventTypeSwipe=31
		  EventTypeRotate=18
		  EventTypeBeginGesture=19
		  EventTypeEndGesture=20
		  EventTypeSmartMagnify=32
		EventTypeQuickLook=33
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Characters"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CharactersHex"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CharactersIgnoringModifiers"
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
			Type="Integer"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsARepeat"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsARepeat"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
