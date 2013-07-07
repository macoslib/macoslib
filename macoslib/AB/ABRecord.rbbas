#tag Class
Class ABRecord
Inherits NSObject
	#tag Method, Flags = &h0
		Function UID() As String
		  //# A Unique ID which is guaranted to never change for that record, whatever the number of modifications.
		  
		  #if TargetMacOS
		    dim v as Variant = ValueForProperty( "kABUIDProperty" )
		    if v=nil then   return ""
		    
		    dim s as string = NSString( v ).StringValue
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForProperty(propertyName as string) As variant
		  
		  #if TargetMacOS
		    declare function m_valueForProperty lib "AddressBook.framework" selector "valueForProperty:" (id as Ptr, propName as CFStringRef) as Ptr
		    
		    dim p as Ptr
		    if propertyName.Instr( "kAB" )=1 then //PropertyName given as a Carbon or Cocoa constant type.
		      p = m_valueForProperty( me.id, Cocoa.StringConstant( propertyName ))
		    else
		      p = m_valueForProperty( me.id, propertyName )
		    end if
		    
		    return   Cocoa.NSObjectFromNSPtr( p, false, false )
		  #endif
		End Function
	#tag EndMethod


	#tag Constant, Name = kMultiValueLabels, Type = String, Dynamic = False, Default = \"kABHomePageLabel\rkABEmailWorkLabel\rkABEmailHomeLabel\rkABEmailMobileMeLabel\rkABAddressHomeLabel\rkABAddressWorkLabel\rkABAnniversaryLabel\rkABFatherLabel\rkABMotherLabel\rkABParentLabel\rkABBrotherLabel\rkABSisterLabel\rkABChildLabel\rkABFriendLabel\rkABSpouseLabel\rkABPartnerLabel\rkABAssistantLabel\rkABManagerLabel\rkABPhoneWorkLabel\rkABPhoneHomeLabel\rkABPhoneiPhoneLabel\rkABPhoneMobileLabel\rkABPhoneMainLabel\rkABPhoneHomeFAXLabel\rkABPhoneWorkFAXLabel\rkABPhonePagerLabel\rkABAIMWorkLabel\rkABAIMHomeLabel\rkABAIMMobileMeLabel\rkABJabberWorkLabel\rkABJabberHomeLabel\rkABMSNWorkLabel\rkABMSNHomeLabel\rkABYahooWorkLabel\rkABYahooHomeLabel\rkABICQWorkLabel\rkABICQHomeLabel", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
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
