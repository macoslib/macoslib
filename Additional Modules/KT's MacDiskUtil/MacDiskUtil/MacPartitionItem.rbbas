#tag Class
Class MacPartitionItem
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
			Name="FreeSpace"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOKitSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MountStatus"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="MountType"
			EditorType="Enum"
			#tag EnumValues
				"-2 - Unknown"
				"-1 - NotApplicable"
				"0 - Unmounted"
				"1 - Mounted"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bootable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBeMadeBootable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBeMadeBootableRequiresDestroy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ejectable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileSystemName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileSystemType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GlobalPermissionsEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IOContent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MediaName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mounted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RAIDMaster"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RAIDSlice"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SMARTStatus"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SupportsGlobalPermissionsDisable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SystemImage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="VolumeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VolumeUUID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Writable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WritableMedia"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WritableVolume"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="JournalOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="JournalSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
