-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 将空格键映射为冒号（Normal 模式）
vim.keymap.set("n", "<Space>", ":", { noremap = true, silent = false })
