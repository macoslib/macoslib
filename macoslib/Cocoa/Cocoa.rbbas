#tag Module
Protected Module Cocoa
	#tag Method, Flags = &h1
		Protected Sub Initialize()
		  #if TargetMachO
		    Declare Function NSApplicationLoad Lib CocoaLib () as Boolean
		    
		    autoreleasePool = new AutoreleaseTimer
		    
		    if not NSApplicationLoad() then
		      break // oops, what's wrong here? (Maybe this happens once RB implements Cocoa support - then we can ignore this here)
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ClassRef(className as String) As id
		  #if TargetMachO
		    dim theClassRef as Integer
		    Declare Function objc_getClass Lib CocoaLib (aClassName as CString) as Integer
		    
		    theClassRef = objc_getClass(className)
		    If theClassRef = 0 then
		      Raise new CocoaUnregisteredClassException(className)
		    End if
		    Return To_id(theClassRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Selector(selectorName as String) As SEL
		  #if TargetMachO
		    Declare Function sel_registerName Lib CocoaLib (theName as CString) as Integer
		    
		    dim selectorRef as Integer
		    
		    selectorRef = sel_registerName(selectorName)
		    If selectorRef = 0 then
		      Raise new CocoaUnregisteredSelectorException(selectorName)
		    End if
		    Return ToSEL(selectorRef)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToSEL(sel as Integer) As SEL
		  dim s as SEL
		  s.value = sel
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function To_id(id as Integer) As id
		  dim s as id
		  s.value = id
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSSearchPathForDirectoriesInDomains(dir as Integer, domainMask as Integer, expandTilde as Boolean) As NSArray
		  declare function searchPaths lib CocoaLib alias "NSSearchPathForDirectoriesInDomains" (dir as Integer, domainMask as Integer, expandTilde as Boolean) as Ptr
		  
		  return new NSArray (searchPaths (dir, domainMask, expandTilde), false)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		From: http://www.declaresub.com/ideclare/Cocoa/index.html
		
		This module provides what in Cocoa terms is the "Foundation"
	#tag EndNote

	#tag Note, Name = Caution using 'SEL' and 'id' in declares
		This is only important if you add new Cocoa method calls yourself:
		
		If you want to call an external function (usually via "declare"), and if that function's
		return type is a selector (SEL) or generic Cocoa object (id), be cautious not to use
		such types as the return type of the declared function. Instead, have it return a UInt32
		and then assign its value to a variable of type SEL or id using the ToSEL() or To_id()
		function (or assign directly to its ".value" member, although that's a bit unclean).
		
		If you do not obey this rule, your application may not work on PowerPC processors
		because of a bug in REALbasic (as of v2008r5.1): Returning structure types from
		declare'd functions does not work.
		
		An example where you'd want to store the result of a call in a variable such as:
		
		  dim result as id
		
		Bad:
		  declare function objc_msgSend lib CocoaLib (r as id, s as SEL) as id
		  result = objc_msgSend (r, s)
		
		Good:
		  declare function objc_msgSend lib CocoaLib (r as id, s as SEL) as UInt32
		  result = To_id (objc_msgSend (r, s))
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private autoreleasePool As AutoreleaseTimer
	#tag EndProperty


	#tag Constant, Name = CocoaLib, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CarbonLib, Type = String, Dynamic = False, Default = \"Carbon", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = String, Dynamic = False, Default = \"Foundation.framework", Scope = Public
	#tag EndConstant


	#tag Structure, Name = id, Flags = &h1
		value as UInt32
	#tag EndStructure

	#tag Structure, Name = SEL, Flags = &h1
		value as UInt32
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
