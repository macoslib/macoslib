#tag Class
Protected Class MacPartitionItem
Inherits MacDiskUtil.MacDeviceItem
	#tag Event
		Sub RefreshFromDict(dict As Dictionary)
		  if dict is nil then return
		  
		  me.zRecoveryIdentifier = dict.Lookup( "RecoveryDeviceIdentifier", "" )
		  
		End Sub
	#tag EndEvent


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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "FileSystemName" )
			  
			End Get
		#tag EndGetter
		FileSystemName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "FileSystemType" )
			  
			End Get
		#tag EndGetter
		FileSystemType As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "JournalOffset" )
			  
			End Get
		#tag EndGetter
		JournalOffset As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "JournalSize" )
			  
			End Get
		#tag EndGetter
		JournalSize As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return pValueFromKey( "VolumeUUID" )
			  
			End Get
		#tag EndGetter
		VolumeUUID As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected zRecoveryIdentifier As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bootable"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="MacDiskUtil.MacDeviceItem"
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
			Name="Mounted"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="MacDiskUtil.MacDeviceItem"
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
