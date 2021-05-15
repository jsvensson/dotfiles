call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'

" Languages
Plug 'fatih/vim-go',						" Go
	\ { 'do': ':GoUpdateBinaries' }
Plug 'dag/vim-fish'							" Fish syntax
" Color schemes
Plug 'jacoborus/tender.vim'

" UI enhancements
"  Plug 'nvim-treesitter/nvim-treesitter',	" Syntax highlighting
"		\ { 'do': ':TSUpdate' }
"  Plug 'nvim-treesitter/playground'
Plug 'itchyny/lightline.vim'				" Status bar
Plug 'mhinz/vim-signify'					" Git gutter thingie
Plug 'junegunn/fzf',
	\ { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


"""
""" Configure LSP
"""

lua require('lspconfig').gopls.setup{}
