-- Some options are required to be set before initializing lazy.
require("config.options")

require("config.lazy")

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "bash,c,cmake,cpp,html,java,json,lua,make,markdown,ninja,objc,python,rust,swift,vim" },
	callback = function()
		vim.treesitter.start()
	end,
})
