-- Alex Langford <nirvashtzero@gmail.com>

local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('rhysd/vim-clang-format')
Plug('rust-lang/rust.vim')
Plug('sonph/onehalf', {['rtp'] = 'vim/'})
Plug('cryptomilk/nightcity.nvim')
vim.call('plug#end')

-- Filetype support
vim.cmd.filetype('plugin indent on')
vim.cmd.syntax('on')
vim.cmd.syntax('sync fromstart')

-- Formatting settings
vim.g.mapleader = ','
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.textwidth = 80
vim.opt.linebreak = true

local formatting_commands = vim.api.nvim_create_augroup("FormattingCommands", {
  clear = true
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "c,cpp,objc",
  command = "nnoremap <buffer><Leader>f :ClangFormat<cr>"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "c,cpp,objc",
  command = "vnoremap <buffer><Leader>f :ClangFormat<CR>"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = formatting_commands,
  pattern = "rust",
  command = "nnoremap <buffer><Leader>f :RustFmt<cr>"
})

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- Color settings
require('nightcity').setup({
  style = 'kabuki',
  terminal_colors = true,
  plugins = { default = false },
  invert_colors = {
    cursor = true,
    diff = true,
    error = true,
    search = true,
    selection = false,
    signs = false,
    statusline = true,
    tabline = false,
  },
  font_style = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    search = { bold = true },
  },
})
vim.cmd.colorscheme('nightcity')

-- vim.cmd.colorscheme("onehalfdark")
-- vim.opt.background = 'dark'
-- vim.opt.termguicolors = true

-- vim-airline settings
vim.opt.laststatus = 2
vim.g.airline_theme = 'tomorrow'
