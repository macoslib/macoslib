#tag Class
Protected Class CocoaMenuItemPrint
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "print:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Print\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Print\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Drucken \xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Imprimer\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x97\xE3\x83\xAA\xE3\x83\xB3\xE3\x83\x88..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Stampa\xE2\x80\xA6"
	#tag EndConstant


End Class
#tag EndClass
