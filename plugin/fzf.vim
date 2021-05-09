nnoremap <C-s> :Files<cr>
nnoremap <C-g> :GFiles?<cr>
nnoremap <C-p> :GFiles<cr>

let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\}
