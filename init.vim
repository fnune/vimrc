call plug#begin()

Plug 'w0rp/ale'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-sneak'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'JulesWang/css.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

" Language-specific
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'matchit.zip'

call plug#end()

" Theming
syntax enable
set termguicolors
set laststatus=2
colorscheme jellybeans
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='distinguished'
set encoding=utf-8

" Use the terminal background instead of theme background
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi link xmlEndTag xmlTag

" Configuration
set number
filetype plugin indent on
set showcmd
set list
set textwidth=0
set linebreak
set tabstop=4
set shiftwidth=2
set expandtab
set lazyredraw
set hlsearch
set incsearch
set showmatch
set wildmenu
set cursorline
set ignorecase smartcase
set scroll=5
set exrc
set secure
let g:netrw_disthistmax=0
set backupcopy=yes
set autoread

" Plugin-specific configuration
" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#file#enable_buffer_path=1
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Async Linting Engine
let g:ale_sign_column_always=1
let g:ale_sign_error = '|>'
let g:ale_sign_warning = '|>'
" Indent lines
let g:indentLine_char = '|'

" JavaScript
let g:jsx_ext_required = 0

" Keybindings
let mapleader=","

nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
