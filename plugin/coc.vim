" let g:coc_global_extensions = [
" 				\ 'coc-snippets',
" 				\ 'coc-scssmodules',
" 				\ 'coc-html',
" 				\ 'coc-emmet',
" 				\ 'coc-html-css-support',
" 				\ 'coc-css',
" 				\ 'coc-vimtex',
" 				\ 'coc-pyright',
" 				\ 'coc-json',
" 				\ 'coc-tsserver',
" 				\ 'coc-eslint',
" 				\ 'coc-sh',
" 				\ 'coc-prettier',
" 				\ 'coc-explorer',
" 				\ 'coc-diagnostic',
" 				\ 'coc-solargraph',
" 				\ 'coc-docker',
" 				\ 'coc-yaml'
" 				\ ]

let g:coc_global_extensions = [
				\ 'coc-snippets',
				\ 'coc-pyright',
				\ 'coc-json',
				\ 'coc-tsserver',
				\ 'coc-eslint',
				\ 'coc-sh',
				\ 'coc-prettier',
				\ 'coc-explorer',
				\ 'coc-diagnostic',
				\ 'coc-solargraph',
				\ 'coc-docker',
				\ 'coc-yaml',
        \ 'coc-emmet',
        \ 'coc-html'
				\ ]

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <c-l> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-h>"
inoremap <silent><expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-h>"

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
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
