#tag Class
Class NSImage
Inherits NSObject
	#tag Method, Flags = &h0
		 Shared Function Advanced() As NSImage
		  dim sym as string = ResolveSymbol("NSImageNameAdvanced")
		  return LoadByName( sym )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ApplicationIcon() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameApplicationIcon"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Bonjour() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameBonjour"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Caution() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameCaution"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ClassRef() As Ptr
		  #if targetMacOS
		    return Cocoa.NSClassFromString("NSImage")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ColorPanel() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameColorPanel"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Computer() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameComputer"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As NSImage
		  #if targetMacOS
		    declare function copyWithZone lib CocoaLib selector "copyWithZone:" (obj_id as Ptr, zone as Ptr) as Ptr
		    
		    return new NSImage(copyWithZone(self, nil))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPicture(pict as Picture) As NSImage
		  //To create an NSimage from a REALbasic Picture, create a CGImage from the Picture, then make an NSImage.
		  
		  #if TargetMacOS
		    dim cg_image as CGImage = CGImage.NewCGImage( pict )
		    
		    if cg_image<>nil then
		      dim nsimg as NSImage = cg_image.MakeNSImage
		      
		      return   nsimg
		    else
		      return nil
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DotMac() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameDotMac"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(point as Cocoa.NSPoint, operation as NSComposite, opacity as Double = 1.0)
		  //Draws the image to the current NSGraphicsContext.
		  
		  dim zeroRect as Cocoa.NSRect
		  self.Draw point, zeroRect, operation, opacity
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(point as Cocoa.NSPoint, fromRect as NSRect, operation as NSComposite, opacity as Double = 1.0)
		  //Draws the part of the image defined by fromRect to the current NSGraphicsContext.
		  //pass fromRect = zeroRect to draw the entire image.
		  
		  #if targetCocoa
		    declare sub drawAtPoint lib CocoaLib selector "drawAtPoint:fromRect:operation:fraction:" (obj_id as Ptr, point as Cocoa.NSPoint, fromRect as Cocoa.NSRect, op as NSComposite, delta as Single)
		    
		    drawAtPoint(self, point, fromRect, operation, CType(opacity, Single))
		    
		  #else
		    #pragma unused point
		    #pragma unused fromRect
		    #pragma unused operation
		    #pragma unused opacity
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(srcRect as Cocoa.NSRect, dstRect as Cocoa.NSRect, operation as NSComposite, opacity as Double)
		  //draws part of image defined by srcRect into dstRect in the current context.  The image is scaled as needed.
		  //Pass srcRect = zeroRect to draw the entire image.
		  
		  #if targetMacOS
		    declare sub drawInRect lib CocoaLib selector "drawInRect:fromRect:operation:fraction:" (obj_id as Ptr, dstRect as Cocoa.NSRect, srcRect as Cocoa.NSRect, op as NSComposite, delta as Single)
		    
		    drawInRect(self, dstRect, srcRect, operation, CType(opacity, Single))
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Everyone() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameEveryone"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Folder() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameFolder"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FolderBurnable() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameFolderBurnable"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FolderSmart() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameFolderSmart"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FontPanel() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameFontPanel"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Info() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameInfo"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadByName(name as CFStringRef) As NSImage
		  #if targetMacOS
		    declare function imageNamed lib CocoaLib selector "imageNamed:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim p as Ptr = imageNamed(ClassRef, name)
		    if p <> nil then
		      return new NSImage(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadByNameWithSymbolResolution(name as String) As NSImage
		  dim sym as string = ResolveSymbol( name )
		  return LoadByName( sym )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadByName__(name as String) As NSImage
		  dim cfName as CFStringRef = name
		  return LoadByName(cfName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeCGImage(proposedWidth as double = 0.0, proposedHeight as double = 0.0) As CGImage
		  #if targetMacOS
		    declare function CGImageForProposedRect lib CocoaLib selector "CGImageForProposedRect:context:hints:" (obj_id as Ptr, byref proposedDestRect as NSRect, referenceContext as Ptr, hints as Ptr) as Ptr
		    
		    dim r as NSRect
		    dim s as NSSize = me.Size
		    
		    //Set default size
		    r.w = s.width
		    r.h = s.height
		    
		    //Overwrite size if given
		    if proposedWidth>0.0 then
		      r.w = proposedWidth
		    end if
		    
		    if proposedHeight>0.0 then
		      r.h = proposedHeight
		    end if
		    
		    dim imagePtr as Ptr = CGImageForProposedRect(self, r, nil, nil)
		    if imagePtr <> nil then
		      return new CGImage(imagePtr, not CFType.hasOwnership)
		    else
		      return nil
		    end if
		  #endif
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MixedState() As NSImage
		  
		  return LoadByName(ResolveSymbol("NSImageNameMenuMixedStateTemplate"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MobileMe() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameMobileMe"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MultipleDocuments() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameMultipleDocuments"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Network() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameNetwork"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Picture
		  //Given an NSImage, you can convert it to a REALbasic Picture object by first converting to a CGimage, then to a Picture.
		  
		  #if TargetMacOS
		    
		    dim cg_image as CGImage = me.MakeCGImage
		    
		    if cg_image<>nil then
		      dim p as Picture = cg_image.MakePicture
		      return   p
		      
		    else
		      return  nil
		      
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PreferencesGeneral() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNamePreferencesGeneral"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ResolveSymbol(symbolName as String) As CFStringRef
		  static b as CFBundle = CFBundle.NewCFBundleFromID(Cocoa.BundleID)
		  if b <> nil then
		    return b.StringPointerRetained(symbolName)
		    
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMaxSize(maxSideLength as double)
		  //Set the NSImage size to maxSideLength on one side while the other is computed for keeping aspect ratio. If the NSImage is smaller than maxSideLength, it does nothing.
		  
		  dim theSize as Cocoa.NSSize
		  dim currentSize as Cocoa.NSSize = me.Size
		  dim scale as double
		  dim w, h as double
		  
		  if maxSideLength=0.0 then  //Full size
		    return
		  else
		    scale = currentSize.width / currentSize.height
		    if currentSize.width >= maxSideLength  then
		      w = maxSideLength
		      h = w / scale
		      
		    elseif currentSize.height >= maxSideLength then
		      h = maxSideLength
		      w = h * scale
		      
		    else
		      w = currentSize.width
		      h = currentSize.height
		    end if
		    
		    theSize.width = w
		    theSize.height = h
		  end if
		  
		  me.Size = theSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSize(wantedWidth as double = 0.0, wantedHeight as double = 0.0)
		  //Set the NSImage size with the possibility of setting only one dimension while the other is computed for keeping aspect ratio
		  
		  dim theSize as Cocoa.NSSize
		  dim scale as double
		  dim w, h as double
		  
		  if wantedWidth=0.0 AND wantedHeight=0.0 then  //Full size
		    theSize = me.Size
		  else
		    scale = size.width / size.height
		    if wantedWidth=0.0 then
		      w = scale * h
		    elseif wantedHeight=0.0 then
		      h = w / scale
		    else
		      w = wantedWidth
		      h = wantedHeight
		    end if
		    
		    theSize.width = w
		    theSize.height = h
		  end if
		  
		  me.Size = theSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As Cocoa.NSSize
		  #if targetMacOS
		    declare function size lib CocoaLib selector "size" (obj_id as Ptr) as Cocoa.NSSize
		    
		    return size(self)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(assigns value as Cocoa.NSSize)
		  //starting in MacOS 10.6, this rescales the image.
		  
		  #if targetMacOS
		    declare sub setSize lib CocoaLib selector "setSize:" (obj_id as Ptr, value as Cocoa.NSSize)
		    
		    setSize(self, value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StatusAvailable() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameStatusAvailable"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StatusNone() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameStatusNone"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StatusPartiallyAvailable() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameStatusPartiallyAvailable"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StatusUnavailable() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameStatusUnavailable"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function TrashEmpty() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameTrashEmpty"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function TrashFull() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameTrashFull"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function User() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameUser"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UserAccounts() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameUserAccounts"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UserGroup() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameUserGroup"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UserGuest() As NSImage
		  return LoadByName(ResolveSymbol("NSImageNameUserGuest"))
		End Function
	#tag EndMethod


	#tag Note, Name = Conversion from Picture
		To create an NSimage from a REALbasic Picture, create a CGImage from the Picture, then make an NSImage.
		
		  dim p as new Picture(32, 32, 32)
		  p.Graphics.ForeColor = &cff0000
		  p.Graphics.FillRect 0, 0, p.Width, p.Height
		  
		  dim cg_image as CGImage = CGImage.NewCGImage(p)
		  dim nsimage as NSImage = cg_image.MakeNSImage
	#tag EndNote

	#tag Note, Name = Conversion to Picture
		Given an NSImage, you can convert it to a REALbasic Picture object by first converting to a CGimage, then to a Picture.
		
		dim cg_image as CGImage = image.MakeCGImage
		dim p as Picture = cg_image.MakePicture
	#tag EndNote


	#tag Enum, Name = NSComposite, Type = Integer, Flags = &h0
		Clear = 0
		  Copy = 1
		  SourceOver = 2
		  SourceIn = 3
		  SourceOut = 4
		  SourceAtop = 5
		  DestinationOver = 6
		  DestinationIn = 7
		  DestinationOut = 8
		  DestinationAtop = 9
		  X_OR = 10
		  PlusDarker = 11
		  Highlight = 12
		PlusLighter = 13
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
