-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 将空格键映射为冒号（Normal 模式）
vim.keymap.set("n", "<Space>", ":", { noremap = true, silent = false })

-- move between windows
vim.keymap.set("n", "<A-k>", "<cmd> wincmd k<CR>", { desc = "move between windows" })
vim.keymap.set("n", "<A-j>", "<cmd> wincmd j<CR>", { desc = "move between windows" })
vim.keymap.set("n", "<A-h>", "<cmd> wincmd h<CR>", { desc = "move between windows" })
vim.keymap.set("n", "<A-l>", "<cmd> wincmd l<CR>", { desc = "move between windows" })

-- clear highlights
vim.keymap.set("n", "<LEADER><CR>", "<cmd> noh<CR>", { desc = "clear highlights" })

-- Move Lines
vim.keymap.set("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
