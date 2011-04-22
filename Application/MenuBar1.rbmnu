#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
      Begin AppleMenuItem FileAbout
         SpecialMenu = 0
         Text = "About"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
   End
   Begin MenuItem ExamplesMenu
      SpecialMenu = 0
      Text = "Examples"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ExamplesCocoa
         SpecialMenu = 0
         Text = "Cocoa"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem CocoaNSColorBrowser
            SpecialMenu = 0
            Text = "NSColor Browser"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSDatePicker
            SpecialMenu = 0
            Text = "NSDatePicker"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSLevelIndicator
            SpecialMenu = 0
            Text = "NSLevelIndicator"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSPathControl
            SpecialMenu = 0
            Text = "NSPathControl"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesControls
         SpecialMenu = 0
         Text = "Controls"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem ControlsMacDatePicker
            SpecialMenu = 0
            Text = "MacDatePicker"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesCoreFoundation
         SpecialMenu = 0
         Text = "Core Foundation"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem CoreFoundationShowVersion
            SpecialMenu = 0
            Text = "Show Version"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesCoreGraphics
         SpecialMenu = 0
         Text = "Core Graphics"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem CoreGraphicsAxialShadingExample
            SpecialMenu = 0
            Text = "Axial Shading Example"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CoreGraphicsRadialShadingExample
            SpecialMenu = 0
            Text = "Radial Shading Example"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CoreGraphicsPDFBrowser
            SpecialMenu = 0
            Text = "PDF Browser"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CoreGraphicsImageTransform
            SpecialMenu = 0
            Text = "Image Transform"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesFolderManager
         SpecialMenu = 0
         Text = "Folder Manager"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem FolderManagerShowFolders
            SpecialMenu = 0
            Text = "Show Folders"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesIconServices
         SpecialMenu = 0
         Text = "Icon Services"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem IconServicesShowIconBrowser
            SpecialMenu = 0
            Text = "Show Icon Browser"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesIOKit
         SpecialMenu = 0
         Text = "IOKit"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem IOKitPrimaryMACAddress
            SpecialMenu = 0
            Text = "Primary MAC Address"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem IOKitExternalPowerAdapter
            SpecialMenu = 0
            Text = "External Power Adapter"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesNavigationServices
         SpecialMenu = 0
         Text = "Navigation Services"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem NavigationServicesOpenExampleWindow
            SpecialMenu = 0
            Text = "Open Example Window"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesWindowManager
         SpecialMenu = 0
         Text = "Window Manager"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem WindowManagerAlpha
            SpecialMenu = 0
            Text = "Alpha"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem WindowManagerProxyIcons
            SpecialMenu = 0
            Text = "Proxy Icons"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem ExamplesLanguages
         SpecialMenu = 0
         Text = "Languages"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ExamplesSockets
         SpecialMenu = 0
         Text = "Sockets"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin WindowMenu WindowMenu
      SpecialMenu = 0
      Text = "Window"
      Index = -2147483648
      AutoEnable = True
      Begin WindowMenuItemMinimize WindowMinimize
         SpecialMenu = 0
         Text = "Minimize"
         Index = -2147483648
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnable = False
      End
      Begin WindowMenuItemZoom AppWindowMenuTitleZoom
         SpecialMenu = 0
         Text = "Zoom"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin WindowMenuItemBringAllToFront AppWindowMenuTitleBringAllToFront
         SpecialMenu = 0
         Text = "Bring All To Front"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
