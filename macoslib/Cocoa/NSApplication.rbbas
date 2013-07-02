#tag Class
Class NSApplication
Inherits NSResponder
	#tag Method, Flags = &h0
		 Shared Function App() As NSApplication
		  declare function sharedApplication_ lib CocoaLib selector "sharedApplication" (class_id as Ptr) as Ptr
		  
		  static c as new NSApplication(sharedApplication_(Cocoa.NSClassFromString(NSClassName)))
		  return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString(NSClassName)
		  return ref
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyWindow() As NSWindow
		  #if TargetMacOS
		    declare function m_keyWindow lib CocoaLib selector "keyWindow" ( id as Ptr ) as Ptr
		    
		    return   new NSWindow( m_keyWindow( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MainWindow() As NSWindow
		  #if TargetMacOS
		    declare function m_mainWindow lib CocoaLib selector "mainWindow" ( id as Ptr ) as Ptr
		    
		    return   new NSWindow( m_mainWindow( me.id ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterServices()
		  // Unfinished (by TT) - needs values passed
		  // Also, it hasn't been tested yet if this actually does the right thing.
		  
		  'declare sub registerServices_ lib CocoaLib selector "registerServicesMenuSendTypes:returnTypes:" (ref as Ptr, send as Ptr, receive as Ptr)
		  '
		  'dim type as CFType
		  '
		  'const typeName = "NSURLPboardType"
		  'dim p as Ptr = CFBundle.CocoaFramework.DataPointerNotRetained(typeName)
		  'if p <> nil then
		  'type = new CFString (p.Ptr(0), false)
		  'end if
		  '
		  'dim a as new CFArray(Array(type))
		  'registerServices_ me.Reference, a.Reference, a.Reference
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Windows() As CFArray
		  #if targetCocoa
		    declare function windows lib CocoaLib selector "windows" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = windows(self)
		    return new CFArray(windows(self), not CFArray.hasOwnership)
		    
		    // Keep the compiler from complaining
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = NSClassName, Type = String, Dynamic = False, Default = \"NSApplication", Scope = Public
	#tag EndConstant


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
