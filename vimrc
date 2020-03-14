execute pathogen#infect()
set tabstop=4
set shiftwidth=4
set noexpandtab
set number
set relativenumber
set backspace=indent,eol,start

if !exists("g:syntax_on")
    syntax enable
endif
filetype plugin indent on

colorscheme codedark
set termguicolors

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

nmap \ :NERDTreeToggle<CR>
no <C-j> <C-w>j| "switching to below window
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window
no <C-h> <C-w>h| "switching to left window
let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

set runtimepath-=~/.vim/bundle/vimacs

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

let NERDTreeQuitOnOpen = 1
let g:NERDTreeLimitedSyntax = 1
set lazyredraw

