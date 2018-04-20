" TMUX integration
" disable background color scheme
set t_ut=

" recursive search through directory
set path+=**

" display all files when tab complete
set wildmenu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'vim-python/python-syntax'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ajh17/VimCompletesMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'mhinz/vim-signify'

"Working with tmux
Plugin 'christoomey/vim-tmux-navigator'

"Themes
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'joshdick/onedark.vim'

" Future implementation?
" Plugin 'majutsushi/tagbar'
" Plugin 'vim-latex/vim-latex'
" Plugin 'benmills/vimux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Shortcut keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Toggle Nerdtree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-\|> :NERDTreeClose<CR>

"Execute python in blank screen python
"autocmd FileType python nnoremap <buffer> <F9> <Esc>:w<CR>:!python % &<CR> 

"getting PEP8 indentation for python3
au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8

au BufNewFile,BufRead *.txt
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set tabstop=2 | 
    \ retab 

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=darkred
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

"Turning on Line Numbering
set nu

"pretty this shit
let g:python_highlight_all=1
let g:enable_bold_font=1
set termguicolors
colorscheme onedark
syntax on

set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" NERDTree Config

"opening NERDTree automatically at startup
"autocmd vimenter * NERDTree

" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

