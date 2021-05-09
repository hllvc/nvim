let g:clang_format#style_options = {
						\ "IndentCaseLabels" : "false",
						\ "IndentCaseBlocks" : "true" }

autocmd FileType c,cpp,objc ClangFormatAutoEnable
