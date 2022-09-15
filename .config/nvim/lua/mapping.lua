
-- mappings
----------------------------------------
vim.keymap.set( "n", "<S-H>", "<C-W>", {});
-- explorer
vim.keymap.set( "n", "<leader>vo", ":VsplitVifm<CR>", {});
vim.keymap.set( "n", "<leader>ho", ":SplitVifm<CR>", {});
vim.keymap.set( "n", "<leader>to", ":TabVifm<CR>", {});
-- write and/or quit
vim.keymap.set( "n", "<leader>x", ":wq!<CR>", {});
vim.keymap.set( "n", "<leader>w", ":w!<CR>", {});
vim.keymap.set( "n", "<leader>q", ":q!<CR>", {});
-- language
vim.keymap.set( "n", "<leader>a", ":set arabic!<CR>", {});
vim.keymap.set( "n", "<leader>sp", ":set spell!<CR>", {});
-- clipboard
vim.keymap.set( "n", "<leader>y", "\"+y", {});
vim.keymap.set( "n", "<leader>p", "\"+p", {});
vim.keymap.set( "n", "<leader>P", ":r! xclip -selection clipboard -o<CR>", {});
	
local opts = { noremap=true, silent=false }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

