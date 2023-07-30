-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "windwp/nvim-autopairs"
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
    }
    use { 'gen740/SmoothCursor.nvim',
      config = function()
        require('smoothcursor').setup()
      end
    }
    use "christoomey/vim-tmux-navigator"
    use "wfxr/minimap.vim"
    use("vim-airline/vim-airline")
    use('ryanoasis/vim-devicons')
    use("sharkdp/fd")
    use('BurntSushi/ripgrep')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use("nvim-lua/plenary.nvim")
    use("ThePrimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use('nvim-treesitter/nvim-treesitter-context')
    use("github/copilot.vim")
    use 'navarasu/onedark.nvim'
    use("folke/zen-mode.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
