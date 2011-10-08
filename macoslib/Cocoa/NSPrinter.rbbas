#tag Class
Class NSPrinter
Inherits NSObject
	#tag Method, Flags = &h0
		Function BooleanValue(key as String, table as String) As Boolean
		  #if targetMacOS
		    declare function booleanForKey lib CocoaLib selector "booleanForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Boolean
		    
		    return booleanForKey(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Get(name as String) As NSPrinter
		  #if targetMacOS
		    declare function printerWithName lib CocoaLib selector "printerWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = printerWithName(Cocoa.NSClassFromString("NSPrinter"), name)
		    if p <> nil then
		      return new NSPrinter(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(key as String, table as String) As Integer
		  #if targetMacOS
		    declare function intForKey lib CocoaLib selector "intForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Integer
		    
		    return intForKey(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsKeyInTable(key as String, table as String) As Boolean
		  #if targetMacOS
		    declare function isKeyInTable lib CocoaLib selector "isKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Boolean
		    
		    return isKeyInTable(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Names() As String()
		  #if targetMacOS
		    declare function printerNames lib CocoaLib selector "printerNames" (class_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(printerNames(Cocoa.NSClassFromString("NSPrinter")),not CFType.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSRectValue(key as String, table as String) As Cocoa.NSRect
		  #if targetMacOS
		    declare function rectForKey lib CocoaLib selector "rectForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Cocoa.NSRect
		    
		    return rectForKey(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSSizeValue(key as String, table as String) As Cocoa.NSSize
		  #if targetMacOS
		    declare function sizeForKey lib CocoaLib selector "sizeForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Cocoa.NSSize
		    
		    return sizeForKey(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PageSize(paperName as String) As Cocoa.NSSize
		  #if targetMacOS
		    declare function pageSizeForPaper lib CocoaLib selector "pageSizeForPaper:" (obj_id as Ptr, paperName as CFStringRef) as Cocoa.NSSize
		    
		    return pageSizeForPaper(self, paperName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SingleValue(key as String, table as String) As Single
		  #if targetMacOS
		    declare function floatForKey lib CocoaLib selector "floatForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Single
		    
		    return floatForKey(self, key, table)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringListValue(key as String, table as String) As String()
		  #if targetMacOS
		    declare function stringListForKey lib CocoaLib selector "stringListForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Ptr
		    
		    dim theArray as new CFArray(stringListForKey(self, key, table), not CFType.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(key as String, table as String) As String
		  #if targetMacOS
		    declare function stringforKey lib CocoaLib selector "stringForKey:inTable:" (obj_id as Ptr, key as CFStringRef, table as CFStringRef) as Ptr
		    
		    dim p as Ptr = stringForKey(self, key, table)
		    if p <> nil then
		      return CFStringRetain(p)
		    else
		      return ""
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableStatus(tableName as String) As TableStatus
		  #if targetMacOS
		    declare function statusForTable lib CocoaLib selector "statusForTable:" (obj_id as Ptr, tableName as CFStringRef) as TableStatus
		    
		    return statusForTable(self, tableName)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Types() As String()
		  #if targetMacOS
		    declare function printerTypes lib CocoaLib selector "printerTypes" (class_id as Ptr) as Ptr
		    
		    dim theArray as new CFArray(printerTypes(Cocoa.NSClassFromString("NSPrinter")), not CFArray.hasOwnership)
		    return theArray.StringValues
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function languageLevel lib CocoaLib selector "languageLevel" (obj_id as Ptr) as Integer
			    
			    return languageLevel(self)
			  #endif
			End Get
		#tag EndGetter
		LanguageLevel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = name(self)
			    if p <> nil then
			      return CFStringRetain(p)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function type lib CocoaLib selector "type" (obj_id as Ptr) as Ptr
			    
			    dim p as Ptr = type(self)
			    if p <> nil then
			      return CFStringRetain(p)
			    else
			      return ""
			    end if
			  #endif
			End Get
		#tag EndGetter
		Type As String
	#tag EndComputedProperty


	#tag Enum, Name = TableStatus, Type = Integer, Flags = &h0
		OK = 0
		  NotFound = 1
		Error = 2
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
			Name="LanguageLevel"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
