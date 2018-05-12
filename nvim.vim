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
Plug 'neomake/neomake'
Plug 'AndrewRadev/splitjoin.vim'

":GenCtags
Plug 'jsfaint/gen_tags.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Compatibility
Plug 'christoomey/vim-tmux-navigator'

" Ruby Specific
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
" Plug 'nightsense/seagrey'
call plug#end()

" Deoplete Config
let g:deoplete#enable_at_startup = 1
let g:neomake_open_list = 2

" NerdTree Config
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-\|> :NERDTreeClose<CR>
" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Neomake Config
call neomake#configure#automake('rw', 1000)

" Airline Config
let g:airline_theme='gruvbox'

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

autocmd BufWritePre *.py,*.rb :call <SID>StripTrailingWhitespaces()

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

"Turning on Line Numbering
set number
set relativenumber

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
