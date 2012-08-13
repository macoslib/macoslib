#tag Module
Protected Module AssertionModule
	#tag Method, Flags = &h0
		Sub AssertOSVersion(minVersion as integer = 0, maxVersion as integer = 0, customMessage as string = "")
		  //Assert the OS Version. The default exception message can be overridden by specifying a 'customMessage'
		  
		  //System version is MMmmdd (Major, minor, debug)
		  
		  dim OK as Boolean = true
		  
		  if minVersion>0 AND SystemVersionAsInt < minVersion then
		    OK = false
		  end if
		  
		  if maxVersion>0 AND SystemVersionAsInt > maxVersion then
		    OK = false
		  end if
		  
		  if NOT OK then //Assertion failed
		    if customMessage<>"" then
		      raise  new BadSystemException( customMessage )
		    else
		      raise  new BadSystemException( "The application has called a 'macoslib' method which is not compatible with your OS version." )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertPtr(Pointer as Ptr, exceptionMessage as String)
		  //Raise a macoslibException with the given exceptionMessage if the passed Ptr is nil
		  
		  if Pointer=nil then
		    raise new macoslibException( exceptionMessage )
		  end if
		End Sub
	#tag EndMethod


End Module
#tag EndModule
