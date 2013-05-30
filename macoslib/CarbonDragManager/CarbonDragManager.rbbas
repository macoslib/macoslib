#tag Module
Protected Module CarbonDragManager
	#tag Method, Flags = &h0
		Function ContainsFileReference(extends dragItem as DragItemMBS, itemIndex as Integer, includePromises as Boolean) As Boolean
		  'dim pb as CarbonPasteboard = CarbonPasteboard.DragPasteboard (dragItem.Handle)
		  'dim flavors() as String = pb.ItemFlavors(itemIndex)
		  '
		  'if flavors <> nil then
		  'for each fl as String in flavors
		  'if UTI_Is_FileReference (fl) then
		  'return true
		  'end if
		  'if includePromises then
		  'if StrComp (fl, UTI_phfs, 0) = 0 or StrComp (fl, UTI_PromisedFileURL, 0) = 0 then
		  'return true
		  'end
		  'end
		  'next
		  'end if
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function DragSendDataProc(type as Integer, refCon as Integer, dragItem as Ptr, dragRef as Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function GetFileReference(extends dragItem as DragItemMBS, itemIndex as Integer) As FolderItem
		  'dim pb as CarbonPasteboard = CarbonPasteboard.DragPasteboard (dragItem.Handle)
		  'dim itemID as Ptr = pb.ItemIdentifier(itemIndex)
		  'dim flavors() as String = pb.ItemFlavors(itemID)
		  '
		  'if flavors = nil then
		  'return nil
		  'end
		  '
		  'dim i as Integer
		  'dim f as FolderItem
		  'dim flavor as String
		  '
		  '' first, look for modern file URLs - only then revert back to old style hfs (usually, phfs comes first if present!)
		  '
		  'flavor = UTI_furl
		  'i = flavors.IndexOf (flavor)
		  'if i < 0 then
		  'flavor = UTI_PromisedFileURL
		  'i = flavors.IndexOf (flavor)
		  'end
		  'if i >= 0 then
		  'dim url as MemoryBlock = pb.ItemFlavorData(itemID, flavor)
		  'if url <> nil then
		  '' GetTrueFolderItem doesn't do this right for file ref URLs ("file:///.file/id=...")
		  'dim u as new CFURL (url)
		  'f = u.Item
		  'end if
		  'end
		  '
		  'if f = nil then
		  'flavor = UTI_hfs ' "hfs "
		  'i = flavors.IndexOf (flavor)
		  'if i >= 0 then
		  'dim data as MemoryBlock = pb.ItemFlavorData(itemID, flavor)
		  'if data <> nil then
		  'if data.Size = 80 then
		  'f = FileUtilities.GetFileFromHFSFlavorData(data)
		  'else
		  'break
		  'end
		  'end if
		  'end if
		  'end
		  '
		  'if f = nil then
		  'flavor = UTI_phfs ' "phfs"
		  'i = flavors.IndexOf (flavor)
		  'if i >= 0 then
		  'dim d as MemoryBlock = pb.ItemFlavorData(itemID, flavor)
		  'dim fl2 as Integer
		  'try
		  'fl2 = d.Long(10)
		  'catch
		  'end
		  'if fl2 <> 0 then
		  '' Here's a little problem: We get a OSType here that we'd have to look up in the flavor types.
		  '' But we have no access to the OSType flavor codes here (unless we learn how to convert them).
		  '' So, instead, we simply assume that the seeked flavor is right past the phfs flavor.
		  'if i < flavors.Ubound then
		  'dim data as MemoryBlock = pb.ItemFlavorData(itemID, flavors(i+1))
		  'if data <> nil and data.Size = 70 then
		  '// we have a FSSpec
		  'f = NewFolderItemFSSpecMBS (data)
		  'else
		  'break
		  'end if
		  'end
		  'end
		  '
		  'end if
		  'end
		  '
		  'return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDragRefWithPasteboard(pb as CarbonPasteboard) As DragRef
		  declare function NewDragWithPasteboard lib CarbonLib (pbRef as Integer, ByRef dragRef as Integer) as Integer
		  
		  dim r as Integer
		  if NewDragWithPasteboard (pb.Handle, r) = 0 then
		    if r <> 0 then
		      return new DragRef (r)
		    end
		  end
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Provides a replacement for RB's DragItem, which doesn't work fully in
		Cocoa yet (see <feedback://showreport?report_id=21991>)
		
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
		
	#tag EndNote


	#tag Constant, Name = kDragActionAlias, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionAll, Type = Double, Dynamic = False, Default = \"&hFFFFFFFF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionCopy, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionDelete, Type = Double, Dynamic = False, Default = \"32", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionGeneric, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionMove, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionNothing, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDragActionPrivate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CGPoint, Flags = &h1
		x as Single
		y as Single
	#tag EndStructure

	#tag Structure, Name = EventRecord, Flags = &h1
		what as Short
		  message as Integer
		  when as Integer
		  where as Point
		modifiers as Short
	#tag EndStructure

	#tag Structure, Name = Point, Flags = &h1
		v as Short
		h as Short
	#tag EndStructure


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
End Module
#tag EndModule
