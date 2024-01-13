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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'itmammoth/doorboy.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'xolox/vim-misc'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'

" Ruby
Plug 'tpope/vim-endwise'
Plug 'vim-test/vim-test'

" HTML
Plug 'valloric/matchtagalways'

call plug#end()

" Copies and displays current file
map <Leader>2 :call ShowCurrentFile()<CR>
function! ShowCurrentFile()
  let location = expand('%:p')
  echo location
  let @+=location
endfunction

" Async Linter Engine Config (ale)
let g:ale_completion_enabled=1
let g:ale_linters = { 'python': ['autopep8'], 'ruby': ['ruby', 'rubocop']}
let g:ale_linters_explicit=1
let g:ale_sign_column_always=1

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

" ripgrep Config (:Rg)
" if all lowercase, insensitive, if capital, sensitive
" let g:rg_command = 'rg --vimgrep -S'
if executable('rg')
  set grepprg=rg\ --color=never
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp

" FZF replacing ctrl-p
nmap <C-P> :FZF<CR>
let g:fzf_tags_command = 'ctags -R'
let g:fzf_preview_window = 'right:40%'

" nnoremap <C-p> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Shortcut keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" remap jump to to be split and then jump to
nnoremap <Leader>f <C-W>g<C-]>

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
set nofoldenable
" set foldnestmax=1

"Turning on Line Numbering
set nu
set relativenumber

"pretty this shit
" let g:enable_bold_font=1
set termguicolors
syntax on
colorscheme gruvbox

" Gruvbox Config
let g:gruvbox_contrast_dark='hard'
set background=dark

"pretty this shit
let g:python_highlight_all=1
let g:enable_bold_font=1
set termguicolors
syntax on
colorscheme gruvbox
let g:airline_theme='gruvbox'

" set scrolloff=10
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
