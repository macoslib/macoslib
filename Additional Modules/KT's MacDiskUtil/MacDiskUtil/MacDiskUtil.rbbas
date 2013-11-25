#tag Module
Protected Module MacDiskUtil
	#tag Method, Flags = &h1
		Protected Function Device(identifier As String) As MacDeviceItem
		  dim plist as MacPListBrowser = pGetDiskUtilInfo( identifier )
		  dim r as MacDeviceItem = MacDeviceItem.CreateFromPList( plist )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Devices() As MacDeviceItem()
		  dim info as MacPListBrowser = pGetDiskUtilList( )
		  dim disksArr() as MacPListBrowser = info.FindByKey( "WholeDisks" )
		  dim r() as MacDeviceItem
		  if disksArr.Ubound <> -1 then
		    dim disks as MacPListBrowser = disksArr( 0 )
		    dim lastIndex as integer = disks.Count - 1
		    for i as integer = 0 to lastIndex
		      dim thisDisk as MacPListBrowser = disks.Child( i )
		      r.Append Device( thisDisk.StringValue )
		    next
		  end if
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pExecuteShellCommand(cmd As String) As String
		  dim sh as new shell
		  sh.Execute cmd
		  return sh.Result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pGetDiskUtilInfo(device As String = "") As MacPListBrowser
		  dim cmd as string = kDiskUtilCmd + "info -plist " + device
		  dim r as string = pExecuteShellCommand( cmd )
		  return MacPListBrowser.CreateFromPListString( r )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pGetDiskUtilList(deviceIdentifier As String = "") As MacPListBrowser
		  dim cmd as string = kDiskUtilCmd + "list -plist " + deviceIdentifier
		  dim r as string = pExecuteShellCommand( cmd )
		  return MacPlistBrowser.CreateFromPListString( r )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( Hidden ) Protected Sub SelfTest()
		  dim devicesArr() as MacDeviceItem = Devices
		  dim partitionArr() as MacPartitionItem
		  for each d as MacDeviceItem in devicesArr
		    partitionArr = d.Partitions
		    partitionArr = partitionArr // A Place to break
		  next d
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kDiskUtilCmd, Type = String, Dynamic = False, Default = \"/usr/sbin/diskutil ", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
End Module
#tag EndModule
