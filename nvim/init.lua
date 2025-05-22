-- Some options are required to be set before initializing lazy.
require("config.options")

require("config.lazy")

-- Formatting settings
local formatting_commands = vim.api.nvim_create_augroup("FormattingCommands", {
  clear = true
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "c,cpp,objc,java",
  command = "nnoremap <buffer><Leader>f :ClangFormat<cr>"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "c,cpp,objc,java",
  command = "vnoremap <buffer><Leader>f :ClangFormat<CR>"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "rust",
  command = "nnoremap <buffer><Leader>f :RustFmt<cr>"
})

vim.cmd.colorscheme('nightcity')

-- vim-airline settings
vim.g.airline_theme = 'tomorrow'
-- Needed for nvim 0.11.
-- See: https://github.com/vim-airline/vim-airline/issues/2693
vim.cmd.highlight("statusline cterm=NONE gui=NONE")
