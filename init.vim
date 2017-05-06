call plug#begin()

Plug 'ajh17/VimCompletesMe'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kyuhi/vim-emoji-complete'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" Language-specific
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'
Plug 'matchit.zip'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/rust-doc.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Theming
syntax enable
set termguicolors
set laststatus=2
colorscheme base16-default-dark
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic
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
set hlsearch
set scrolloff=6
set expandtab
set lazyredraw
set incsearch
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
set splitright
set splitbelow

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Autochdir on insert mode, restore on mode change
:autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
:autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Plugin-specific configuration
" Emmet for vim - jsx specifics
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\    'quote_char': "'",
\  },
\}
" Async Linting Engine
let g:ale_sign_column_always=1
let g:ale_sign_error = '*>'
let g:ale_sign_warning = '*>'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Configure ALE for rust linting
let g:ale_rust_ignore_error_codes = ['E0433', 'E0405', 'E0432', 'E0463', 'E0469'] " Using rustc for linting ignores other project files, so we ignore that type of errors
let g:ale_linters = {'rust': ['rustc']} " Using cargo for linting blocks other cargo instances
" FZF - Use silversearcher, also ignores .gitignored files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set grepprg=ag\ --vimgrep
" Padding for NERDCommenter
let NERDSpaceDelims=1
" Navigate between linter errors with CTRL+[jk]
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
" Required for YCM installation
let g:ycm_server_python_interpreter = '/usr/bin/python'

" JavaScript
let g:jsx_ext_required = 0

" Keybindings
let mapleader=" "

nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Ag 
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :NERDTreeFind<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w!<CR>
nnoremap <Leader>wq :wq!<CR>
nnoremap <leader>b :Buffers<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap j gj
nnoremap k gk
map 0 ^
command W w !sudo tee % > /dev/null
" Visual select last pasted text
nnoremap gp `[v`]
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
nnoremap GF gd/'<CR>:noh<CR>gf
" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Comfy mappings for buffer-previous and buffer-next
nnoremap <silent> <Leader>> :bn<CR>
nnoremap <silent> <Leader>< :bp<CR>
" Open the corresponding .spec.js file in the same folder
" or create it if it doesn't exist
function OpenSpec()
  let l:path = expand("%")
  let l:spec = substitute(l:path, ".js", ".spec.js", "")
  exec "vsplit "l:spec
endfunction
map <F12> :call OpenSpec() <cr>

