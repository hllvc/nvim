if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax on
syntax sync minlines=64
filetype plugin indent on

set relativenumber
set enc=utf-8
set noswapfile

set autoread
set history=1000

set backspace=indent,eol,start
set clipboard=unnamed

set go=
set mouse=

" searching
set ignorecase
set smartcase
set nohlsearch
set incsearch
set lazyredraw
" set synmaxcol=128
set noshowcmd

set noerrorbells
set novisualbell

set number
set wrap
set linebreak
set showbreak=↪
set autoindent
set ttyfast
" set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2
set so=999
set hidden
set noshowmode

" set wildmenu
" set wildmode=longest,list,full

" ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

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
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" code folding
" set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=10
set foldlevel=1

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

set colorcolumn=80

" remember position

" Automatically deletes all trailing whitespace and newlines at end of file on save.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\n\+\%$//e
" autocmd BufWritePre *.[ch] %s/\%$/\r/e

call plug#begin("~/.vim/plugged")

" Startify
Plug 'mhinz/vim-startify'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" text obj indent
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

" sort motion
Plug 'christoomey/vim-sort-motion'

" context-aware pasting
Plug 'sickill/vim-pasta'

" cpp/c
" Plug 'rhysd/vim-clang-format'

" cpp highlighting
" Plug 'octol/vim-cpp-enhanced-highlight'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sainnhe/gruvbox-material'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" indentLine
Plug 'Yggdroot/indentLine'

" terraform
Plug 'hashivim/vim-terraform'

" commenting
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

" sytax checker
" Plug 'vim-syntastic/syntastic'

" Javascript/Typescript/JSX/Vue
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'othree/yajs.vim'
" Plug 'yuezk/vim-js'
" Plug 'ianks/vim-tsx'
" Plug 'leafgarland/typescript-vim'

" Plug 'pangloss/vim-javascript'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'turbio/bracey.vim'

" scss & css
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'ap/vim-css-color'

" match tags in html, similar to paren support
" Plug 'gregsexton/MatchTag', { 'for': 'html' }

" latex
" Plug 'lervag/vimtex'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

" tmux plugins
" Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Jenkinsfile
" Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'burnettk/vim-jenkins'

" au! BufNewFile,BufCreate,BufRead Dockerfile.build,Dockerfile.run setf dockerfile

" Plug 'itspriddle/vim-shellcheck'
" Plug 'mrk21/yaml-vim'
" Plug 'towolf/vim-helm'

" Helm
Plug 'towolf/vim-helm'

" reopen last line
Plug 'farmergreg/vim-lastplace'

call plug#end()
