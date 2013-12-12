#tag Class
Class CFArray
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As UInt32
		  return self.ClassID
		End Function
	#tag EndEvent

	#tag Event
		Function VariantValue() As Variant
		  dim result() as Variant
		  dim lastOffset as Integer = self.Count - 1
		  
		  for i as Integer = 0 to lastOffset
		    result.Append self.CFValue(i).VariantValue
		  next
		  
		  return result
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function ClassID() As UInt32
		  #if targetMacOS
		    declare function TypeID lib CoreFoundation.framework alias "CFArrayGetTypeID" () as UInt32
		    static id as UInt32 = TypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As CFArray
		  #if TargetMacOS
		    declare function CFArrayCreateCopy lib CoreFoundation.framework (allocator as Ptr, theArray as CFTypeRef) as CFTypeRef
		    
		    if self <> nil then
		      return new CFArray(CFArrayCreateCopy(nil, self), CFType.hasOwnership)
		    else
		      return new CFArray(nil, CFType.hasOwnership)
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theList() as CFType)
		  #if targetMacOS
		    declare function CFArrayCreate lib CoreFoundation.framework (allocator as Ptr, values as Ptr, numValues as Integer, callbacks as Ptr) as CFTypeRef
		    
		    self.Constructor(CFArrayCreate(nil, GetValuesAsCArray(theList), UBound(theList) + 1, DefaultCallbacks), hasOwnership)
		  #else
		    #pragma unused theList
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Attributes( deprecated )  Sub Constructor(strings() as String)
		  #if TargetMacOS
		    dim cfstr() as CFString
		    for each str as String in strings
		      cfstr.Append str
		    next
		    self.Constructor(cfstr)
		    
		  #else
		    #pragma unused strings
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromObjectsArray(theArray as variant) As CFArray
		  
		  #if TargetMacOS
		    dim cfma as new CFMutableArray
		    
		    select case theArray.ArrayElementType
		    case Variant.TypeBoolean
		      dim arb() as Boolean = theArray
		      for each b as Boolean in arb
		        if b then
		          cfma.Append   CFBoolean.GetTrue
		        else
		          cfma.Append   CFBoolean.GetFalse
		        end if
		      next
		      
		    case Variant.TypeInteger
		      dim ari() as Integer = theArray
		      for each i as integer in ari
		        cfma.Append   new CFNumber( i )
		      next
		      
		    case Variant.TypeString
		      dim ars() as string = theArray
		      for each s as String in ars
		        cfma.Append   new CFString( s )
		      next
		      
		    case Variant.TypeDouble, Variant.TypeSingle
		      dim ard() as double = theArray
		      for each d as double in ard
		        cfma.Append   new CFNumber( d )
		      next
		      
		    case Variant.TypeDate
		      dim ardate() as Date = theArray
		      for each dd as date in ardate
		        cfma.Append   new CFDate( dd )
		      next
		      
		    case 9
		      dim arv() as variant = theArray
		      for each v as variant in arv
		        'cfma.Append   CFArray.CreateFromObjectsArray( v )
		        cfma.Append   CFTypeFromVariant( v ) // Modified by Kem Tekinay. The line above was just wrong
		      next
		    end select
		    
		    return  cfma
		    
		  #else
		    #pragma unused theArray
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListFile(file as FolderItem) As CFArray
		  #if TargetMacOS
		    return MakeFromPList(CFType.CreateFromPListFile(file, CoreFoundation.kCFPropertyListImmutable))
		  #else
		    #pragma unused file
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromPListString(plistString as String) As CFArray
		  #if TargetMacOS
		    return MakeFromPList(CFType.CreateFromPListString(plistString, CoreFoundation.kCFPropertyListImmutable))
		  #else
		    #pragma unused plistString
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function DefaultCallbacks() As Ptr
		  const kCFTypeArrayCallBacks = "kCFTypeArrayCallBacks"
		  return CFBundle.NewCFBundleFromID(CoreFoundation.BundleID).DataPointerNotRetained(kCFTypeArrayCallBacks)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetValuesAsCArray(theList() as CFType) As MemoryBlock
		  #if targetMacOS
		    dim theValues as new MemoryBlock(CFTypeRef.Size * (1 + UBound(theList)))
		    dim offset as Integer = 0
		    for index as Integer = 0 to UBound(theList)
		      theValues.Ptr(offset) = theList(index).Handle.value
		      offset = offset + CFTypeRef.Size
		    next
		    return theValues
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MakeFromPList(plist as CFPropertyList) As CFArray
		  if plist isA CFArray then
		    return CFArray(plist)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Variant()
		  // Added by Kem Tekinay.
		  
		  return self.VariantValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(index as Integer) As Ptr
		  #if TargetMacOS
		    declare function CFArrayGetCount lib CoreFoundation.framework (theArray as CFTypeRef) as Integer
		    declare function CFArrayGetValueAtIndex lib CoreFoundation.framework (theArray as CFTypeRef, idx as Integer) as Ptr
		    
		    if self <> nil then
		      if index < 0 or index >= CFArrayGetCount(self) then
		        raise new OutOfBoundsException
		      end if
		      
		      return CFArrayGetValueAtIndex(self, index)
		    else
		      return nil
		    end if
		    
		  #else
		    #pragma unused index
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function CFArrayGetCount lib CoreFoundation.framework (theArray as CFTypeRef) as Integer
			    
			    if self <> nil then
			      return CFArrayGetCount(self)
			    else
			      return 0
			    end if
			  #endif
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
		#tag EndViewProperty
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
End Class
#tag EndClass
