local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

map("i", "<M-a>", " <- ", { buffer = 0 })

-- Slime bindings
map("n", "<CR>", "<Plug>SlimeParagraphSend", { buffer = 0, noremap = true, desc = "Send block" })
map("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })

map(
	"n",
	"<localleader>g",
	"<cmd>SlimeSend1 "
		.. "ggplot2::ggsave("
		.. "file = 'scratch.png',"
		.. "width = 10,"
		.. "height = 8,"
		.. "units = 'in'"
		.. ")"
		.. "<cr>",
	{ buffer = 0, noremap = true, desc = "ggsave" }
)

map("n", "<localleader>b", "<cmd>SlimeSend1 hgd_browse()<cr>", { buffer = 0, desc = "viewer" })

map("n", "localleader>w", function()
	vim.ui.input({ prompt = "Write to file: " }, function(input)
		if input and input ~= "" then
			vim.cmd("SlimeSend1 fwrite(as.data.table(" .. input .. ", keep.rownames = FALSE), file = './scratch.csv')")
		end
	end)
end, { buffer = 0, noremap = true, desc = "write csv" })

-- Calls R function on user input
local function r_popup_command(cmd)
	local function on_confirm(input)
		if input and input ~= "" then
			vim.cmd("SlimeSend1 " .. cmd .. "(" .. input .. ")")
		end
	end

	vim.ui.input({ prompt = cmd .. "(): " }, on_confirm)
end

-- Map common R commands to <localleader> + key
local popup_cmds = {
	["s"] = "str",
	["k"] = "skimr::skim",
	["u"] = "unique",
	["y"] = "summary",
	["h"] = "pclih",
	["x"] = "pclibx",
	["c"] = "print",
	["i"] = "pak::pak",
	["l"] = "library",
}

for key, cmd in pairs(popup_cmds) do
	map("n", "<localleader>" .. key, function()
		r_popup_command(cmd)
	end, { buffer = 0, noremap = true, desc = cmd })
end

-- Writes environment summary to ~/.local/cache/r_env_overview.md
vim.keymap.set("n", "<localleader>e", "<cmd>SlimeSend1 eo()<cr>", {
	buffer = 0,
	noremap = true,
	desc = "Write env",
})

vim.keymap.set("n", "<localleader>E", "<cmd>tabnew | e ~/.local/cache/r_env_overview.md<cr>", {
	buffer = 0,
	noremap = true,
	desc = "View env",
})

-- R Object Preview
-- Uses treesitter to grab object under cursor and display preview in split
local function r_object_preview()
	-- Get the R object name under cursor using treesitter
	local ts = vim.treesitter
	local node = ts.get_node()

	if not node then
		vim.notify("No treesitter node found under cursor", vim.log.levels.WARN)
		return
	end

	-- Traverse up to find the base identifier (handles df$col -> df)
	local obj_name = nil
	local current = node

	while current do
		local node_type = current:type()

		-- If we hit a subset operation ($ or [), get the parent's first child (the base object)
		if node_type == "extract_operator" or node_type == "subset" or node_type == "subset2" then
			local parent = current:parent()
			if parent then
				for child in parent:iter_children() do
					if child:type() == "identifier" then
						obj_name = ts.get_node_text(child, 0)
						break
					end
				end
			end
			break
		end

		-- If we're on a simple identifier, use it
		if node_type == "identifier" then
			-- Check if parent is namespace_operator (pkg::func) - skip those
			local parent = current:parent()
			if parent and parent:type() == "namespace_operator" then
				vim.notify("Cannot preview package functions", vim.log.levels.INFO)
				return
			end
			obj_name = ts.get_node_text(current, 0)
			break
		end

		current = current:parent()
	end

	if not obj_name or obj_name == "" then
		vim.notify("Could not identify R object under cursor", vim.log.levels.WARN)
		return
	end

	-- Call R preview function (defined in ~/.config/R/utilities.r)
	-- Function is loaded automatically when R starts via .Rprofile
	local r_preview_func = string.format('obj_preview("%s")', obj_name)

	-- Send R code to terminal via vim-slime
	vim.fn["slime#send"](r_preview_func)

	-- Wait briefly for R to write the file, then open in split
	local cache_file = vim.fn.expand("~/.local/cache/r_obj_preview.md")

	vim.defer_fn(function()
		-- Check if file exists and has content
		local file = io.open(cache_file, "r")
		if not file then
			vim.notify(string.format("Object '%s' not found in R environment", obj_name), vim.log.levels.ERROR)
			return
		end

		local content = file:read("*all")
		file:close()

		-- Check for error message in content
		if content:match("^Error:") then
			vim.notify(content:match("^Error: (.+)"), vim.log.levels.ERROR)
			return
		end

		-- Create ephemeral split buffer with fixed height
		vim.cmd("split")
		vim.cmd("resize 15")

		-- Create scratch buffer
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_win_set_buf(0, buf)

		-- Set buffer name first
		vim.api.nvim_buf_set_name(buf, string.format("[R Preview: %s]", obj_name))

		-- Set buffer options for ephemeral behavior
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].bufhidden = "wipe"
		vim.bo[buf].buflisted = false
		vim.bo[buf].swapfile = false
		vim.bo[buf].filetype = "markdown"
		vim.bo[buf].modifiable = true

		-- Read file content and load into buffer
		local lines = vim.fn.readfile(cache_file)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

		-- Make buffer read-only after loading content
		vim.bo[buf].modifiable = false
		vim.bo[buf].readonly = true

		-- Add quick-close keymap
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = buf,
			nowait = true,
			desc = "Close preview",
		})
	end, 250) -- 250ms delay to allow R to write file
