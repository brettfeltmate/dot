return {
	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = lint.linters_by_ft or {}

			lint.linters_by_ft["clojure"] = nil
			lint.linters_by_ft["dockerfile"] = nil
			lint.linters_by_ft["inko"] = nil
			lint.linters_by_ft["janet"] = nil
			lint.linters_by_ft["rst"] = nil

			lint.linters_by_ft["python"] = { "ruff" }

			-- lint.linters_by_ft["r"] = { "styler" }
			-- lint.linters_by_ft["r"].styler = {
			-- 	cmd = "R",
			-- 	args = {'-e', 'styler::style_file(stdin())', '--silent', '--slave'},
			--
			-- }
			-- lint.linters_by_ft["lua"] = { "selene" }

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
