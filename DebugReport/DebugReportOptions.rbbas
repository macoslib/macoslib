#tag Module
Protected Module DebugReportOptions
	#tag Note, Name = Documentation
		This module allows you to quickly change behavior of the DebugReportModule:
		• AllowDebugReport: if false, all debug reports are dropped and the DebugLogWND will never show up. Useful when releasing your software
		• UseMacoslib: set it to true if macoslib is installed
		• AutomaticallyDisableInFinalBuilds: if true (even if AllowDebugReport is true), debug reports are disabled in final builds (but allowed when debugging). This way, you are
		   sure that the Debug Report window will not show up in the built applications, even if you forgot to set "AllowDebugReport" to false.
		
	#tag EndNote


	#tag Constant, Name = AllowDebugReport, Type = Boolean, Dynamic = False, Default = \"true", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AutomaticallyDisableInFinalBuilds, Type = Boolean, Dynamic = False, Default = \"true", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UseMacoslib, Type = Boolean, Dynamic = False, Default = \"true", Scope = Protected
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
End Module
#tag EndModule
