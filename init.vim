call plug#begin("~/.vim/plugged")

" NERDTree plugins
Plug 'preservim/nerdtree'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-fugitive'


Plug 'vim-syntastic/syntastic'
Plug 'matze/vim-move'

" Javascript/Typescript/JSX
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'turbio/bracey.vim'
Plug 'ap/vim-css-color'

" scss & css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" indent line
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Yggdroot/indentLine'

" latex
" Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'

" vue.js
Plug 'posva/vim-vue'
Plug 'leafoftree/vim-vue-plugin'



call plug#end()

"Config Section

" nerdTree config START

" autocmd StdinReadPre * let s:std_in=1
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeStatusline = ''
map <silent> <C-n> :NERDTreeToggle<CR>

" nerdTree config END

" use alt+hjkl to move between split/vsplit panels

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <C-s> <C-w>s<CR>
nnoremap <C-v> <C-w>v<CR><C-w>l

" fuzzy finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

" Theme
" set t_Co=256
set bg=dark
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_hls_cursor='aqua'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox
let g:airline_theme='gruvbox'
syntax enable
set cursorline
hi CursorLine term=bold gui=bold cterm=bold
hi CursorLineNr term=bold gui=bold cterm=bold ctermbg=NONE

" testing
" set lazyredraw

" other
set conceallevel=2
set concealcursor=v
set number
set nowrap
set autoindent
set smarttab
set enc=utf-8
set incsearch
set showmatch
set nohlsearch
set noswapfile
set relativenumber
set noruler
set ignorecase
set smartcase
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set clipboard+=unnamed
set so=999
set autoread

" Custom functions
function ShowLineNumber()
	if &number == 1
		set nonumber
	else
		set number
	endif
endf

function ToggleRelativeNumbers()
	if &relativenumber == 1
		set norelativenumber
		set number
	else
		set relativenumber
		set nonumber
	endif
endf

nnoremap <silent> <F3> :call ShowLineNumber()<CR>
nnoremap <silent> <F4> :call ToggleRelativeNumbers()<CR>

" settings for coc

set hidden
set nobackup
set nowritebackup
set updatetime=500

" testing
set shortmess+=c
" set cmdheight=2

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

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
" nmap <F2> <Plug>(coc-rename)

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" airline other
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" " ruby workaround
"
" let g:ruby_host_prog = '/home/hllvc/.gem/ruby/2.7.0/bin/neovim-ruby-host'

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

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1

autocmd FocusLost * silent! wa

" additional remaps
inoremap jk <ESC>

" highlight options
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" cpplint
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

" mapping arrow keys
nmap <Left> <<
nmap <Right> >>

vmap <Left> <gv
vmap <Right> >gv

" moving lines
let g:move_key_modifier = 'C'

" new tab
nnoremap <silent><C-t> :tabnew<CR>

" prettier setup
command! -nargs=0 Prettier :cal CocAction{'runCommand', 'prettier.formatFile'}

" bracey config
let g:bracey_server_port=5000

" nerdtree open/close
let g:nerdTreeMapOpenDirNode = 'l'
let g:nerdTreeMapCloseDirNode = 'h'

" indent line
let g:indentLine_char = '▏'
let g:indent_blankline_char = '▏'
let g:indentLine_setConceal = 0

" add $$ in tex
autocmd FileType tex let b:coc_pairs = [["$", "$"]]

" latex
let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0

" vue.js
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
