#tag Class
Protected Class DragRef
	#tag Method, Flags = &h0
		Function AllowableActions() As Integer
		  #if TargetMacOS
		    
		    declare function GetDragAllowableActions lib CarbonLib (ref as Integer, ByRef act as Integer) as Integer
		    
		    dim actions as Integer
		    dim res as Integer = GetDragAllowableActions (mRef, actions)
		    if res <> 0 then
		      break
		    else
		      return actions
		    end
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ref as Integer)
		  mRef = ref
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  #if TargetMacOS
		    
		    declare sub DisposeDrag lib CarbonLib (ref as Integer)
		    
		    if mRef <> 0 then
		      DisposeDrag (mRef)
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DropDestination() As FolderItem
		  #if TargetMacOS
		    
		    declare function GetDropLocation lib CarbonLib (dragHdl as Integer, outDropLocationAEDesc as Ptr) as Integer
		    declare function AECoerceDesc lib CarbonLib (aeDesc as Ptr, type as OSType, descr_in as Ptr) as Integer
		    declare function AEGetDescData lib CarbonLib (aeDesc as Ptr, data as Ptr, maxSize as Integer) as Integer
		    
		    dim aeDesc as new MemoryBlock(8)
		    dim res as Integer = GetDropLocation (mRef, aeDesc)
		    
		    if res = 0 then
		      dim fsrDesc as new MemoryBlock (8)
		      res = AECoerceDesc (aeDesc, "fsrf", fsrDesc)
		      if res = 0 then
		        dim ref as new MemoryBlock (80)
		        res = AEGetDescData (fsrDesc, ref, ref.Size)
		        if res = 0 then
		          dim r2 as new FSRef (ref)
		          return r2.FolderItem
		        end if
		      end if
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAllowableActions(actions as Integer, isLocal as Boolean)
		  #if TargetMacOS
		    
		    declare function SetDragAllowableActions lib CarbonLib (ref as Integer, act as Integer, loc as Boolean) as Integer
		    
		    dim res as Integer = SetDragAllowableActions (mRef, actions, isLocal)
		    if res <> 0 then
		      break
		    end
		    
		  #else
		    
		    #pragma unused actions
		    #pragma unused isLocal
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCGImage(img as CGImage, ofsx as Integer, ofsy as Integer, flags as Integer)
		  #if TargetMacOS
		    
		    declare function SetDragImageWithCGImage lib CarbonLib (ref as Integer, imgRef as Ptr, ByRef ofs as CGPoint, fl as Integer) as Integer
		    
		    dim pt as CGPoint
		    pt.x = ofsx
		    pt.y = ofsy
		    dim res as Integer = SetDragImageWithCGImage (mRef, img.Reference, pt, flags)
		    if res <> 0 then
		      break
		    end
		    
		  #else
		    
		    #pragma unused img
		    #pragma unused ofsx
		    #pragma unused ofsy
		    #pragma unused flags
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDragSendProc(proc as DragSendDataProc, ref as Integer)
		  #if TargetMacOS
		    
		    declare function SetDragSendProc lib CarbonLib (dragRef as Integer, proc as Ptr, refCon as Integer) as Integer
		    
		    dim res as Integer = SetDragSendProc (mRef, proc, ref)
		    if res <> 0 then
		      break
		    end
		    
		  #else
		    
		    #pragma unused proc
		    #pragma unused ref
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrackDrag(eventRec as EventRecord, rgn as Ptr) As Integer
		  #if TargetMacOS
		    
		    declare function TrackDrag lib CarbonLib (dragRef as Integer, ByRef ev as EventRecord, theRegion as Ptr) as Integer
		    
		    return TrackDrag (mRef, eventRec, rgn)
		    
		  #else
		    
		    #pragma unused eventRec
		    #pragma unused rgn
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WasDroppedToTrash() As Boolean
		  #if TargetMacOS
		    
		    declare function GetStandardDropLocation lib CarbonLib (theDrag as Integer, byref outDropLocation as Integer) as Integer
		    
		    ' determine standard location drag item was dropped to
		    dim outDropLocation as Integer
		    call GetStandardDropLocation(mRef, outDropLocation)
		    
		    return outDropLocation = kDragStandardDropLocationTrash
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag Property, Flags = &h21
		Private mRef As Integer
	#tag EndProperty


	#tag Constant, Name = kDragStandardDropLocationTrash, Type = Double, Dynamic = False, Default = \"\'trsh\'", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
