
require("config.lazy")
require("config.options")

require('lualine').setup {
    -- options = {
    --     tabline = {
    --       lualine_a = {'buffers'},
    --       lualine_b = {'branch'},
    --       lualine_c = {'filename'},
    --       lualine_x = {},
    --       lualine_y = {},
    --       lualine_z = {'tabs'}
    --     }
    -- }
}

require('barbar').setup {
    -- options = {
    -- }
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.clangd.setup { coq.lsp_ensure_capabilities {
    cmd = {'clangd', '--background-index', '--clang-tidy'}, -- '--log=verbose'},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    init_options = {
      fallbackFlags = { '-std=c++17' },
    },
}
} 

local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('deadcolumn').setup()
