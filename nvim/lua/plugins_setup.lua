local Plug = vim.fn['plug#']
vim.call('plug#begin')

  Plug 'wellle/context.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'folke/tokyonight.nvim'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'APZelos/blamer.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sharkdp/fd'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-tree/nvim-web-devicons'
  vim.cmd [[
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
  ]]

  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'nvim-lualine/lualine.nvim'

  -- language server completion
    Plug 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- end language server completion
  --
  
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'airblade/vim-gitgutter'
  vim.cmd [[
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  ]]

  Plug 'stevearc/aerial.nvim'
  Plug 'David-Kunz/gen.nvim'

    -- Required by avante.nvim
  Plug 'stevearc/dressing.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'MeanderingProgrammer/render-markdown.nvim'
  vim.cmd [[
    Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
  ]]
  -- Optional deps for avante.nvim
  Plug 'HakonHarnes/img-clip.nvim'
  Plug 'zbirenbaum/copilot.lua'


  -- AI used at work
  Plug 'augmentcode/augment.vim'

vim.call('plug#end')
