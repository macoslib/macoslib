#tag Module
Module CoreFoundation
	#tag Method, Flags = &h0
		Function Version() As Double
		  // Returns the version of the CoreFoundation framework
		  
		  #if targetMacOS
		    const kCFCoreFoundationVersionNumber = "kCFCoreFoundationVersionNumber"
		    
		    dim p as Ptr = CFBundle.CarbonFramework.DataPointer(kCFCoreFoundationVersionNumber)
		    if p <> nil then
		      return p.Double(0)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XMLValue(Extends theObj as CFPropertyList) As String
		  #if TargetMacOS
		    soft declare function CFPropertyListCreateXMLData lib CarbonFramework (allocator as Ptr, propertyList as Ptr) as Ptr
		    
		    dim xmlData as new CFData(CFPropertyListCreateXMLData(nil, theObj.Reference))
		    return DefineEncoding(xmlData.Data, Encodings.UTF8)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFRangeMake(loc as Int32, len as Int32) As CFRange
		  dim r as CFRange
		  r.location = loc
		  r.length = len
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Retain(extends s as CFStringRef)
		  // This function is needed for CFStringRef values returned by a Mac OS CF...Get... function.
		  //
		  // That's because the CFStringRef destructor will call CFRelease on the reference,
		  // which must be balanced with a CFRetain call so that the object does not get freed.
		  // This is because of the ownership rules which say that a CF-Get function does not
		  // transfer ownership.
		  
		  #if targetMacOS
		    soft declare function CFRetain lib CarbonFramework (cf as CFStringRef) as Integer
		    
		    call CFRetain(s)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RunTests()
		  // This is an incomplete set of tests to make sure nothing got screwed up too much
		  
		  #if DebugBuild
		    
		    #pragma DisableBackgroundTasks
		    
		    dim s as String
		    s = CFBundle.CarbonFramework.Identifier
		    
		    dim cft as CFType
		    
		    if true then
		      dim vals() as CFString
		      vals.Append new CFString("a")
		      vals.Append "b"
		      dim arr as new CFArray(vals)
		      dim p as Ptr = arr.Reference
		      arr = CFArray(CFType.NewObject(p)) // here the ref needs to be retained
		      p = arr.Reference
		      arr = new CFArray(p, false) // here the ref needs to be retained
		      testAssert arr.Value(1).Equals(new CFString("b"))
		    end // at this point the CFString objects should all get deallocated
		    
		    // Test CFNumber operations
		    dim cf1, cf2 as CFNumber
		    cf1 = new CFNumber(1)
		    testAssert cf2=nil
		    cf2 = new CFNumber(nil,false)
		    testAssert cf2<>nil
		    testAssert cf2.IsNULL
		    cf2 = new CFNumber(0)
		    testAssert not cf2.IsNULL
		    testAssert cf1.IntegerValue > cf2.IntegerValue
		    testAssert cf1.DoubleValue = 1
		    testAssert cf1.Equals(new CFNumber(1.0))
		    
		    // Test the CFPreferences functionality
		    dim prefs as CFPreferences
		    dim prefKeys() as String = prefs.Keys
		    for each key as String in prefKeys
		      dim desc as String = prefs.Value(key).Description
		    next
		    cf1 = CFNumber(prefs.Value("RunCount"))
		    dim runCount as Integer
		    if cf1 <> nil then
		      runCount = cf1.IntegerValue
		    end if
		    cf1 = new CFNumber (runCount + 1)
		    prefs.Value("RunCount") = cf1
		    call prefs.Sync // this writes back the changes to the prefs we made here
		    cft = prefs.Value("RunCount")
		    testAssert cf1.Equals(prefs.Value("RunCount"))
		    
		    // Test CFURL
		    dim url as new CFURL(SpecialFolder.System)
		    testAssert url.Scheme = "file"
		    testAssert url.NetLocation = "localhost"
		    testAssert url.StringValue = "file://localhost"+url.Path+"/"
		    
		    // Test CFBundle
		    dim bndl as CFBundle = CFBundle.Application
		    url = bndl.URL
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub testAssert(b as Boolean, msg as String = "")
		  #if DebugBuild
		    if not b then
		      break
		      #if TargetHasGUI
		        MsgBox "Test failed: "+EndOfLine+EndOfLine+msg
		      #else
		        Print "Test failed: "+msg
		      #endif
		    end
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFString(str as String) As CFString
		  return new CFString(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFBoolean(b as Boolean) As CFBoolean
		  if b then
		    return CFBoolean.GetTrue
		  end if
		  return CFBoolean.GetFalse
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFDate(d as Date) As CFDate
		  return new CFDate(d)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFNumber(dbl as Double) As CFNumber
		  return new CFNumber(dbl)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFURL(url as String) As CFURL
		  return new CFURL(url)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFNumber(int_32 as Integer) As CFNumber
		  return new CFNumber(int_32)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFNumber11(int_64 as Int64) As CFNumber
		  return new CFNumber(int_64)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		CFType and its subclasses are wrappers for Mac OS's CoreFoundation classes, which encompass
		numbers, strings, arrays, dictionaries and a few more common types. The CoreGraphics module
		also makes use of, and extends, these classes.
		
		As a first time user, start looking at CFPreferences to read/write your app's ".plist" prefs file,
		and at CFBundle, using its Application() method to get to your app bundle's folders (those
		hidden in your app package).
		
		Important: If you are adding or modifying new functionality using Declare statements,
		make sure you understand the reference counting rules. Read the "Memory Management"
		note in the CFType class for a start.
	#tag EndNote

	#tag Note, Name = Comparing values
		There are three ways to compare objects of CFType and their subclasses:
		
		1. As they're objects, one may want to see if two RB variables identify the same
		   RB object, or if one is nil. To test this, use the "is" operator, e.g.:
		
		     if cfDict.Value(x) is nil then ... // tests if a dictionary entry exists
		
		2. As they reference a CoreFoundation object managed by OS X, one can test
		   if two RB objects reference the same CF object. Use the "="operator for this
		   (this is achieved by the Operator_Compare() function in the CFType class):
		
		     if cfArray.Value(i) = item then ... // test if item is already in the array
		
		   A special case is the NULL CF reference. To test if a CF class identifies
		   no CF object, you can use the IsNULL function.
		
		3. Finally, all CF objects refer to data (unless IsNULL() returns true). To access
		   that data, you need to retrieve it explicitly (exception: CFStrings can be
		   automatically coerced into Strings and vice versa).
		   In general, to check if two separate CF objects are equal, use the
		   Equals() function:
		
		     if cfNum1.Equals (cfNum2) then ... // test if their values are equal
		
		   Additionally, to order two CFNumber values, you cannot use "<" and
		   ">" on the CF objects but must compare their explicit values instead:
		
		     if n1.IntegerValue > n2.IntegerValue then ... // number compare
	#tag EndNote

	#tag Note, Name = NULL references ( nil ptrs )
		New rule implemented on 23 Dec 08:
		
		If a CF... class gets constructed from a nil reference, it will still be created
		(as a CFType whose IsNULL() function returns true).
		That way, you can always expect that a function that returns CF type values
		will get you an existing object and not nil. To test if the reference is nil,
		call the IsNULL() member function.
		Note, however, that CFDictionary.Value and CFPreferences.Value may still
		return nil if the given key does not exist in the dictionary or prefs.
	#tag EndNote


	#tag Structure, Name = CFRange, Flags = &h0
		location as Int32
		length as Int32
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
			InitialValue="-2147483648"
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
