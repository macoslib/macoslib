#tag Class
Class NSURL
Inherits NSObject
	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  if not (f is nil) then
		    self.Constructor  f.URLPath
		  else
		    raise new NilObjectException
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theURL as String)
		  #if targetMacOS
		    declare function URLWithString lib CocoaLib selector "URLWithString:" ( id as Ptr, URLString as CFStringRef ) as Ptr
		    
		    super.Constructor URLWithString( Cocoa.NSClassFromString( "NSURL" ), theURL ), false
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function KeyList() As String()
		  return kKeyList.Split(EndOfLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		  return self.AbsoluteString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(URLString as String)
		  
		  self.Constructor(URLString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pathExtension() As NSString
		  // Added by Kem Tekinay.
		  
		  #if TargetMacOS
		    declare function pathExtension lib CocoaLib selector "pathExtension" (id as Ptr) as Ptr
		    
		    return new NSString( pathExtension( self.id ), false )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceValue(forKey as string) As NSObject
		  //Get information about file/volume
		  
		  //If there is no value for the given key, nil is returned.
		  
		  #if TargetMacOS
		    declare function getResourceValue lib CocoaLib selector "getResourceValue:forKey:error:" (id as Ptr, byref value as Ptr, forKey as CFStringRef, byref err as Ptr) as Boolean
		    
		    assertOSVersion  100600 //Snow Leopard
		    
		    dim value as Ptr
		    dim key as CFStringRef
		    if KeyList.IndexOf(forKey) > -1 then
		      key = Cocoa.StringConstant(forKey)
		    else
		      key = forKey
		    end if
		    dim err as Ptr
		    
		    dim OK as Boolean = getResourceValue( self.id, value, key, err )
		    
		    
		    if OK then
		      if value = nil then
		        return nil
		      else
		        return Cocoa.NSObjectFromNSPtr(value)
		      end if
		    else
		      raise new NSException(err)
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceValue(forKey as string, newValue as NSObject) As boolean
		  //Set information about file/volume
		  
		  #if TargetMacOS
		    declare function setResourceValue lib CocoaLib selector "setResourceValue:forKey:error:" (id as Ptr, value as Ptr, forKey as CFStringRef, byref err as Ptr) as Boolean
		    
		    assertOSVersion  100600 //Snow Leopard
		    
		    dim key as CFStringRef
		    if KeyList.IndexOf(forKey) > -1 then
		      key = Cocoa.StringConstant(forKey)
		    else
		      key = forKey
		    end if
		    dim err as Ptr
		    
		    dim OK as Boolean = setResourceValue(newValue.id, newValue, key, err )
		    
		    if err <> nil then
		      raise new NSException( err )
		    end if
		    
		    return  OK
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue() As variant
		  return  self.absoluteString
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    declare function absoluteString lib CocoaLib selector "absoluteString" ( id as Ptr ) as CFStringRef
			    
			    return absoluteString( self.id )
			  #endif
			End Get
		#tag EndGetter
		absoluteString As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if targetMacOS
			    declare function absoluteURL lib CocoaLib selector "absoluteURL" (obj_id as Ptr) as Ptr
			    
			    dim urlRef as Ptr = absoluteURL(self)
			    if urlRef <> nil then
			      return new NSURL(urlRef)
			    end if
			    
			  #endif
			End Get
		#tag EndGetter
		absoluteURL As NSURL
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not ( self = nil ) then
			    return new FolderItem(self.absoluteString, FolderItem.PathTypeURL )
			  end if
			End Get
		#tag EndGetter
		Item As FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = kKeyList, Type = String, Dynamic = False, Default = \"NSURLNameKey\rNSURLLocalizedNameKey\rNSURLIsRegularFileKey\rNSURLIsDirectoryKey\rNSURLIsSymbolicLinkKey\rNSURLIsVolumeKey\rNSURLIsPackageKey\rNSURLIsSystemImmutableKey\rNSURLIsUserImmutableKey\rNSURLIsHiddenKey\rNSURLHasHiddenExtensionKey\rNSURLCreationDateKey\rNSURLContentAccessDateKey\rNSURLContentModificationDateKey\rNSURLAttributeModificationDateKey\rNSURLLinkCountKey\rNSURLParentDirectoryURLKey\rNSURLVolumeURLKey\rNSURLTypeIdentifierKey\rNSURLLocalizedTypeDescriptionKey\rNSURLLabelNumberKey\rNSURLLabelColorKey\rNSURLLocalizedLabelKey\rNSURLEffectiveIconKey\rNSURLCustomIconKey\rNSURLFileSizeKey\rNSURLFileAllocatedSizeKey\rNSURLIsAliasFileKey\rNSURLVolumeLocalizedFormatDescriptionKey\rNSURLVolumeTotalCapacityKey\rNSURLVolumeAvailableCapacityKey\rNSURLVolumeResourceCountKey\rNSURLVolumeSupportsPersistentIDsKey\rNSURLVolumeSupportsSymbolicLinksKey\rNSURLVolumeSupportsHardLinksKey\rNSURLVolumeSupportsJournalingKey\rNSURLVolumeIsJournalingKey\rNSURLVolumeSupportsSparseFilesKey\rNSURLVolumeSupportsZeroRunsKey\rNSURLVolumeSupportsCaseSensitiveNamesKey\rNSURLVolumeSupportsCasePreservedNamesKey", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="absoluteString"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
