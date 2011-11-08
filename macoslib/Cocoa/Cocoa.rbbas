#tag Module
Protected Module Cocoa
	#tag Method, Flags = &h1
		Protected Function Bundle() As NSBundle
		  //This function returns an NSBundle because it is most likely that one wants an
		  //NSBundle for Cocoa.    The function Cocoa.StringConstant provides an easy way to resolve string constants.
		  
		  return NSBundle.LoadFromIdentifier(BundleID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFolderItemFromPOSIXPath(absolutePath as String) As FolderItem
		  // Note: The passed path must be absolute, i.e. start from root with "/"
		  
		  #if TargetMacOS
		    declare function CFURLCopyAbsoluteURL lib CarbonLib (relativeURL as Ptr) as Ptr
		    declare function CFURLCreateWithFileSystemPath lib CarbonLib (allocator as ptr, filePath as CFStringRef, pathStyle as Integer, isDirectory as Boolean) as Ptr
		    declare function CFURLGetString lib CarbonLib (anURL as Ptr) as Ptr
		    declare sub CFRelease lib CarbonLib (cf as Ptr)
		    declare function CFRetain lib CarbonLib (cf as Ptr) as CFStringRef
		    declare sub CFShow lib CarbonLib (obj as Ptr)
		    const kCFURLPOSIXPathStyle = 0
		    
		    dim url as Ptr = CFURLCreateWithFileSystemPath(nil, absolutePath, kCFURLPOSIXPathStyle, true)
		    dim str as CFStringRef = CFRetain (CFURLGetString (url))
		    CFRelease (url)
		    dim f as FolderItem = GetFolderItem (str, FolderItem.PathTypeURL)
		    return f
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Initialize()
		  #if TargetCarbon
		    // This function needs to be called once to set up the Cocoa environment.
		    
		    Declare Function NSApplicationLoad Lib CocoaLib () as Boolean
		    
		    static inited as Boolean
		    if not inited then // we should do this only once!
		      inited = true
		      
		      #if RBVersion < 2010
		        autoreleasePool = new AutoreleaseTimer
		      #else
		        // Newer RB versions (actually, since any release after July 2009) create
		        // an autorelease pool for us, so we don't need this any more.
		      #endif
		      
		      if not NSApplicationLoad() then
		        break
		      end
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LoadFramework(frameworkName as String, searchPublicFrameworks as Boolean = true) As CFBundle
		  // Call this to make a framework known to the app, so that its classRef etc. can be looked up
		  
		  #if targetMacOS
		    const FrameworksDirectoryName = "Frameworks"
		    const FrameworkExtension = ".framework"
		    
		    if frameworkName.Right(10) <> FrameworkExtension then
		      frameworkName = frameworkName + FrameworkExtension
		    end if
		    
		    const NSAllDomainsMask = &h0ffff
		    const NSLibraryDirectory = 5
		    const isDirectory = true
		    
		    dim bundleURL as CFURL
		    
		    dim frameworkURLs() as CFURL = Array(CFBundle.Application.FrameworksDirectory.AppendComponent(frameworkName, not isDirectory))
		    
		    if searchPublicFrameworks then
		      const expandTilde = true
		      dim libraryPathArray as new CFArray(NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSAllDomainsMask, expandTilde), not CFType.hasOwnership)
		      for i as Integer = 0 to libraryPathArray.Count - 1
		        frameworkURLs.Append CFURL.CreateFromPOSIXPath(libraryPathArray.CFStringRefValue(i), isDirectory).AppendComponent(FrameworksDirectoryName, isDirectory).AppendComponent(frameworkName, not isDirectory)
		      next
		    end if
		    
		    for each url as CFURL in frameworkURLs
		      dim bundleItem as FolderItem = url.Item
		      if bundleItem <> nil and bundleItem.Exists then
		        bundleURL = url
		        exit
		      end if
		    next
		    
		    dim b as CFBundle = CFBundle.NewCFBundleFromURL(bundleURL)
		    if b <> nil and b.Load then
		      return b
		    else
		      return nil
		    end if
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSClassFromString Lib CocoaLib (aClassName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSFullUserName Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSHomeDirectory Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function NSMakeRect(x as Double, y as Double, w as Double, h as Double) As NSRect
		  dim r as NSRect
		  r.x = x
		  r.y = y
		  r.w = w
		  r.h = h
		  return r
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSSearchPathForDirectoriesInDomains Lib CocoaLib (directory as Integer, domainMask as Integer, expandTilde as Boolean) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSSelectorFromString Lib CocoaLib (aSelectorName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSStringFromClass Lib CocoaLib (aClass as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSStringFromSelector Lib CocoaLib (aSelector as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSUserName Lib CocoaLib () As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function StringConstant(symbolName as String) As String
		  //NSBundle doesn't support loading of data pointers; for this we must use a CFBundle.
		  #if targetMacOS
		    dim b as CFBundle = CFBundle.NewCFBundleFromID(BundleID)
		    return b.StringPointerRetained(symbolName)
		  #endif
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


	#tag Constant, Name = BundleID, Type = String, Dynamic = False, Default = \"com.apple.Cocoa", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CocoaLib, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FoundationLib, Type = String, Dynamic = False, Default = \"Foundation.framework", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NSPoint, Flags = &h1
		x as Single
		y as Single
	#tag EndStructure

	#tag Structure, Name = NSRange, Flags = &h1
		location as Integer
		length as Integer
	#tag EndStructure

	#tag Structure, Name = NSRect, Flags = &h1
		x as Single
		  y as Single
		  w as Single
		h as Single
	#tag EndStructure

	#tag Structure, Name = NSSize, Flags = &h1
		width as Single
		height as Single
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
