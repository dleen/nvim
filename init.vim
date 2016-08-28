" Fish shell breaks vim.
"set shell=/bin/sh

call plug#begin()
Plug 'tpope/vim-sensible'

" Git integration, I mostly use for :Gblame and the statusline.
Plug 'tpope/vim-fugitive'

Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Base16 colorscheme.
Plug 'chriskempson/base16-vim'
" Highlight all spurious whitespace.
Plug 'ntpeters/vim-better-whitespace'

" Nicer status line.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'moll/vim-node'
Plug 'isRuslan/vim-es6'

Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'scrooloose/syntastic'

Plug 'honza/vim-snippets'
Plug '907th/vim-auto-save'
call plug#end()




" ctrlp
" Awesome fuzzy file matching, search buffers etc.
let g:ctrlp_map = '<c-p>'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Keep the cache around, helps me remember what I was looking at.
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
" Have the working directory be the first parent that contains .git or
" the dir of the current file (with exceptions, see help).
let g:ctrlp_working_path_mode = 'ra'
" Start with the buffer, nicer than :ls.
let g:ctrlp_cmd = 'CtrlPBuffer'
" If buffer is already open somewhere then ctrlp won't try to jump to it.
let g:ctrlp_switch_buffer = 0

" User powerline like the rest of vim.
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" vim-airline has its own status bar so hide the default one or you'll get
" stuff like INSERT twice.
set noshowmode

" Required:
filetype plugin indent on " enable file-specific plugins/settings

let mapleader = ","

" Syntax highlighting.
syntax enable

" Colorscheme.
" Access colors present in 256 colorspace
let base16colorspace=256

set background=dark
colorscheme base16-monokai

" Time between keystrokes.
set timeoutlen=1000 ttimeoutlen=0

" ================ General Config ====================
"set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell t_vb=            "No sounds
set autoread                    "Reload files changed outside vim
set nowrap
set wildmenu
set cursorline
set cursorcolumn

nnoremap ' `
nnoremap ` '

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set laststatus=2

"default indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" universal text encoding, compatible with ascii
" set encoding=utf-8

set autoindent
set wildmode=list:longest
set ttyfast
set undofile

" Highlight searches.
set hlsearch

set incsearch

set ignorecase
set smartcase

set shortmess=atI

" The Silver Searcher, http://robots.thoughtbot.com/faster-grepping-in-vim/
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

set wrap linebreak textwidth=0

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set colorcolumn=80
let &colorcolumn="80,".join(range(120,320),",")

set nonumber

set splitbelow
set splitright

set showmatch " briefly jump to the matching bracket on insert

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Mitigate hitting F1 instead of escape.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use jj to escape in insert mode.
inoremap jj <ESC>

" Clear highlighted search matches.
nnoremap <leader><space> :noh<cr>

" cut down key stroke for normal mode
nnoremap ; :

" git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

" vim-auto-suave plugin
let g:auto_save = 1
au FocusLost * :wa

" Easy editing of this file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set mouse=

map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 3

nnoremap <leader>sc :SyntasticCheck<cr>

" nvim python support
let g:python_host_prog = '/usr/local/bin/python'

" nvim terminal
tnoremap <Esc> <c-\><c-n>
