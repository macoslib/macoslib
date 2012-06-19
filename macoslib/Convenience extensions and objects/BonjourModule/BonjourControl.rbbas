#tag Class
Class BonjourControl
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  //
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  //
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  //
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BrowseBonjourServicesOfType(type as string, inDomain as string = "")
		  
		  #if TargetMacOS
		    NetBrowser = new NSNetServiceBrowser
		    
		    RegisterServiceBrowser   NetBrowser
		    
		    NetBrowser.SearchForServicesOfType   type, inDomain
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  #if TargetMacOS
		    BonjourModule.RegisterControl  me
		    Super.Constructor
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoesUseObject(obj as BonjourService) As Boolean
		  
		  for each bs as BonjourService in BSS
		    if bs.Handle = obj.Handle then
		      return   true
		    end if
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindService(nsservice as NSNetService, andRemove as Boolean = false) As BonjourService
		  
		  dim result as BonjourService
		  
		  for i as integer=0 to BSS.Ubound
		    if BSS( i ).Handle = nsservice.id then //Found
		      result = BSS( i )
		      if andRemove then
		        BSS.Remove   i
		      end if
		      return  result
		    end if
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_SearchError(browser as NSNetServiceBrowser, errorCode as integer, errorDomain as integer)
		  
		  #if TargetMacOS
		    RaiseEvent   BrowsingError( errorCode, errorDomain )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_SearchStopped(browser as NSNetServiceBrowser)
		  
		  RaiseEvent   BrowsingStopped
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceAdded(browser as NSNetServiceBrowser, ServiceName as string, TXTDict as Dictionary, moreComing as Boolean, NSService as NSNetService)
		  
		  #if TargetMacOS
		    dim service as BonjourService = BonjourService.CreateFromCocoaObject( NSService )
		    
		    if service=nil then
		      DReportError  CurrentMethodName, "Could not create BonjourService from the passed NSNetService"
		      return
		    end if
		    
		    RegisterBonjourService   service
		    
		    RaiseEvent    ServiceAdded( service, moreComing )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceRemoved(browser as NSNetServiceBrowser, ServiceName as string, moreComing as Boolean, NSService as NSNetService)
		  
		  #if TargetMacOS
		    dim service as BonjourService
		    dim index as integer
		    
		    for i as integer=0 to BSS.Ubound
		      if BSS( i ).Handle = NSService.id then
		        index = i
		        service = BSS( i )
		        exit
		      end if
		    next
		    
		    if service=nil then
		      DReportError   CurrentMethodName, "Couldn't retrieve existing BonjourService for NSNetService:", NSService
		      return
		    end if
		    
		    RaiseEvent  ServiceRemoved   service, moreComing
		    
		    BSS.Remove   index
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
		  
		  RaiseEvent   ServiceResolutionError( service, errorCode, errorDomain )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceResolved(service as BonjourService)
		  
		  RaiseEvent   ServiceResolved( service )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceStoppedResolving(service as BonjourService)
		  
		  RaiseEvent   ServiceStoppedResolving( service )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_ServiceTXTDataChanged(service as BonjourService)
		  
		  RaiseEvent   ServiceTXTRecordChanged( service )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PublishBonjourService(Name as string, type as string, domain as string, port as integer, TXTDictionary as Dictionary = nil)
		  //# Register a Bonjour service
		  
		  BonjourModule.PublishService   name, type, domain, port, TXTDictionary
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterBonjourService(service as BonjourService)
		  
		  BSS.Append   service
		  service.AddParent   me
		  
		  AddHandler   service.Resolved, AddressOf Handle_ServiceResolved
		  AddHandler   service.ResolutionError, AddressOf Handle_ServiceResolutionError
		  AddHandler   service.StoppedResolving, AddressOf Handle_ServiceStoppedResolving
		  AddHandler   service.TXTDataChanged, AddressOf Handle_ServiceTXTDataChanged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RegisterServiceBrowser(browser as NSNetServiceBrowser)
		  
		  AddHandler   browser.ServiceAdded, AddressOf Handle_ServiceAdded
		  AddHandler   browser.ServiceRemoved, AddressOf Handle_ServiceRemoved
		  AddHandler   browser.SearchError, AddressOf Handle_SearchError
		  AddHandler   browser.SearchStopped, AddressOf Handle_SearchStopped
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResolveBonjourService(Name as string, type as string, domain as string = "", timeoutInSeconds as double)
		  
		  #if TargetMacOS
		    dim nsns as NSNetService = NSNetService.InitForResolving( name, domain, type )
		    
		    if nsns<>nil then
		      NetServices.Append   nsns
		      nsns.AttachedProperty( "ParentBonjourControl" ) = me
		      nsns.Resolve   timeoutInSeconds
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BrowsingError(errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BrowsingStopped()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceAdded(service as BonjourService, moreComing as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceRemoved(service as BonjourService, moreComing as boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceResolutionError(service as BonjourService, errorCode as integer, errorDomain as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceResolved(service as BonjourService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceStoppedResolving(service as BonjourService)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ServiceTXTRecordChanged(service as BonjourService)
	#tag EndHook


	#tag Property, Flags = &h21
		Private BSS() As BonjourService
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NetBrowser As NSNetServiceBrowser
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NetServices() As NSNetService
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
