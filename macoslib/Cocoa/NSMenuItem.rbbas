#tag Class
Class NSMenuItem
Inherits NSObject
	#tag Method, Flags = &h1021
		Private Sub Constructor(mi as MenuItem)
		  me.Constructor( mi.Text, 0 )
		  
		  fromRBMenuItem = mi
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(theTitle as string, aTag as integer)
		  #if TargetMacOS
		    dim p as Ptr
		    
		    p = NSObject.Initialize( NSObject.Allocate( "NSMenuItem" ))
		    
		    Super.Constructor( p, false )
		    
		    Title = theTitle
		    Tag = aTag
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromMenuItem(mi as MenuItem) As NSMenuItem
		  
		  dim nsm as NSMenuItem
		  
		  declare function separatorItem lib CocoaLib selector "separatorItem" ( Cls as Ptr ) as Ptr
		  
		  if mi=nil then
		    return  nil
		  end if
		  
		  if mi.Text = "-" then //A separator
		    nsm = NSMenuItem.CreateSeparatorItem
		    nsm.fromRBMenuItem = mi
		  else
		    nsm = new NSMenuItem( mi )
		  end if
		  
		  return  nsm
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateSeparatorItem() As NSMenuItem
		  #if TargetMacOS
		    declare function separatorItem lib CocoaLib selector "separatorItem" ( Cls as Ptr ) as Ptr
		    
		    return new NSMenuItem(separatorItem(Cocoa.NSClassFromString("NSMenuItem" )))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAction(selectorName as string)
		  #if TargetMacOS
		    declare sub _setAction lib CocoaLib selector "setAction:" (id as Ptr, SEL as ptr)
		    
		    _setAction   me.id, Cocoa.NSSelectorFromString( selectorName )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTarget(targetObject as Ptr)
		  #if TargetMacOS
		    declare sub _setTarget lib CocoaLib selector "setTarget:" (id as Ptr, target as Ptr)
		    
		    _setTarget  me.id, targetObject
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function isEnabled lib CocoaLib selector "isEnabled" (id as Ptr) as Boolean
			    
			    return  isEnabled( me.id )
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetMacOS
			    declare sub setEnabled lib CocoaLib selector "setEnabled:" (id as Ptr, value as Boolean)
			    
			    setEnabled   me.id, value
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			//The original MenuItem if created from a RS MenuItem
		#tag EndNote
		fromRBMenuItem As MenuItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function tag lib CocoaLib selector "tag" (obj_id as Ptr) as Integer
			    
			    return tag(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTag lib CocoaLib selector "setTag:" (obj_id as Ptr, value as Integer)
			    
			    setTag(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Tag As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function title lib CocoaLib selector "title" (obj_id as Ptr) as CFStringRef
			    
			    return title(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if targetMacOS
			    declare sub setTitle lib CocoaLib selector "setTitle:" (obj_id as Ptr, value as CFStringRef)
			    
			    setTitle(self, value)
			    
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
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
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
