" TMUX integration
" disable background color scheme
set t_ut=

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" Window Swapping
Plug 'wesQ3/vim-windowswap'

":GenCtags
Plug 'jsfaint/gen_tags.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Compatibility
Plug 'christoomey/vim-tmux-navigator'

" language support
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'elixir-editors/vim-elixir'

" Themes
Plug 'morhetz/gruvbox'
call plug#end()

" Deoplete Config
" let g:deoplete#enable_at_startup = 1
" let g:neomake_open_list = 2

" NerdTree Config
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-\|> :NERDTreeClose<CR>
" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap ,n :NERDTreeFind<CR>

" Neomake Config
" call neomake#configure#automake('nw', 1000)

" Ale
let g:ale_linters={'ruby':['rubocop', 'ruby']}
let g:ale_linters_explicit=1
let g:ale_sign_column_always=1

" ctrlp Config
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

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

autocmd BufWritePre *.py,*.rb,*.erb :call <SID>StripTrailingWhitespaces()

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

au BufNewFile,BufRead *
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent |
    \ set expandtab

" Text / Code Folding
set foldmethod=indent

"Turning on Line Numbering
set number
set relativenumber

" Airline Config
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1


"pretty this shit
let g:python_highlight_all=1
let g:enable_bold_font=1
set termguicolors
syntax on
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
