let mapleader=' '
inoremap jk <esc>
inoremap JK <esc>
nmap <silent><leader><leader> :w<cr>
nmap <silent><leader>q :wq<cr>

" git conflicts
nmap <silent><leader>h :diffget //2<cr>
nmap <silent><leader>l :diffget //3<cr>
nmap <silent><leader>g :Gvdiffsplit!<cr>

" let j & k navigate visual lines instead of logical
nmap j gj
nmap k gk

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

" use leader+alt+hjkl to move windows between split/vsplit panels
nnoremap <leader><A-h> <C-\><C-n><C-w><S-h>
nnoremap <leader><A-j> <C-\><C-n><C-w><S-j>
nnoremap <leader><A-k> <C-\><C-n><C-w><S-k>
nnoremap <leader><A-l> <C-\><C-n><C-w><S-l>
nnoremap <leader><A-h> <C-\><C-n><C-w><S-h>
nnoremap <leader><A-j> <C-\><C-n><C-w><S-j>
nnoremap <leader><A-k> <C-\><C-n><C-w><S-k>
nnoremap <leader><A-l> <C-\><C-n><C-w><S-l>

" use leader+s for split
nnoremap <leader>e <C-w>s<CR><C-w>j

" use leader+v for vertical split
nnoremap <leader>v <C-w>v<CR><C-w>l

nnoremap <leader>r :source %<cr>

" keep visual selection while indenting
vmap < <gv
vmap > >gv

" select what was pasted
nnoremap <Leader>p V`]

" switch between current and last buffer
nmap <leader>n <c-^>

" close current buffer
nmap <silent><Leader>w :bd<CR>

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

let g:term_height = 10

" Toggle terminal on/off (neovim)
" nnoremap <silent><A-t> :call TermToggle(g:term_height)<CR>
" inoremap <silent><A-t> <Esc>:call TermToggle(g:term_height)<CR>
" tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(g:term_height)<CR>

" write with sudo
command W :execute ':silent w !sudo tee % > /dev/null'
