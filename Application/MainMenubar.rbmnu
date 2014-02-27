#tag Menu
Begin Menu MainMenubar
   Begin MenuItemFileMenu FileMenu
      SpecialMenu = 0
      Text = "#MenuItemFileMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin CocoaMenuItemClose FileClose
         SpecialMenu = 0
         Text = "#CocoaMenuItemClose.LocalizedText"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 0
         AutoEnable = True
      End
      Begin CocoaMenuItemPageSetup CocoaFilePageSetup
         SpecialMenu = 0
         Text = "#CocoaMenuItemPageSetup.LocalizedText"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+Shift+P"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
      End
      Begin CocoaMenuItemPrint CocoaFilePrint
         SpecialMenu = 0
         Text = "#CocoaMenuItemPrint.LocalizedText"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 1
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
   Begin MenuItemEditMenu EditMenu
      SpecialMenu = 0
      Text = "#MenuItemEditMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin CocoaMenuItemUndo EditUndo
         SpecialMenu = 0
         Text = "#CocoaMenuItemUndo.LocalizedText"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = False
      End
      Begin CocoaMenuItemRedo EditRedo
         SpecialMenu = 0
         Text = "#CocoaMenuItemRedo.LocalizedText"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Shift+Z"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 2
         AutoEnable = True
      End
      Begin CocoaMenuItemCut EditCut
         SpecialMenu = 0
         Text = "#CocoaMenuItemCut.LocalizedText"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = False
      End
      Begin CocoaMenuItemCopy EditCopy
         SpecialMenu = 0
         Text = "#CocoaMenuItemCopy.LocalizedText"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = False
      End
      Begin CocoaMenuItemPaste EditPaste
         SpecialMenu = 0
         Text = "#CocoaMenuItemPaste.LocalizedText"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = False
      End
      Begin CocoaMenuItemPasteAndMatchStyle EditPasteAndMatchStyle
         SpecialMenu = 0
         Text = "#CocoaMenuItemPasteAndMatchStyle.LocalizedText"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+Shift+Option+V"
         MenuModifier = True
         AltMenuModifier = True
         MacOptionKey = True
         AutoEnable = False
      End
      Begin CocoaMenuItemDelete EditClear
         SpecialMenu = 0
         Text = "#CocoaMenuItemDelete.LocalizedText"
         Index = -2147483648
         AutoEnable = True
      End
      Begin CocoaMenuItemComplete EditComplete
         SpecialMenu = 0
         Text = "#CocoaMenuItemComplete.LocalizedText"
         Index = -2147483648
         ShortcutKey = "ESC"
         Shortcut = "Option+ESC"
         MacOptionKey = True
         AutoEnable = False
      End
      Begin CocoaMenuItemSelectAll EditSelectAll
         SpecialMenu = 0
         Text = "#CocoaMenuItemSelectAll.LocalizedText"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 3
         AutoEnable = True
      End
      Begin CocoaMenuItemInsert EditInsert
         SpecialMenu = 0
         Text = "#CocoaMenuItemInsert.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemInsertLineBreak InsertLineBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertLineBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemInsertParagraphBreak InsertParagraphBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertParagraphBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
         Begin CocoaMenuItemInsertPageBreak InsertPageBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertPageBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin CocoaMenuItemEditLink EditEditLink
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditLink.LocalizedText"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 4
         AutoEnable = True
      End
      Begin CocoaMenuItemFindParent EditFind
         SpecialMenu = 0
         Text = "#CocoaMenuItemFindParent.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemFind FindFind
            SpecialMenu = 0
            Text = "#CocoaMenuItemFind.LocalizedText"
            Index = -2147483648
            ShortcutKey = "F"
            Shortcut = "Cmd+F"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFindNext FindFindNext
            SpecialMenu = 0
            Text = "#CocoaMenuItemFindNext.LocalizedText"
            Index = -2147483648
            ShortcutKey = "G"
            Shortcut = "Cmd+G"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFindPrevious FindFindPrevious
            SpecialMenu = 0
            Text = "#CocoaMenuItemFindPrevious.LocalizedText"
            Index = -2147483648
            ShortcutKey = "G"
            Shortcut = "Cmd+Shift+G"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemUseSelectionForFind UntitledItem2
            SpecialMenu = 0
            Text = "#CocoaMenuItemUseSelectionForFind.LocalizedText"
            Index = -2147483648
            ShortcutKey = "E"
            Shortcut = "Cmd+E"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemJumpToSelection UntitledItem3
            SpecialMenu = 0
            Text = "#CocoaMenuItemJumpToSelection.LocalizedText"
            Index = -2147483648
            ShortcutKey = "J"
            Shortcut = "Cmd+J"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemSelectLine UntitledItem4
            SpecialMenu = 0
            Text = "#CocoaMenuItemSelectLine.LocalizedText"
            Index = -2147483648
            ShortcutKey = "L"
            Shortcut = "Cmd+L"
            MenuModifier = True
            AutoEnable = False
         End
      End
      Begin CocoaMenuItemEditSpelling EditSpellingandGrammar
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSpelling.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemShowSpelling SpellingandGrammarShowSpellingandGrammar
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowSpelling.LocalizedText"
            Index = -2147483648
            ShortcutKey = ":"
            Shortcut = "Cmd+:"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemCheckDocumentNow SpellingandGrammarCheckDocumentNow
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckDocumentNow.LocalizedText"
            Index = -2147483648
            ShortcutKey = ";"
            Shortcut = "Cmd+;"
            MenuModifier = True
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 5
            AutoEnable = True
         End
         Begin CocoaMenuItemCheckSpellingWhileTyping SpellingandGrammarCheckSpellingWhileTyping
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckSpellingWhileTyping.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
         Begin CocoaMenuItemCheckGrammarWithSpelling SpellingandGrammarCheckGrammarWithSpelling
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckGrammarWithSpelling.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemCorrectSpelling SpellingandGrammarCorrectSpellingAutomatically
            SpecialMenu = 0
            Text = "#CocoaMenuItemCorrectSpelling.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin CocoaMenuItemEditSubstitutions EditSubstitutions
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSubstitutions.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemShowSubstitutions SubstitutionsShowSubstitutions
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowSubstitutions.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 6
            AutoEnable = True
         End
         Begin CocoaMenuItemSmartCopyPaste SubstitutionsSmartCopyPaste
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartCopyPaste.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemSmartQuotes SubstitutionsSmartQuotes
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartQuotes.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemSmartDashes SubstitutionsSmartDashes
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartDashes.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemSmartLinks SubstitutionsSmartLinks
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartLinks.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemDataDetectors SubstitutionsDataDetectors
            SpecialMenu = 0
            Text = "#CocoaMenuItemDataDetectors.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemTextReplacement SubstitutionsTextReplacement
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextReplacement.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
      End
      Begin CocoaMenuItemEditTransformations EditTransformations
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditTransformations.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemMakeUppercase TransformationsMakeUpperCase
            SpecialMenu = 0
            Text = "#CocoaMenuItemMakeUppercase.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemMakeLowercase TransformationsMakeLowerCase
            SpecialMenu = 0
            Text = "#CocoaMenuItemMakeLowercase.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
         Begin CocoaMenuItemCapitalize TransformationsCapitalize
            SpecialMenu = 0
            Text = "#CocoaMenuItemCapitalize.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin CocoaMenuItemEditSpeech EditSpeech
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSpeech.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemStartSpeaking SpeechStartSpeaking
            SpecialMenu = 0
            Text = "#CocoaMenuItemStartSpeaking.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemStopSpeaking SpeechStopSpeaking
            SpecialMenu = 0
            Text = "#CocoaMenuItemStopSpeaking.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
      End
   End
   Begin MenuItemFormatMenu FormatMenu
      SpecialMenu = 0
      Text = "#MenuItemFormatMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin CocoaMenuItemFormatFont FormatFonts
         SpecialMenu = 0
         Text = "#CocoaMenuItemFormatFont.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Begin CocoaMenuItemShowFonts FontsShowFonts
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowFonts.LocalizedText"
            Index = -2147483648
            ShortcutKey = "T"
            Shortcut = "Cmd+T"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFormatBold FontsBold
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatBold.LocalizedText"
            Index = -2147483648
            ShortcutKey = "B"
            Shortcut = "Cmd+B"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFormatItalic FontsItalic
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatItalic.LocalizedText"
            Index = -2147483648
            ShortcutKey = "I"
            Shortcut = "Cmd+I"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFormatUnderline FontsUnderline
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatUnderline.LocalizedText"
            Index = -2147483648
            ShortcutKey = "U"
            Shortcut = "Cmd+U"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemFormatOutline FontsOutline
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatOutline.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin CocoaMenuItemFontStyles FontsStyles
            SpecialMenu = 0
            Text = "#CocoaMenuItemFontStyles.LocalizedText"
            Index = -2147483648
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 9
            AutoEnable = True
         End
         Begin CocoaMenuItemBigger FontsBigger
            SpecialMenu = 0
            Text = "#CocoaMenuItemBigger.LocalizedText"
            Index = -2147483648
            ShortcutKey = "+"
            Shortcut = "Cmd++"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemSmaller FontsSmaller
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmaller.LocalizedText"
            Index = -2147483648
            ShortcutKey = "-"
            Shortcut = "Cmd+-"
            MenuModifier = True
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 10
            AutoEnable = True
         End
         Begin CocoaMenuItemFormatFontKern UntitledItem
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatFontKern.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            SubMenu = True
            Begin CocoaMenuItemKernDefault KernUseDefault
               SpecialMenu = 0
               Text = "#CocoaMenuItemKernDefault.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemKernNone KernUseNone
               SpecialMenu = 0
               Text = "#CocoaMenuItemKernNone.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemKernTighten KernTighten
               SpecialMenu = 0
               Text = "#CocoaMenuItemKernTighten.LocalizedText"
               Index = -2147483648
               ShortcutKey = "["
               Shortcut = "Cmd+Option+["
               MenuModifier = True
               MacOptionKey = True
               AutoEnable = True
            End
            Begin CocoaMenuItemKernLoosen KernLoosen
               SpecialMenu = 0
               Text = "#CocoaMenuItemKernLoosen.LocalizedText"
               Index = -2147483648
               ShortcutKey = "]"
               Shortcut = "Cmd+Option+]"
               MenuModifier = True
               MacOptionKey = True
               AutoEnable = True
            End
         End
         Begin CocoaMenuItemLigature FontsLigature
            SpecialMenu = 0
            Text = "#CocoaMenuItemLigature.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            SubMenu = True
            Begin CocoaMenuItemLigatureDefault LigatureUseDefault
               SpecialMenu = 0
               Text = "#CocoaMenuItemLigatureDefault.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemLigatureNone LigatureUseNone
               SpecialMenu = 0
               Text = "#CocoaMenuItemLigatureNone.LocalizedText"
               Index = -2147483648
               AutoEnable = True
            End
            Begin CocoaMenuItemLIgatureAll LigatureUseAll
               SpecialMenu = 0
               Text = "#CocoaMenuItemLIgatureAll.LocalizedText"
               Index = -2147483648
               AutoEnable = True
            End
         End
         Begin CocoaMenuItemFormatFontBaseline FontsBaseline
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatFontBaseline.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            SubMenu = True
            Begin CocoaMenuItemBaselineDefault BaselineUseDefault
               SpecialMenu = 0
               Text = "#CocoaMenuItemBaselineDefault.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemBaselineSuperscript BaselineSuperscript
               SpecialMenu = 0
               Text = "#CocoaMenuItemBaselineSuperscript.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemBaselineSubscript BaselineSubscript
               SpecialMenu = 0
               Text = "#CocoaMenuItemBaselineSubscript.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemBaselineRaise BaselineRaise
               SpecialMenu = 0
               Text = "#CocoaMenuItemBaselineRaise.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemBaselineLower BaselineLower
               SpecialMenu = 0
               Text = "#CocoaMenuItemBaselineLower.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
         End
         Begin CocoaMenuItemFormatFontCharacterShape FontsCharacterShape
            SpecialMenu = 0
            Text = "#CocoaMenuItemFormatFontCharacterShape.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            SubMenu = True
            Begin CocoaMenuItemCharShapeTraditional CharacterShapeTraditionalForm
               SpecialMenu = 0
               Text = "#CocoaMenuItemCharShapeTraditional.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 11
            AutoEnable = True
         End
         Begin CocoaMenuItemShowColors FontsShowColors
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowColors.LocalizedText"
            Index = -2147483648
            ShortcutKey = "C"
            Shortcut = "Cmd+Shift+C"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 12
            AutoEnable = True
         End
         Begin CocoaMenuItemCopyStyle FontsCopyStyle
            SpecialMenu = 0
            Text = "#CocoaMenuItemCopyStyle.LocalizedText"
            Index = -2147483648
            ShortcutKey = "C"
            Shortcut = "Cmd+Option+C"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = False
         End
         Begin CocoaMenuItemPasteStyle FontsPasteStyle
            SpecialMenu = 0
            Text = "#CocoaMenuItemPasteStyle.LocalizedText"
            Index = -2147483648
            ShortcutKey = "V"
            Shortcut = "Cmd+Option+V"
            MenuModifier = True
            MacOptionKey = True
            AutoEnable = False
         End
      End
      Begin MenuItem FormatText
         SpecialMenu = 0
         Text = "#CocoaMenuItemFormatText.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin CocoaMenuItemTextAlignLeft TextAlignLeft
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextAlignLeft.LocalizedText"
            Index = -2147483648
            ShortcutKey = "{"
            Shortcut = "Cmd+{"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemTextCenter TextAlignCenter
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextCenter.LocalizedText"
            Index = -2147483648
            ShortcutKey = "|"
            Shortcut = "Cmd+|"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemTextJustify TextJustify
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextJustify.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
         Begin CocoaMenuItemTextAlignRight TextAlignRight
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextAlignRight.LocalizedText"
            Index = -2147483648
            ShortcutKey = "}"
            Shortcut = "Cmd+}"
            MenuModifier = True
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 13
            AutoEnable = True
         End
         Begin CocoaMenuItemWritingDirection TextWritingDirection
            SpecialMenu = 0
            Text = "#CocoaMenuItemWritingDirection.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
            Begin CocoaMenuItemWritingDirectionBase WritingDirectionParagraph
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionBase.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionBaseNatural WritingDirectionParagraphDefault
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionBaseNatural.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionBaseLeftToRight WritingDirectionParagraphLefttoRight
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionBaseLeftToRight.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionBaseRightToLeft WritingDirectionParagraphRighttoLeft
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionBaseRightToLeft.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionText WritingDirectionSelection
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionText.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionTextNatural WritingDirectionSelectionDefault
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionTextNatural.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
            Begin CocoaMenuItemWritingDirectionTextLeftToRight WritingDirectionSelectionLeftToRight
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionTextLeftToRight.LocalizedText"
               Index = -2147483648
               AutoEnable = True
            End
            Begin CocoaMenuItemWritingDirectionTextRightToLeft WritingDirectionSelectionRightToLeft
               SpecialMenu = 0
               Text = "#CocoaMenuItemWritingDirectionTextRightToLeft.LocalizedText"
               Index = -2147483648
               AutoEnable = False
            End
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 14
            AutoEnable = True
         End
         Begin CocoaMenuItemShowRuler TextShowRuler
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowRuler.LocalizedTextShow"
            Index = -2147483648
            ShortcutKey = "R"
            Shortcut = "Cmd+R"
            MenuModifier = True
            AutoEnable = False
         End
         Begin CocoaMenuItemCopyRuler TextCopyRuler
            SpecialMenu = 0
            Text = "#CocoaMenuItemCopyRuler.LocalizedText"
            Index = -2147483648
            ShortcutKey = "C"
            Shortcut = "Cmd+Control+C"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = False
         End
         Begin CocoaMenuItemPasteRuler TextPasteRuler
            SpecialMenu = 0
            Text = "#CocoaMenuItemPasteRuler.LocalizedText"
            Index = -2147483648
            ShortcutKey = "V"
            Shortcut = "Cmd+Control+V"
            MenuModifier = True
            MacControlKey = True
            AutoEnable = False
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 15
            AutoEnable = True
         End
         Begin CocoaMenuItemSpacing TextSpacing
            SpecialMenu = 0
            Text = "#CocoaMenuItemSpacing.LocalizedText"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 7
         AutoEnable = True
      End
      Begin MenuItem FormatMakePlainText
         SpecialMenu = 0
         Text = "Make Plain Text"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+Shift+T"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem FormatPreventEditing
         SpecialMenu = 0
         Text = "Prevent Editing"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem FormatWrapToPage
         SpecialMenu = 0
         Text = "Wrap To Page"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+Shift+W"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem FormatAllowHyphenation
         SpecialMenu = 0
         Text = "Allow Hyphenation"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 8
         AutoEnable = True
      End
      Begin CocoaMenuItemList FormatList
         SpecialMenu = 0
         Text = "#CocoaMenuItemList.LocalizedText"
         Index = -2147483648
         AutoEnable = False
      End
      Begin CocoaMenuItemTable FormatTable
         SpecialMenu = 0
         Text = "#CocoaMenuItemTable.LocalizedText"
         Index = -2147483648
         AutoEnable = False
      End
   End
   Begin MenuItemViewMenu ViewMenu
      SpecialMenu = 0
      Text = "#MenuItemViewMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin CocoaMenuItemShowToolbar ViewToggleToolbar
         SpecialMenu = 0
         Text = "#CocoaMenuItemShowToolbar.LocalizedTextShow"
         Index = -2147483648
         AutoEnable = False
      End
      Begin CocoaMenuItemCustomizeToolbar ViewCustomizeToolbar
         SpecialMenu = 0
         Text = "#CocoaMenuItemCustomizeToolbar.LocalizedText"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 16
         AutoEnable = True
      End
      Begin CocoaMenuItemToggleFullscreen ViewToggleFullscreen
         SpecialMenu = 0
         Text = "#CocoaMenuItemToggleFullscreen.LocalizedTextEnterFullscreen"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+Control+F"
         MenuModifier = True
         MacControlKey = True
         AutoEnable = True
      End
   End
   Begin MenuItemExamplesMenu ExamplesMenu
      SpecialMenu = 0
      Text = "#MenuItemExamplesMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ConvenienceMethodsMenu
         SpecialMenu = 0
         Text = "Convenience Extensions"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem StringExtensionMenu
            SpecialMenu = 0
            Text = "String Extensions"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem UnicodeExtensionsMenu
            SpecialMenu = 0
            Text = "Unicode Extensions for strings"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem SystemIconsMenuItem
            SpecialMenu = 0
            Text = "System Icons Extensions"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem SystemExtensionsMenu
            SpecialMenu = 0
            Text = "System Extensions"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem ApplicationExtensionsMenu
            SpecialMenu = 0
            Text = "Application Extensions"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem BonjourExampleMenu
            SpecialMenu = 0
            Text = "Bonjour Services"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem DebugReportMenu
            SpecialMenu = 0
            Text = "Debug Reports"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem FSEventStreamMenu
            SpecialMenu = 0
            Text = "FSEvent stream"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem SpeechMenu
            SpecialMenu = 0
            Text = "Speech"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem LabelExtensionMenu
            SpecialMenu = 0
            Text = "Label Extensions"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 17
         AutoEnable = True
      End
      Begin MenuItem ExamplesCocoa
         SpecialMenu = 0
         Text = "Cocoa"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
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
         Begin MenuItem CocoaNSSearchField
            SpecialMenu = 0
            Text = "NSSearchField"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSTableView
            SpecialMenu = 0
            Text = "NSTableView"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem NSTokenFieldMenuItem
            SpecialMenu = 0
            Text = "NSTokenField"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSToolbar
            SpecialMenu = 0
            Text = "NSToolbar"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem NSSlidersExampleMenu
            SpecialMenu = 0
            Text = "NSSliders"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem NSImageViewMenu
            SpecialMenu = 0
            Text = "NSImageView (incl. ImageWell)"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaTextArea
            SpecialMenu = 0
            Text = "Text Area"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 18
            AutoEnable = True
         End
         Begin MenuItem CocoaNSAlert
            SpecialMenu = 0
            Text = "NSAlert"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSDockTile
            SpecialMenu = 0
            Text = "NSDockTile"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSPopover
            SpecialMenu = 0
            Text = "NSPopover"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSSharingServicePicker
            SpecialMenu = 0
            Text = "NSSharingServicePicker"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSStatusItem
            SpecialMenu = 0
            Text = "NSStatusItem"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSUserNotifications
            SpecialMenu = 0
            Text = "NSUserNotifications"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSWindow
            SpecialMenu = 0
            Text = "NSWindow"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 21
            AutoEnable = True
         End
         Begin MenuItem CocoaApplicationIcon
            SpecialMenu = 0
            Text = "Application Icon"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSByteCountFormatter
            SpecialMenu = 0
            Text = "NSByteCountFormatter"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSColorBrowser
            SpecialMenu = 0
            Text = "NSColor Browser"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSHost
            SpecialMenu = 0
            Text = "NSHost"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSPasteboard
            SpecialMenu = 0
            Text = "NSPasteboard"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSPrinter
            SpecialMenu = 0
            Text = "NSPrinter"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSRunningApplication
            SpecialMenu = 0
            Text = "NSRunningApplication"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSTask
            SpecialMenu = 0
            Text = "NSTask"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSTimeZone
            SpecialMenu = 0
            Text = "NSTimeZone"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaNSWorkspaceNotifications
            SpecialMenu = 0
            Text = "NSWorkspace notifications"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem CocoaSystemImages
            SpecialMenu = 0
            Text = "System Images"
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
         Begin MenuItem ControlsHISearchField
            SpecialMenu = 0
            Text = "HISearchField"
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
         Begin MenuItem CoreFoundationStringTokenizer
            SpecialMenu = 0
            Text = "String Tokenizer"
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
      Begin MenuItem MenuItemExamplesMenuLocalizedTextCoreText
         SpecialMenu = 0
         Text = "Core Text"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem CoreTextOpenExampleWindow
            SpecialMenu = 0
            Text = "Open Example Window"
            Index = -2147483648
            AutoEnable = True
         End
      End
      Begin MenuItem IKICExampleMenu
         SpecialMenu = 0
         Text = "ImageKit && ImageCapture…"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem ImageKitMenu
            SpecialMenu = 0
            Text = "ImageKit example"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem ImageCaptureMenu
            SpecialMenu = 0
            Text = "ImageCapture example"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem IKImageBrowserMenu
            SpecialMenu = 0
            Text = "IKImageBrowser example"
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
      Begin MenuItem ExamplesQTKit
         SpecialMenu = 0
         Text = "QTKit"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem QTKitQTCaptureView
            SpecialMenu = 0
            Text = "QTCaptureView"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem QTKitQTMovieView
            SpecialMenu = 0
            Text = "QTMovieView"
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
      Begin MenuItem ExamplesCarbonPasteboard
         SpecialMenu = 0
         Text = "Carbon Pasteboard"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem MenuItemExamplesMenuLocalizedTextDragManager
         SpecialMenu = 0
         Text = "Carbon Drag Manager"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem MenuItemExamplesMenuLocalizedTextThemeColors
         SpecialMenu = 0
         Text = "Theme Colors"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ExamplesCorePrinting
         SpecialMenu = 0
         Text = "Core Printing"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItemWindowMenu WindowMenu
      SpecialMenu = 0
      Text = "#MenuItemWindowMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItemMinimize WindowMinimize
         SpecialMenu = 0
         Text = "#MenuItemMinimize.LocalizedText"
         Index = -2147483648
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItemZoom AppWindowMenuTitleZoom
         SpecialMenu = 0
         Text = "#MenuItemZoom.LocalizedText"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 19
         AutoEnable = True
      End
      Begin MenuItemBringAllToFront AppWindowMenuTitleBringAllToFront
         SpecialMenu = 0
         Text = "#MenuItemBringAllToFront.LocalizedText"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 20
         AutoEnable = True
      End
   End
   Begin MenuItemHelpMenu HelpMenu
      SpecialMenu = 0
      Text = "#MenuItemHelpMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem WelcomeWindowMenu
         SpecialMenu = 0
         Text = "Welcome Window"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
