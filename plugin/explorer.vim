:nnoremap <silent><c-n> :CocCommand explorer --sources=file+<cr>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<C-h>"
