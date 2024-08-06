if true then
	return {}
end

return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = lint.linters_by_ft or {}

			lint.linters_by_ft["clojure"] = nil
			lint.linters_by_ft["dockerfile"] = nil
			lint.linters_by_ft["inko"] = nil
			lint.linters_by_ft["janet"] = nil
			lint.linters_by_ft["rst"] = nil
			lint.linters_by_ft["text"] = nil
			lint.linters_by_ft["md"] = { "markdownlint" }

			lint.linters_by_ft["python"] = { "ruff" }

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
