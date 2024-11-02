-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {	  
        'nvim-telescope/telescope.nvim', tag = '0.1.8',	  -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }  
    }

    use 'folke/tokyonight.nvim'

    use 'supermaven-inc/supermaven-nvim'

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('terrortylor/nvim-comment')
    use('nikvdp/ejs-syntax')

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use {
        'fatih/vim-go',
        run = ':GoInstallBinaries'
    }

    use 'vim-airline/vim-airline'

    use 'jwalton512/vim-blade'

    use {
        'kristijanhusak/vim-dadbod-ui',
        requires = {
            {'tpope/vim-dadbod'},
            {'kristijanhusak/vim-dadbod-completion', ft = {'sql', 'mysql', 'plsql'}},
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        config = function()
            -- Your DBUI configuration
            -- require("config.dadbod").setup()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    }
    

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- require("config.cmp").setup()
        end,
    }

    use {
        'adalessa/laravel.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'tpope/vim-dotenv',
            'MunifTanjim/nui.nvim',
        },
        cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
        keys = {
            { '<leader>la', ':Laravel artisan<cr>' },
            { '<leader>lr', ':Laravel routes<cr>' },
            { '<leader>lm', ':Laravel related<cr>' },
            {
                '<leader>lt',
                function()
                    require('laravel.tinker').send_to_tinker()
                end,
                mode = 'v',
                desc = 'Laravel Application Routes',
            },
        },
        event = { 'VeryLazy' },
        config = function()
            require('laravel').setup()
            require('telescope').load_extension 'laravel'
        end,
    }

    use {
        'onsails/lspkind-nvim',
        config = function()
            require('lspkind').init({
                -- You can customize `lspkind` behavior here if needed
                symbol_map = {
                    Supermaven = "", -- Optional: Adding Supermaven icon as we discussed earlier
                }
            })
        end
    }  
    
end)
