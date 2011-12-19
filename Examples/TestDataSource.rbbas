#tag Class
Protected Class TestDataSource
Inherits NSTableViewDataSource
	#tag Event
		Function DisallowTableEdit(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn) As Boolean
		  return rowIndex = 0
		  
		  #pragma unused tableView
		  #pragma unused column
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GetValue(row as Integer, columnID as String) As String
		  return self.RowValues(row)
		  
		  #pragma unused columnID
		  
		End Function
	#tag EndEvent

	#tag Event
		Function RowCount() As Integer
		  return 1 + UBound(self.RowValues)
		End Function
	#tag EndEvent

	#tag Event
		Sub SetValue(tableView as NSTableView, rowIndex as Integer, column as NSTableColumn, value as String)
		  RowValues(rowIndex) = value
		  
		  #pragma unused tableView
		  #pragma unused column
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		RowValues() As String
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
End Class
#tag EndClass
