#tag Class
Protected Class PDFView
Inherits Cocoa.CanvasForNSView
	#tag Event
		Function NSClassName() As String
		  return  "PDFView"
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  #if targetMacOS
		    me.RegisterForNotification   ""
		  #endif
		  
		  RaiseEvent   Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceivedNotification(notification as NSNotification)
		  
		  #if TargetMacOS
		    select case notification.Name
		    case "PDFViewChangedHistoryNotification"
		      RaiseEvent  HistoryChanged
		      
		    case "PDFViewDocumentChangedNotification"
		      RaiseEvent  DocumentChanged
		      
		    case "PDFViewPageChangedNotification"
		      RaiseEvent  PageChanged
		      
		    case "PDFViewScaleChangedNotification"
		      RaiseEvent  ScaleChanged
		      
		    case "PDFViewSelectionChangedNotification"
		      RaiseEvent  SelectionChanged
		      
		    case "PDFViewDisplayModeChangedNotification"
		      RaiseEvent  DisplayModeChanged
		      
		    else
		      RaiseEvent  ReceivedNotification( notification )
		      
		    end select
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function RequiredFrameworks() As String()
		  
		  return  Array( "Quartz.framework" )
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function CocoaDelegateMap() As Dictionary
		  static d as new Dictionary
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DelegateClassID() As Ptr
		  static p as Ptr = MakeDelegateClass
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FindObjectByID(id as Ptr) As IKDeviceBrowserView
		  dim w as WeakRef = CocoaDelegateMap.Lookup(id, new WeakRef(nil))
		  return IKDeviceBrowserView( w.Value )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDelegate() As Ptr
		  #if targetCocoa
		    declare function delegate_ lib CocoaLib selector "delegate" (obj_id as Ptr) as Ptr
		    
		    return delegate_(self.id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Invalidate()
		  
		  #if TargetMacOS
		    declare sub setNeedsDisplay lib CocoaLib selector "setNeedsDisplay:" (id as Ptr, flag as boolean)
		    
		    setNeedsDisplay( me.id, true )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeDelegateClass(className as String = DelegateClassName, superclassName as String = "NSObject") As Ptr
		  #if false   //Implementation in progress
		    '#if targetCocoa
		    'declare function objc_allocateClassPair lib CocoaLib (superclass as Ptr, name as CString, extraBytes as Integer) as Ptr
		    'declare sub objc_registerClassPair lib CocoaLib (cls as Ptr)
		    'declare function class_addMethod lib CocoaLib (cls as Ptr, name as Ptr, imp as Ptr, types as CString) as Boolean
		    'declare function objc_getProtocol lib CocoaLib (name as CString) as Ptr
		    'declare function class_addProtocol lib CocoaLib (Cls as Ptr, protocol as Ptr) as Boolean
		    '
		    'dim newClassId as Ptr = objc_allocateClassPair(Cocoa.NSClassFromString( superclassName ), className, 0)
		    'if newClassId = nil then
		    'raise new macoslibException( "Unable to create ObjC subclass " + className + " from " + superclassName ) //perhaps the class already exists.  We could check for this, and raise an exception for other errors.
		    'return nil
		    'end if
		    '
		    'objc_registerClassPair newClassId
		    '
		    ''call   class_addProtocol( newClassId, objc_getProtocol( "IKDeviceBrowserViewDelegate" ))
		    '
		    'dim methodList() as Tuple
		    ''methodList.Append  "deviceBrowserView:didEncounterError:" : CType( AddressOf DelegateError, Ptr ) : "v@:@@"
		    ''methodList.Append  "deviceBrowserView:selectionDidChange:" : CType( AddressOf DelegateSelectionChanged, Ptr ) : "v@:@@"
		    '
		    'dim methodsAdded as Boolean = true
		    'for each item as Tuple in methodList
		    'methodsAdded = methodsAdded and class_addMethod(newClassId, Cocoa.NSSelectorFromString(item(0)), item(1), item(2))
		    'next
		    '
		    'if methodsAdded then
		    'return newClassId
		    'else
		    'break
		    'return nil
		    'end if
		    '
		    '#else
		    '#pragma unused className
		    '#pragma unused superClassName
		    '#endif
		    
		  #else
		    
		    #pragma unused className
		    #pragma unused superclassName
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  #if TargetMacOS
		    declare function release lib CocoaLib selector "release" (id as Ptr) as Ptr
		    
		    call  release( me.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDelegate()
		  #if targetCocoa
		    declare function alloc lib CocoaLib selector "alloc" (class_id as Ptr) as Ptr
		    declare function init lib CocoaLib selector "init" (obj_id as Ptr) as Ptr
		    declare sub setDelegate lib CocoaLib selector "setDelegate:" (obj_id as Ptr, del_id as Ptr)
		    
		    
		    dim delegate_id as Ptr = init(alloc(DelegateClassID))
		    if delegate_id = nil then
		      return
		    end if
		    setDelegate self.id, delegate_id
		    CocoaDelegateMap.Value(delegate_id) = new WeakRef(self)
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DisplayModeChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HistoryChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PageChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReceivedNotification(notification as NSNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScaleChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function autoScales lib "Quartz.framework" selector "autoScales" (id as Ptr) as Boolean
			    
			    return  autoScales( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setAutoScales lib "Quartz" selector "setAutoScales:" (id as Ptr, flag as Boolean)
			    
			    setAutoScales  self.id, value
			  #endif
			End Set
		#tag EndSetter
		AutoScales As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function displayMode lib "Quartz.framework" selector "displayMode" (id as Ptr) as Integer
			    
			    return  displayMode( self.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDisplayMode lib "Quartz.framework" selector "setDisplayMode:" (id as Ptr, flag as integer)
			    
			    setDisplayMode  self.id, value
			  #endif
			End Set
		#tag EndSetter
		DisplayMode As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function document lib "Quartz.framework" selector "document" (id as Ptr) as Ptr
			    
			    dim p as Ptr = document( self.id )
			    if p<>nil then
			      return  new mlPDFDocument( p, false )
			    else
			      return  nil
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setDocument lib "Quartz.framework" selector "setDocument:" (id as Ptr, docid as Ptr)
			    
			    setDocument  self.id, value
			  #endif
			End Set
		#tag EndSetter
		Document As mlPDFDocument
	#tag EndComputedProperty


	#tag Constant, Name = DelegateClassName, Type = String, Dynamic = False, Default = \"macoslibPDFViewDelegate", Scope = Private
	#tag EndConstant


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
			Name="FocusRingType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="NSFocusRingType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - Exterior"
			#tag EndEnumValues
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
			Name="AutoresizesSubviews"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoresizingMask"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoScales"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
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
			Name="BoundsRotation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBecomeKeyView"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDraw"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDrawConcurrently"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
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
			Name="FrameRotation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
			Name="Hidden"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HiddenOrHasHiddenAncestor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="InLiveResize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsFlipped"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsInFullScreenMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsOpague"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedFromBase"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRotatedOrScaledFromBase"
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
			Name="NeedsDisplay"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsBoundsChangedNotifications"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PostsFrameChangedNotifications"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesContentDuringLiveResize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldDrawColor"
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
			Name="Tag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="WantsDefaultClipping"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
