source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/lsp-config.vim

" Lick the rainbow
if (has("termguicolors"))
 set termguicolors
endif

" Enable mouse if available
if has('mouse')
    set mouse=a
endif

" UI/theme setup
set title " Let nvim set iTerm tab title
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }

highlight Constant cterm=italic
highlight Constant gui=italic
highlight Comment cterm=italic
highlight Comment gui=italic
highlight Todo cterm=italic	
highlight Todo gui=italic 

" Disable language syntax already handled by treesitter.
let s:lang_syntax_disable = [
 \ 'go.plugin',
\ ]

" Go configuration
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "golines"
let g:go_fmt_options = {
    \ 'golines': '-m 120',
    \ }
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

set number				" Line number in gutter
set encoding=utf-8
set tabstop=4
set shiftwidth=4		" Indent size
set colorcolumn=100
set cursorline

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  highlight = {
"    enable = true
"  },
"}
"EOF

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
