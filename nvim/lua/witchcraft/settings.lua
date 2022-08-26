local set = vim.opt
local opts = { noremap = true, silent = true }

set.path = ".,,**"

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--[[ set.cmdheight = 2 ]]

set.nu = true
set.relativenumber = true

set.backup = false
set.swapfile = false

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- set.nohlsearch = true
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- set.clipboard = "unnamedplus"
set.cursorline = true
set.wrap = false
set.mouse = "a"
set.pumheight = 20
set.scrolloff = 8
set.sidescrolloff = 8
set.showmatch = true
set.signcolumn = "yes"

set.timeoutlen = 1000
set.updatetime = 300

set.hidden = true

set.splitright = true
set.splitbelow = true

set.termguicolors = true

set.completeopt = { "menuone", "noinsert", "noselect" }

set.shortmess:append "c"
vim.opt_global.shortmess:remove "F"

-- remove fillchars '~' NOTE: probs move this later
set.fillchars:append('eob: ')



