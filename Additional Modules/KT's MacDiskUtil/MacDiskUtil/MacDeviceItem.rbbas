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
		Function Ejectable() As Boolean
		  return zEjectable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FreeSpace() As UInt64
		  return zFreeSpace
		  
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
		Function SMARTStatus() As String
		  return zSMARTStatus
		  
		End Function
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not zIsPartition then return nil
			  
			  dim id as string = zParentIdentifier
			  if id <> "" then
			    try
			      return Device( id )
			    catch
			      return nil
			    end try
			  else
			    return nil
			  end if
			  
			End Get
		#tag EndGetter
		Parent As MacDeviceItem
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
		Protected zFreeSpace As UInt64
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
		Protected zSMARTStatus As String
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
