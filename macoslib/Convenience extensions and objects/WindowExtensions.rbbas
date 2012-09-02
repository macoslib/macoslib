#tag Module
Protected Module WindowExtensions
	#tag Method, Flags = &h0
		Function FrameAutosaveName(extends w as Window) As string
		  //# Set the autosave name for the Window's frame
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    dim nsw as NSWindow = NSWindow.CreateFromWindow( w )
		    call   nsw.FrameAutosaveName
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameAutosaveName(extends w as Window, assigns saveName as String)
		  //# Set the autosave name for the Window's frame
		  
		  //@ See RestoreFrameFromWindowName
		  
		  #if TargetMacOS
		    dim nsw as NSWindow = NSWindow.CreateFromWindow( w )
		    call   nsw.SetFrameAutosaveName( saveName )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreFrameFromWindowName(extends w as Window, saveName as String)
		  //# Restores the window's frame from its saveName in the application's preferences
		  
		  //@ You should use this method in a Constructor method or in the Open event.
		  
		  //@ The saveName is also set for the window, so the frame will be stored in preferences
		  //@ If no such saveName exists in the preferences, this method does not resize the window.
		  
		  #if TargetMacOS
		    dim nsw as NSWindow = NSWindow.CreateFromWindow( w )
		    call   nsw.RestoreFrameFromAutosaveName( saveName )
		    call   nsw.SetFrameAutosaveName( saveName )
		  #endif
		End Sub
	#tag EndMethod


End Module
#tag EndModule
