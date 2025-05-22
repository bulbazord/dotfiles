-- Set the leader key to ,
-- Note: This must be done before loading lazy!
vim.g.mapleader = ','
vim.g.localmapleader = ','

-- Formatting settings --
-- Line numbers
vim.o.number = true

-- Line wrapping is broken up at the word boundary
vim.o.linebreak = true
-- Line wrapping preserves indentation of original line
vim.o.breakindent = true

-- Match indentation levels when creating new line
vim.o.autoindent = true
-- But be smart about indentation level
vim.o.smartindent = true
-- Number of spaces to insert when shifting text around.
vim.o.shiftwidth = 2
-- Use shiftwidth when <Tab> is pressed in insert mode
vim.o.smarttab = true
-- Tab characters should be converted into spaces
vim.o.expandtab = true

-- Number of columns in a tab
vim.o.tabstop = 2
-- Number of columns in a tab (insert mode)
vim.o.softtabstop = 2

-- Align braces with case keyword
vim.o.cinoptions = "l1"

-- Search settings --
-- Incremental search
vim.o.incsearch = true
-- Highlight search results
vim.o.hlsearch = true
-- Ignore search case
vim.o.ignorecase = true
-- Except when upper case letters are explicitly used
vim.o.smartcase = true

-- Filetype settings
vim.cmd.filetype("plugin indent on")
vim.cmd.syntax("on")
vim.cmd.syntax("sync fromstart")
