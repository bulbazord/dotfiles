return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "html",
        "java",
        "json",
        "lua",
        "make",
        "markdown",
        "ninja",
        "objc",
        "python",
        "rust",
        "swift",
        "vim",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
