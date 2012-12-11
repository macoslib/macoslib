#tag Class
Class CFBoolean
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInt32
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.BooleanValue
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFBooleanGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(value As Boolean)
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    me.Constructor me.Get( value ).Reference, not CFType.HasOwnership
		  #else
		    #pragma unused value
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListFile(file as FolderItem) As CFBoolean
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListFile( file, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFBoolean = CFBoolean( plist )
		    return r
		    
		  #else
		    
		    #pragma unused file
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListString(plistString as String) As CFBoolean
		  #if TargetMacOS
		    
		    dim plist as CFPropertyList = CFType.CreateFromPListString( plistString, CoreFoundation.kCFPropertyListImmutable )
		    dim r as CFBoolean = CFBoolean( plist )
		    return r
		    
		  #else
		    
		    #pragma unused plistString
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Get(value as Boolean) As CFBoolean
		  dim symbolName as String
		  if value then
		    symbolName = "kCFBooleanTrue"
		  else
		    symbolName = "kCFBooleanFalse"
		  end if
		  
		  dim p as Ptr = Carbon.Bundle.DataPointerNotRetained(symbolName)
		  if p <> nil then
		    return new CFBoolean(p.Ptr(0), false)
		  else
		    return new CFBoolean(nil, false)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetFalse() As CFBoolean
		  static b as CFBoolean = Get(false)
		  return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetTrue() As CFBoolean
		  static b as CFBoolean = Get(true)
		  return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(value As Boolean) As Integer
		  // Added by Kem Tekinay.
		  
		  dim b as boolean = me.BooleanValue
		  if b = value then
		    return 0
		  else
		    return -1
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(value As CFBoolean) As Integer
		  // Added by Kem Tekinay.
		  
		  if me.Reference = nil or value is nil or value.Reference = nil then
		    return super.Operator_Compare( value )
		    
		  else
		    return me.Operator_Compare( value.BooleanValue )
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Boolean
		  return me.BooleanValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(value As Boolean)
		  // Added by Kem Tekinay.
		  
		  me.Constructor( value )
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    // Introduced in MacOS X 10.0
			    declare function CFBooleanGetValue lib CarbonLib (cf as Ptr) as Boolean
			    
			    dim p as Ptr = me.Reference
			    return p <> nil and CFBooleanGetValue(p)
			    
			  #endif
			End Get
		#tag EndGetter
		BooleanValue As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BooleanValue"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
