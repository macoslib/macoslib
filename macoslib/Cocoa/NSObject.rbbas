#tag Class
Protected Class NSObject
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(classRef as id)
		  #if TargetMachO
		    Declare Function objc_msgSend Lib CocoaLib (theReceiver as id, theSelector as SEL) as UInt32 // do not return cocoa.id here because that doesn't work on PowerPC due to bug in RB (as of 2008r5.1)
		    
		    me.objRef.value = objc_msgSend (classRef, Cocoa.Selector("alloc"))
		    if me.objRef.value = 0 then //allocation failed
		      raise new RuntimeException
		    end
		    me.objRef.value = objc_msgSend (me.objRef, Cocoa.Selector("init"))
		    if me.objRef.value = 0 then //initialization failed
		      raise new RuntimeException
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if TargetMachO
		    Declare Sub objc_msgSend Lib CocoaLib (theReceiver as id, theSelector as SEL)
		    
		    if me.objRef.value <> 0 then
		      objc_msgSend me.objRef, Cocoa.Selector("release")
		      me.objRef = To_id(0)
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reference() As id
		  return objRef
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Derived from: http://www.declaresub.com/ideclare/Cocoa/index.html
	#tag EndNote


	#tag Property, Flags = &h1
		Protected objRef As id
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
