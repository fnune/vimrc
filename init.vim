call plug#begin()

Plug 'w0rp/ale'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/neoinclude.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Language-specific
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'matchit.zip'
Plug 'JulesWang/css.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

call plug#end()

" Theming
syntax enable
set termguicolors
set laststatus=2
colorscheme base16-default-dark
hi link xmlEndTag xmlTag
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
autocmd FileType nerdtree setlocal nolist

" Configuration
set number
filetype plugin indent on
set showcmd
set list
set breakindent
set textwidth=0
set linebreak
set tabstop=4
set shiftwidth=2
set scrolloff=6
set expandtab
set lazyredraw
set hlsearch
set incsearch
set nohlsearch
set showmatch
set wildmenu
set cursorline
set ignorecase smartcase
set exrc
set secure
let g:netrw_disthistmax=0
set backupcopy=yes
set autoread
set autoindent
set smartindent
set wrap
set directory=~/.local/share/nvim/swap

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Plugin-specific configuration
" Async Linting Engine
let g:ale_sign_column_always=1
let g:ale_sign_error = '|>'
let g:ale_sign_warning = '|>'
" FZF - Use silversearcher, also ignores .gitignored files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set grepprg=ag\ --vimgrep
" Padding for NERDCommenter
let NERDSpaceDelims=1
" Navigate between linter errors with CTRL+[jk]
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" YouCompleteMe
set completeopt-=preview
" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" JavaScript
let g:jsx_ext_required = 0

" Keybindings
let mapleader=" "

nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Ag 
nnoremap <Leader>t :NERDTreeToggle<CR>
nmap <leader>w :w!<cr>
nnoremap j gj
nnoremap k gk
map 0 ^
command W w !sudo tee % > /dev/null
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Press F7 to run JS code on node and show it in a buffer
map <F7> :call Run() <cr>
function Run()
  exec "! node %"
endfunction
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap GF gd/'<CR>gf
