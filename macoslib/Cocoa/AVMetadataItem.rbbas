#tag Class
Class AVMetadataItem
Inherits NSObject
	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  static ref as Ptr = Cocoa.NSClassFromString("AVMetadataItem")
		  return ref
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function commonKey lib Framework selector "commonKey" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = commonKey( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		CommonKey As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function dataValue lib Framework selector "dataValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = dataValue( self.id )
			    dim nsd as NSData
			    if p <> nil then
			      nsd = new NSData( p )
			    end if
			    return nsd
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DataValue As NSData
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function dateValue lib Framework selector "dateValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = dateValue( self.id )
			    dim nsd as NSDate
			    if p <> nil then
			      nsd = new NSDate( p )
			    end if
			    return nsd
			    
			  #endif
			  
			End Get
		#tag EndGetter
		DateValue As NSDate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function duration lib Framework selector "duration" ( obj_id As Ptr ) As CMTime
			    // Introduced in MacOS X 10.7.
			    
			    dim time as CMTime = duration( self.id )
			    return time
			    
			  #endif
			  
			End Get
		#tag EndGetter
		Duration As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Cocoa.CMTimeGetSeconds( Duration )
			  
			End Get
		#tag EndGetter
		DurationInSeconds As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function extraAttributes lib Framework selector "extraAttributes" ( obj_id As Ptr ) As Ptr
			    //Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = extraAttributes( self.id )
			    dim nsd as NSDictionary
			    if p <> nil then
			      nsd = new NSDictionary( p )
			    end if
			    
			    return nsd
			    
			  #endif
			End Get
		#tag EndGetter
		ExtraAttributes As NSDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function keySpace lib Framework selector "keySpace" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = keySpace( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		KeySpace As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as string
			  
			  #if TargetMacOS
			    
			    declare function stringValue lib Framework selector "stringValue" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = stringValue( self.id )
			    if p <> nil then
			      dim nss as new NSString( p )
			      r = nss
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CommonKey"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DurationInSeconds"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeySpace"
			Group="Behavior"
			Type="String"
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
