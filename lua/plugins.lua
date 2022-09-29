local packer = require('packer')

packer.startup({
    function(use)
        -- add plugins here
        use('wbthomason/packer.nvim')
        use('folke/tokyonight.nvim')
        use('sainnhe/sonokai')
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        use('glepnir/dashboard-nvim')
        use('ahmedkhalf/project.nvim')
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
        --------------------- LSP --------------------
        use('williamboman/nvim-lsp-installer')
        -- Lspconfig
        use({ 'neovim/nvim-lspconfig' })
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- ui
        use('onsails/lspkind-nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        -- code formating
        use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        use({
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup({})
            end,
        })
        use('numToStr/Comment.nvim')
        use('b0o/schemastore.nvim')
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
        -- Rust 增强
        use('simrat39/rust-tools.nvim')
        -- 函数、类导航栏
        use('simrat39/symbols-outline.nvim')
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
