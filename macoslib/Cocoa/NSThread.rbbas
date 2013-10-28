#tag Class
Class NSThread
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function CallStackSymbols() As NSArray
		  //# Get all the symbols on the call stack
		  
		  #if TargetMacOS
		    declare function callStackSymbols lib CocoaLib selector "callStackSymbols" ( id as Ptr ) as Ptr
		    
		    return  new NSArray( callStackSymbols( ClassID ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As Ptr
		  #if TargetMacOS
		    static classPtr as Ptr = Cocoa.NSClassFromString( "NSThread" )
		    
		    return  classPtr
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
