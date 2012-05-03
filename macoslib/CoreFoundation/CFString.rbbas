#tag Class
Class CFString
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInt32
		  return me.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  return me.StringValue
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CarbonLib alias "CFStringGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(s as String)
		  #if targetMacOS
		    declare function CFStringCreateWithCString lib CarbonLib (alloc as Ptr, cStr as CString, encoding as Integer) as Ptr
		    
		    dim p as Ptr
		    if Encoding(s) <> nil then
		      p = CFStringCreateWithCString(nil, s, Encoding(s).code)
		    else
		      const kCFStringEncodingInvalidId = &hffffffff
		      
		      p = CFStringCreateWithCString(nil, s, kCFStringEncodingInvalidId)
		    end if
		    
		    self.Constructor(p, hasOwnership)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return self.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(s as String)
		  self.Constructor(s)
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		This is an alternative to CFStringRef.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    if self = nil then
			      return ""
			    end if
			    
			    soft declare function CFStringGetLength lib CarbonLib (theString as Ptr) as Integer
			    soft declare function CFStringGetMaximumSizeForEncoding lib CarbonLib (length as Integer, enc as Integer) as Integer
			    soft declare function CFStringGetCString lib CarbonLib (theString as Ptr, buffer as Ptr, bufferSize as Integer, enc as Integer) as Boolean
			    
			    dim stringLength as Integer = CFStringGetLength(self)
			    if stringLength = 0 then
			      return ""
			    end if
			    dim maxSize as Integer = CFStringGetMaximumSizeForEncoding(stringLength, kCFStringEncodingUTF8)
			    if maxSize < 0 then
			      return ""
			    end if
			    
			    dim buffer as new MemoryBlock(1 + maxSize)
			    if CFStringGetCString(self, buffer, buffer.Size, kCFStringEncodingUTF8) then
			      return DefineEncoding(buffer.CString(0), Encodings.UTF8)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


	#tag Constant, Name = kCFStringEncodingUTF8, Type = Double, Dynamic = False, Default = \"&h08000100", Scope = Private
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
			Name="StringValue"
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
