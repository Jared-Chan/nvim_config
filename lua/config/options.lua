local set = vim.opt
---------------- vim options  ----------------
set.number = true  -- shows line numbers
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true -- make tabs spaces
set.autoindent = true -- auto indent
set.cindent = true
set.shiftwidth = 4 -- autoindent width

set.rnu = true
set.number = true

set.wildmenu = true -- cycle through files in command prompt ie: ~/.vim/<TAB

set.showmatch = true -- show matching parenthese

set.incsearch = true -- search as characters are entered 
set.hlsearch = true -- highlight mathches

set.colorcolumn = "80" -- deadcolumn


vim.cmd.colorscheme "catppuccin-mocha"
