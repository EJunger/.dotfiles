local nnoremap = require("witchcraft.keymap").nnoremap
local inoremap = require("witchcraft.keymap").inoremap
local vnoremap = require("witchcraft.keymap").vnoremap

------------------------------------------------------
-- INSERT --

-- Exit Insert mode
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")
inoremap("JK", "<ESC>")
inoremap("KJ", "<ESC>")

-- Insert mode undo
inoremap("<leader>uu", "<C-O>:u<CR>")

------------------------------------------------------
-- NORMAL --

-- Resize
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")

-- Buffer navigation
nnoremap("<A-l>", ":bnext<CR>")
nnoremap("<A-h>", ":bprevious<CR>")

------------------------------------------------------
-- VISUAL --

-- Sticky indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Sticky paste
vnoremap("p", '"_dP"')

-- Move text selection 
vnoremap("<A-j>", ":m .+1<CR>gv")
vnoremap("<A-k>", ":m .-2<CR>gv")


------------------------------------------------------
-- Utils --

-- Telescope --
nnoremap("<leader>f", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>b", "<cmd>Telescope file_browser<CR>")
nnoremap("<C-t>", "<cmd>Telescope live_grep<CR>")
--nnoremap <leader>/ <cmd>lua require("cowgirl.tele-config").curr_buf()<CR>

-- NvimTree --
nnoremap("<leader>e", ":NvimTreeToggle<CR>")

-- LSP --
nnoremap("<leader>li", ":LspInfo<CR>")
nnoremap("<leader>lin", ":LspInstallInfo<CR>")
