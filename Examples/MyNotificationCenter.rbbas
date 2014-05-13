#tag Class
Protected Class MyNotificationCenter
Inherits NSUserNotificationCenter
	#tag Event
		Sub DidActivateNotification(notification as NSUserNotification)
		  dim i as NSUserNotification.NSUserNotificationActivationType = notification.ActivationType
		  dim s as string
		  
		  Select case i
		  case NSUserNotification.NSUserNotificationActivationType.None
		  case NSUserNotification.NSUserNotificationActivationType.ContentsClicked
		    s = " with click on contents"
		  case NSUserNotification.NSUserNotificationActivationType.ActionButtonClicked
		    s = " with click on action button"
		    
		  end Select
		  
		  
		  dim description as String = notification.Title
		  if description = "" then description = "macoslib"
		  
		  NSUserNotificationExample.lstNotifications.AddRow "Activated " + description + s
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDeliverNotification(notification as NSUserNotification)
		  dim description as String = notification.Title
		  if description = "" then description = "macoslib"
		  
		  NSUserNotificationExample.lstNotifications.AddRow "Delivered " + description
		End Sub
	#tag EndEvent

	#tag Event
		Function ShouldPresentNotificationInForeground(notification as NSUserNotification) As Boolean
		  dim description as String = notification.Title
		  if description = "" then description = "macoslib"
		  
		  NSUserNotificationExample.lstNotifications.AddRow Description + " should present"
		  
		  return True // True if the user notification should be displayed regardless of whether the app is in the fore- or background; false for background only.
		End Function
	#tag EndEvent


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
			Type="Integer"
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
