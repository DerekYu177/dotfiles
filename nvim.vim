" TMUX integration
" disable background color scheme
set t_ut=

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  kutocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin()
" UI
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

" Tools
Plug 'kien/ctrlp.vim'
Plug 'eugen0329/vim-esearch'
Plug 'tpope/vim-surround'
Plug 'itmammoth/doorboy.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" Plug 'jsfaint/gen_tags.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'

call plug#end()

let g:easytags_suppress_ctags_warning = 1

" Startify working with Nerdtree
autocmd VimEnter *
     \   if !argc()
     \ |   Startify
     \ |   NERDTree
     \ |   wincmd w
     \ | endif

" NerdTree Config
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-\|> :NERDTreeClose<CR>
" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap ,n :NERDTreeFind<CR>
" let NERDTreeIgnore=['__init__.py', '__pycache__']

" ctrlp Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" Shortcut keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" badwhitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

au BufNewFile,BufRead *.*
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent

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

" Turn on folding
set foldmethod=indent

"Turning on Line Numbering
set nu
set relativenumber

"pretty this shit
" let g:python_highlight_all=1
" let g:enable_bold_font=1
set termguicolors
syntax on
colorscheme gruvbox

" Gruvbox Config
let g:gruvbox_contrast_dark='hard'
set background=dark

" Airline Config
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled=1

" set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
