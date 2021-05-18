let g:clang_format#style_options = {
						\ "AllowShortIfStatementsOnASingleLine" : "true",
						\ "AlwaysBreakTemplateDeclarations" : "true",
						\ "IndentCaseLabels" : "false",
						\ "IndentCaseBlocks" : "true" }

autocmd FileType c,cpp,objc ClangFormatAutoEnable
