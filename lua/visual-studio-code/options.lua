-- [[ Setting options ]]

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Set highlight on search
vim.o.hlsearch = true

-- Set configuration for tabs
-- See `:help tabstop` (using method 3)
vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false

-- Sync system clipboard with Neovim
--  See `:help clipboard`
vim.o.clipboard = 'unnamedplus'

-- vim: ts=2 sts=2 sw=2 et
