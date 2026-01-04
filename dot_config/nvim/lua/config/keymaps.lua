-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-CR>", ":vsplit | terminal<CR>", { noremap = true, silent = true })
