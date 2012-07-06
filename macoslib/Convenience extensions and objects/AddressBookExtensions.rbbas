#tag Module
Protected Module AddressBookExtensions
	#tag Method, Flags = &h0
		Function CocoaObject(extends abr as AddressBookRecord, createIfNecessary as boolean = true) As ABRecord
		  //# Return the Cocoa object corresponding to the AddressBookRecord
		  
		  //@ It can return a ABPerson, ABGroup or ABRecord
		  
		  dim abo as ABRecord = abr.AttachedPropertyLookup( "ABObject", nil )
		  
		  if abo=nil OR (abo.UID <> abr.UniqueID) then //The cached object is nil or outdated
		    abo = abr.FindABObject
		  end if
		  
		  return  abo
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindABObject(extends abr as AddressBookRecord) As ABRecord
		  //Find the corresponding ABRecord for the RS AddressBookRecord
		  
		  init
		  
		  dim ABRec as ABRecord = ABook.recordForUniqueId( abr.UniqueID )
		  abr.AttachedProperty( "ABObject" ) = ABRec
		  
		  return  ABRec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init()
		  
		  if inited then return
		  
		  ABook = new ABAddressBook
		  
		  inited = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForProperty(extends abr as AddressBookRecord, propertyName as String) As variant
		  //# Get a property value given its code name, including those which are not accessible from an AddressBookRecord
		  
		  dim abo as ABRecord = abr.CocoaObject( true )
		  
		  if abo=nil then  return  nil
		  
		  dim v as variant
		  
		  v = abo.ValueForProperty( propertyName )
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ABook As ABAddressBook
	#tag EndProperty

	#tag Property, Flags = &h21
		Private inited As boolean
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
