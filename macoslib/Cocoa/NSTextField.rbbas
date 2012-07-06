#tag Class
Class NSTextField
Inherits NSObject
	#tag Method, Flags = &h1000
		Sub Constructor(fromObject as Label)
		  
		  #if TargetMacOS
		    me.Constructor  Ptr( fromObject.Handle ), false
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(fromObject as TextField)
		  
		  #if TargetMacOS
		    me.Constructor  Ptr( fromObject.Handle ), false
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function attributedStringValue lib CocoaLib selector "attributedStringValue" (id as Ptr) as Ptr
			    
			    return   Cocoa.NSObjectFromNSPtr( attributedStringValue( me._id ))
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub attributedStringValue lib CocoaLib selector "setAttributedStringValue:" (id as Ptr, value as Ptr)
			    
			    attributedStringValue( me._id, value.id )
			  #endif
			End Set
		#tag EndSetter
		AttributedStringValue As NSAttributedString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isEditable lib CocoaLib selector "isEditable" (id as Ptr) as Boolean
			    
			    return   isEditable( me._id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub isEditable lib CocoaLib selector "setIsEditable:" (id as Ptr, value as boolean)
			    
			    isEditable( me._id, value )
			  #endif
			End Set
		#tag EndSetter
		Editable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isSelectable lib CocoaLib selector "isSelectable" (id as Ptr) as Boolean
			    
			    return   isSelectable( me._id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub isSelectable lib CocoaLib selector "setIsSelectable:" (id as Ptr, value as boolean)
			    
			    isSelectable( me._id, value )
			  #endif
			End Set
		#tag EndSetter
		Selectable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function allowsEditingTextAttributes lib CocoaLib selector "allowsEditingTextAttributes" (id as Ptr) as Boolean
			    
			    return   allowsEditingTextAttributes( me._id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub allowsEditingTextAttributes lib CocoaLib selector "setAllowsEditingTextAttributes:" (id as Ptr, value as boolean)
			    
			    allowsEditingTextAttributes( me._id, value )
			  #endif
			End Set
		#tag EndSetter
		Styled As Boolean
	#tag EndComputedProperty


End Class
#tag EndClass
