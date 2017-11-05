" Colorscheme.
" Access colors present in 256 colorspace
let base16colorspace=256

set background=dark
colorscheme base16-monokai

" Indent themes
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=18
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=19
