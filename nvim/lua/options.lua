require "nvchad.options"

-- add yours here!

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.colorcolumn = "80"
o.relativenumber = true

o.ignorecase = true -- search case insensitive
o.smartcase = true -- search matters if capital letter
o.inccommand = "split" -- "for incsearch while sub

-- o.cursorlineopt = "both" -- to enable cursorline!
