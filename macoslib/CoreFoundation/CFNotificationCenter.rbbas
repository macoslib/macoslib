#tag Class
Class CFNotificationCenter
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function LocalCenter() As CFNotificationCenter
		  #if targetMacOS
		    if IsTiger then
		      soft declare function CFNotificationCenterGetLocalCenter lib CarbonFramework () as Ptr
		      
		      dim theCenter as new CFNotificationCenter(CFNotificationCenterGetLocalCenter, false)
		      return theCenter
		      
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    
		    soft declare function CFNotificationCenterGetTypeID lib CarbonFramework () as CFTypeID
		    
		    static id as CFTypeID = CFNotificationCenterGetTypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddObserver()
		  'void CFNotificationCenterAddObserver (
		  'CFNotificationCenterRef center,
		  'const void *observer,
		  'CFNotificationCallback callBack,
		  'CFStringRef name,
		  'const void *object,
		  'CFNotificationSuspensionBehavior suspensionBehavior
		  ');
		  
		  
		  'enum CFNotificationSuspensionBehavior {
		  'CFNotificationSuspensionBehaviorDrop = 1,
		  'CFNotificationSuspensionBehaviorCoalesce = 2,
		  'CFNotificationSuspensionBehaviorHold = 3,
		  'CFNotificationSuspensionBehaviorDeliverImmediately = 4
		  '};
		  'typedef enum CFNotificationSuspensionBehavior CFNotificationSuspensionBehavior;
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
