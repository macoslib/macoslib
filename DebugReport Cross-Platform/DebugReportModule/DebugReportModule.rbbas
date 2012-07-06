#tag Module
Protected Module DebugReportModule
	#tag Method, Flags = &h21
		Private Sub AppendToWindow(level as integer, sr1 as StyleRun, sr2 as StyleRun = nil)
		  if Keyboard.AsyncKeyDown( 80 ) then
		    DebugLogWND.ImmediateReportCB.Value = false
		    DebugLogWND.ImmediateReportCB.Refresh
		  end if
		  
		  if DebugLogWND.AllowReportCB.Value then
		    select case level
		    case 1
		      ReportCnt = ReportCnt + 1
		      DebugLogWND.ReportCountLBL.Text = Str( ReportCnt )
		    case 3
		      ErrorCnt = ErrorCnt + 1
		      DebugLogWND.ErrorCountLBL.Text = Str( ErrorCnt )
		    case 4
		      WarningCnt = WarningCnt + 1
		      DebugLogWND.WarningCountLBL.Text = Str( WarningCnt )
		    end select
		    
		    DebugLogWND.LogTA.StyledText.AppendStyleRun   sr1
		    LogText = LogText + sr1.Text
		    
		    if sr2<>nil then
		      DebugLogWND.LogTA.StyledText.AppendStyleRun   sr2
		      LogText = LogText + sr2.Text
		    end if
		    
		    //Should we log to the system ?
		    if DebugLogWND.SyslogCB.Value then
		      select case level
		      case kLevelNotice, kLevelTitled //Normal
		        System.Log   System.LogLevelNotice, sr1.Text
		      case kLevelWarning //Warning
		        System.Log   System.LogLevelWarning, IFTE( sr2=nil, sr1.Text, sr2.Text )
		      case kLevelError //Error
		        System.Log   System.LogLevelError, IFTE( sr2=nil, sr1.Text, sr2.Text )
		      case kLevelDebug //Debug
		        
		      end select
		    end if
		    
		    if not Dequeueing then
		      if DebugLogWND.ImmediateReportCB.Value AND NOT (Keyboard.AsyncKeyDown( 79 )) then
		        DebugLogWND.LogTA.ScrollPosition = 1e+6
		        DebugLogWND.LogTA.Refresh
		      end if
		    end if
		  end if
		  
		  //Add a half-EndOfLine
		  dim srHalf as new StyleRun
		  srHalf.Size = 3
		  srHalf.Text = EndOfLine
		  
		  'LogText = LogText + EndOfLine
		  
		  DebugLogWND.LogTA.StyledText.AppendStyleRun   srHalf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReport(ParamArray values() as variant)
		  //# Make a Debug Report as a notice
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelNotice, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportDebug(ParamArray values() as variant)
		  //# Make a Debug Report as a debug note
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelDebug, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportError(ParamArray values() as variant)
		  //# Make a Debug Report as an error
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelError, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportTitled(ParamArray values() as variant)
		  //# Make a Debug Report as a notice, the first item being displayed in boldface
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelTitled, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportWaitAction(paramArray items as string)
		  //# Displays a message then presents the user a sheet window to make a choice before the execution goes on
		  
		  //@ The first value is the message to be displayed
		  //@ All the following values are considered as choices. They must be formatted as "<shortcut>:<the message>" (as a Pair)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DReportWarning(ParamArray values() as variant)
		  //# Make a Debug Report as a warning
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelWarning, true, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatVariant(v as Variant, formatSpec as string = "") As string
		  
		  dim results() as string
		  dim obj as Object
		  dim drfResult as variant
		  
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
		        
		      case Variant.TypeDouble
		        dim ard() as integer = v
		        results.Append   "Array of doubles: ("
		        for i as integer = 0 to ard.Ubound
		          results.Append  Str( i ) + ": " + Str( ard( i ))
		        next
		        results.Append ")"
		        
		      case Variant.TypeBoolean
		        dim arb() as boolean = v
		        results.Append   "Array of booleans: ("
		        for i as integer = 0 to arb.Ubound
		          results.Append  Str( i ) + ": " + IFTE( arb( i ), "true", "false" )
		        next
		        results.Append ")"
		        
		      case 9
		        dim arv() as variant = v
		        if formatSpec<>"-" then
		          results.Append   "Array of variants: ("
		          for i as integer = 0 to arv.Ubound
		            results.Append  Str( i ) + ": " + FormatVariant( arv( i ))
		          next
		          results.Append ")"
		        else
		          for i as integer = 0 to arv.Ubound
		            results.Append  FormatVariant( arv( i ))
		          next
		        end if
		        
		      else
		        
		      end Select
		      
		      return   Join( Results, EndOfLine )
		      
		    else  //Single values
		      if v isa DebugReportFormatter then //Object has a formatter method
		        drfResult = DebugReportFormatter( v ).DebugReportRepresentation
		        
		        if VarType( drfResult ) = Variant.TypeString then
		          return   drfResult.StringValue
		        else
		          return   "<" + v.ClassName + EndOfLine + FormatVariant( drfResult, "-" ) + " >"
		        end if
		      end if
		      
		      select case VarType( v )
		      case  variant.TypeObject
		        if v isa FolderItem then //FolderItem
		          dim f as FolderItem = v
		          return   "<FolderItem: POSIX path:" + f.POSIXPath + " >"
		          
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
		          
		        else //We have no special code to format the Object. Let's use Introspection.
		          
		          //Does not work. It crashes the App
		          
		          obj = v
		          'dim ppts() as Introspection.PropertyInfo
		          'redim result( -1 )
		          '
		          'ppts = Introspection.GetType( obj ).GetProperties
		          '
		          'for each ppt as Introspection.PropertyInfo in ppts
		          'result.Append   ppt.Name + " = " + FormatVariant( ppt.Value( obj ))
		          'next
		          '
		          'return  "<" + obj.ClassName + EndOfLine + Join( result, EndOfLine ) +  " >"
		          
		          return  "<" + obj.ClassName + " >"
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

	#tag Method, Flags = &h21
		Private Sub Init()
		  
		  LogTimer = new Timer
		  LogTimer.Period = 0
		  LogTimer.Mode = 0
		  
		  AddHandler   LogTimer.Action, AddressOf  TimerAction
		  
		  inited = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReport(ParamArray values() as variant)
		  //# Make a Debug Report as a notice
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelNotice, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportDebug(ParamArray values() as variant)
		  //# Make a Debug Report as a debug note
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelDebug, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportError(ParamArray values() as variant)
		  //# Make a Debug Report as an error
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelError, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportTitled(ParamArray values() as variant)
		  //# Make a Debug Report as a notice, the first item being displayed with boldface
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelTitled, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QReportWarning(ParamArray values() as variant)
		  //# Make a Debug Report as a warning
		  
		  //@ You can pass any number of any variant. They will be formatted as text and separated by a space.
		  
		  #if DebugReportOptions.AllowDebugReport AND NOT (DebugReportOptions.AutomaticallyDisableInFinalBuilds AND NOT DebugBuild)
		    XReport   kLevelWarning, false, 0, values
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimerAction(theTimer as Timer)
		  #pragma DisableBackgroundTasks
		  #pragma unused theTimer
		  
		  if App.CurrentThread = nil then
		    if Queue.Ubound>-1 then
		      Dequeueing = true
		      DReportTitled   "QUEUED MESSAGES"
		      for each re as DebugReportModule.ReportEvent in Queue
		        XReport   re.Type, false, re.FormatType, re.values
		      next
		    end if
		    
		    Dequeueing = false
		    LogTimer.mode = 0
		    redim  Queue( -1 )
		    
		  else //We have been called from a Thread ?
		    DReportWarning   "Timer called from Thread" //Will queue
		    LogTimer.Reset
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub XReport(type as integer, immediate as boolean, FormatType as integer, values() as variant)
		  //General Report function
		  
		  #pragma unused immediate
		  
		  dim realImmediate as Boolean
		  dim results1() as string
		  dim results2() as string
		  dim result1, result2 as string
		  dim sr1 as new StyleRun
		  dim sr2 as new StyleRun
		  dim usesr2 as boolean
		  
		  if not inited then   init
		  
		  //Enqueue reports if we are not in the main thread
		  if App.CurrentThread<>nil then
		    Queue.Append   new ReportEvent( type, FormatType, false, values )
		    LogTimer.mode = 1
		    return
		  end if
		  
		  //Format according to parameters
		  select case type
		  case kLevelDebug //Debug
		    for each v as variant in values
		      results1.Append  FormatVariant( v )
		    next
		    sr1.Font = "SmallSystem"
		    
		  case kLevelNotice //Normal text
		    for each v as variant in values
		      results1.Append  FormatVariant( v )
		    next
		    sr1.Font = "SmallSystem"
		    
		  case kLevelTitled //Titled
		    sr1.Font = "SmallSystem"
		    sr1.Bold = true
		    sr1.Text = values( 0 )
		    
		    sr2.Font = "SmallSystem"
		    for i as integer = 1 to values.Ubound
		      results2.Append   FormatVariant( values( i ))
		    next
		    
		  case kLevelWarning //Warning
		    sr1.Font = "SmallSystem"
		    sr1.Text = "WARNING: "
		    sr1.TextColor = &c0000FF
		    sr1.Bold = true
		    
		    for each v as variant in values
		      results2.Append  FormatVariant( v )
		    next
		    sr2.Font = "SmallSystem"
		    
		  case kLevelError //Error
		    sr1.Font = "SmallSystem"
		    sr1.Text = "ERROR: "
		    sr1.TextColor = &c9C3120
		    sr1.Bold = true
		    
		    for each v as variant in values
		      results2.Append  FormatVariant( v )
		    next
		    sr2.Font = "SmallSystem"
		    
		  end select
		  
		  if results1.Ubound>-1 then
		    result1 = Join( results1, " " )
		    if result1<>"" then
		      sr1.Text = result1 + EndOfLine
		    end if
		  end if
		  
		  if results2.Ubound>-1 then
		    result2 = Join( results2, " " )
		    if result2<>"" then
		      sr2.Text = result2 + EndOfLine
		      usesr2 = true
		    end if
		  end if
		  
		  if usesr2 then
		    AppendToWindow  type, sr1, sr2
		  else
		    AppendToWindow   type, sr1
		  end if
		  
		  'if not Dequeueing then
		  'if realImmediate then
		  if immediate then
		    DebugLogWND.LogTA.Refresh
		    'else
		    'DebugLogWND.LogTA.Invalidate
		  end if
		  'end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Documentation
		The DebugReportModule allows you to easily report any value in a dedicated window without the hassle of converting values to strings. You can specify any number of
		values. They will be automatically represented as strings, separated by a space.
		The Debug Log window controls all have a help tag.
		
		• DReportDebug: prints out gray text and does not log it to the system log.
		• DReport: just print out the formatted text as black text.
		• DReportTitled: prints the first item as bold title and the other values as normal text.
		• DReportWarning: a warning. The text will be prepended by a blue "WARNING" tag
		• DReportError: an error. The text will be prepended by a red "ERROR" tag
		• DReportWaitChoice: gives the user a choice and blocks execution until the user selected an option. (NOT IMPLEMENTED YET)
		
		The count of DReports is showed at the bottom of the window (notices, warnings and errors).
		Carbon and Cocoa objects: you can pass any native Carbon or Cocoa objects, for which the "description" function is used.
		If you want to read the Log text after your software broke into the debugger, go to Globals→DebugReportModule→LogText; you will get the whole unformatted text.
		
		• If you change "D" by "Q" at the beginning of the method name, the report will be Queued, i.e. it is added immediately but is displayed only when the DebugLogWindow
		     updates itself. This is much less time consuming than the "D" variant. Also, the data are available even if your software breaks before it has displayed a "Q" Report.
		
		THREADS note: as the UI cannot be modified from a Thread, reports will be queued and displayed ASAP.
		
		WARNING: by default, the Log Window is forced to refresh each time a DReport is encountered. This is useful but also extremely time-consuming. For that reason,
		   you can use the different CheckBoxes but also press F18 (continuously) to reverse that behavior or F19 (once) to block that behavior from now on (DOES NOT WORK YET).
		
		
		EXTENDING the module: if you create a class and want it to be displayable in the Debug Log window, create a method named "DReportVariantString" with an optional 
		   "formatSpec" parameter (as String, defaults to "") which returns the String to be displayed. The string can contain any character but will be displayed as plain text.
		
		
		
		FUTURE FEATURES: in the future, some methods will use a format specification which allows developers to choose some options for representing the contents of
		   a Real Studio type or of an Object.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Dequeueing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ErrorCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private inited As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			The contents of the Debug Log window. It allows you to have the contents of the window even when the debugger broke on exception.
		#tag EndNote
		Protected LogText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LogTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Queue() As ReportEvent
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReportCnt As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WarningCnt As Integer
	#tag EndProperty


	#tag Constant, Name = DRSeparation, Type = String, Dynamic = False, Default = \"_.$separation$._", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDebugReportModuleVersion, Type = Double, Dynamic = False, Default = \"100", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLevelDebug, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelError, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelNotice, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelTitled, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLevelWarning, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
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
