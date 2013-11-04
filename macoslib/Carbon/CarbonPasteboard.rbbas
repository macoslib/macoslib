#tag Class
Class CarbonPasteboard
	#tag Method, Flags = &h0
		Sub Clear()
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardClear lib CarbonLib (ref as Integer) as Integer
		    
		    mLastError = PasteboardClear (mRef)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Clipboard() As CarbonPasteboard
		  return new CarbonPasteboard()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // default constructor, returning the main clipboard
		  
		  self.Constructor("com.apple.pasteboard.clipboard")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(name as CFStringRef)
		  #if TargetMacOS
		    
		    declare function PasteboardCreate lib CarbonLib (name as CFStringRef, ByRef ref as Integer) as Integer
		    
		    mLastError = PasteboardCreate (name, mRef)
		    if mLastError <> 0 then
		      raise new NilObjectException
		    end if
		    
		  #else
		    
		    #pragma unused name
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(pbRef as Integer)
		  #if TargetMacOS
		    
		    mRef = pbRef
		    
		    declare sub CFRetain lib CarbonLib (cf as Integer)
		    CFRetain (mRef)
		    
		  #else
		    
		    #pragma unused pbRef
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  #if TargetMacOS
		    
		    declare sub CFRelease lib CarbonLib (cf as Integer)
		    CFRelease mRef
		    mRef = 0
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DragPasteboard(dragHandle as Integer) As CarbonPasteboard
		  #if TargetMacOS
		    
		    declare function GetDragPasteboard lib CarbonLib (dragRef as Integer, ByRef pbRefOut as Integer) as Integer
		    
		    dim r as Integer
		    if GetDragPasteboard (dragHandle, r) = 0 then
		      dim pb as CarbonPasteboard = new CarbonPasteboard (r)
		      return pb
		    end
		    
		  #else
		    
		    #pragma unused dragHandle
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FindPasteboard() As CarbonPasteboard
		  return new CarbonPasteboard("com.apple.pasteboard.find")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  return mRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemFlavorData(itemID as Ptr, flavor as String) As MemoryBlock
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardCopyItemFlavorData lib CarbonLib (ref as Integer, id as Ptr, type as CFStringRef, ByRef data as Ptr) as Integer
		    
		    dim d as Ptr
		    mLastError = PasteboardCopyItemFlavorData (mRef, itemID, flavor, d)
		    
		    if mLastError = 0 then
		      dim data as new CFData (d, CFData.hasOwnership)
		      return data.Data
		    end if
		    
		  #else
		    
		    #pragma unused itemID
		    #pragma unused flavor
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemFlavorFlags(itemID as Ptr, flavor as String) As UInt32
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardGetItemFlavorFlags lib CarbonLib (ref as Integer, id as Ptr, type as CFStringRef, ByRef data as UInt32) as Integer
		    
		    dim d as UInt32
		    mLastError = PasteboardGetItemFlavorFlags (mRef, itemID, flavor, d)
		    
		    if mLastError = 0 then
		      return d
		    end if
		    
		  #else
		    
		    #pragma unused itemID
		    #pragma unused flavor
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemFlavors(itemID as Ptr) As String()
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardCopyItemFlavors lib CarbonLib (ref as Integer, id as Ptr, ByRef data as Ptr) as Integer
		    
		    dim d as Ptr
		    mLastError = PasteboardCopyItemFlavors (mRef, itemID, d)
		    
		    if mLastError = 0 then
		      dim a as new CFArray (d, CFArray.hasOwnership)
		      return a.StringValues
		    end if
		    
		  #else
		    
		    #pragma unused itemID
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemIdentifier(index_1based as Integer) As Ptr
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardGetItemIdentifier lib CarbonLib (ref as Integer, idx as Integer, ByRef data as Ptr) as Integer
		    
		    dim d as Ptr
		    mLastError = PasteboardGetItemIdentifier (mRef, index_1based, d)
		    
		    if mLastError = 0 then
		      return d
		    else
		      return Ptr(index_1based)
		    end if
		    
		  #else
		    
		    #pragma unused index_1based
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PasteLocation() As CFURL
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardCopyPasteLocation lib CarbonLib (ref as Integer, ByRef data as Ptr) as Integer
		    
		    dim d as Ptr
		    mLastError = PasteboardCopyPasteLocation (mRef, d)
		    
		    if mLastError = 0 then
		      dim url as new CFURL (d, CFData.hasOwnership)
		      return url
		    end if
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PutItemFlavor(itemID as Ptr, flavor as String, data as MemoryBlock, flags as UInt32) As Boolean
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardPutItemFlavor lib CarbonLib (ref as Integer, id as Ptr, flavor as CFStringRef, data as Ptr, flags as UInt32) as Integer
		    
		    mLastError = PasteboardPutItemFlavor (mRef, itemID, flavor, new CFData (data), flags)
		    
		    return mLastError = 0
		    
		  #else
		    
		    #pragma unused itemID
		    #pragma unused flavor
		    #pragma unused data
		    #pragma unused flags
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResolvePromises()
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardResolvePromises lib CarbonLib (ref as Integer) as Integer
		    
		    mLastError = PasteboardResolvePromises (mRef)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPasteLocation(url as CFURL) As Boolean
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardSetPasteLocation lib CarbonLib (ref as Integer, url as Ptr) as Integer
		    
		    mLastError = PasteboardSetPasteLocation (mRef, url.Reference)
		    
		    return mLastError = 0
		    
		  #else
		    
		    #pragma unused url
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Synchronize(ByRef modified as Boolean, ByRef isOwn as Boolean)
		  #if TargetMacOS
		    
		    #pragma DisableBackgroundTasks
		    
		    declare function PasteboardSynchronize lib CarbonLib (ref as Integer) as UInt32
		    
		    dim n as UInt32 = PasteboardSynchronize (mRef)
		    
		    modified = (n and 1) <> 0
		    isOwn = (n and 2) <> 0
		    
		    mLastError = 0
		    
		  #else
		    
		    #pragma unused modified
		    #pragma unused isOwn
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UniquePasteboard() As CarbonPasteboard
		  #if TargetMacOS
		    
		    declare function PasteboardCreate lib CarbonLib (name as Ptr, ByRef ref as Integer) as Integer
		    
		    dim ref as Integer
		    
		    const kPasteboardUniqueName = nil
		    dim err as Integer = PasteboardCreate (kPasteboardUniqueName, ref)
		    if err <> 0 then
		      return nil
		    end if
		    
		    return new CarbonPasteboard (ref)
		    
		  #endif
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is part of the open source "MacOSLib"
		
		Original sources are located here:  https://github.com/macoslib/macoslib
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetMacOS
			    
			    declare function PasteboardGetItemCount lib CarbonLib (ref as Integer, ByRef n as UInt32) as Integer
			    
			    dim n as UInt32
			    mLastError = PasteboardGetItemCount (mRef, n)
			    
			    if mLastError = 0 then
			      return n
			    end if
			    
			  #endif
			  
			End Get
		#tag EndGetter
		ItemCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastError As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRef As Integer
	#tag EndProperty


	#tag Constant, Name = kPasteboardFlavorNoFlags, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorNotSaved, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorPromised, Type = Double, Dynamic = False, Default = \"512", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorRequestOnly, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorSenderOnly, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorSenderTranslated, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPasteboardFlavorSystemTranslated, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemCount"
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
	#tag EndViewBehavior
End Class
#tag EndClass
