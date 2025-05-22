return {
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "rhysd/vim-clang-format",
  "rust-lang/rust.vim",
  { "cryptomilk/nightcity.nvim",
    style = "kabuki",
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
  }
}
