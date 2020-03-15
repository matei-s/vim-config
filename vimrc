set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasiser/vim-code-dark'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'valloric/youcompleteme'
Plugin 'yuttie/comfortable-motion.vim'

call vundle#end()
filetype plugin indent on

set updatetime=100
let mapleader=" "

" Indent with tabs of size 4
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start

nnoremap <silent><Leader>j m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><Leader>k m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
xnoremap <Leader>p "_dP

set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup fixwhitespace
	autocmd!
	autocmd BufWrite * :FixWhitespace
augroup END

" Syntax highlighting
if !exists('g:syntax_on')
    syntax enable
endif

colorscheme codedark
set termguicolors
set hlsearch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_show_diagnostics_ui = 0
let g:syntastic_c_checkers = ['gcc', 'make']
let g:ycm_autoclose_preview_window_after_completion = 1

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
nmap <Leader>t :NERDTreeToggle<CR>
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

set runtimepath-=~/.vim/bundle/delimitMate

augroup nerdtreeclose
	autocmd!
	autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END

set lazyredraw

let g:comfortable_motion_no_default_key_mappings = 1

nnoremap <silent> <C-d> :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>

let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0

