

require 'plugins_setup'
require 'keymaps'
require 'lualine_setup'
require 'telescope'
require 'lspconfig_setup'
require 'completions'
require 'nvimtree_setup'
require 'aerial_setup'
require 'tokyo_night_setup'
require 'gen_nvim_setup'

vim.o.ic = true
vim.o.encoding = 'UTF-8'
vim.opt.swapfile = false
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.expandtab = true
-- vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.wrap = false


vim.o.rnu = true
vim.o.number = true
vim.o.showmatch = true
vim.o.cursorline = true

vim.o.foldmethod = "syntax"



vim.g.transparent_enabled = true
vim.cmd[[colorscheme tokyonight]]

vim.g.blamer_enabled = true

vim.g.netrw_liststyle=3
vim.g.netrw_altv=1

-- for vim-gitgutter
vim.o.updatetime=300
vim.o.signcolumn = 'yes'

vim.o.fixendofline = false

vim.diagnostic.config({
    -- virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})
