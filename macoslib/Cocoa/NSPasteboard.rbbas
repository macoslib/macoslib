#tag Class
Class NSPasteboard
Inherits NSObject
	#tag Method, Flags = &h0
		Sub ClearContents()
		  #if TargetMacOS
		    declare function clearContents lib CocoaLib selector "clearContents" (id as Ptr) as integer
		    
		    call  clearContents( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataForType(type as String) As NSData
		  #if targetMacOS
		    declare function dataForType lib CocoaLib selector "dataForType:" (obj_id as Ptr, type as CFStringRef) as Ptr
		    
		    return new NSData (dataForType (self, type), false)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DragPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSDragPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FindPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSFindPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FontPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSFontPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GeneralPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSGeneralPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function RulerPboard() As NSPasteboard
		  static name as String = Cocoa.StringConstant ("NSRulerPboard")
		  return WithName (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function WithName(name as String) As NSPasteboard
		  #if targetMacOS
		    declare function pasteboardWithName lib CocoaLib selector "pasteboardWithName:" (obj_id as Ptr, name as CFStringRef) as Ptr
		    
		    if gClassRef = nil then
		      gClassRef = Cocoa.NSClassFromString("NSPasteboard")
		    end
		    
		    dim ref as Ptr = pasteboardWithName (gClassRef, name)
		    if ref <> nil then
		      return new NSPasteboard (ref)
		    end
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			changeCount
		#tag EndNote
		#tag Getter
			Get
			  #if targetMacOS
			    declare function changeCount lib CocoaLib selector "changeCount" (obj_id as Ptr) as Integer
			    
			    return changeCount(self)
			  #endif
			End Get
		#tag EndGetter
		ChangeCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared gClassRef As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function pasteboardItems lib CocoaLib selector "pasteboardItems" (id as Ptr) as Ptr
			    
			    dim p as Ptr = pasteboardItems( me.id )
			    
			    if p=nil then   return nil
			    
			    return  new NSArray( p, false )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare function writeObjects lib CocoaLib selector "writeObjects:" (id as Ptr, nsa as Ptr) as Boolean
			    
			    call   writeObjects( me.id, value.id )
			  #endif
			End Set
		#tag EndSetter
		Items As NSArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function types lib CocoaLib selector "types" (obj_id as Ptr) as Ptr
			    
			    return   new NSArray (types (self), false)
			  #endif
			End Get
		#tag EndGetter
		Types As NSArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ChangeCount"
			Group="Behavior"
			Type="Integer"
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
