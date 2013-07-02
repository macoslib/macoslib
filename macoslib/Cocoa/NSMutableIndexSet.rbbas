#tag Class
Class NSMutableIndexSet
Inherits NSIndexSet
	#tag Method, Flags = &h0
		Sub Add(newIndex as integer)
		  #if TargetMacOS
		    declare sub addIndex lib CocoaLib selector "addIndex:" (id as Ptr, idx as integer)
		    
		    addIndex  me.id, newIndex
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetMacOS
		    me.m_id = NSObject.Initialize( NSObject.Allocate( "NSMutableIndexSet" ))
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSIndexSet"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstIndex"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSIndexSet"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastIndex"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="NSIndexSet"
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
