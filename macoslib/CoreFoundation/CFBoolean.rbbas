#tag Class
Class CFBoolean
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.Operator_Convert
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFBooleanGetTypeID" () as UInt32
		    static id as CFTypeID = CFTypeID(TypeID)
		    return id
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
		  
		  dim p as Ptr = CFBundle.CarbonFramework.DataPointerNotRetained(symbolName)
		  if p = nil then
		    return new CFBoolean(nil, false)
		  end if
		  
		  return new CFBoolean(p.Ptr(0), false)
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
		Function Operator_Convert() As Boolean
		  #if TargetMacOS
		    soft declare function CFBooleanGetValue lib CarbonLib (cf as Ptr) as Boolean
		    
		    dim p as Ptr = me.Reference
		    return p <> nil and CFBooleanGetValue(p)
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = ClassName, Type = String, Dynamic = False, Default = \"CFBoolean", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
