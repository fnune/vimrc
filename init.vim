call plug#begin()

Plug 'ajh17/VimCompletesMe'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kyuhi/vim-emoji-complete'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

" Language-specific
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'JulesWang/css.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim'
Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'
Plug 'rhysd/rust-doc.vim'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

call plug#end()

"********* THEMING **********"
syntax enable
set termguicolors
set laststatus=2
set noshowmode
colorscheme base16-default-dark
let g:lightline = {
\ 'colorscheme': 'base16',
\ }
set encoding=utf-8
autocmd FileType nerdtree setlocal nolist
" Make sure italics works
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic
" Don't use different colors for opening and closing tags
hi link xmlEndTag xmlTag

"****** CONFIGURATION *******"
filetype plugin indent on
let g:netrw_disthistmax=0
set autoindent
set autoread
set backupcopy=yes
set breakindent
set cursorline
set expandtab
set exrc
set hlsearch
set ignorecase smartcase
set incsearch
set lazyredraw
set linebreak
set list
set number
set scrolloff=6
set secure
set shiftwidth=2
set showcmd
set showmatch
set smartindent
set smarttab
set splitbelow
set splitright
set tabstop=4
set textwidth=0
set ttimeout
set ttimeoutlen=100
set wildmenu
set wrap

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
" Disable rust linting on ALE - It either blocks cargo or uses rustc which
" ignores all files except for the current one
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'rust': [],
\}
" FZF - Use ripgrep, also ignores .gitignored files
let $FZF_DEFAULT_COMMAND = 'rg --files -g ""'
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
" JavaScript
let g:jsx_ext_required = 0

"******* KEYBINDINGS ********"
let mapleader=" "

map 0 ^
imap <c-x><c-l> <plug>(fzf-complete-line)
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Ag<SPACE>
nnoremap <Leader>R :Rg<SPACE>
nnoremap <Leader>re :Rename<SPACE>
nnoremap <Leader>mv :Move<SPACE>
nnoremap <Leader>de :Delete<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :NERDTreeFind<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w!<CR>
nnoremap <Leader>wq :wq!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap j gj
nnoremap k gk
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Comfy mappings for buffer-previous and buffer-next
nnoremap <silent> <Leader>> :bn<CR>
nnoremap <silent> <Leader>< :bp<CR>
" Go to file in a vertical split
nnoremap vgf <C-w>v gf
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap GF gd/'<CR>:noh<CR>gf
" Visual select last pasted text
nnoremap gp `[v`]
" Navigate between linter errors with Leader [jk]
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

"***** CUSTOM COMMANDS ******"
" Save as super user even if vim was opened as regular user
command W w !sudo tee % > /dev/null
" Use <Leader>l to clear the highlighting of :set hlsearch.
nnoremap <silent> <Leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" Press F7 to run JS code on node and show it in a buffer
map <F7> :call Run() <cr>
function Run()
  exec "! node %"
endfunction
" Open the corresponding .spec.js file in the same folder
function OpenSpec()
  let l:path = expand("%")
  let l:spec = substitute(l:path, ".js", ".spec.js", "")
  let l:test = substitute(l:path, ".js", ".test.js", "")
  if filereadable(l:spec)
    exec "vsplit "l:spec
  endif
  if filereadable(l:test)
    exec "vsplit "l:test
  endif
endfunction
map <F12> :call OpenSpec() <cr>

