#tag Class
Class NSCharacterSet
Inherits NSObject
	#tag Method, Flags = &h0
		Function AllowedCharacters() As string
		  #if TargetMacOS
		    dim mb as MemoryBlock
		    dim value as integer
		    dim result as string = DefineEncoding( "", Encodings.UTF16 )
		    
		    mb = me.BitmapRepresentation.Data
		    
		    for byteNbr as integer = 0 to 8191
		      value = mb.Byte( byteNbr )
		      
		      for bitNbr as integer = 0 to 7
		        if  BitWise.BitAnd( value, RealBasic.Pow( 2., bitNbr ))<>0 then
		          result = result + Encodings.UTF16.Chr( byteNbr * 8 + bitNbr )
		        end if
		      next
		    next
		    
		    return  result
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitmapRepresentation() As NSData
		  #if TargetMacOS
		    declare function bitmapRepresentation lib CocoaLib selector "bitmapRepresentation" (id as Ptr) as Ptr
		    
		    dim p as Ptr = bitmapRepresentation( me.id )
		    
		    if p<>nil then
		      return   new NSData( p, false )
		    else
		      return  nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharacterIsMember(theCharacter as String) As Boolean
		  #if TargetMacOS
		    dim mb as MemoryBlock = theCharacter.ConvertEncoding( Encodings.UTF16 )
		    
		    declare function characterIsMember lib CocoaLib selector "characterIsMember:" (id as Ptr, theChar as UInt16) as Boolean
		    
		    return   characterIsMember( me.id, mb.UInt16Value( 0 ))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromString(theString as String) As NSCharacterSet
		  #if TargetMacOS
		    declare function characterSetWithCharactersInString lib CocoaLib selector "characterSetWithCharactersInString:" (cls as Ptr, theStr as CFStringRef) as Ptr
		    
		    dim chars as string = theString.ConvertEncoding( Encodings.UTF16 )
		    return  new NSCharacterSet( characterSetWithCharactersInString( Cocoa.NSClassFromString( "NSCharacterSet" ), chars), false )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeMutableCopy() As NSMutableCharacterSet
		  #if TargetMacOS
		    return  new NSMutableCharacterSet( NSObject( me ).id, true )
		  #endif
		End Function
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
