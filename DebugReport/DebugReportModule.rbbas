#tag Module
Protected Module DebugReportModule
	#tag Method, Flags = &h21
		Private Sub AppendToWindow(level as integer, sr1 as StyleRun, sr2 as StyleRun = nil)
		  if Keyboard.AsyncKeyDown( 80 ) then
		    DebugLogWND.ImmediateReportCB.Value = false
		  end if
		  
		  if DebugLogWND.AllowReportCB.Value then
		    select case level
		    case 0
		      ReportCnt = ReportCnt + 1
		      DebugLogWND.ReportCountLBL.Text = Str( ReportCnt )
		    case 1
		      ErrorCnt = ErrorCnt + 1
		      DebugLogWND.ErrorCountLBL.Text = Str( ErrorCnt )
		    case 2
		      WarningCnt = WarningCnt + 1
		      DebugLogWND.WarningCountLBL.Text = Str( WarningCnt )
		    end select
		    
		    DebugLogWND.LogTA.StyledText.AppendStyleRun   sr1
		    LogText = LogText + sr1.Text
		    
		    if sr2<>nil then
		      DebugLogWND.LogTA.StyledText.AppendStyleRun   sr2
		      LogText = LogText + sr2.Text
		    end if
		    
		    DebugLogWND.LogTA.ScrollPosition = 1e+6
		    
		    if DebugLogWND.ImmediateReportCB.Value AND NOT (Keyboard.AsyncKeyDown( 79 )) then
		      DebugLogWND.LogTA.Refresh
		    end if
		  end if
		  
		  //Add a half-EndOfLine
		  dim srHalf as new StyleRun
		  srHalf.Size = 5
		  srHalf.Text = EndOfLine
		  
		  LogText = LogText + EndOfLine
		  
		  DebugLogWND.LogTA.StyledText.AppendStyleRun   srHalf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReport(ParamArray values() as variant)
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim results() as string
		    dim result as string
		    dim sr as new StyleRun
		    
		    for each v as variant in values
		      results.Append  FormatVariant( v )
		    next
		    
		    result = Join( results, " " ) + EndOfLine
		    
		    sr.Text = result
		    sr.Font = "SmallSystem"
		    
		    AppendToWindow  0, sr
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportError(ParamArray values() as variant)
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim results() as string
		    dim result as string
		    dim sr1 as new StyleRun
		    dim sr2 as new StyleRun
		    
		    for each v as variant in values
		      results.Append  FormatVariant( v )
		    next
		    
		    result = Join( results, " " ) + EndOfLine
		    
		    sr1.Text = "ERROR: "
		    sr1.Font = "SmallSystem"
		    sr1.TextColor = &c9C312000
		    sr1.Bold = true
		    
		    sr2.Text = result
		    sr2.Font = "SmallSystem"
		    
		    AppendToWindow  1, sr1, sr2
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportTitle(ParamArray values() as variant)
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim results() as string
		    dim result as string
		    dim sr as new StyleRun
		    
		    for each v as variant in values
		      results.Append  FormatVariant( v )
		    next
		    
		    result = Join( results, " " ) + EndOfLine
		    
		    sr.Text = result
		    sr.Font = "SmallSystem"
		    sr.Bold = true
		    
		    AppendToWindow  -1, sr
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportWaitChoice(Msg as string, paramarray Choices() as Pair)
		  '//Display a message and wait for user interaction to continue
		  '
		  '//This is a real-time interaction, so we must enforce immediate report
		  'dim immediate as Boolean = DebugLogWND.ImmediateReportCB.Value
		  'dim results() as string
		  'dim result as string
		  '
		  'DebugLogWND.ImmediateReportCB.Value = true
		  '
		  'dim sr1 as new StyleRun
		  'sr1.Text = EndOfLine + Msg + EndOfLine
		  'sr1.Font = "SmallSystem"
		  'sr1.Bold = true
		  'sr1.TextColor = &c00804000
		  '
		  'dim sr2 as new StyleRun
		  'sr2.Font = "SmallSystem"
		  '
		  'for i as integer = 0 to Choices.Ubound
		  'results.Append   Uppercase( Choices( i ).Left ) + ": " + Choices( i ).Right
		  'next
		  ''sr2.Text = Join( Choices, EndOfLine )
		  '
		  'AppendToWindow  0, sr1 //, sr2
		  '
		  'while not ( KeyBoard.AsyncControlKey AND Keyboard.AsyncCommandKey )
		  'app.DoEvents
		  'wend
		  '
		  'beep
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportWarning(ParamArray values() as variant)
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    dim results() as string
		    dim result as string
		    dim sr1 as new StyleRun
		    dim sr2 as new StyleRun
		    
		    for each v as variant in values
		      results.Append  FormatVariant( v )
		    next
		    
		    result = Join( results, " " ) + EndOfLine
		    
		    sr1.Text = "WARNING: "
		    sr1.Font = "SmallSystem"
		    sr1.TextColor = &c0000FF00
		    sr1.Bold = true
		    
		    sr2.Text = result
		    sr2.Font = "SmallSystem"
		    
		    AppendToWindow  2, sr1, sr2
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatVariant(v as Variant, formatSpec as string = "") As string
		  
		  dim results() as string
		  dim s as string
		  dim obj as Object
		  
		  if v.IsNull then
		    return  "nil"
		    
		    #if DebugReportOptions.UseMacoslib
		  elseif v isa NSObject then
		    dim nso as NSObject
		    nso = v
		    return   nso.Description
		    
		  elseif v isa CFType then
		    dim cft as CFType
		    return   cft.Description
		    #endif
		    
		  else
		    if v.IsArray then  //Arrays
		      select case v.ArrayElementType
		      case Variant.TypeString
		        dim ars() as string = v
		        results.Append   "Array of strings: ("
		        for i as integer = 0 to ars.Ubound
		          results.Append  Str( i ) + ": " + ars( i )
		        next
		        results.Append ")"
		        
		      case Variant.TypeInteger
		        dim ari() as integer = v
		        results.Append   "Array of integers: ("
		        for i as integer = 0 to ari.Ubound
		          results.Append  Str( i ) + ": " + Str( ari( i ))
		        next
		        results.Append ")"
		        
		      case Variant.TypeBoolean
		        dim arb() as boolean = v
		        results.Append   "Array of booleans: ("
		        for i as integer = 0 to arb.Ubound
		          results.Append  Str( i ) + ": " + IFTE( arb( i ), "true", "false" )
		        next
		        results.Append ")"
		      else
		        
		      end Select
		      
		      return   Join( Results, EndOfLine )
		      
		    else  //Single values
		      select case VarType( v )
		      case  variant.TypeObject
		        if v isa FolderItem then //FolderItem
		          dim f as FolderItem = v
		          return   "<FolderItem: POSIX path:" + f.POSIXPath + ">"
		          
		        elseif v isa MemoryBlock then //MemoryBlock
		          dim mb as MemoryBlock = v
		          dim maxsize as integer
		          if mb.Size=-1 OR mb.Size > 32767 then
		            maxsize = 32768
		            return   "<MemoryBlock of size " + Str(mb.Size) + " bytes. Only the first 32k displayed:" + EndOfLine + EncodeHex( mb.StringValue( 0, MAX( mb.Size, maxsize )), true ) + ">"
		          else
		            return   "<MemoryBlock of size " + Str(mb.Size) + " bytes. Contents:" + EndOfLine + EncodeHex( mb.StringValue( 0, MAX( mb.Size, maxsize )), true ) + ">"
		          end if
		          
		        elseif v isa Pair then //Pair
		          dim p as Pair = v
		          return  "<Pair: " + FormatVariant( p.Left ) + " : " + FormatVariant( p.Right ) + ">"
		          
		        else
		          obj = v
		          return  "<" + obj.ClassName + ">"
		        end if
		        
		      else
		        obj = v
		        
		        //There is something to fix here
		        
		        'if obj.HasMethod( "DReportVariantString" ) then //The class implements a DReport-compatible formatting method. Let's call it.
		        'return   obj.InvokeMethod( "DReportVariantString", formatSpec )
		        '
		        'else
		        return   v.StringValue
		        'end if
		      end select
		    end if
		  end if
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Documentation
		The DebugReportModule allows you to easily report any value in a dedicated window without the hassle of converting values to strings. You can specify any number of
		values. They will be automatically represented as strings, separated by a space.
		The Debug Log window controls all have a help tag.
		
		• DReport: just print out the formatted text as black text.
		• DReportTitle: prints a bold title which is usually followed by a series of DReport... strings.
		• DReportWarning: a warning. The text will be prepended by a blue "WARNING" tag
		• DReportError: an error. The text will be prepended by a red "ERROR" tag
		• DReportWaitChoice: gives the user a choice and blocks execution until the user selected an option. (NOT IMPLEMENTED YET)
		
		The count of DReports is showed at the bottom of the window.
		
		Carbon and Cocoa objects: you can pass any native Carbon or Cocoa objects, for which the "description" function is used.
		
		WARNING: by default, the Log Window is forced to refresh each time a DReport is encountered. This is useful but also extremely time-consuming. For that reason,
		   you can use the different CheckBoxes but also press F18 (continuously) to reverse that behavior or F19 (once) to block that behavior from now on.
		
		
		EXTENDING the module: if you create a class and want it to be displayable in the Debug Log window, create a method named "DReportVariantString" with an optional 
		   "formatSpec" parameter (as String, defaults to "") which returns the String to be displayed. The string can contain any character but will be displayed as plain text.
		
		
		
		FUTURE FEATURES: in the future, some methods will use a format specification which allows developpers to choose some options for representing the contents of
		   a Real Studio type or of an Object.
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected ErrorCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			The contents of the Debug Log window. It allows you to have the contents of the window even when the debugger broke on exception.
		#tag EndNote
		Protected LogText As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReportCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WarningCnt As Integer
	#tag EndProperty


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
