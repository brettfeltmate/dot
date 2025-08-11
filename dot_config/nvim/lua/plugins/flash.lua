return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	---@diagnostic disable: missing-fields
	opts = {
		-- search = {
		-- 	mode = function(str)
		-- 		return "\\<" .. str
		-- 	end,
		-- },
		label = {
			uppercase = false,
			current = false,
			after = false,
			before = true,
			style = "inline",
		},
		modes = {
			search = { enabled = false },
			char = {
				jump_labels = true,
				char_actions = function(motion)
					return {
						-- [";"] = "right", -- set to `right` to always go right
						-- [","] = "left", -- set to `left` to always go left
						-- clever-f style
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
						-- jump2d style: same case goes next, opposite case goes prev
						-- [motion] = "next",
						-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
			},
		},
	},
	-- stylua: ignore
	-- keys = {
	--   { "%", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	--   -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	--   -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	-- },
}
