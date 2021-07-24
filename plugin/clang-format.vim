let g:clang_format#style_options = {
						\ "IndentWidth" : 2,
						\ "DerivePointerAlignment" : "false",
						\ "PointerAlignment" : "Left",
						\ "AlignEscapedNewlines" : "Left",
						\ "AllowAllArgumentsOnNextLine" : "false",
						\ "AllowAllParametersOfDeclarationOnNextLine": "false",
						\ "AllowShortIfStatementsOnASingleLine" : "true",
						\ "AlwaysBreakTemplateDeclarations" : "true",
						\ "IndentCaseLabels" : "false",
						\ "IndentCaseBlocks" : "true" }

" autocmd FileType c,cpp,objc ClangFormatAutoEnable
