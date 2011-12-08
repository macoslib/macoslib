#tag Class
Protected Class CocoaMenuItemPageSetup
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "runPageLayout:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Page Setup\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Page Setup\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Papierformat \xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE3\x83\x9A\xE3\x83\xBC\xE3\x82\xB8\xE8\xA8\xAD\xE5\xAE\x9A..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Format d\xE2\x80\x99impression\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Formato di stampa\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAA\xE0\xA7\x83\xE0\xA6\xB7\xE0\xA7\x8D\xE0\xA6\xA0\xE0\xA6\xBE\xE0\xA6\xB0 \xE0\xA6\xAC\xE0\xA6\xBF\xE0\xA6\xA8\xE0\xA7\x8D\xE0\xA6\xAF\xE0\xA6\xBE\xE0\xA6\xB8\xE2\x80\xA6"
	#tag EndConstant


End Class
#tag EndClass
