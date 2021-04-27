call plug#begin("~/.vim/plugged")

" General {{{
set relativenumber
set enc=utf-8
set noswapfile
" set noruler
" set formatoptions=tcqrn1

set autoread
set history=1000

set backspace=indent,eol,start
set clipboard=unnamed

set go=a
set mouse=a

" searching
set ignorecase
set smartcase
set nohlsearch
set incsearch
set lazyredraw

" error bells
set noerrorbells
set visualbell
"}}}

" appearance {{{

set number
set nowrap
" set wrapmargin=8
set linebreak
set showbreak=↪
set autoindent
set ttyfast
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2
" set so=7
set so=999
set hidden
set noshowmode
set wildmenu
set wildmode=longest,list,full
set shell=$SHELL
set cmdheight=1
set title
set showmatch
set updatetime=500
set nobackup
set nowritebackup
set signcolumn=yes
set shortmess+=c

" Tab control
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" code folding
set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=10
set foldlevel=1

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" General mappings {{{
let mapleader=','
inoremap jk <esc>
nmap <leader>, :w<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" new tab
nnoremap <silent><leader>t :tabnew<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" use Shift+alt+hjkl to move windows between split/vsplit panels
nnoremap <leader><A-h> <C-\><C-n><C-w><S-h>
nnoremap <leader><A-j> <C-\><C-n><C-w><S-j>
nnoremap <leader><A-k> <C-\><C-n><C-w><S-k>
nnoremap <leader><A-l> <C-\><C-n><C-w><S-l>
nnoremap <leader><A-h> <C-\><C-n><C-w><S-h>
nnoremap <leader><A-j> <C-\><C-n><C-w><S-j>
nnoremap <leader><A-k> <C-\><C-n><C-w><S-k>
nnoremap <leader><A-l> <C-\><C-n><C-w><S-l>

" use Ctrl+v for vertical split
nnoremap <leader>s <C-w>s<CR>

" use Ctrl+s for split
nnoremap <leader>v <C-w>v<CR><C-w>l

" keep visual selection while indenting
vmap < <gv
vmap > >gv

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

" save all files on focus lost, ignoring warnings about untitled buffers
autocmd FocusLost * silent! wa

" toggle relativenumber
function ToggleRelativeNumbers()
if &relativenumber == 1
set norelativenumber
else
set relativenumber
endif
endf

nnoremap <silent> <F3> :call ToggleRelativeNumbers()<CR>

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
if win_gotoid(g:term_win)
hide
else
botright new
exec "resize " . a:height
try
exec "buffer " . g:term_buf
catch
call termopen($SHELL, {"detach": 1})
let g:term_buf = bufnr("")
set nonumber
set norelativenumber
set signcolumn=no
endtry
startinsert!
let g:term_win = win_getid()
endif
endfunction

let g:term_height = 20

" Toggle terminal on/off (neovim)
nnoremap <silent><A-t> :call TermToggle(g:term_height)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(g:term_height)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(g:term_height)<CR>

" }}}

" }}}

" Startify: Fancy startup screen for vim {{{
Plug 'mhinz/vim-startify'

" Don't change to directory when selecting a file
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\   { 'uc': [ 'Update CoC Plugins', ':CocUpdate' ] },
\ ]

let g:startify_bookmarks = [
	\ { 'c': '~/.config/nvim/init.vim' },
	\ { 'k': '~/.config/kitty/kitty.conf'},
	\ { 'z': '~/.zshrc' }
\ ]

autocmd User Startified setlocal cursorline
nmap <leader>st :Startify<cr>
" }}}


" Pluginss

Plug 'preservim/tagbar'
nmap <silent><leader><tab> :TagbarToggle<cr>
let g:tagbar_autofocus = 1
let g:tagbar_show_data_type = 1
let g:tagbar_vertical = 10

" cpp highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

" text obj indent
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

" sort motion
Plug 'christoomey/vim-sort-motion'

" context-aware pasting
Plug 'sickill/vim-pasta'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\}

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" cpp/c
Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
						\ "IndentCaseLabels" : "false",
						\ "IndentCaseBlocks" : "true" }

autocmd FileType c,cpp,objc ClangFormatAutoEnable

" " theme

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_section_b = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"
function! s:update_git_status()
	let g:airline_section_b = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"
endfunction
autocmd User CocGitStatusChange call s:update_git_status()

" Plug 'morhetz/gruvbox'
" let g:gruvbox_italic=1
" let g:gruvbox_bold=1
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_hls_cursor='aqua'
" let g:gruvbox_sign_column='bg0'
Plug 'sainnhe/gruvbox-material'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_background = 'hard'

" coc {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
				\ 'coc-yank',
				\ 'coc-snippets',
				\ 'coc-scssmodules',
				\ 'coc-html',
				\ 'coc-vimtex',
				\ 'coc-vimlsp',
				\ 'coc-stylelint',
				\ 'coc-pyright',
				\ 'coc-vetur',
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-eslint',
        \ 'coc-tslint-plugin',
        \ 'coc-pairs',
        \ 'coc-sh',
        \ 'coc-emmet',
        \ 'coc-prettier',
        \ 'coc-explorer',
        \ 'coc-diagnostic'
        \ ]

" coc-explorer
:nnoremap <silent><c-n> :CocCommand explorer --sources=file+<cr>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<C-h>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
call CocActionAsync('doHover')
else
execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
" }}}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
let g:move_key_modifier = 'C'

" commenting
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

" sytax checker
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = ""
let g:syntastic_tex_checkers = ['chktex']

" Javascript/Typescript/JSX/Vue
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'turbio/bracey.vim'
let g:bracey_server_port=5000

" scss & css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" match tags in html, similar to paren support
Plug 'gregsexton/MatchTag', { 'for': 'html' }

" latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0
" add $$ in tex
autocmd FileType tex let b:coc_pairs = [["$", "$"]]

" vue.js
Plug 'posva/vim-vue'
Plug 'leafoftree/vim-vue-plugin'
autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue

let g:LanguageClient_serverCommands = {
\ 'vue': ['vls']
\ }

let g:vim_vue_plugin_config = {
\'syntax': {
\   'template': ['html'],
\   'script': ['javascript', 'typescript'],
\   'style': ['css', 'scss'],
\},
\'full_syntax': [],
\'attribute': 1,
\'keyword': 1,
\'foldexpr': 1,
\'init_indent': 0,
\'debug': 0,
\}

" prettier setup
command! -nargs=0 Prettier :cal CocAction{'runCommand', 'prettier.formatFile'}

Plug 'ryanoasis/vim-devicons'

call plug#end()

" Colorscheme
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
