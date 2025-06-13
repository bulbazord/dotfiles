return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true }, function(err)
						if not err then
							local mode = vim.api.nvim_get_mode().mode
							if vim.startswith(string.lower(mode), "v") then
								vim.api.nvim_feedkeys(
									vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
									"n",
									true
								)
							end
						end
					end)
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				objc = { "clang-format" },
				objcpp = { "clang-format" },
				java = { "clang-format" },
				python = { "black" },
			},
		},
	},
}
