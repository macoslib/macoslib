#tag Class
Protected Class MacDeviceItem
	#tag Method, Flags = &h0
		Function BlockSize() As Integer
		  return zBlockSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bootable() As Boolean
		  return zBootable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BusProtocol() As String
		  return zBusProtocol
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanBeMadeBootable() As Boolean
		  return zCanBeMadeBootable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanBeMadeBootableRequiresDestroy() As Boolean
		  return zCanBeMadeBootableRequiresDestroy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPList(plist As MacPListBrowser) As MacDeviceItem
		  return MacPartitionItem.CreateFromPList( plist ) // The subclass can access all of the properties
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Eject() As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "eject " + me.Identifier
		  dim r as Shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ejectable() As Boolean
		  return zEjectable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GlobalPermissionsEnabled() As Boolean
		  return zGlobalPermissionsEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identifier() As String
		  return zIdentifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Internal() As Boolean
		  return zInternal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IOKitSize() As UInt64
		  return zIOKitSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LowLevelFormatSupported() As Boolean
		  return zLowLevelFormatSupported
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaName() As String
		  return zMediaName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaType() As String
		  return zMediaType
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MountDisk() As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "mountDisk "
		  cmd = cmd + me.ParentIdentifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MountPoint() As String
		  return zMountPoint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Node() As String
		  return zNode
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return Identifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentIdentifier() As String
		  return zParentIdentifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Partitions() As MacPartitionItem()
		  dim r() as MacPartitionItem
		  
		  dim info as MacPListBrowser = pGetDiskUtilList( me.Identifier )
		  dim disksArr() as MacPListBrowser = info.FindByKey( "AllDisksAndPartitions" )
		  if disksArr.Ubound = -1 then return r
		  
		  dim thisDisk as MacPListBrowser = disksArr( 0 )
		  if thisDisk.Type <> MacPListBrowser.ValueType.IsArray or thisDisk.Count = 0 then return r
		  
		  dim partitionsListArr() as MacPListBrowser = thisDisk.FindByKey( "Partitions" )
		  if partitionsListArr.Ubound = -1 then return r
		  
		  dim partitionsArr as MacPListBrowser = partitionsListArr( 0 )
		  if partitionsArr.Count = 0 then return r
		  
		  dim idArr() as MacPlistBrowser = partitionsArr.FindByKey( "DeviceIdentifier" )
		  for i as integer = 0 to idArr.Ubound
		    dim id as string = idArr( i ).StringValue
		    dim partition as MacPartitionItem = MacPartitionItem( Device( id ) )
		    r.Append partition
		  next
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pGrepInfo(term As String) As String
		  dim r as string
		  
		  term = " " + term + ": "
		  dim quotedTerm as string = "'" + term + "'"
		  
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "info " + me.Identifier + " | grep " + quotedTerm
		  dim sh as Shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  if sh.ErrorCode = 0 then
		    r = sh.Result
		    dim parts() as string = r.Split( term )
		    r = parts( parts.Ubound )
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub pRefresh(dict As Dictionary)
		  if dict = nil then return
		  
		  me.zBootable = dict.Lookup( "Bootable", false )
		  me.zBusProtocol = dict.Lookup( "BusProtocol", "" )
		  me.zCanBeMadeBootable = dict.Lookup( "CanBeMadeBootable", false )
		  me.zCanBeMadeBootableRequiresDestroy = dict.Lookup( "CanBeMadeBootableRequiresDestroy", false )
		  me.zType = dict.Lookup( "Content", "" )
		  me.zBlockSize = dict.Lookup( "DeviceBlockSize", false )
		  me.zIdentifier = dict.Lookup( "DeviceIdentifier", "" )
		  me.zNode = dict.Lookup( "DeviceNode", "" )
		  me.zTreePath = dict.Lookup( "DeviceTreePath", "" )
		  me.zEjectable = dict.Lookup( "Ejectable", false )
		  me.zGlobalPermissionsEnabled = dict.Lookup( "GlobalPermissionsEnabled", false )
		  me.zIOKitSize = dict.Lookup( "IOKitSize", false )
		  me.zInternal = dict.Lookup( "Internal", false )
		  if not zIsPartition then
		    me.zLowLevelFormatSupported = dict.Lookup( "LowLevelFormatSupported", false )
		  end if
		  me.zMediaName = dict.Lookup( "MediaName", "" )
		  me.zMediaType = dict.Lookup( "MediaType", "" )
		  me.zMountPoint = dict.Lookup( "MountPoint", "" )
		  me.zParentIdentifier = dict.Lookup( "ParentWholeDisk", "" )
		  me.zRAIDMaster = dict.Lookup( "RAIDMaster", false )
		  me.zRAIDSlice = dict.Lookup( "RAIDSlice", false )
		  me.zSupportsGlobalPermissionsDisable = dict.Lookup( "SupportsGlobalPermissionsDisable", false )
		  me.zSystemImage = dict.Lookup( "SystemImage", false )
		  me.zTotalSize = dict.Lookup( "TotalSize", false )
		  me.zVolumeName = dict.Lookup( "VolumeName", "" )
		  me.zWritable = dict.Lookup( "Writable", false )
		  me.zWritableMedia = dict.Lookup( "WritableMedia", false )
		  me.zWritableVolume = dict.Lookup( "WritableVolume", false )
		  
		  RaiseEvent RefreshFromDict( dict )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function pValueFromKey(key As String) As Variant
		  dim r as Variant = nil
		  
		  dim plist as MacPListBrowser = MacDiskUtil.pGetDiskUtilInfo( me.Identifier )
		  if plist.HasKey( key ) then
		    r = plist.Child( key ).VariantValue
		  end if
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RAIDMaster() As Boolean
		  return zRAIDMaster
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RAIDSlice() As Boolean
		  return zRAIDSlice
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh()
		  // Updates all the properties
		  
		  dim plist as MacPListBrowser = MacDiskUtil.pGetDiskUtilInfo( me.Identifier )
		  if plist <> nil and plist.IsDictionary then
		    dim dict as Dictionary = plist.VariantValue
		    me.pRefresh( dict )
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsGlobalPermissionsDisable() As Boolean
		  return zSupportsGlobalPermissionsDisable
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemImage() As Boolean
		  return zSystemImage
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalSize() As UInt64
		  return zTotalSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TreePath() As String
		  return zTreePath
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As String
		  return zType
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnmountDisk(force As Boolean = False) As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "unmountDisk "
		  if force then
		    cmd = cmd + "force "
		  end if
		  cmd = cmd + me.ParentIdentifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VolumeName() As String
		  return zVolumeName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Writable() As Boolean
		  return zWritable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WritableMedia() As Boolean
		  return zWritableMedia
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WritableVolume() As Boolean
		  return zWritableVolume
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event RefreshFromDict(dict As Dictionary)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not zIsPartition then return me
			  
			  dim r as MacDeviceItem
			  
			  dim id as string = zParentIdentifier
			  if id <> "" then
			    try
			      r = Device( id )
			    catch
			      r = nil
			    end try
			  else
			    r = nil
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		Device As MacDeviceItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as UInt64
			  dim v as Variant = pValueFromKey( "FreeSpace" )
			  if v <> nil then
			    r = v.UInt64Value
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		FreeSpace As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  dim v as Variant = pValueFromKey( "SMARTStatus" )
			  if v <> nil then
			    r = v.StringValue
			  end if
			  
			  return r
			  
			End Get
		#tag EndGetter
		SMARTStatus As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zBlockSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zBootable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zBusProtocol As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zCanBeMadeBootable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zCanBeMadeBootableRequiresDestroy As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zEjectable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zGlobalPermissionsEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zInternal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zIOKitSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zIsPartition As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zLowLevelFormatSupported As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zMediaName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zMediaType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zMountPoint As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zNode As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zParentIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zRAIDMaster As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zRAIDSlice As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zSupportsGlobalPermissionsDisable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zSystemImage As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zTotalSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zTreePath As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zVolumeName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zWritable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zWritableMedia As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zWritableVolume As Boolean
	#tag EndProperty


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
			Name="SMARTStatus"
			Group="Behavior"
			Type="String"
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
