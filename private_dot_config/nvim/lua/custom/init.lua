vim.opt.colorcolumn = "120"

-- Terraform setup gets to live here until I figure out where to put it
--vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
--vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
--vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
--vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
--vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- Auto-format HCL on save
--vim.cmd([[let g:terraform_fmt_on_save=1]])
--vim.cmd([[let g:terraform_align=1]])
