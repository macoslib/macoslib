#tag Class
Class QTCaptureView
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
		    
		    
		    self.id = initWithFrame(NSObject.Allocate("QTCaptureView"), Cocoa.NSMakeRect(0, 0, self.Width, self.Height))
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
		Function AvailableVideoPreviewConnections() As QTCaptureConnection()
		  #If targetMacOS and targetX86
		    declare function availableVideoPreviewConnections lib CocoaLib selector "availableVideoPreviewConnections" (obj_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(availableVideoPreviewConnections(self), not CFType.hasOwnership)
		    dim connectionList() as QTCaptureConnection
		    for i as Integer = 0 to theArray.Count - 1
		      connectionList.Append new QTCaptureConnection(theArray.Value(i))
		    next
		    return connectionList
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CaptureSession() As QTCaptureSession
		  #If targetMacOS and targetX86
		    declare function captureSession lib CocoaLib selector "captureSession" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = captureSession(self)
		    if p <> nil then
		      return new QTCaptureSession(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CaptureSession(assigns value as QTCaptureSession)
		  #If targetMacOS and targetX86
		    declare sub setCaptureSession lib QTKit.framework selector "setCaptureSession:" (obj_id as Ptr, value as Ptr)
		    
		    setCaptureSession(self, value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return self.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviewBounds() As Cocoa.NSRect
		  #If targetMacOS and targetX86
		    declare function previewBounds lib CocoaLib selector "previewBounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return previewBounds(self)
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private id As Ptr
	#tag EndProperty


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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
