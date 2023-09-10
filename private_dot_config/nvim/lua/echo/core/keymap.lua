local keymap = vim.keymap

-- set leader key to Space
vim.g.mapleader = " "

-- copy/paste to system clipboard
keymap.set({ "n", "v" }, "<Leader>y", "+y", { desc = "Yank to system clipboard" })
keymap.set("n", "<Leader>p", "+p", { desc = "Put from system clipboard" })

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<Leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<Leader>sx", "<Cmd>close<CR>", { desc = "Close current split" })

-- diagnostics
keymap.set("n", "<Leader>dn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
keymap.set("n", "<Leader>dp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
