execute pathogen#infect()
:set number
:set tabstop=4
:set relativenumber
:set backspace=indent,eol,start

if !exists("g:syntax_on")
    syntax enable
endif

let g:dracula_italic = 0
colorscheme dracula
:set termguicolors

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

