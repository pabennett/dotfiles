set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
scriptencoding utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'nachumk/systemverilog.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'ervandew/supertab.git'
Plugin 'w0rp/ale.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set Vim's updatetime to something quicker than the default 4000
set updatetime=500

" Set CTRL+P root directory behaviour
let g:ctrlp_working_path_mode = '0'

" Configure Airline Theme
let g:airline_solarized_bg='dark'
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1

" Gitgutter
let g:gitgutter_max_signs = 1000

" ALE
let g:ale_python_pylint_change_directory = 0
let g:airline#extensions#ale#enabled = 1

" Listchars
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" Open splits intuitively
set splitbelow
set splitright

" Clipboard across multiple vim sessions using tmp file
vmap <leader>y :w! /tmp/vitmp<CR>
vmap <leader>p :r! cat /tmp/vitmp<CR>

syntax enable
colorscheme monokai
set expandtab                   " Spaces not Tabs
set tabstop=4                   " PEP8 Tabbing
set shiftwidth=4                " Tabbing
set cc=79                       " PEP8 Line Limit (a good limit in general)
set nu                          " Line numbers
set backspace=indent,eol,start  " Make backspace behave properly

"Keybinds
" TAB DEDENT for command mode
nnoremap <S-Tab> <<
" TAB DEDENT for insert mode
inoremap <S-Tab> <C-d>
" Toggle NERDTree
map <C-b> :NERDTreeToggle<CR>
" Clear trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
