#tag Class
Protected Class mlPDFDocument
Inherits NSObject
	#tag Method, Flags = &h0
		Shared Function CreateFromFolderItem(f as FolderItem) As mlPDFDocument
		  
		  #if TargetMacOS
		    return CreateFromURL( new NSURL( f ))
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromURL(url as NSURL) As mlPDFDocument
		  
		  #if TargetMacOS
		    RequireFramework  "Quartz.framework"
		    
		    declare function initWithURL lib CocoaLib selector "initWithURL:" (id as Ptr, url as Ptr) as Ptr
		    
		    dim p as Ptr = initWithURL( Allocate( Cocoa.NSClassFromString( "PDFDocument" )), url )
		    if p<>nil then
		      return  new mlPDFDocument( p, false )
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
