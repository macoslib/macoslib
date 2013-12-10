#tag Class
Protected Class MacPartitionItem
Inherits MacDiskUtil.MacDeviceItem
	#tag Event
		Sub RefreshFromDict(dict As Dictionary)
		  if dict is nil then return
		  
		  me.zFileSystemName = dict.Lookup( "FileSystemName", "" )
		  me.zFileSystemType = dict.Lookup( "FileSystemType", "" )
		  me.zJournalOffset = dict.Lookup( "JournalOffset", false )
		  me.zJournalSize = dict.Lookup( "JournalSize", false )
		  me.zVolumeUUID = dict.Lookup( "VolumeUUID", "" )
		  me.zRecoveryIdentifier = dict.Lookup( "RecoveryDeviceIdentifier", "" )
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function CreateFromPList(plist As MacPListBrowser) As MacDeviceItem
		  if plist is nil then return nil
		  
		  if plist.Type <> MacPListBrowser.ValueType.IsDictionary then return nil
		  #if DebugBuild
		    dim k() as String = plist.ChildrenKeys
		    #pragma unused k
		  #endif
		  
		  dim dict as Dictionary = plist.VariantValue // Get it as a Dictionary all at once
		  
		  dim device as MacDeviceItem
		  dim isPartition as boolean = not dict.Lookup( "WholeDisk", false )
		  if isPartition then
		    device = new MacPartitionItem
		  else
		    device = new MacDeviceItem
		  end if
		  device.zIsPartition = isPartition
		  
		  'device.zBootable = dict.Lookup( "Bootable", false )
		  device.zBusProtocol = dict.Lookup( "BusProtocol", "" )
		  device.zCanBeMadeBootable = dict.Lookup( "CanBeMadeBootable", false )
		  device.zCanBeMadeBootableRequiresDestroy = dict.Lookup( "CanBeMadeBootableRequiresDestroy", false )
		  device.zType = dict.Lookup( "Content", "" )
		  device.zBlockSize = dict.Lookup( "DeviceBlockSize", false )
		  device.zIdentifier = dict.Lookup( "DeviceIdentifier", "" )
		  device.zNode = dict.Lookup( "DeviceNode", "" )
		  device.zTreePath = dict.Lookup( "DeviceTreePath", "" )
		  device.zEjectable = dict.Lookup( "Ejectable", false )
		  device.zGlobalPermissionsEnabled = dict.Lookup( "GlobalPermissionsEnabled", false )
		  device.zIOKitSize = dict.Lookup( "IOKitSize", false )
		  device.zInternal = dict.Lookup( "Internal", false )
		  if not isPartition then
		    device.zLowLevelFormatSupported = dict.Lookup( "LowLevelFormatSupported", false )
		  end if
		  device.zMediaName = dict.Lookup( "MediaName", "" )
		  device.zMediaType = dict.Lookup( "MediaType", "" )
		  device.zMountPoint = dict.Lookup( "MountPoint", "" )
		  device.zParentIdentifier = dict.Lookup( "ParentWholeDisk", "" )
		  device.zRAIDMaster = dict.Lookup( "RAIDMaster", false )
		  device.zRAIDSlice = dict.Lookup( "RAIDSlice", false )
		  device.zSupportsGlobalPermissionsDisable = dict.Lookup( "SupportsGlobalPermissionsDisable", false )
		  device.zSystemImage = dict.Lookup( "SystemImage", false )
		  device.zTotalSize = dict.Lookup( "TotalSize", false )
		  device.zVolumeName = dict.Lookup( "VolumeName", "" )
		  device.zWritable = dict.Lookup( "Writable", false )
		  device.zWritableMedia = dict.Lookup( "WritableMedia", false )
		  device.zWritableVolume = dict.Lookup( "WritableVolume", false )
		  
		  if isPartition then
		    dim partition as MacPartitionItem = MacPartitionItem( device )
		    partition.zFileSystemName = dict.Lookup( "FileSystemName", "" )
		    partition.zFileSystemType = dict.Lookup( "FileSystemType", "" )
		    partition.zJournalOffset = dict.Lookup( "JournalOffset", false )
		    partition.zJournalSize = dict.Lookup( "JournalSize", false )
		    partition.zVolumeUUID = dict.Lookup( "VolumeUUID", "" )
		    partition.zRecoveryIdentifier = dict.Lookup( "RecoveryDeviceIdentifier", "" )
		  end if
		  
		  return device
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSystemName() As String
		  return zFileSystemName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileSystemType() As String
		  return zFileSystemType
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JournalOffset() As UInt64
		  return zJournalOffset
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JournalSize() As UInt64
		  return zJournalSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( Hidden ) Private Function LowLevelFormatSupported() As Boolean
		  // Only property that doesn't exist in partition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mount(readOnly As Boolean = False) As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "mount "
		  if readOnly then
		    cmd = cmd + "readOnly "
		  end if
		  cmd = cmd + me.Identifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( Hidden ) Private Function Partitions() As MacPartitionItem()
		  // Overrides the super. Meaningless for a partition
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RecoveryIdentifier() As String
		  return zRecoveryIdentifier
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Unmount(force As Boolean = False) As Boolean
		  dim cmd as string = MacDiskUtil.kDiskUtilCmd + "unmount "
		  if force then
		    cmd = cmd + "force "
		  end if
		  cmd = cmd + me.Identifier
		  
		  dim r as shell = MacDiskUtil.pExecuteShellCommand( cmd )
		  return r.ErrorCode = 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VolumeUUID() As String
		  return zVolumeUUID
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected zFileSystemName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zFileSystemType As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zJournalOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zJournalSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zRecoveryIdentifier As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zVolumeUUID As String
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
			Name="Mounted"
			Group="Behavior"
			Type="Boolean"
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
			InheritedFrom="MacDiskUtil.MacDeviceItem"
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
