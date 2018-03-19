let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:source_file(path, ...) abort
  let use_global = get(a:000, 0, ! has('vim_starting'))
  let abspath = resolve(expand($VIMPATH.'/config/'.a:path))
  if ! use_global
    execute 'source' fnameescape(abspath)
		return
	endif

	let content = map(readfile(abspath),
		\ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
	let tempfile = tempname()
	try
		call writefile(content, tempfile)
		execute printf('source %s', fnameescape(tempfile))
	finally
		if filereadable(tempfile)
			call delete(tempfile)
    endif
  endtry
endfunction

" Set augroup
augroup MyAutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

" Disable default plugins "{{{

" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_ruby_provider = 1
let g:loaded_shada_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
" }}}

let mapleader = ","
let maplocalleader = ";"

if has('vim_starting')
  call s:source_file('neovim.vim')
  call s:source_file('terminal.vim')
endif

"dein Scripts-----------------------------
" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$VIMPATH/dein')
  call dein#begin('$VIMPATH/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$VIMPATH/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('haya14busa/dein-command.vim')

	call dein#add('Shougo/deoplete.nvim', {
  \ 'on_i': 1,
	\ 'hook_add': 'let g:deoplete#enable_at_startup = 1',
	\ 'hook_source': 'execute "source" "$VIMPATH/config/plugins/deoplete.vim"',
	\ })

  call dein#add('zchee/deoplete-jedi', {
  \ 'on_i': 1,
  \ 'on_ft': 'python',
  \ 'hook_source': 'autocmd MyAutoCmd FileType python setlocal omnifunc='
  \ })

	call dein#add('vim-python/python-syntax', {
  \ 'hook_add': 'let g:python_highlight_all = 1'
  \ })

	call dein#add('leafgarland/typescript-vim', {
  \ })

	call dein#add('mhartington/nvim-typescript', {
  \ })

  call dein#add('Shougo/neosnippet.vim', {
  \ 'depends': 'neosnippet-snippets',
  \ 'on_event': 'InsertCharPre',
  \ 'on_ft': 'snippet',
  \ 'hook_source': join(['let g:neosnippet#enable_snipmate_compatibility = 1',
  \                      'let g:neosnippet#enable_completed_snippet = 1',
  \                      'let g:neosnippet#expand_word_boundary = 1',
  \                      'autocmd MyAutoCmd InsertLeave * NeoSnippetClearMarkers'], "\n")
  \ })

  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Raimondi/delimitMate', {
  \ 'on_i': 1,
  \ 'hook_source': join(['let g:delimitMate_expand_cr = 1',
  \                      'let g:delimitMate_excluded_ft = "html"'], "\n")
  \ })

  call dein#add('tmhedberg/SimpylFold')

  call dein#add('chriskempson/base16-vim')

  call dein#add('Shougo/denite.nvim', {
  \ 'on_cmd': 'Denite',
	\ 'hook_source': 'execute "source" "$VIMPATH/config/plugins/denite.vim"',
	\ 'hook_post_source': 'execute "source" "$VIMPATH/config/menus.vim"',
  \ })

  call dein#add('ntpeters/vim-better-whitespace')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('junegunn/vim-peekaboo')

  call dein#add('mitsuhiko/vim-jinja', { 'on_ft': ['htmljinja', 'jinja'] })

  call dein#add('tpope/vim-commentary')

  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('itchyny/vim-parenmatch')

  call dein#add('rhysd/committia.vim')

  call dein#add('rust-lang/rust.vim')

  call dein#add('Shougo/echodoc.vim', {
  \ 'on_event': 'CompleteDone',
  \ 'hook_post_source': 'call echodoc#enable()',
  \ })

  call dein#add('majutsushi/tagbar', {
  \ 'on_cmd': 'TagbarToggle',
  \ 'hook_source': 'let g:tagbar_width = 40'
  \ })

  call dein#add('scrooloose/nerdtree', {
  \ 'depends': 'nerdtree-git-plugin',
  \ 'on_map': { 'n': '<Plug>' },
	\ 'hook_post_source': 'execute "source" "$VIMPATH/config/plugins/nerdtree.vim"',
  \ })
  call dein#add('Xuyuanp/nerdtree-git-plugin', { 'on_source': 'nerdtree' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" -------------------------------------------

" Required:
filetype plugin indent on
syntax enable

if ! has('vim_starting')
	call dein#call_hook('source')
	call dein#call_hook('post_source')
endif

"End dein Scripts-------------------------

call s:source_file('plugins/all.vim')

" Loading configuration modules
call s:source_file('general.vim')
call s:source_file('filetype.vim')
call s:source_file('mappings.vim')
call s:source_file('theme.vim')
set secure

if ! empty(glob("/usr/local/bin/fish"))
  set shell=/usr/local/bin/fish
else
  set shell=/apollo/env/envImprovement/bin/fish
endif

" ------------------------

"" Use powerline like the rest of vim.
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"" super slow
"let g:airline#extensions#branch#enabled = 0

"" Enter terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet expandtab :
