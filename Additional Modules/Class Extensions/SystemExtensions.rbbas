#tag Module
Protected Module SystemExtensions
	#tag Method, Flags = &h0
		Function SystemDoubleClickInterval() As double
		  //# Return the system double-click time interval in seconds
		  
		  #if TargetMacOS
		    declare function doubleClickInterval lib CocoaLib selector "doubleClickInterval" (Cls as Ptr) as double
		    dim dblClick as double = doubleClickInterval( Cocoa.NSClassFromString( "NSEvent" ))
		    
		    return  dblClick
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemDoubleClickIntervalInTicks() As integer
		  //# Return the system double-click time interval in seconds
		  
		  #if TargetMacOS
		    return   ( SystemDoubleClickInterval * 1000 / 60 )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderLabelColors() As Color()
		  //#Returns the Finder labels as an array of colors
		  
		  #if TargetMacOS
		    dim colors() as Variant
		    dim result() as color
		    dim nsa as NSArray = NSWorkspace.FinderLabelColors
		    colors = nsa.VariantValue
		    
		    for each c as Color in Colors
		      result.Append   c
		    next
		    
		    result.Remove  0  //Remove the first label color which actually corresponds to "no label" (defined as black)
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderLabels() As string()
		  //#Returns the Finder labels as an array of strings
		  
		  #if TargetMacOS
		    dim labels() as Variant
		    dim result() as string
		    dim nsa as NSArray = NSWorkspace.FinderLabels
		    labels = nsa.VariantValue
		    
		    for each s as string in labels
		      result.Append   s
		    next
		    
		    result.Remove  0  //Remove the first label which actually corresponds to "no label"
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderTagColors() As Color()
		  //# Gets the current list of file tags's color
		  
		  //NOTE: this is a workaround as Mavericks 10.9.0 does not seem to have public API for that
		  //DO NOT USE FOR MAS-COMPATIBLE development
		  
		  //NOTE 2: Tags are merged between user-sessions. However, they are not really "system-wide".
		  
		  //@result If a tag color is "no color", its color is returned as "transparent white" (&cFFFFFFFF) with RS 2011r4 or later and "pure white" (&cFFFFFF) on earlier versions.
		  
		  
		  #if TargetMacOS
		    dim result() as Color
		    dim LabelColors() as Color
		    
		    #pragma BreakOnExceptions false
		    
		    Try  //Be lazy here. We do not need to make countless "if...then...else" statements as any error should cause the full block of code to abort.
		      LabelColors = SystemFinderLabelColors //Colors for tags are given as indexes to labels
		      
		      dim f as FolderItem = SpecialFolder.UserLibrary.Child( "SyncedPreferences" )
		      dim dict as Dictionary
		      
		      f = f.Child( "com.apple.Finder.plist" )
		      
		      dim nsd as NSDictionary = NSDictionary.CreateFromFile( f )
		      
		      nsd = new NSDictionary( nsd.Value( new NSString( "values" )))
		      nsd = new NSDictionary( nsd.Value( new NSString( "FinderTagDict" )))
		      nsd = new NSDictionary( nsd.Value( new NSString( "value" )))
		      
		      dim nsa as NSArray = new NSArray( nsd.Value( new NSString( "FinderTags" )))
		      
		      for i as integer=0 to nsa.Count - 1
		        nsd = new NSDictionary( nsa.Value( i ))
		        dict = nsd.VariantValue
		        dim myColor as Color
		        
		        if dict.HasKey( "l" ) then //It has a color
		          myColor = LabelColors( dict.Value( "l" ) - 1 )
		          result.Append  myColor
		          
		        else
		          #if RBVersion>=2011.04 //First version supporting alpha channel
		            result.Append   &cFFFFFFFF //Special value for "no color"
		          #else
		            result.Append  &cFFFFFF
		          #endif
		        end if
		        
		      next
		      
		    Catch exc
		      DReportError   "Exception", exc
		    End Try
		    
		    #pragma BreakOnExceptions default
		    
		    //On error, result will be empty
		    return  result
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemFinderTags() As String()
		  //# Gets the current list of file tags
		  
		  //NOTE: this is a workaround as Mavericks 10.9.0 does not seem to have public API for that
		  //DO NOT USE FOR MAS-COMPATIBLE development
		  
		  //NOTE 2: Tags are merged between user-sessions. However, they are not really "system-wide".
		  
		  #if TargetMacOS
		    dim result() as string
		    
		    #pragma BreakOnExceptions false
		    
		    Try  //Be lazy here. We do not need to make countless "if...then...else" statements as any error should cause the full block of code to abort.
		      dim f as FolderItem = SpecialFolder.UserLibrary.Child( "SyncedPreferences" )
		      dim dict as Dictionary
		      
		      f = f.Child( "com.apple.Finder.plist" )
		      
		      dim nsd as NSDictionary = NSDictionary.CreateFromFile( f )
		      
		      nsd = new NSDictionary( nsd.Value( new NSString( "values" )))
		      nsd = new NSDictionary( nsd.Value( new NSString( "FinderTagDict" )))
		      nsd = new NSDictionary( nsd.Value( new NSString( "value" )))
		      
		      dim nsa as NSArray = new NSArray( nsd.Value( new NSString( "FinderTags" )))
		      
		      for i as integer=0 to nsa.Count - 1
		        nsd = new NSDictionary( nsa.Value( i ))
		        dict = nsd.VariantValue
		        
		        result.Append   dict.Value( "n" )
		      next
		      
		    Catch exc
		      DReportError   "Exception", exc
		    End Try
		    
		    #pragma BreakOnExceptions default
		    
		    //On error, result will be empty
		    return  result
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemListPrinterNames() As string()
		  //# Returns the list of the installed printers name
		  
		  return   NSPrinter.Names
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemListPrinterTypes() As string()
		  //# Returns the list of the installed printers type
		  
		  return   NSPrinter.Types
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
