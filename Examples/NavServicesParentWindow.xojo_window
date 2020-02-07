#tag Window
Begin Window NavServicesParentWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "NavigationServices"
   Visible         =   True
   Width           =   300
   Begin PushButton ShowButton
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Show"
      ControlOrder    =   "0"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   200
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   262
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu DialogTypePopup
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      ControlOrder    =   "1"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   107
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      SelectedRowIndex=   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   105
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   173
   End
   Begin Label StaticText1
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   2
      Bold            =   False
      ControlOrder    =   "2"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Dialog Type"
      TextAlign       =   0
      TextAlignment   =   "1"
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   105
      Transparent     =   False
      Underline       =   False
      Value           =   "Dialog Type"
      Visible         =   True
      Width           =   82
   End
   Begin CheckBox ShowAsSheetCheckBox
      AllowAutoDeactivate=   "True"
      AutoDeactivate  =   True
      BehaviorIndex   =   3
      Bold            =   False
      Caption         =   "ShowAsSheet"
      ControlOrder    =   "3"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   "0.0"
      FontUnit        =   "0"
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   107
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   153
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   "0"
      Width           =   167
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			self.Close
			return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub HandleCancel()
		  MsgBox "User cancelled."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChoose(items() as FolderItem)
		  dim paths() as String
		  for i as Integer = 0 to UBound(items)
		    paths.Append items(i).POSIXPath
		  next
		  
		  if UBound(paths) > -1 then
		    Msgbox Join(paths, EndOfLine)
		  else
		    MsgBox "No items chosen."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleDiscardChanges()
		  Msgbox "Changes Discarded."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDiscardDocuments()
		  Msgbox "Discard Documents"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDontSaveChanges()
		  Msgbox "Don't Save Changes"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleNewFolder(item as FolderItem)
		  Msgbox "New folder created at " + item.POSIXPath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleOpen(items() as FolderItem)
		  dim paths() as String
		  for i as Integer = 0 to UBound(items)
		    paths.Append items(i).POSIXPath
		  next
		  
		  if UBound(paths) > -1 then
		    Msgbox Join(paths, EndOfLine)
		  else
		    MsgBox "No items opened."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleReviewDocuments()
		  MsgBox "Review Documents"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSaveAs(saveDirectory as FolderItem, fileName as String)
		  Msgbox "Save file '" + fileName + "' in directory " + saveDirectory.POSIXPath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSaveChanges()
		  Msgbox "Save Changes"
		End Sub
	#tag EndMethod


	#tag Constant, Name = AskDiscardChangesItem, Type = String, Dynamic = False, Default = \"Ask Discard Changes", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AskReviewDocumentsItem, Type = String, Dynamic = False, Default = \"Ask Review Documents", Scope = Private
	#tag EndConstant

	#tag Constant, Name = AskSaveChangesItem, Type = String, Dynamic = False, Default = \"Ask Save Changes", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ChooseFolderItem, Type = String, Dynamic = False, Default = \"Choose Folder", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ChooseObjectItem, Type = String, Dynamic = False, Default = \"Choose Object", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ChooseVolumeItem, Type = String, Dynamic = False, Default = \"Choose Volume", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreateNewFolderItem, Type = String, Dynamic = False, Default = \"Create New Folder", Scope = Private
	#tag EndConstant

	#tag Constant, Name = GetFileItem, Type = String, Dynamic = False, Default = \"Get File", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PutFileItem, Type = String, Dynamic = False, Default = \"Put File", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events ShowButton
	#tag Event
		Sub Action()
		  if DialogTypePopup.ListIndex = -1 then
		    return
		  end if
		  
		  dim popupText as String = DialogTypePopup.List(DialogTypePopup.ListIndex)
		  select case popupText
		  case ChooseFolderItem
		    dim dlg as new ChooseFolderDialog
		    dlg.ChooseHandler = AddressOf self.HandleChoose
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		    
		  case ChooseObjectItem
		    dim dlg as new ChooseObjectDialog
		    dlg.ChooseHandler = AddressOf self.HandleChoose
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		  case ChooseVolumeItem
		    dim dlg as new ChooseVolumeDialog
		    dlg.ChooseHandler = AddressOf self.HandleChoose
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		  case CreateNewFolderItem
		    dim dlg as new CreateNewFolderDialog
		    dlg.SaveFileName = "Foo"
		    dlg.NewFolderHandler = AddressOf self.HandleNewFolder
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		  case GetFileItem
		    dim dlg as new GetFileDialog
		    if ShowAsSheetCheckBox.Value then
		      dlg.OpenHandler = AddressOf self.HandleOpen
		      dlg.CancelHandler = AddressOf self.HandleCancel
		      dlg.Show self
		    else
		      dlg.Show
		      HandleOpen dlg.Selection
		    end if
		    
		  case AskDiscardChangesItem
		    dim dlg as new AskDiscardChangesDialog("Foo") //failure to provide a nontrivial name is an error.
		    dlg.DiscardChangesHandler = AddressOf self.HandleDiscardChanges
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		  case AskReviewDocumentsItem
		    dim dlg as new AskReviewDocumentsDialog(6)
		    dlg.ReviewDocumentsHandler = AddressOf self.HandleReviewDocuments
		    dlg.DiscardDocumentsHandler = AddressOf self.HandleDiscardDocuments
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		      
		    end if
		    
		  case AskSaveChangesItem
		    dim dlg as new AskSaveChangesDialog
		    dlg.SaveChangesHandler = AddressOf self.HandleSaveChanges
		    dlg.DontSaveChangesHandler = AddressOf self.HandleDontSaveChanges
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		    
		  case PutFileItem
		    dim dlg as new PutFileDialog("R*ch", "TEXT")
		    dlg.SaveAsHandler = AddressOf self.HandleSaveAs
		    dlg.NewFolderHandler = AddressOf self.HandleNewFolder
		    dlg.CancelHandler = AddressOf self.HandleCancel
		    if ShowAsSheetCheckBox.Value then
		      dlg.Show self
		    else
		      dlg.Show
		    end if
		    
		  else
		    //
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DialogTypePopup
	#tag Event
		Sub Open()
		  me.AddRow ChooseFolderItem
		  me.AddRow ChooseObjectItem
		  me.AddRow ChooseVolumeItem
		  me.AddRow CreateNewFolderItem
		  me.AddRow GetFileItem
		  
		  me.AddSeparator
		  
		  me.AddRow AskDiscardChangesItem
		  me.AddRow AskReviewDocumentsItem
		  me.AddRow AskSaveChangesItem
		  me.AddRow PutFileItem
		End Sub
	#tag EndEvent
#tag EndEvents
