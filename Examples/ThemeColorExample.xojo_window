#tag Window
Begin Window ThemeColorExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   345
   ImplicitInstance=   True
   LiveResize      =   "True"
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
   Title           =   "ThemeColors"
   Visible         =   True
   Width           =   503
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  const h = 20
		  dim m as Integer = g.Height \ h
		  for i as integer = -5 to 60
		    dim y as integer = ((i+5) mod m * h)
		    dim x as Integer = (i+5) \ m * 120
		    g.ForeColor = &c000000
		    g.DrawString Str(i), x+10, y+h-4
		    g.ForeColor = AppearanceManager.ThemeColor(i)
		    g.FillRect (x+32, y, 60, h)
		  next
		  
		  #if RBVersion >= 2012.02
		    #pragma unused areas
		  #endif
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

