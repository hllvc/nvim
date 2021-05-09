
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
