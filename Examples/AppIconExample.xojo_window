#tag Window
Begin Window AppIconExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Application Icon"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //here's the code that actually loads the icon into an NSImage.
		  
		  self.AppIcon = NSWorkspace.IconForFile(NSBundle.MainBundle.BundleDirectory)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if self.AppIcon = nil then
		    return
		  end if
		  
		  
		  //NSImage.Draw methods use the Cocoa coordinate system in which (0,0) sits at the lower left corner of the world.
		  //The code below creates a new, flipped graphics context. We then need to apply an NSAffineTransform to get the
		  //image to be drawn where we intend.
		  //You can change flipped to false or comment out the four lines of NSAffineTransform code or both to see the effects added.
		  
		  #if targetCocoa
		    NSGraphicsContext.SaveState
		    try
		      const flipped = true
		      dim ctx as new NSGraphicsContext(g, flipped)
		      NSGraphicsContext.CurrentContext = ctx
		      
		      dim t as new NSAffineTransform
		      t.Translate(0.0, g.Height)
		      t.Scale(1.0, -1.0)
		      t.Concat()
		      
		      const IconSize = 256
		      
		      dim srcRect as Cocoa.NSRect
		      dim dstRect as Cocoa.NSRect
		      dstRect.x = (g.Width - IconSize)/2
		      dstRect.y = 64
		      dstRect.w = IconSize
		      dstRect.h = IconSize
		      self.AppIcon.Draw(srcRect, dstRect, NSImage.NSComposite.SourceAtop)
		      
		    finally
		      NSGraphicsContext.RestoreState
		    end try
		    
		  #else
		    #pragma unused g
		  #endif
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private AppIcon As NSImage
	#tag EndProperty


#tag EndWindowCode

