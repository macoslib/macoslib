#tag Class
Class NSUserDefaults
Inherits NSObject
	#tag Method, Flags = &h0
		Function ArrayValue(key as String) As NSArray
		  #if TargetMacOS
		    declare function arrayForKey lib CocoaLib selector "arrayForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return  new NSArray( arrayForKey( self.id, key ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ArrayValue(key as String, assigns value as NSArray)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(key as String) As Boolean
		  #if TargetMacOS
		    declare function boolForKey lib CocoaLib selector "boolForKey:" (id as Ptr, key as CFStringRef) as boolean
		    
		    return  boolForKey( self.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BooleanValue(key as string, assigns value as Boolean)
		  #if TargetMacOS
		    declare sub setBool lib CocoaLib selector "setBool:forKey:" (id as Ptr, value as Boolean, key as CFStringRef)
		    
		    setBool   self.id, value, key
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataValue(key as String) As NSData
		  #if TargetMacOS
		    declare function dataForKey lib CocoaLib selector "dataForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return  new NSData( dataForKey( self.id, key ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataValue(key as String, assigns value as NSData)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryRepresentation() As NSDictionary
		  #if TargetMacOS
		    declare function dictionaryRepresentation lib CocoaLib selector "dictionaryRepresentation" (id as Ptr) as Ptr
		    
		    return   new NSDictionary( dictionaryRepresentation( me.id ), true )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DictionaryValue(key as String) As NSDictionary
		  #if TargetMacOS
		    declare function dictionaryForKey lib CocoaLib selector "dictionaryForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return  new NSDictionary( dictionaryForKey( self.id, key ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DictionaryValue(key as String, assigns value as NSDictionary)
		  #if TargetMacOS
		    ObjectValue( key ) = value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(key as String) As double
		  #if TargetMacOS
		    declare function doubleForKey lib CocoaLib selector "doubleForKey:" (id as Ptr, key as CFStringRef) as double
		    
		    return  doubleForKey( self.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleValue(key as String, assigns value as double)
		  #if TargetMacOS
		    declare sub setDouble lib CocoaLib selector "setDouble:forKey:" (id as Ptr, value as double, key as CFStringRef)
		    
		    setDouble( self.id, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FloatValue(key as String) As single
		  #if TargetMacOS
		    declare function floatForKey lib CocoaLib selector "floatForKey:" (id as Ptr, key as CFStringRef) as single
		    
		    return  floatForKey( self.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FloatValue(key as String, assigns value as single)
		  #if TargetMacOS
		    declare sub setFloat lib CocoaLib selector "setFloat:forKey:" (id as Ptr, value as single, key as CFStringRef)
		    
		    setFloat( self.id, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(key as String) As integer
		  #if TargetMacOS
		    declare function integerForKey lib CocoaLib selector "integerForKey:" (id as Ptr, key as CFStringRef) as integer
		    
		    return  integerForKey( self.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IntegerValue(key as String, assigns value as integer)
		  #if TargetMacOS
		    declare sub setInteger lib CocoaLib selector "setInteger:forKey:" (id as Ptr, value as integer, key as CFStringRef)
		    
		    setInteger( self.id, value, key )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectIsForcedForKey(key as String) As Boolean
		  #if TargetMacOS
		    declare function objectIsForcedForKey lib CocoaLib selector "objectIsForcedForKey:" (id as Ptr, key as CFStringRef) as Boolean
		    
		    return  objectIsForcedForKey( me.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectValue(key as String) As NSObject
		  #if TargetMacOS
		    declare function objectForKey lib CocoaLib selector "objectForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return  Cocoa.NSObjectFromNSPtr( objectForKey( me.id, key ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ObjectValue(key as String, assigns obj as NSObject)
		  #if TargetMacOS
		    declare sub setObject lib CocoaLib selector "setObject:forKey:" (id as Ptr, obj as Ptr, key as CFStringRef)
		    
		    setObject  me.id, obj.id, key
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterDefaults(dict as NSDictionary)
		  #if TargetMacOS
		    declare sub registerDefaults lib CocoaLib selector "registerDefaults:" (id as Ptr, dict as Ptr)
		    
		    registerDefaults( me.id, dict.id )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key as string)
		  #if TargetMacOS
		    declare sub removeObjectForKey lib CocoaLib selector "removeObjectForKey:" (id as Ptr, key as CFStringRef)
		    
		    removeObjectForKey   me.id, key
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StandardUserDefaults() As NSUserDefaults
		  #if TargetMacOS
		    declare function standardUserDefaults lib CocoaLib selector "standardUserDefaults" (Cls as Ptr) as Ptr
		    
		    return  new NSUserDefaults( Cocoa.NSClassFromString( "NSUserDefaults" ), true )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(key as String) As string
		  #if TargetMacOS
		    declare function stringForKey lib CocoaLib selector "stringForKey:" (id as Ptr, key as CFStringRef) as CFStringRef
		    
		    return  stringForKey( self.id, key )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(key as String, assigns value as String)
		  #if TargetMacOS
		    ObjectValue( key ) = NSString( value )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Synchronize()
		  #if TargetMacOS
		    declare sub synchronize lib CocoaLib selector "synchronize" (id as Ptr)
		    
		    synchronize   self.id
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLValue(key as String) As NSURL
		  #if TargetMacOS
		    declare function URLForKey lib CocoaLib selector "URLForKey:" (id as Ptr, key as CFStringRef) as Ptr
		    
		    return  Cocoa.NSObjectFromNSPtr( URLForKey( me.id, key ), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URLValue(key as String, assigns obj as NSURL)
		  #if TargetMacOS
		    declare sub setURL lib CocoaLib selector "setURL:forKey:" (id as Ptr, obj as Ptr, key as CFStringRef)
		    
		    setURL  me.id, obj.id, key
		  #endif
		End Sub
	#tag EndMethod


End Class
#tag EndClass
