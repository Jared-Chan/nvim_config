
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

local coq = require "coq"

vim.lsp.config("clangd", coq.lsp_ensure_capabilities {
    cmd = {'clangd', '--background-index', '--clang-tidy'}, -- '--log=verbose'},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    init_options = {
      fallbackFlags = { '-std=c++20' },
    },
}
)
vim.lsp.enable("clangd")
 

vim.lsp.config("vale_ls", coq.lsp_ensure_capabilities {
    cmd = {'vale-ls'}, 
    filetypes = { "markdown", "text", "tex", "rst" },
}
) 
vim.lsp.enable("vale_ls")

vim.lsp.config("verible", coq.lsp_ensure_capabilities {
    cmd = { "verible-verilog-ls" },
    filetypes = { "systemverilog", "verilog" },
    root_dir = function(fname)
      return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
    end,
}
) 
vim.lsp.enable("verible")

vim.lsp.config("ruff", coq.lsp_ensure_capabilities {
    cmd = {"ruff", "server"}, 
    filetypes = { "python" },
    init_options = {
      settings = {
        -- Server settings should go here
      }
    }
}
)
vim.lsp.enable("ruff")

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

-- Custom keymaps --

vim.keymap.set('n', '<leader>va', 
               "<cmd>! vale-a <cword> <cr>", 
               { desc = 'Add word to Vale global accept.txt' })

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = 'Go to next LSP error' })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = 'Go to prev LSP error' })

vim.keymap.set('n', '<leader>F', "<cmd>lua vim.lsp.buf.format()<CR>", 
                { desc = 'Format current file'})

vim.filetype.add({
  pattern = {
    ['.*/*.fs'] = 'glsl',
    ['.*/*.vs'] = 'glsl',
    ['.*/*.gs'] = 'glsl',
  },
})

