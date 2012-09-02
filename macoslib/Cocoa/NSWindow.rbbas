#tag Class
Class NSWindow
Inherits NSResponder
	#tag Method, Flags = &h0
		 Shared Function CreateFromWindow(wnd as Window, hasOwnerShip as boolean = false) As NSWindow
		  #if TargetMacOS
		    dim w as NSWindow
		    
		    #if TargetCocoa
		      w = new NSWindow( Ptr( wnd.Handle ), hasOwnership )
		      
		    #elseif TargetCarbon
		      declare function initWithWindowRef lib CocoaLib( ref as Ptr ) as Ptr
		      
		      w = new NSWindow( initWithWindowRef( Ptr( wnd.Handle )), hasOwnership )
		    #endif
		    
		    return   w
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldEditorForObject(obj as ptr) As Ptr
		  
		  declare function fieldEditor lib CocoaLib selector "fieldEditor:forObject:" ( wnd as Ptr, createIfNeeded as Boolean, obj as Ptr ) as Ptr
		  
		  return   fieldEditor( me.id, false, obj )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameAutosaveName() As String
		  #if TargetMacOS
		    declare Function frameAutosaveName lib CocoaLib selector "frameAutosaveName" (id as Ptr) as CFStringRef
		    
		    return  frameAutosaveName( me.id )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RestoreFrameFromAutosaveName(saveName as string) As boolean
		  #if TargetMacOS
		    declare function setFrameUsingName lib CocoaLib selector "setFrameUsingName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    return   setFrameUsingName( me.id, saveName )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFrameAutosaveName(saveName as string) As boolean
		  #if TargetMacOS
		    declare Function setFrameAutosaveName lib CocoaLib selector "setFrameAutosaveName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    return  setFrameAutosaveName( me.id, saveName )
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
