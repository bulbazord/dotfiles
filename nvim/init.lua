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

vim.cmd.colorscheme('catppuccin')
