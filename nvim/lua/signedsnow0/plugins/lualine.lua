local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "horizon",
	},
	sections = {
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},
	},
})
