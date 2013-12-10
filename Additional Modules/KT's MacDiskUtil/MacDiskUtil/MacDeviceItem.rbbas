#tag Class
Protected Class MacDeviceItem
	#tag Method, Flags = &h0
		Function BlockSize() As Integer
		  return zBlockSize
		  
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
		 Shared Function CreateFromDictionary(dict As Dictionary) As MacDeviceItem
		  if dict is nil then return nil
		  
		  dim isPartition as boolean = not dict.Lookup( "WholeDisk", false )
		  
		  dim r as MacDiskUtil.MacDeviceItem
		  if isPartition then
		    r = new MacPartitionItem
		  else
		    r = new MacDeviceItem
		  end if
		  
		  r.zIsPartition = isPartition
		  r.pRefresh( dict )
		  return r
		  
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
		  
		  dim info as Dictionary = pGetDiskUtilList( me.Identifier )
		  if info is nil then return r
		  
		  dim disksArr() as Variant = info.Lookup( "AllDisksAndPartitions", nil )
		  if disksArr is nil or disksArr.Ubound = -1 then return r
		  
		  dim thisDisk as Dictionary = disksArr( 0 )
		  if thisDisk.Count = 0 then return r
		  
		  dim partitionsListArr() as Variant 
		  dim v as Variant = thisDisk.Lookup( "Partitions", nil )
		  #if DebugBuild
		    dim thisType as integer = v.Type
		    #pragma unused thisType
		  #endif
		  if v is nil or v.Type < Variant.TypeArray then
		    return r
		  end if
		  
		  partitionsListArr = v
		  if partitionsListArr.Ubound = -1 then return r
		  
		  for i as integer = 0 to partitionsListArr.Ubound
		    dim partitionDict as Dictionary = partitionsListArr( i )
		    dim id as string = partitionDict.Lookup( "DeviceIdentifier", "" )
		    if id <> "" then
		      dim partition as MacDiskUtil.MacPartitionItem = MacDiskUtil.MacPartitionItem( Device( id ) )
		      r.Append partition
		    end if
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
		  #pragma warning "Don't think I need this"
		  
		  if dict = nil then return
		  
		  zDict = dict
		  
		  'me.zBootable = dict.Lookup( "Bootable", false )
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
		  dim r as Variant = ""
		  
		  if zDict is nil then return r
		  r = zDict.Lookup( key, "" )
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
		  
		  dim dict as Dictionary = MacDiskUtil.pGetDiskUtilInfo( me.Identifier )
		  zDict = dict
		  if dict <> nil then
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
			  return pValueFromKey( "Bootable" )
			  
			End Get
		#tag EndGetter
		Bootable As Boolean
	#tag EndComputedProperty

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
			  me.Refresh
			  return pValueFromKey( "FreeSpace" ).UInt64Value
			  
			End Get
		#tag EndGetter
		FreeSpace As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			i
		#tag EndNote
		#tag Getter
			Get
			  return me.MountStatus = MountType.Mounted
			End Get
		#tag EndGetter
		Mounted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as MountType = MountType.Unknown
			  
			  try
			    dim text as string = pGrepInfo( "Mounted" )
			    if text.InStr( "not applicable" ) <> 0 then
			      r = MountType.NotApplicable
			    elseif text.InStr( "yes" ) <> 0 then
			      r = MountType.Mounted
			    elseif text.InStr( "no" ) <> 0 then
			      r = MountType.Unmounted
			    end if
			    
			  catch
			  end
			  
			  return r
			  
			End Get
		#tag EndGetter
		MountStatus As MountType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  me.Refresh
			  return pValueFromKey( "SMARTStatus" ).StringValue
			  
			End Get
		#tag EndGetter
		SMARTStatus As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zBlockSize As Integer
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
		Protected zDict As Dictionary
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


	#tag Enum, Name = MountType, Type = Integer, Flags = &h0
		Unknown = -2
		  NotApplicable = -1
		  Unmounted = 0
		Mounted = 1
	#tag EndEnum


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
			EditorType="MultiLineEditor"
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
