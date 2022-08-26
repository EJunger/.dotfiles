local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Source and sync file on save
vim.cmd [[
    augroup packer_sourcesync
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Run packer through a protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer Error")
    return
end

-- Packer options
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Plugins
return packer.startup(function(use)
	use "wbthomason/packer.nvim"

    -- Colorschemes
	use "colepeters/spacemacs-theme.vim"

    -- Cmp
    use "hrsh7th/nvim-cmp"

    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippet engine
    use "L3MON4D3/LuaSnip"

    -- Snippets
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/playground"
    use "JoosepAlviste/nvim-ts-context-commentstring"
	--use("nvim-treesitter/nvim-treesitter-refactor")
    --use("romgrk/nvim-treesitter-context")
    --use("windwp/nvim-ts-autotag")

    -- Telescope
	use "nvim-telescope/telescope.nvim"

	use "nvim-telescope/telescope-file-browser.nvim"
    --[[ use "nvim-telescope/telescope-ui-select.nvim" ]]
	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	}

    -- Dap
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    --[[ use "ravenxrz/DAPInstall.nvim" ]]

    -- Bufferline
    use "akinsho/bufferline.nvim"

    -- NvimTree 
    use "kyazdani42/nvim-tree.lua"

    -- Toggleterm
    use "akinsho/toggleterm.nvim"

    -- Rust
	use "simrat39/rust-tools.nvim"

    -- Git
    use "TimUntersberger/neogit"
    use "lewis6991/gitsigns.nvim"

    -- Tmux 
	use "christoomey/vim-tmux-navigator"

    -- Util
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "moll/vim-bbye"
	use "BurntSushi/ripgrep"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"

end)
