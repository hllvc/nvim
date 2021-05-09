set relativenumber
set enc=utf-8
set noswapfile

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

set noerrorbells
set novisualbell

set number
set nowrap
set linebreak
set showbreak=↪
set autoindent
set ttyfast
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2
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

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

call plug#begin("~/.vim/plugged")

" Startify
Plug 'mhinz/vim-startify'

Plug 'preservim/tagbar'

" cpp highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

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

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" cpp/c
Plug 'rhysd/vim-clang-format'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sainnhe/gruvbox-material'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'

" commenting
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

" sytax checker
Plug 'vim-syntastic/syntastic'

" Javascript/Typescript/JSX/Vue
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'turbio/bracey.vim'

" scss & css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" match tags in html, similar to paren support
Plug 'gregsexton/MatchTag', { 'for': 'html' }

" latex
Plug 'lervag/vimtex'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'

call plug#end()
