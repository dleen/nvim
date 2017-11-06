if dein#tap('denite.nvim')
 	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh<CR>
  nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file_old -default-action=switch<CR>
  nnoremap <silent><LocalLeader>f :<C-u>Denite file_rec<CR>
  nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
  nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
endif

if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
endif

if dein#tap('vim-peekaboo')
	nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
	xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
	nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
	inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('nerdtree')
	let g:NERDTreeMapOpenSplit = 'sv'
	let g:NERDTreeMapOpenVSplit = 'sg'
	let g:NERDTreeMapOpenInTab = 'st'
	let g:NERDTreeMapOpenInTabSilent = 'sT'
	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
	let g:NERDTreeMapOpenRecursively = 't'
	let g:NERDTreeMapCloseChildren = 'T'
	let g:NERDTreeMapToggleHidden = '.'

	nnoremap <silent> <LocalLeader>e :<C-u>NERDTreeToggle<CR>
	nnoremap <silent> <LocalLeader>a :<C-u>NERDTreeFind<CR>
endif

if dein#tap('tagbar')
	nnoremap <silent> <Leader>o   :<C-u>TagbarOpenAutoClose<CR>

	" Also use h/l to open/close folds
	let g:tagbar_map_closefold = ['h', '-', 'zc']
	let g:tagbar_map_openfold = ['l', '+', 'zo']
endif
