" UI settings {{{

" Lick the rainbow
if (has("termguicolors"))
 set termguicolors
endif

" Enable mouse if available
if has('mouse')
    set mouse=a
endif

" }}}
" General appearance settings {{{

set number				" Line number in gutter
set encoding=utf-8
set colorcolumn=100,120	" Highlight column
set cursorline			" Highlight current line
set foldmethod=marker

" }}}
" Tabs and indentation {{{

set tabstop=4			" Tab size
set shiftwidth=4		" Auto-indent size
set noexpandtab			" Tabs, not spaces
