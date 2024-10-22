require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>oi", "<cmd> OrganizeImports <CR>", { desc = "Organize Imports" })

map("n", "<C-d>", "<C-d>zz", { desc = "downward move page and center the cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "upword move by page and center the cursor" })

-- tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd>  TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd>  TmuxNavigateUp<CR>", { desc = "window up" })
