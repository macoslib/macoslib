#tag Class
Class NSMutableString
Inherits NSString
	#tag Method, Flags = &h0
		Sub AppendString(s as NSString)
		  //Append the string
		  
		  declare sub appendString lib CocoaLib selector "appendString:" (id as Ptr, nsstring as Ptr )
		  
		  appendString  (self.id, s.id )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendString(s as String)
		  //Append the string
		  
		  declare sub appendString lib CocoaLib selector "appendString:" (id as Ptr, nsstring as Ptr )
		  
		  dim nss as NSString = NSString.InitFromString( s )
		  appendString  (self.id, nss.id )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  declare function stringWithCapacity lib CocoaLib selector "stringWithCapacity:" (id as Ptr, capacity as UInt32) as Ptr
		  
		  dim p as Ptr = NSObject.Allocate( "NSMutableString" )
		  
		  Super.Constructor( stringWithCapacity( p, 0 ), true )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(initialString as string)
		  declare function stringWithCapacity lib CocoaLib selector "stringWithCapacity:" (id as Ptr, capacity as UInt32) as Ptr
		  
		  Super.Constructor( stringWithCapacity( Cocoa.NSClassFromString( "NSMutableString" ), 0 ), false )
		  AppendString   initialString
		  
		End Sub
	#tag EndMethod


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
