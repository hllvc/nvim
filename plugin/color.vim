let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_colors_override = {'bg0': ['#1C1C1C', '234'], 'bg2': ['#32302F', '235']}
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_better_performance = 1

set t_Co=256
set bg=dark
set termguicolors

colorscheme gruvbox-material
let g:airline_theme='gruvbox_material'

set nocompatible
filetype plugin indent on
syntax enable

set cursorline
hi CursorLineNr guifg=#d3a356

" make comments and HTML attributes italic
highlight Comment cterm=italic term=italic gui=italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic
" highlight Type cterm=italic term=italic gui=italic
