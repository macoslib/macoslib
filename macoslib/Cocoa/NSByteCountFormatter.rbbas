#tag Class
Class NSByteCountFormatter
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function ByteCount(byteCount as UInt64) As String
		  //# Converts a byte count into a string without creating an NSNumber object.
		  
		  //@param byteCount
		  //    The byte count.
		  //@param/
		  
		  //@return
		  //    A string containing the formatted byteCount value.
		  //@return /
		  
		  #if TargetCocoa then
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    
		    if respondsToSelector( ClassRef, Cocoa.NSSelectorFromString("stringFromByteCount:countStyle:") ) then
		      declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64) as CFStringRef
		      
		      return stringFromByteCount(ClassRef, byteCount)
		    end if
		  #else
		    #pragma Unused ByteCount
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ByteCountWithStyle(byteCount as UInt64, countStyle as NSByteCountFormatterCountStyle) As String
		  //# Converts a byte count into the specified string format without creating an NSNumber object.
		  
		  //@param byteCount
		  //    The byte count.
		  //@param/
		  //@param countStyle
		  //    The formatter style. See “NSByteCountFormatterCountStyle” for possible values.
		  //@param/
		  
		  //@return
		  //    A string containing the formatted byteCount value.
		  //@return /
		  
		  #if TargetCocoa then
		    declare function respondsToSelector lib CocoaLib selector "respondsToSelector:" (obj_id as Ptr, aSelector as Ptr) as Boolean
		    
		    if respondsToSelector( ClassRef, Cocoa.NSSelectorFromString("stringFromByteCount:countStyle:") ) then
		      declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64, countStyle as NSByteCountFormatterCountStyle) as CFStringRef
		      
		      return stringFromByteCount(ClassRef, byteCount, countStyle)
		    end if
		  #else
		    #pragma Unused ByteCount
		    #pragma Unused countStyle
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  
		  static ref as Ptr = Cocoa.NSClassFromString("NSByteCountFormatter")
		  return ref
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  #if TargetCocoa then
		    'if RespondsToSelector("stringFromByteCount:countStyle:") then
		    declare function getStringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as Int64) as Ptr
		    
		    Super.Constructor( getStringFromByteCount(Cocoa.NSClassFromString("NSByteCountFormatter"), 0 ) )
		    'end if
		  #else
		    #pragma Unused byteCount
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringFromByteCount(byteCount as UInt64) As String
		  //# Converts a byte count into a string without creating an NSNumber object.
		  
		  //@param byteCount
		  //    The byte count.
		  //@param/
		  
		  //@return
		  //    A string containing the formatted byteCount value.
		  //@return /
		  
		  #if TargetCocoa then
		    if RespondsToSelector("stringFromByteCount:countStyle:") then
		      declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64) as CFStringRef
		      
		      return stringFromByteCount(self, byteCount)
		    end if
		  #else
		    #pragma Unused byteCount
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function StringFromByteCountWithStyle(byteCount as UInt64, countStyle as NSByteCountFormatterCountStyle) As String
		  //# Converts a byte count into the specified string format without creating an NSNumber object.
		  
		  //@param byteCount
		  //    The byte count.
		  //@param/
		  //@param countStyle
		  //    The formatter style. See “NSByteCountFormatterCountStyle” for possible values.
		  //@param/
		  
		  //@return
		  //    A string containing the formatted byteCount value.
		  //@return /
		  
		  #if TargetCocoa then
		    if RespondsToSelector("stringFromByteCount:countStyle:") then
		      declare function stringFromByteCount lib CocoaLib selector "stringFromByteCount:countStyle:" (obj_id as Ptr, byteCount as UInt64, countStyle as NSByteCountFormatterCountStyle) as CFStringRef
		      
		      return stringFromByteCount(self, byteCount, countStyle)
		    end if
		  #else
		    #pragma Unused byteCount
		    #pragma Unused countStyle
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if TargetCocoa then
			    declare function getAllowsNonnumericFormatting lib CocoaLib selector "allowsNonnumericFormatting" (obj_id as Ptr) as Boolean
			    
			    return getAllowsNonnumericFormatting(self)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetCocoa then
			    declare sub setAllowsNonnumericFormatting lib CocoaLib selector "allowsNonnumericFormatting" (obj_id as Ptr, value as Boolean)
			    
			    setAllowsNonnumericFormatting(self, value)
			  #else
			    #pragma Unused value
			  #endif
			End Set
		#tag EndSetter
		AllowsNonnumericFormatting As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = NSByteCountFormatterCountStyle, Type = Integer, Flags = &h0
		File = 0
		  Memory
		  Decimal
		Binary
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
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
