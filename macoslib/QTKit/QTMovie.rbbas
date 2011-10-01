#tag Class
Class QTMovie
Inherits NSObject
	#tag Method, Flags = &h0
		Function CurrentTime() As QTTime
		  #if targetMacOS
		    declare function currentTime lib QTKit.framework selector "currentTime" (obj_id as Ptr) as QTTime
		    
		    return currentTime(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Duration() As QTTime
		  #if targetMacOS
		    declare function duration lib QTKit.framework selector "duration" (obj_id as Ptr) as QTTime
		    
		    return duration(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromFolderItem(f as FolderItem) As QTMovie
		  if f = nil then
		    return nil
		  end if
		  
		  return LoadFromPath(f.POSIXPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromPath(path as String) As QTMovie
		  #if targetCocoa
		    declare function initWithFile lib QTKit.Framework selector "initWithFile:error:" (obj_id as Ptr, fileName as CFStringRef, ByRef errorPtr as Ptr) as Ptr
		    
		    dim errorPtr as Ptr
		    dim p as Ptr = initWithFile(NSObject.Allocate("QTMovie"), path, errorPtr)
		    if p <> nil then
		      return new QTMovie(p, NSObject.hasOwnership)
		    else
		      dim error as new NSObject(errorPtr)
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakeFileType(uti as String) As FileType
		  'dim f as new FileType
		  'f.MacType = UTI.OSType(uti)
		  'f.Extensions = UTI.
		  'f.Name = uti
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rate() As Double
		  #if targetCocoa
		    declare function rate lib QTKit.framework selector "rate" (obj_id as Ptr) as Single
		    
		    return CType(rate(self), Double)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UTIs() As String()
		  #if targetCocoa
		    declare function movieTypesWithOptions lib QTKit.framework selector "movieTypesWithOptions:" (class_id as Ptr, types as Integer) as Ptr
		    
		    dim theArray as new CFArray(movieTypesWithOptions(Cocoa.NSClassFromString("QTMovie"), QTIncludeCommonTypes), not CFType.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Volume() As Double
		  #if targetCocoa
		    declare function volume lib QTKit.framework selector "volume" (obj_id as Ptr) as Single
		    
		    return CType(volume(self), Double)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetCocoa
			    declare function muted lib QTKit.framework selector "muted" (obj_id as Ptr) as Boolean
			    
			    return muted(self)
			  #endif
			End Get
		#tag EndGetter
		Muted As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = QTIncludeCommonTypes, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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
End Class
#tag EndClass
