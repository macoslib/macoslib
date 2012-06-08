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
		Protected Function ClassNameForObjectPointer(p as ptr) As String
		  
		  #if TargetMacOS
		    declare function object_getClassName lib CocoaLib ( id as Ptr ) as Ptr
		    
		    dim s as string
		    
		    dim mb as MemoryBlock
		    if p<>nil then
		      mb = object_getClassName( p )
		      s = mb.CString( 0 )
		    else
		      break
		    end if
		    declare function object_getClass lib CocoaLib (id as Ptr ) as Ptr
		    declare function class_getName lib CocoaLib (id as Ptr) as Ptr
		    declare function class_getSuperclass lib CocoaLib (id as Ptr) as Ptr
		    dim cls as Ptr
		    
		    cls = object_getClass( p )
		    while cls<>nil
		      mb = class_getName( cls )
		      if mb<>nil then
		      end if
		      
		      cls = class_getSuperclass( cls )
		    wend
		    
		    return  s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ClassNameTreeForObjectPointer(p as ptr) As String()
		  
		  declare function object_getClass lib CocoaLib (id as Ptr ) as Ptr
		  declare function class_getName lib CocoaLib (id as Ptr) as Ptr
		  declare function class_getSuperclass lib CocoaLib (id as Ptr) as Ptr
		  
		  dim result() as string
		  dim cls as Ptr
		  dim mb as MemoryBlock
		  
		  cls = object_getClass( p )
		  while cls<>nil
		    mb = class_getName( cls )
		    if mb<>nil then
		      result.Append   mb.CString( 0 )
		    end if
		    
		    cls = class_getSuperclass( cls )
		  wend
		  
		  return  result
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
		Protected Function InheritsFromClass(p as Ptr, classname as string) As Boolean
		  //Check if the Ptr (corresponding to any NS object) has "classname" in its inheritance tree
		  
		  dim tree() as string
		  
		  tree = ClassNameTreeForObjectPointer( p )
		  
		  return  ( tree.IndexOf( classname ) <> -1 )
		  
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

	#tag Method, Flags = &h1
		Protected Function NSObjectFromNSPtr(id as Ptr, hasOwnership as Boolean = false, DontReturnNSObject as boolean = false) As variant
		  //Creates an instance of an RB Cocoa object from the passed Cocoa object instance id
		  
		  dim objClassNameTree() as string = ClassNameTreeForObjectPointer( id )
		  
		  for each objClassName as string in objClassNameTree  //Scan inheritance tree down to NSObject (or root class)
		    select case objClassName
		    case "NSApplication"
		      return  new NSApplication( id, hasOwnership )
		      
		    case "NSArray"
		      return  new NSArray( id, hasOwnership )
		      
		    case "NSBundle"
		      return  new NSBundle( id, hasOwnership )
		      
		    case "NSCell"
		      return  new NSCell( id, hasOwnership )
		      
		    case "NSCharacterSet"
		      return  new NSCharacterSet( id, hasOwnership )
		      
		    case "NSColor"
		      return  new NSColor( id, hasOwnership )
		      
		    case "NSColorSpace"
		      'return  new NSColorSpace( id, hasOwnership )
		      
		    case "NSData"
		      return  new NSData( id, hasOwnership )
		      
		    case "NSDate"
		      return  new NSDate( id, hasOwnership )
		      
		    case "NSDateFormatter"
		      return  new NSDateFormatter( id, hasOwnership )
		      
		    case "NSDictionary"
		      return  new NSDictionary( id, hasOwnership )
		      
		    case "NSEvent"
		      return  new NSEvent( id, hasOwnership )
		      
		    case "NSFont"
		      return  new NSFont( id, hasOwnership )
		      
		    case "NSFontManager"
		      return  new NSFontManager( id, hasOwnership )
		      
		    case "NSGraphicsContext"
		      return  new NSGraphicsContext( id, hasOwnership )
		      
		    case "NSHost"
		      return  new NSHost( id, hasOwnership )
		      
		    case "NSImage"
		      return  new NSImage( id, hasOwnership )
		      
		    case "NSIndexSet"
		      return  new NSIndexSet( id, hasOwnership )
		      
		    case "NSMenu"
		      return  new NSMenu( id, hasOwnership )
		      
		    case "NSMenuItem"
		      return  new NSMenuItem( id, hasOwnership )
		      
		    case "NSMutableArray" //No such class for the moment
		      'return  new NSMutableArray( id, hasOwnership )
		      
		    case "NSMutableCharacterSet"
		      return  new NSMutableCharacterSet( id, hasOwnership )
		      
		    case "NSMutableDictionary"
		      return  new NSMutableDictionary( id, hasOwnership )
		      
		    case "NSMutableIndexSet"
		      return  new NSMutableIndexSet( id, hasOwnership )
		      
		    case "NSMutableString"
		      return  new NSMutableString( id, hasOwnership )
		      
		    case "NSNetService"
		      return  new NSNetService( id, hasOwnership )
		      
		    case "NSNetServiceBrowser"
		      return  new NSNetServiceBrowser( id, hasOwnership )
		      
		    case "NSNotification"
		      return  new NSNotification( id, hasOwnership )
		      
		    case "NSNotificationCenter"
		      return  new NSNotificationCenter( id, hasOwnership )
		      
		    case "NSNull"
		      return  new NSNull( id, hasOwnership )
		      
		    case "NSNumber"
		      return  new NSNumber( id, hasOwnership )
		      
		    case "NSPasteboard"
		      return  new NSPasteboard( id, hasOwnership )
		      
		    case "NSPasteboardItem"
		      return  new NSPasteboardItem( id, hasOwnership )
		      
		    case "NSObject"
		      if DontReturnNSObject then
		        return  nil
		      else
		        return  new NSObject( id, hasOwnership )
		      end if
		      
		    case "NSPathComponentCell"
		      'return  new NSPathComponentCell( id, hasOwnership )
		      
		    case "NSPrinter"
		      return  new NSPrinter( id, hasOwnership )
		      
		    case "NSProcessInfo"
		      return  new NSProcessInfo( id, hasOwnership )
		      
		    case "NSResponder"
		      return  new NSResponder( id, hasOwnership )
		      
		    case "NSRunLoop"
		      return  new NSRunLoop( id, hasOwnership )
		      
		    case "NSRunningApplication"
		      return  new NSRunningApplication( id, hasOwnership )
		      
		    case "NSString"
		      return  new NSString( id, hasOwnership )
		      
		    case "NSTableColumn"
		      return  new NSTableColumn( id, hasOwnership )
		      
		    case "NSTableHeaderView"
		      return  new NSTableHeaderView( id, hasOwnership )
		      
		    case "NSTableViewDataSource"
		      'return  new NSTableViewDataSource( id, hasOwnership )
		      
		    case "NSText"
		      return  new NSText( id, hasOwnership )
		      
		    case "NSTimeZone"
		      return  new NSTimeZone( id, hasOwnership )
		      
		    case "NSURL"
		      return  new NSURL( id, hasOwnership )
		      
		    case "NSValue"
		      return  new NSValue( id, hasOwnership )
		      
		    case "NSView"
		      return  new NSView( id, hasOwnership )
		      
		    case "NSWindow"
		      return  new NSWindow( id, hasOwnership )
		      
		    case "NSWorkspace"
		      return  new NSWorkspace( id, hasOwnership )
		      
		    end select
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSObjectFromRSVariant(v as variant) As variant
		  if v.IsArray then
		    return   NSArray.CreateFromRSObjectsArray( v )
		  end if
		  
		  select case v.Type
		  case Variant.TypeBoolean
		    return  new NSNumber( v.BooleanValue )
		    
		  case Variant.TypeInteger
		    return   new NSNumber( v.IntegerValue )
		    
		  case Variant.TypeString
		    return   new NSString( v.StringValue )
		    
		  case Variant.TypeDouble, Variant.TypeSingle
		    return   new NSNumber( v.DoubleValue )
		    
		  case Variant.TypeObject  //->Dictionary, MemoryBlock
		    if v IsA Dictionary then
		      return   NSDictionary.CreateFromRSDictionary( Dictionary( v ))
		    elseif v IsA MemoryBlock then
		      return   new NSData( MemoryBlock( v ))
		    end if
		    
		  case Variant.TypeDate
		    return   new NSDate( v.DateValue )
		    
		  case Variant.TypeNil
		    return   new NSNull
		  end select
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSSearchPathForDirectoriesInDomains Lib CocoaLib (directory as Integer, domainMask as Integer, expandTilde as Boolean) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSSelectorFromString Lib CocoaLib (aSelectorName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function NSString(ImmutableString as String) As NSString
		  
		  return   NSString.InitFromString( ImmutableString )
		End Function
	#tag EndMethod

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
