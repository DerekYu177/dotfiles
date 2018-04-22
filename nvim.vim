" TMUX integration
" disable background color scheme
set t_ut=

" recursive search through directory
set path+=**

" display all files when tab complete
set wildmenu

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
":GenCtags
Plug 'jsfaint/gen_tags.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Compatibility
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" Themes
Plug 'joshdick/onedark.vim'
call plug#end()

" Deoplete Config
let g:deoplete#enable_at_startup = 1

" NerdTree Config
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-\|> :NERDTreeClose<CR>
" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Airline Config
let g:airline_theme='onedark'

" Shortcut keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" badwhitespace
highlight BadWhitespace ctermbg=darkred

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
    \ match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.txt
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set tabstop=2 | 
    \ retab 

"Turning on Line Numbering
set nu

"pretty this shit
let g:python_highlight_all=1
let g:enable_bold_font=1
set termguicolors
syntax on
colorscheme onedark

set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
