#tag Class
Class QTMovieView
Inherits Canvas
	#tag Event
		Sub Open()
		  #if targetMacOS and targetX86
		    declare function initWithFrame lib QTKit.Framework selector "initWithFrame:" (obj_id as Ptr, frame as Cocoa.NSRect) as Ptr
		    soft declare sub addSubview lib QTKit.framework selector "addSubview:" (id as Ptr, aView as Ptr)
		    soft declare sub setAutoresizingMask lib QTKit.framework selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    
		    
		    if not QTKit.Load then
		      return
		    end if
		    
		    
		    self.id = initWithFrame(NSObject.Allocate("QTMovieView"), Cocoa.NSMakeRect(0, 0, self.Width, self.Height))
		    if self.id = nil then
		      return
		    end if
		    
		    
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    
		    addSubview Ptr(self.Handle), self
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    setAutoresizingMask self, NSViewWidthSizable or NSViewHeightSizable
		    setAutoresizingMask self, NSViewWidthSizable or NSViewHeightSizable
		    
		    raiseEvent Open
		    
		  #endif
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add()
		  #If targetMacOS and targetX86
		    declare sub add lib QTKit.framework selector "add:" (obj_id as Ptr, sender as Ptr)
		    
		    add(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddScaled()
		  #If targetMacOS and targetX86
		    declare sub addScaled lib QTKit.framework selector "addScaled:" (obj_id as Ptr, sender as Ptr)
		    
		    addScaled(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  #If targetMacOS and targetX86
		    declare sub copy lib QTKit.framework selector "copy:" (obj_id as Ptr, sender as Ptr)
		    
		    copy(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cut()
		  #If targetMacOS and targetX86
		    declare sub cut lib QTKit.framework selector "cut:" (obj_id as Ptr, sender as Ptr)
		    
		    cut(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  #If targetMacOS and targetX86
		    declare sub delete lib QTKit.framework selector "delete:" (obj_id as Ptr, sender as Ptr)
		    
		    delete(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillColor() As NSColor
		  #if targetMacOS and targetX86
		    declare function fillColor lib QTKit.framework selector "fillColor" (obj_id as Ptr) as Ptr
		    
		    return new NSColor(fillColor(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillColor(assigns value as NSColor)
		  #if targetMacOS and targetX86
		    declare sub setFillColor lib QTKit.framework selector "setFillColor:" (obj_id as Ptr, value as Ptr)
		    
		    if value <> nil then
		      setFillColor(self, value)
		    else
		      setFillColor(self, nil)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoBeginning()
		  #If targetMacOS and targetX86
		    declare sub gotoBeginning lib QTKit.framework selector "gotoBeginning:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoBeginning(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoEnd()
		  #If targetMacOS and targetX86
		    declare sub gotoEnd lib QTKit.framework selector "gotoEnd:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoEnd(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoNextSelectionPoint()
		  #If targetMacOS and targetX86
		    declare sub gotoNextSelectionPoint lib QTKit.framework selector "gotoNextSelectionPoint:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoNextSelectionPoint(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoPosterFrame()
		  #If targetMacOS and targetX86
		    declare sub gotoPosterFrame lib QTKit.framework selector "gotoPosterFrame:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoPosterFrame(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GotoPreviousSelectionPoint()
		  #If targetMacOS and targetX86
		    declare sub gotoPreviousSelectionPoint lib QTKit.framework selector "gotoPreviousSelectionPoint:" (obj_id as Ptr, sender as Ptr)
		    
		    gotoPreviousSelectionPoint(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Movie() As QTMovie
		  #if targetMacOS and targetX86
		    declare function movie lib QTKit.framework selector "movie" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = movie(self)
		    if p <> nil then
		      return new QTMovie(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Movie(assigns value as QTMovie)
		  #if targetMacOS and targetX86
		    declare sub setMovie lib QTKit.framework selector "setMovie:" (obj_id as Ptr, value as Ptr)
		    
		    if value <> nil then
		      setMovie(self, value)
		    else
		      setMovie(self, nil)
		    end if
		    
		  #else
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovieBounds() As Cocoa.NSRect
		  #if targetMacOS and targetX86
		    declare function movieBounds lib QTKit.framework selector "movieBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return movieBounds(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovieControllerBounds() As Cocoa.NSRect
		  #if targetMacOS and targetX86
		    declare function movieControllerBounds lib QTKit.framework selector "movieControllerBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return movieControllerBounds(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  #If targetMacOS and targetX86
		    declare sub paste lib QTKit.framework selector "paste:" (obj_id as Ptr, sender as Ptr)
		    
		    paste(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  #If targetMacOS and targetX86
		    declare sub pause lib QTKit.framework selector "pause:" (obj_id as Ptr, sender as Ptr)
		    
		    pause(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  #If targetMacOS and targetX86
		    declare sub play lib QTKit.framework selector "play:" (obj_id as Ptr, sender as Ptr)
		    
		    play(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace()
		  #If targetMacOS and targetX86
		    declare sub replace lib QTKit.framework selector "replace:" (obj_id as Ptr, sender as Ptr)
		    
		    replace(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  #If targetMacOS and targetX86
		    declare sub selectAll lib QTKit.framework selector "selectAll:" (obj_id as Ptr, sender as Ptr)
		    
		    selectAll(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNone()
		  #If targetMacOS and targetX86
		    declare sub selectNone lib QTKit.framework selector "selectNone:" (obj_id as Ptr, sender as Ptr)
		    
		    selectNone(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepBackward()
		  #If targetMacOS and targetX86
		    declare sub stepBackward lib QTKit.framework selector "stepBackward:" (obj_id as Ptr, sender as Ptr)
		    
		    stepBackward(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepForward()
		  #If targetMacOS and targetX86
		    declare sub stepForward lib QTKit.framework selector "stepForward:" (obj_id as Ptr, sender as Ptr)
		    
		    stepForward(self, nil)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Trim()
		  #If targetMacOS and targetX86
		    declare sub trim lib QTKit.framework selector "trim:" (obj_id as Ptr, sender as Ptr)
		    
		    trim(self, nil)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If targetMacOS and targetX86
			    declare function controllerBarHeight lib QTKit.framework selector "controllerBarHeight" (obj_id as Ptr) as Double
			    
			    return CType(controllerBarHeight(self), Double)
			  #endif
			End Get
		#tag EndGetter
		ControllerBarHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS and targetX86
			    declare function isControllerVisible lib QTKit.framework selector "isControllerVisible" (obj_id as Ptr) as Boolean
			    
			    return isControllerVisible(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS and targetX86
			    declare sub setControllerVisible lib QTKit.framework selector "setControllerVisible:" (obj_id as Ptr, value as Boolean)
			    
			    setControllerVisible(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ControllerVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS and targetX86
			    declare function isEditable lib QTKit.framework selector "isEditable" (obj_id as Ptr) as Boolean
			    
			    return isEditable(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS and targetX86
			    declare sub setEditable lib QTKit.framework selector "setEditable:" (obj_id as Ptr, value as Boolean)
			    
			    setEditable(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Editable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private id As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS and targetX86
			    declare function preservesAspectRatio lib QTKit.framework selector "preservesAspectRatio" (obj_id as Ptr) as Boolean
			    
			    return preservesAspectRatio(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS and targetX86
			    declare sub setPreservesAspectRatio lib QTKit.framework selector "setPreservesAspectRatio:" (obj_id as Ptr, value as Boolean)
			    
			    setPreservesAspectRatio(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		PreservesAspectRatio As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControllerBarHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControllerVisible"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesAspectRatio"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