end

-- Preview R object under cursor
vim.keymap.set("n", "<localleader>o", r_object_preview, {
	buffer = 0,
	noremap = true,
	desc = "Preview obj",
})

-- Auto-correct
vim.cmd([[
  iabbrev <buffer> true TRUE
  iabbrev <buffer> True TRUE
  iabbrev <buffer> tRue TRUE
  iabbrev <buffer> trUe TRUE
  iabbrev <buffer> truE TRUE
  iabbrev <buffer> TRue TRUE
  iabbrev <buffer> TrUe TRUE
  iabbrev <buffer> TruE TRUE
  iabbrev <buffer> tRUe TRUE
  iabbrev <buffer> tRuE TRUE
  iabbrev <buffer> TRuE TRUE
  iabbrev <buffer> tRUE TRUE
  iabbrev <buffer> false FALSE
  iabbrev <buffer> False FALSE
  iabbrev <buffer> fAlse FALSE
  iabbrev <buffer> faLse FALSE
  iabbrev <buffer> falSe FALSE
  iabbrev <buffer> falsE FALSE
  iabbrev <buffer> FAlse FALSE
  iabbrev <buffer> FaLse FALSE
  iabbrev <buffer> FalSe FALSE
  iabbrev <buffer> FalsE FALSE
  iabbrev <buffer> FALse FALSE
  iabbrev <buffer> FaLSe FALSE
  iabbrev <buffer> FaLsE FALSE
  iabbrev <buffer> FALSe FALSE
  iabbrev <buffer> FaLSE FALSE
  iabbrev <buffer> FAlSE FALSE
  iabbrev <buffer> FAlsE FALSE
  iabbrev <buffer> fALSE FALSE
  iabbrev <buffer> null NULL
  iabbrev <buffer> Null NULL
  iabbrev <buffer> nUll NULL
  iabbrev <buffer> nuLl NULL
  iabbrev <buffer> nulL NULL
  iabbrev <buffer> NUll NULL
  iabbrev <buffer> NuLl NULL
  iabbrev <buffer> NulL NULL
  iabbrev <buffer> nULl NULL
  iabbrev <buffer> NULl NULL
  iabbrev <buffer> NuLL NULL
  iabbrev <buffer> nULL NULL
]])

-- Indentation
vim.g.r_indent_align_args = 0 -- else: args on newline, aligned w/ (
vim.bo.shiftwidth = 2 -- 2 space convention
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]

local wk = require("which-key")
wk.add({
	{ "<localleader>", icon = "󰟔  ", group = "R..." },
	{ "<localleader>G", mode = "n" },
	{ "<localleader>v", mode = "n" },
	{ "<localleader>w", mode = "n" },
	{ "<localleader>s", mode = "n" },
	{ "<localleader>l", mode = "n" },
	{ "<localleader>k", mode = "n" },
	{ "<localleader>u", mode = "n" },
	{ "<localleader>y", mode = "n" },
	{ "<localleader>h", mode = "n" },
	{ "<localleader>p", mode = "n" },
	{ "<localleader>b", mode = "n" },
	{ "<localleader>o", mode = "n" },
})
