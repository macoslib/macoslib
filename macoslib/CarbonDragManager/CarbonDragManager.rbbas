#tag Module
Protected Module CarbonDragManager
	#tag DelegateDeclaration, Flags = &h0
		Delegate Function DragSendDataProc(type as Integer, refCon as Integer, dragItem as Ptr, dragRef as Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function NewDragRefWithPasteboard(pb as CarbonPasteboard) As DragRef
		  #if TargetMacOS
		    
		    declare function NewDragWithPasteboard lib CarbonLib (pbRef as Integer, ByRef dragRef as Integer) as Integer
		    
		    dim r as Integer
		    if NewDragWithPasteboard (pb.Handle, r) = 0 then
		      if r <> 0 then
		        return new DragRef (r)
		      end
		    end
		    
		  #else
		    
		    #pragma unused pb
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Provides a replacement for RB's DragItem, which doesn't work fully in
		Cocoa yet (see <feedback://showreport?report_id=21991>)
		
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Constant, Name = kDragActionAlias, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionAll, Type = Double, Dynamic = False, Default = \"&hFFFFFFFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionCopy, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionDelete, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionGeneric, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionMove, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionNothing, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionPrivate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CGPoint, Flags = &h1
		x as Single
		y as Single
	#tag EndStructure

	#tag Structure, Name = EventRecord, Flags = &h1
		what as Short
		  message as Integer
		  when as Integer
		  where as Point
		modifiers as Short
	#tag EndStructure

	#tag Structure, Name = Point, Flags = &h1
		v as Short
		h as Short
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
