#tag Class
Class QTCaptureSession
Inherits NSObject
	#tag Method, Flags = &h0
		Sub AddInput(qtInput as QTCaptureDeviceInput)
		  #If targetMacOS and targetX86
		    declare function addInput lib QTKit.framework selector "addInput:error:" (obj_id as Ptr, input_ as Ptr, ByRef errorPtr as Ptr) as Boolean
		    
		    dim errorPtr as Ptr
		    if addInput(self, qtInput, errorPtr) then
		      //
		    else
		      raise new NSException(errorPtr)
		    end if
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #If targetMacOS and targetX86
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = init(alloc(Cocoa.NSClassFromString("QTCaptureSession")))
		    if p <> nil then
		      super.Constructor(p, NSObject.hasOwnership)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartRunning()
		  #If targetMacOS and targetX86
		    declare sub startRunning lib QTKit.framework selector "startRunning" (obj_id as Ptr)
		    
		    startRunning(self)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopRunning()
		  #If targetMacOS and targetX86
		    declare sub stopRunning lib QTKit.framework selector "stopRunning" (obj_id as Ptr)
		    
		    stopRunning(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #If targetMacOS and targetX86
			    declare function isRunning lib QTKit.framework selector "isRunning" (obj_id as Ptr) as Boolean
			    
			    return isRunning(self)
			  #endif
			End Get
		#tag EndGetter
		IsRunning As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
