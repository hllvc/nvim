let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['tex', 'plaintex'],'passive_filetypes': [] }

let g:syntastic_tex_checkers = ['chktex']

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = ""
let g:syntastic_style_error_symbol = ""
let g:syntastic_style_warning_symbol = ""

let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
