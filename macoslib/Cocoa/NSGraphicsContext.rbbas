#tag Class
Class NSGraphicsContext
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(g as Graphics)
		  if g is nil then
		    return
		  end if
		  
		  #if targetCocoa
		    declare function graphicsContextWithGraphicsPort lib CocoaLib selector "graphicsContextWithGraphicsPort:flipped:" (class_id as Ptr, port as Ptr, flipped as Boolean) as Ptr
		    
		    self.Constructor(graphicsContextWithGraphicsPort(Cocoa.NSClassFromString("NSGraphicsContext"), Ptr(g.Handle(Graphics.HandleTypeCGContextRef)), false))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CurrentContext() As NSGraphicsContext
		  #if targetCocoa
		    declare function currentContext lib CocoaLib selector "currentContext" (class_id as Ptr) as Ptr
		    
		    return new NSGraphicsContext(currentContext(Cocoa.NSClassFromString("NSGraphicsContext")))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub CurrentContext(assigns context as NSGraphicsContext)
		  #if targetCocoa
		    declare sub setCurrentContext lib CocoaLib selector "setCurrentContext:" (class_id as Ptr, context as Ptr)
		    
		    setCurrentContext(Cocoa.NSClassFromString("NSGraphicsContext"), context)
		    
		  #else
		    #pragma unused context
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RestoreState()
		  #if targetMacOS
		    declare sub restoreGraphicsState lib CocoaLib selector "restoreGraphicsState" (class_id as Ptr)
		    
		    restoreGraphicsState(Cocoa.NSClassFromString("NSGraphicsContext"))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub SaveState()
		  #if targetMacOS
		    declare sub saveGraphicsState lib CocoaLib selector "saveGraphicsState" (class_id as Ptr)
		    
		    saveGraphicsState(Cocoa.NSClassFromString("NSGraphicsContext"))
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function isFlipped lib CocoaLib selector "isFlipped" (obj_id as Ptr) as Boolean
			    
			    return isFlipped(self)
			  #endif
			End Get
		#tag EndGetter
		Flipped As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flipped"
			Group="Behavior"
			Type="Boolean"
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
