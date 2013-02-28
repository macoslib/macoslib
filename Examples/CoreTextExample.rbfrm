#tag Window
Begin Window CoreTextExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.42e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Core Text Example"
   Visible         =   True
   Width           =   3.93e+2
   Begin Canvas textCanvas
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
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
      UseFocusRing    =   True
      Visible         =   True
      Width           =   148
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   95
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   197
      LockBottom      =   ""
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
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   176
   End
   Begin Canvas textCanvas2
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
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
		  
		  ' make the text red
		  dim rgbColorSpace as CGColorSpace = CGColorSpace.DeviceRGB
		  dim red as new CGColor (rgbColorSpace, Array (1., 0, 0, 0.8))
		  dim attr as new CFDictionary (Array(CFString (kCTForegroundColorAttributeName)), Array (red))
		  
		  dim attrString as new CFMutableAttributedString(text)
		  attrString.SetAttributes CFRangeMake (3, 15), attr, true
		  
		  dim framesetter as new CTFramesetter (attrString)
		  dim frame as CTFrame = framesetter.CreateFrame (CFRangeMake (0, 0), path, nil)
		  
		  frame.Draw (context)
		  
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
		  textPosY = g.Height - lineSpacing
		  
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
		    if count = 0 then
		      exit ' end of loop
		    end
		    
		    dim line as CTLine = typesetter.CreateLine (CFRangeMake(start, count))
		    
		    dim flush as Double = .5
		    dim penOffset as Double = line.PenOffsetForFlush (flush, g.width)
		    
		    dim ascent, descent, leading as Single
		    call line.GetTypographicBounds ascent, descent, leading
		    
		    dim lineRect as CGRect = line.ImageBounds(context)
		    
		    context.SetTextPosition (textPosX + penOffset, textPosY-lineRect.rectSize.height)
		    
		    line.Draw (context)
		    
		    start = start + count
		    textPosY = textPosY - lineRect.rectSize.height - lineSpacing
		  loop
		End Sub
	#tag EndEvent
#tag EndEvents
