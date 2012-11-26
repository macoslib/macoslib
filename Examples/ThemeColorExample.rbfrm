#tag Window
Begin Window ThemeColorExample
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.45e+2
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
   Title           =   "ThemeColors"
   Visible         =   True
   Width           =   5.03e+2
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
		End Sub
	#tag EndEvent


#tag EndWindowCode

