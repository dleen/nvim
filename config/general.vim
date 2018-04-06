" General Settings
"---------------------------------------------------------
" General
" {{{
"set mouse=nv                " Disable mouse in command-line mode
set nomodeline               " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif
" }}}

" Tabs and Indents "{{{
"
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set expandtab       " Expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set nosmartindent   " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
" }}}

set undofile swapfile nobackup
set directory=$VARPATH/swap//,$VARPATH,~/tmp,/var/tmp,/tmp
set undodir=$VARPATH/undo//,$VARPATH,~/tmp,/var/tmp,/tmp
set backupdir=$VARPATH/backup/,$VARPATH,~/tmp,/var/tmp,/tmp
set viewdir=$VARPATH/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" Davileen " {{{
set timeoutlen=1000 ttimeoutlen=0
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set nowrap
set wildmenu
set cursorline
set cursorcolumn

set laststatus=2

set wildmode=list:longest
set ttyfast
set undofile

" Highlight searches.
set hlsearch

set incsearch

set ignorecase
set smartcase

set shortmess=atI

set wrap linebreak textwidth=0

set formatoptions-=o " dont continue comments when pushing o/O

" vertical/horizontal scroll off settings
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set colorcolumn=80
let &colorcolumn="80,".join(range(120,320),",")

set nonumber

set splitbelow
set splitright

set showmatch " briefly jump to the matching bracket on insert

set noshowmode

" nvim python support
if has("mac")
	let g:python3_host_prog = '/Users/davileen/.local/share/virtualenvs/nvim-TurP3Hnt/bin/python'
	let g:python_host_prog = '/Users/davileen/.local/share/virtualenvs/python2-neovim-JRAoj47o/bin/python'
elseif has("unix")
	let g:python3_host_prog = 'python3.6'
	let g:python_host_prog = 'python'
endif
" }}}

" Folds {{{
" -----

" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
autocmd MyAutoCmd TextChangedI,TextChanged *
	\ if &l:foldenable && &l:foldmethod !=# 'manual' |
	\   let b:foldmethod_save = &l:foldmethod |
	\   let &l:foldmethod = 'manual' |
	\ endif

autocmd MyAutoCmd BufWritePost *
	\ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
	\   let &l:foldmethod = b:foldmethod_save |
	\   execute 'normal! zx' |
	\ endif

if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
	set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
	" Get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let foldLevelStr = repeat('+--', v:foldlevel)
	let lineCount = line('$')
	let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
	let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
