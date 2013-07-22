#tag Class
Class NSLayoutConstraint
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSLayoutConstraint")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreatesWithVisualFormat(aFormat as String, options as UInt32, metrics as NSDictionary, views as NSDictionary) As NSLayoutConstraint()
		  
		  #if TargetMacOS
		    declare function constraintsWithVisualFormat lib CocoaLib selector "constraintsWithVisualFormat:options:metrics:views:" _
		    (class_id as Ptr, aFormat as CFStringRef, options as UInt32, metrics as Ptr, views as Ptr) as Ptr
		    
		    dim metricsRef as Ptr
		    if metrics <> nil then
		      metricsRef = metrics
		    end if
		    
		    dim viewsRef as Ptr
		    if views <> nil then
		      viewsRef = views
		    end if
		    
		    dim retArray() as NSLayoutConstraint
		    
		    dim arrayRef as Ptr = constraintsWithVisualFormat(ClassRef, aFormat, options, metricsRef, viewsRef)
		    if arrayRef <> nil then
		      dim ns_array as new NSArray(arrayRef)
		      const sizeOfPtr = 4
		      dim arrayRange as Cocoa.NSRange = Cocoa.NSMakeRange(0, ns_array.Count)
		      dim m as MemoryBlock = ns_array.ValuesArray(arrayRange)
		      dim n as UInt32 = arrayRange.length-1
		      for i as integer = 0 to n
		        retArray.append new NSLayoutConstraint(Ptr(m.UInt32Value(i*sizeOfPtr)))
		      next
		    end if
		    
		    return retArray
		    
		  #else
		    #pragma unused aFormat
		    #pragma unused options
		    #pragma unused metrics
		    #pragma unused views
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateWithItem(view1 as NSView, attrib1 as NSLayoutAttribute, relation as NSLayoutRelation, view2 as NSView, attrib2 as NSLayoutAttribute, multiplier as Single, constant as Single) As NSLayoutConstraint
		  
		  #if TargetMacOS
		    declare function constraintWithItem lib CocoaLib selector "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:" _
		    (class_id as Ptr, view1 as Ptr, attrib1 as NSLayoutAttribute, relation as NSLayoutRelation, view2 as Ptr, attrib2 as NSLayoutAttribute, multiplier as Single, constant as Single) as Ptr
		    
		    dim view1Ref as Ptr
		    if view1 <> nil then
		      view1Ref = view1
		    end if
		    
		    dim view2Ref as Ptr
		    if view2 <> nil then
		      view2Ref = view2
		    end if
		    
		    dim constraintRef as Ptr = constraintWithItem(ClassRef, view1Ref, attrib1, relation, view2Ref, attrib2, multiplier, constant)
		    
		    if constraintRef <> nil then
		      return new NSLayoutConstraint(constraintRef)
		    end if
		    
		  #else
		    #pragma unused view1
		    #pragma unused attrib1
		    #pragma unused relation
		    #pragma unused view2
		    #pragma unused attrib2
		    #pragma unused multiplier
		    #pragma unused constant
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function constant lib CocoaLib selector "constant" (obj_id as Ptr) as Single
			    
			    return constant(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setConstant lib CocoaLib selector "setConstant:" (obj_id as Ptr, value as Single)
			    
			    setConstant self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Constant As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function firstAttribute lib CocoaLib selector "firstAttribute" (obj_id as Ptr) as NSLayoutAttribute
			    
			    return firstAttribute(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FirstAttribute As NSLayoutAttribute
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function firstItem lib CocoaLib selector "firstItem" (obj_id as Ptr) as Ptr
			    
			    dim viewRef as Ptr = firstItem(self)
			    
			    if viewRef <> nil then
			      return new NSView(viewRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		FirstItem As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function multiplier lib CocoaLib selector "multiplier" (obj_id as Ptr) as Single
			    
			    return multiplier(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Multiplier As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function priority lib CocoaLib selector "priority" (obj_id as Ptr) as Single
			    
			    return CType(priority(self), NSLayoutPriority)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setPriority lib CocoaLib selector "setPriority:" (obj_id as Ptr, value as Single)
			    
			    setPriority self, CType(value, Single)
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		Priority As NSLayoutPriority
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function relation lib CocoaLib selector "relation" (obj_id as Ptr) as NSLayoutRelation
			    
			    return relation(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Relation As NSLayoutRelation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function secondAttribute lib CocoaLib selector "secondAttribute" (obj_id as Ptr) as NSLayoutAttribute
			    
			    return secondAttribute(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		SecondAttribute As NSLayoutAttribute
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function secondItem lib CocoaLib selector "secondItem" (obj_id as Ptr) as Ptr
			    
			    dim viewRef as Ptr = secondItem(self)
			    
			    if viewRef <> nil then
			      return new NSView(viewRef)
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		SecondItem As NSView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    declare function shouldBeArchived lib CocoaLib selector "shouldBeArchived" (obj_id as Ptr) as Boolean
			    
			    return shouldBeArchived(self)
			    
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    declare sub setShouldBeArchived lib CocoaLib selector "setShouldBeArchived:" (obj_id as Ptr, value as Boolean)
			    
			    setShouldBeArchived self, value
			    
			  #else
			    #pragma unused value
			  #endif
			  
			End Set
		#tag EndSetter
		ShouldBeArchived As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = NSLayoutFormatAlignAllBaseline, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllBottom, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllCenterX, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllCenterY, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllLeading, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllLeft, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllRight, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllTop, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignAllTrailing, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatAlignmentMask, Type = Double, Dynamic = False, Default = \"&hFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatDirectionLeadingToTrailing, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatDirectionLeftToRight, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatDirectionMask, Type = Double, Dynamic = False, Default = \"768", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSLayoutFormatDirectionRightToLeft, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NSEdgeInsets, Flags = &h0
		top as Single
		  left as Single
		  bottom as Single
		right as Single
	#tag EndStructure


	#tag Enum, Name = NSLayoutAttribute, Type = Integer, Flags = &h0
		NSLayoutAttributeLeft = 1
		  NSLayoutAttributeRight
		  NSLayoutAttributeTop
		  NSLayoutAttributeBottom
		  NSLayoutAttributeLeading
		  NSLayoutAttributeTrailing
		  NSLayoutAttributeWidth
		  NSLayoutAttributeHeight
		  NSLayoutAttributeCenterX
		  NSLayoutAttributeCenterY
		  NSLayoutAttributeBaseline
		NSLayoutAttributeNotAnAttribute = 0
	#tag EndEnum

	#tag Enum, Name = NSLayoutConstraintOrientation, Type = Integer, Flags = &h0
		NSLayoutConstraintOrientationHorizontal
		NSLayoutConstraintOrientationVertical
	#tag EndEnum

	#tag Enum, Name = NSLayoutPriority, Type = Integer, Flags = &h0
		NSLayoutPriorityRequired = 1000
		  NSLayoutPriorityDefaultHigh = 750
		  NSLayoutPriorityDragThatCanResizeWindow = 510
		  NSLayoutPriorityWindowSizeStayPut = 500
		  NSLayoutPriorityDragThatCannotResizeWindow = 490
		  NSLayoutPriorityDefaultLow = 250
		NSLayoutPriorityFittingSizeCompression = 50
	#tag EndEnum

	#tag Enum, Name = NSLayoutRelation, Type = Integer, Flags = &h0
		NSLayoutRelationLessThanOrEqual = -1
		  NSLayoutRelationEqual = 0
		NSLayoutRelationGreaterThanOrEqual = 1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Constant"
			Group="Behavior"
			Type="Single"
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
			Name="Multiplier"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldBeArchived"
			Group="Behavior"
			Type="Boolean"
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
