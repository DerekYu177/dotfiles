" TMUX integration
" disable background color scheme
set t_ut=

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'christoomey/vim-tmux-navigator'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linter and autocompletes
Plug 'w0rp/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Ruby
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'

" Themes
Plug 'morhetz/gruvbox'
call plug#end()

" Async Linter Engine Config (ale)
" Enable autocompletion when available
let g:ale_completion_enabled=1
" Only run a single linter
let b:ale_linters = {'python': ['autopep8']}

" Deoplete Async Config
let g:deoplete#enable_at_startup = 1

" NerdTree Config
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-\|> :NERDTreeClose<CR>
" open NERDTree if no files are specified
autocmd StdinReadPre * let s:st_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrlp Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore things that .gitignore does
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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

au BufNewFile,BufRead *.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent

" Turn on folding
set foldmethod=indent

"Turning on Line Numbering
set nu
set relativenumber

" Gruvbox Config
let g:gruvbox_contrast_dark='hard'
set background=dark

" Airline Config
let g:airline_theme='gruvbox'
" airline combination with ale
let g:airline#extensions#ale#enabled=1

"pretty this shit
" let g:python_highlight_all=1
" let g:enable_bold_font=1
set termguicolors
syntax on
colorscheme gruvbox

" set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
