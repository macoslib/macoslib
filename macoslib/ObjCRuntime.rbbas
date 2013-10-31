#tag Module
Protected Module ObjCRuntime
	#tag Method, Flags = &h1
		Protected Function Class_AddMethod(ClassDesc as Ptr, theSelector as string, IMP as Ptr, types as string) As Boolean
		  #if TargetMacOS
		    declare function class_addMethod lib CocoaLib (cls as Ptr, SEL as Ptr, IMP as Ptr, types as CString) as Boolean
		    
		    return  class_addMethod( ClassDesc, Cocoa.NSSelectorFromString( theSelector ), IMP, types )
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Class_getName(ClassID as Ptr) As String
		  #if TargetMacOS
		    declare function class_getName lib CocoaLib (cls as Ptr) as CString
		    
		    return   class_getName( ClassID )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CountRegisteredClasses() As integer
		  //# Counts all the classes registered with the Objective-C Runtime.
		  
		  #if TargetMacOS
		    declare function objc_getClassList lib CocoaLib (buffer as Ptr, bufferSize as integer) as integer
		    
		    return  objc_getClassList( nil, 0 )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RegisteredClasses() As String()
		  //# Gets the name of all the classes registered with the Objective-C Runtime.
		  
		  //@64bits
		  
		  #if TargetMacOS
		    declare function objc_getClassList lib CocoaLib (buffer as Ptr, bufferSize as integer) as integer
		    
		    dim cnt as integer = objc_getClassList( nil, 0 )
		    dim mb as MemoryBlock = new MemoryBlock( cnt * SizeOfPointer )
		    dim p as Ptr
		    cnt = objc_getClassList( mb, mb.Size )
		    
		    dim result() as string
		    
		    for i as integer=0 to cnt - 1
		      p = mb.bsPtrValueFromCArray( i )
		      if p<>nil then
		        result.Append   Class_getName( p )
		      end if
		    next
		    
		    return  result
		  #endif
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
