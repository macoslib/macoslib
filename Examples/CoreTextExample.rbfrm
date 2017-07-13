#tag Window
Begin Window CoreTextExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   242
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
   Title           =   "Core Text Example"
   Visible         =   True
   Width           =   393
   Begin Canvas textCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   95
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   148
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   95
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   197
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Resize the window to watch the text adjust itself inside the Canvas."
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
   End
   Begin Canvas textCanvas2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   95
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   127
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   148
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  adjustLayout
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  adjustLayout
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  adjustLayout
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub adjustLayout()
		  // Adjusts the Canvases so that they share the available height of the window
		  
		  dim gap as Integer = textCanvas.Top ' this is the gap between the canvases as well as towards their window edges
		  dim canvasHeight as Integer = (self.Height - 3 * gap) \ 2
		  textCanvas.Height = canvasHeight
		  textCanvas2.Top = self.Height - gap - canvasHeight
		  textCanvas2.Height = canvasHeight
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events textCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // This code is based on Listing 2-1 of the "Common Operations" chapter of the Core Text Programming Guide:
		  // http://developer.apple.com/library/ios/#documentation/StringsTextFonts/Conceptual/CoreText_Programming/Operations/Operations.html
		  
		  dim rect as CGRect = CGRectMake (0, 0, g.Width, g.Height)
		  
		  dim context as new CGContextGraphicsPort(g)
		  context.SetTextMatrix CGAffineTransformIdentity
		  
		  ' let's give the canvas a light background so that we can see its boundaries
		  context.SetFillColor &cddffff
		  context.FillRect rect
		  
		  dim path as new CGMutablePath
		  path.AddRect rect
		  
		  dim text as String = "We hold this truth to be self-evident, that everyone is created equal."+EndOfLine+EndOfLine+"(Using block drawing)"
		  
		  ' preset the attributed string with the text
		  dim attrString as new CFMutableAttributedString(text)
		  
		  ' now add some text attributes...
		  dim attr as new CFMutableDictionary
		  
		  ' make the text red
		  dim red as new CGColor (CGColorSpace.DeviceRGB, Array (1., 0, 0, 0.8))
		  attr.Value(CFString(kCTForegroundColorAttributeName)) = red
		  attrString.SetAttributes CFRangeMake (3, 15), attr, false
		  
		  ' add a different font
		  dim font as NSFont = NSFontManager.SharedManager.GetFont("Marker Felt", 16)
		  dim cf_font as CFType = CFType.NewObject(font, not CFType.hasOwnership) ' turns a NS type into a CF type
		  attr.Clear
		  attr.Value(CFString(kCTFontAttributeName)) = cf_font
		  attrString.SetAttributes CFRangeMake (30, 7), attr, false
		  
		  ' frame a drawing frame
		  dim framesetter as new CTFramesetter (attrString)
		  dim frame as CTFrame = framesetter.CreateFrame (CFRangeMake (0, 0), path, nil)
		  
		  ' and draw the text into the context
		  frame.Draw (context)
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textCanvas2
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // This code is based on Listing 2-4 of the "Common Operations" chapter of the Core Text Programming Guide:
		  // http://developer.apple.com/library/ios/#documentation/StringsTextFonts/Conceptual/CoreText_Programming/Operations/Operations.html
		  
		  const lineSpacing = 2 ' extra space between each line
		  
		  dim textPosX, textPosY as Integer
		  textPosX = 0
		  textPosY = g.Height
		  
		  dim rect as CGRect = CGRectMake (0, 0, g.Width, g.Height)
		  
		  dim context as new CGContextGraphicsPort(g)
		  context.SetTextMatrix CGAffineTransformIdentity
		  
		  ' let's give the canvas a light background so that we can see its boundaries
		  context.SetFillColor &cffffee
		  context.FillRect rect
		  
		  dim text as String = "We hold this truth to be self-evident, that everyone is created equal."+EndOfLine+EndOfLine+"(Using line-by-line drawing)"
		  
		  dim typesetter as new CTTypesetter (text)
		  
		  dim start as Integer = 0
		  
		  ' loop over every single line to draw
		  do
		    dim count as Integer = typesetter.SuggestLineBreak (start, g.Width)
		    if count <= 0 then
		      exit ' end of loop
		    end
		    
		    dim line as CTLine = typesetter.CreateLine (CFRangeMake(start, count))
		    
		    dim flush as Double = .5
		    dim penOffset as Double = line.PenOffsetForFlush (flush, g.width)
		    
		    dim ascent, descent, leading as Double
		    call line.GetTypographicBounds ascent, descent, leading
		    
		    dim lineRect as CGRect = line.ImageBounds(context)
		    #pragma unused lineRect
		    
		    dim textHeight as Integer = Ceil (ascent + descent + leading) ' lineRect.rectSize.height is 0 for empty lines, but ascent+descent aren't
		    
		    context.SetTextPosition (textPosX + penOffset, textPosY-textHeight)
		    
		    line.Draw (context)
		    
		    start = start + count
		    textPosY = textPosY - textHeight - lineSpacing
		  loop
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
