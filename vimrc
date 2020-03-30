" Vim configuration file

" VUNDLE CONFIGS START
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'valloric/youcompleteme'
Plugin 'python-mode/python-mode'
Plugin 'Valloric/ListToggle'
Plugin 'yuttie/comfortable-motion.vim'

call vundle#end()
filetype plugin indent on
" VUNDLE CONFIGS END

" Speed settings
set ttimeoutlen=50
set updatetime=750
set ttyfast
set lazyredraw
let mapleader=" "

" Indent with tabs of size 4
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start

" Search results appear in the middle of the screen
:set scrolloff=999

" Strip whitespce on save
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Cursor line in current window
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

nnoremap <silent><Leader>j m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>k m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
xnoremap <Leader>p "_dP

" Relative line numbers in normal mode and current window
set number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Syntax highlighting
if !exists('g:syntax_on')
    syntax enable
endif

" Theme configurations
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Highlight search results
set hlsearch

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic configs
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Trying to see if YCM is better for C/C++
let g:syntastic_c_checkers = []
let g:syntastic_cpp_checkers = []

" Keeping syntastic for python because of pylint
let g:syntastic_python_checkers = ['pylint']


" YouCompleteMe configs
let g:ycm_show_diagnostics_ui = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_interpreter_path = '~/.pyenv/shims/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_global_extra_conf.py'

" PythonMode configs
let g:pymode_syntax = 1
let g:pylint_lint_checkers = ['pylint']

" Fast escape key
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

nmap <Leader>f :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeLimitedSyntax = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
augroup nerdtreeopen
	autocmd!
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

augroup nerdtreeclose
	autocmd!
  	autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END

" Smooth Scroll custom configs
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0

