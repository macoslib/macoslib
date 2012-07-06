#tag Class
Class ABPerson
Inherits ABRecord
	#tag Method, Flags = &h0
		 Shared Function properties() As NSArray
		  
		  #if TargetMacOS
		    RequireFramework   "AddressBook"
		    
		    declare function _properties lib "AddressBook.framework" selector "properties" (Cls as Ptr) as Ptr
		    
		    dim p as Ptr = Cocoa.NSClassFromString( "ABPerson" )
		    dim nsa as NSArray = new NSArray( _properties( p ), false )
		    
		    return  nsa
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function typeOfProperty(propertyName as String) As integer
		  
		  #if TargetMacOS
		    RequireFramework   "AddressBook"
		    
		    declare function typeOfProperty lib "AddressBook.framework" selector "typeOfProperty" (Cls as Ptr, name as CFStringRef ) as integer
		    
		    return  typeOfProperty( Cocoa.NSClassFromString( "ABPerson" ), propertyName )
		  #endif
		  
		  //TYPES
		  
		  'typedef enum _ABPropertyType {
		  'kABErrorInProperty = 0x0,
		  'kABStringProperty = 0x1,
		  'kABIntegerProperty = 0x2,
		  'kABRealProperty = 0x3,
		  'kABDateProperty = 0x4,
		  'kABArrayProperty = 0x5,
		  'kABDictionaryProperty = 0x6,
		  'kABDataProperty = 0x7,
		  'kABMultiStringProperty = 0x100 | kABStringProperty,
		  'kABMultiIntegerProperty = 0x100 | kABIntegerProperty,
		  'kABMultiRealProperty = 0x100 | kABRealProperty,
		  'kABMultiDateProperty = 0x100 | kABDateProperty,
		  'kABMultiArrayProperty = 0x100 | kABArrayProperty,
		  'kABMultiDictionaryProperty = 0x100 | kABDictionaryProperty,
		  'kABMultiDataProperty = 0x100 | kABDataProperty
		  '} ABPropertyType;
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kDefaultPersonProperties, Type = String, Dynamic = False, Default = \"kABFirstNameProperty\rkABLastNameProperty\rkABFirstNamePhoneticProperty\rkABLastNamePhoneticProperty\rkABNicknameProperty\rkABMaidenNameProperty\rkABBirthdayProperty\rkABBirthdayComponentsProperty\rkABOrganizationProperty\rkABJobTitleProperty\rkABHomePageProperty\rkABURLsProperty\rkABCalendarURIsProperty\rkABEmailProperty\rkABAddressProperty\rkABOtherDatesProperty\rkABOtherDateComponentsProperty\rkABRelatedNamesProperty\rkABDepartmentProperty\rkABPersonFlags\rkABPhoneProperty\rkABInstantMessageProperty\rkABAIMInstantProperty\rkABJabberInstantProperty\rkABMSNInstantProperty\rkABYahooInstantProperty\rkABICQInstantProperty\rkABNoteProperty\rkABMiddleNameProperty\rkABMiddleNamePhoneticProperty\rkABTitleProperty\rkABSuffixProperty\rkABSocialProfileProperty", Scope = Public
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
