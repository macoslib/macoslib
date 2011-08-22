#tag Class
Class NSControl
Inherits Canvas
	#tag Event
		Sub Close()
		  raiseEvent Close
		  
		  if ControlMap.HasKey(self.id) then
		    ControlMap.Remove(self.id)
		  end if
		  
		  
		  if TargetMap.HasKey(me.TargetID) then
		    TargetMap.Remove me.TargetID
		  end if
		  
		  #if targetCocoa
		    soft declare sub release lib CocoaFramework selector "release" (id as Ptr)
		    
		    if me.targetID <> nil then
		      release me.targetID
		      me.targetID = nil
		    end if
		  #endif
		  
		  //I think that self.id is released by the superview.
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.AcceptFocus = false
		  
		  #if targetCocoa
		    dim frame as NSRect
		    frame.x = 0.0
		    frame.y = 0.0
		    frame.w = self.Width
		    frame.h = self.Height
		    
		    declare function initWithFrame lib CocoaLib selector "initWithFrame:" (obj_id as Ptr, frameRect as NSRect) as Ptr
		    
		    self._id = initWithFrame(Allocate(self.NSClassName), frame)
		    if self.id = nil then
		      return
		    end if
		    
		    
		    soft declare sub addSubview lib CocoaFramework selector "addSubview:" (id as Ptr, aView as Ptr)
		    soft declare sub setAutoresizingMask lib CocoaFramework selector "setAutoresizingMask:" (id as Ptr, mask as Integer)
		    soft declare sub setFrame lib CocoaFramework selector "setFrame:" (id as Ptr, frameRect as NSRect)
		    
		    const NSViewWidthSizable = 2
		    const NSViewHeightSizable = 16
		    const NSViewMinYMargin = 8
		    
		    dim subview as Ptr = CreateSubview(frame)
		    if subview = nil then
		      subview = self.id
		    else
		      
		    end if
		    
		    'dim frame as NSRect
		    'frame.x = 0.0
		    'frame.y = 0.0
		    'frame.w = self.Width
		    'frame.h = self.Height
		    'setFrame subview, frame
		    'setFrame self.id, frame
		    addSubview Ptr(self.Handle), subview
		    
		    //here we lock the control to the canvas superview so that resizing is handled by the canvas.
		    setAutoresizingMask subview, NSViewWidthSizable or NSViewHeightSizable
		    setAutoresizingMask self.id, NSViewWidthSizable or NSViewHeightSizable
		    
		    
		    //here we set up an Objective-C delegate to be the target of the NSControl action.
		    soft declare function init lib CocoaFramework selector "init" (id as Ptr) as Ptr
		    
		    self.TargetID = init(Allocate(TargetClass))
		    
		    soft declare function NSSelectorFromString lib CocoaFramework (aSelectorName as CFStringRef) as Ptr
		    soft declare sub setAction lib CocoaFramework selector "setAction:" (id as Ptr, aSelector as Ptr)
		    soft declare sub setTarget lib CocoaFramework selector "setTarget:" (id as Ptr, anObject as Ptr)
		    
		    setAction self.id, NSSelectorFromString("action:")
		    setTarget self.id, self.TargetID
		    TargetMap.Value(self.TargetID) = AddressOf self.HandleAction
		    
		    ControlMap.Value(self.id) = self
		  #endif
		  
		  raiseEvent Open
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub ActionDelegate()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function AddInstanceMethod(class_id as Ptr, name as String, impl as Ptr, types as String) As Boolean
		  #if targetMacOS
		    soft declare function class_addMethod lib CocoaFramework (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    soft declare function NSSelectorFromString lib CocoaFramework (aSelectorName as CFStringRef) as Ptr
		    
		    return class_addMethod(class_id, NSSelectorFromString(name), impl, types)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Allocate(class_id as Ptr) As Ptr
		  #if targetCocoa
		    if class_id = nil then
		      return nil
		    end if
		    
		    soft declare function alloc lib CocoaFramework selector "alloc" (classRef as Ptr) as Ptr
		    
		    return alloc(class_id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Allocate(NSClassName as String) As Ptr
		  #if targetCocoa
		    soft declare function NSClassFromString lib CocoaFramework (aClassName as CFStringRef) as Ptr
		    soft declare function alloc lib CocoaFramework selector "alloc" (classRef as Ptr) as Ptr
		    
		    dim class_id as Ptr = NSClassFromString(NSClassName)
		    if class_id <> nil then
		      return alloc(class_id)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cell() As Ptr
		  #if targetCocoa
		    if me.id = nil then
		      return nil
		    end if
		    
		    soft declare function cell lib CocoaFramework selector "cell" (id as Ptr) as Ptr
		    
		    return cell(me.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ControlMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchHandleAction(id as Ptr, sel as Ptr, sender as Ptr)
		  #pragma unused sel
		  #pragma unused sender
		  
		  #pragma stackOverflowChecking false
		  
		  if TargetMap.HasKey(id) then
		    dim action as ActionDelegate = TargetMap.Value(id)
		    action.Invoke()
		  else
		    //something might be wrong.
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue() As Double
		  #if targetCocoa
		    if me.id = nil then
		      return 0.0
		    end if
		    
		    soft declare function doubleValue lib CocoaFramework selector "doubleValue" (id as Ptr) as Double
		    
		    return doubleValue(me.id)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(assigns value as Double)
		  #if targetCocoa
		    if me.id = nil then
		      return
		    end if
		    
		    soft declare sub setDoubleValue lib CocoaFramework selector "setDoubleValue:"  (id as Ptr, aDouble as Double)
		    
		    setDoubleValue me.id, value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FindByID(obj_id as Ptr) As NSControl
		  return ControlMap.Lookup(obj_id, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame() As NSRect
		  #if targetCocoa
		    if me.id = nil then
		      dim r as NSRect
		      return r
		    end if
		    
		    
		    soft declare function frame lib CocoaFramework selector "frame" (id as Ptr) as NSRect
		    
		    return frame(me.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Frame(assigns value as NSRect)
		  #if targetCocoa
		    if me.id = nil then
		      return
		    end if
		    
		    soft declare sub setFrame lib CocoaFramework selector "setFrame:" (id as Ptr, frameRect as NSRect)
		    
		    setFrame me.id, value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAction()
		  raiseEvent Action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Initialize(newobj_id as Ptr, frame as NSRect) As Ptr
		  #if targetCocoa
		    if newobj_id = nil then
		      return nil
		    end if
		    
		    //if the Initialize event handler is unimplemented, as may often be the case, it will return nil (actually, it's not invoked).
		    dim obj_id as Ptr = raiseEvent Initialize(newobj_id)
		    if obj_id = nil then
		      soft declare function init lib CocoaFramework selector "init" (id as Ptr) as Ptr
		      
		      obj_id = init(newobj_id)
		    end if
		    
		    return obj_id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeTargetClass(className as String = NSControlTarget, superclassName as String = "NSObject") As Ptr
		  //this is Objective-C 2.0 code (available in Leopard).  For 1.0, we'd need to do it differently.
		  
		  
		  #if targetCocoa
		    soft declare function NSClassFromString lib CocoaFramework (aClassName as CFStringRef) as Ptr
		    soft declare function objc_allocateClassPair lib CocoaFramework (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    
		    dim newClassId as Ptr = objc_allocateClassPair(NSClassFromString(superclassName), className, 0)
		    if newClassId = nil then
		      //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		      return nil
		    end if
		    
		    soft declare sub objc_registerClassPair lib CocoaFramework (cls as Ptr)
		    
		    objc_registerClassPair newClassId
		    const MethodTypeEncoding = "v@:@"
		    
		    if AddInstanceMethod(newClassId, "action:", AddressOf DispatchHandleAction, MethodTypeEncoding) then
		      return newClassId
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NSClassName() As String
		  dim name as String = raiseEvent NSClassName
		  if name = "" then
		    //we'll try the class name itself.
		    name = Introspection.GetType(self).Name
		  end if
		  return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(obj as NSControl) As Integer
		  if obj <> nil then
		    return Integer(self.id) - Integer(obj.id)
		  else
		    return 1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Ptr
		  return me.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  #if targetCocoa
		    if me.id <> nil then
		      soft declare function stringValue lib CocoaFramework selector "stringValue" (id as Ptr) as CFStringRef
		      
		      
		      return stringValue(me.id)
		    else
		      return ""
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(assigns value as String)
		  #if targetCocoa
		    declare sub setStringValue lib CocoaLib selector "setStringValue:" (obj_id as Ptr, value as CFStringRef)
		    
		    setStringValue(self, value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetClass() As Ptr
		  static class_id as Ptr = MakeTargetClass
		  return class_id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function TargetMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CreateSubview(frame as Cocoa.NSRect) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Initialize(class_id as Ptr) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSClassName() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function autoresizesSubviews lib CocoaLib selector "autoresizesSubviews" (obj_id as Ptr) as Boolean
			    
			    if self.id <> nil then
			      return autoresizesSubviews(self)
			    end if
			  #endif
			End Get
		#tag EndGetter
		autoresizesSubviews As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return self.Frame
			End Get
		#tag EndGetter
		Private debugFrame As NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me._id
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    soft declare function isFlipped lib CocoaFramework selector "isFlipped" (id as Ptr) as Boolean
			    
			    return isFlipped(self)
			  #endif
			End Get
		#tag EndGetter
		IsFlipped As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TargetID As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden = true ) Private _id As Ptr
	#tag EndProperty


	#tag Constant, Name = CocoaFramework, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NSControlTarget, Type = String, Dynamic = False, Default = \"NSControlTarget", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
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
			Name="TabIndex"
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
