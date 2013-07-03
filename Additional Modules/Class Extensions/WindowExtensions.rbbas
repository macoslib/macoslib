#tag Module
Protected Module WindowExtensions
	#tag Method, Flags = &h0
		Function FrameAutosaveName(extends w as Window) As String
		  //# Get the autosave name for the Window's frame
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    declare function frameAutosaveName lib CocoaLib selector "frameAutosaveName" (id as Ptr) as Ptr
		    
		    return RetainedStringValue(frameAutosaveName(Ptr(w.Handle)))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RestoreFrameFromWindowName(extends w as Window, name as String) As Boolean
		  //# Restores the window's frame from its saveName in the application's preferences
		  
		  //@ You should use this method in a Constructor method or in the Open event.
		  
		  
		  #if TargetMacOS
		    declare function setFrameUsingName lib CocoaLib selector "setFrameUsingName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    return setFrameUsingName(WindowRef(w), name)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalingFactor(Extends w as Window) As Single
		  //# Determines if the window is displayed on a Retina screen or other HiDPI mode.
		  
		  //@result The ScalingFactor is 2 for a Retina MacBook Pro (or other HiDPI modes) and 1 for anything else
		  
		  //@ The following property needs to be added to the app's __Info.plist__ in order to make your Cocoa app Retina capable:
		  // __<key>NSHighResolutionCapable</key>__
		  // __<true/>__
		  
		  if TargetCocoa and IsLion then
		    declare function BackingScaleFactor lib "AppKit" selector "backingScaleFactor" (target As WindowPtr) as double
		    return BackingScaleFactor(w)
		  else
		    #pragma Unused w
		    return 1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFrameAutosaveName(extends w as Window, saveName as String) As Boolean
		  //# Set the autosave name for the Window's frame.
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    declare function setFrameAutosaveName lib CocoaLib selector "setFrameAutosaveName:" (id as Ptr, name as CFStringRef) as Boolean
		    
		    //returns false if the name is already in use for another NSWindow object in the application.
		    return setFrameAutosaveName(WindowRef(w), saveName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WindowRef(w as Window) As Ptr
		  if w = nil then
		    return nil
		  end if
		  
		  #if targetCocoa
		    return Ptr(w.Handle)
		    
		  #elseif targetCarbon
		    //the existing code was wrong.  I'm leaving this unimplemented for now.
		    return nil
		    
		  #else
		    #pragma unused w
		    return nil
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
