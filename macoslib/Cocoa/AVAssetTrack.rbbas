#tag Class
Class AVAssetTrack
Inherits NSObject
	#tag Method, Flags = &h0
		Function AvailableMetadataFormats() As NSString()
		  dim arr() as NSString
		  
		  #if TargetMacOS
		    
		    declare function availableMetadataFormats lib Framework selector "availableMetadataFormats" ( obj_id As Ptr ) As Ptr
		    // Introduced in MacOS X 10.7.
		    
		    dim p as Ptr = availableMetadataFormats( self.id )
		    if p <> nil then
		      dim nsa as new NSArray( p, not NSObject.hasOwnership )
		      dim cnt as integer = nsa.Count
		      for i as integer = 1 to cnt
		        dim nss as new NSString( nsa.Value( i - 1 ) )
		        arr.Append nss
		      next i
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AvailableTrackAssociationTypes() As NSString()
		  dim arr() as NSString
		  
		  #if TargetMacOS
		    
		    if me.RespondsToSelector( "availableTrackAssociationTypes" ) then
		      declare function availableTrackAssociationTypes lib Framework selector "availableTrackAssociationTypes" ( obj_id As Ptr ) As Ptr
		      // Introduced in MacOS X 10.9.
		      
		      dim p as Ptr = availableTrackAssociationTypes( self.id )
		      if p <> nil then
		        dim nsa as new NSArray( p, not NSObject.hasOwnership )
		        dim cnt as integer = nsa.Count
		        for i as integer = 1 to cnt
		          dim nss as new NSString( nsa.Value( i - 1 ) )
		          arr.Append nss
		        next i
		      end if
		      
		    end if
		    
		  #endif
		  
		  return arr
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim r as AVAsset
			  
			  #if TargetMacOS
			    
			    declare function getAsset lib Framework selector "asset" ( obj_id As Ptr ) As Ptr
			    // Introduced in MacOS X 10.7.
			    
			    dim p as Ptr = getAsset( self.id )
			    if p <> nil then
			      r = new AVAsset( p, not NSObject.hasOwnership )
			    end if
			    
			  #endif
			  
			  return r
			  
			End Get
		#tag EndGetter
		Asset As AVAsset
	#tag EndComputedProperty


	#tag Constant, Name = Framework, Type = String, Dynamic = False, Default = \"AppKit.framework", Scope = Private
	#tag EndConstant


End Class
#tag EndClass
