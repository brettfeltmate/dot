return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	event = "BufRead",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "x" }, "<A-u>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<A-d>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<M-U>", function()
			mc.lineSkipCursor(-1)
		end)
		set({ "n", "x" }, "<M-D>", function()
			mc.lineSkipCursor(1)
		end)

		set({ "n" }, "ga", function()
			mc.addCursorOperator()
		end)

		-- Mappings defined in a keymap layer only apply when there are
		-- multiple cursors. This lets you have overlapping mappings.
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one.
			layerSet({ "n", "x" }, "<A-p>", mc.prevCursor)
			layerSet({ "n", "x" }, "<A-n>", mc.nextCursor)

			-- Delete the main cursor.
			layerSet({ "n", "x" }, "<A-x>", mc.deleteCursor)

			-- Align cursors
			layerSet({ "n", "x" }, "<A-a>", mc.alignCursors)

			-- Rotate the text contained in each visual selection between cursors.
			layerSet("x", "<A-r>", function()
				mc.transposeCursors(1)
			end)
			layerSet("x", "<M-R>", function()
				mc.transposeCursors(-1)
			end)
			-- Increment/decrement sequences, treaing all cursors as one sequence.
			layerSet({ "n", "x" }, "<C-a>", mc.sequenceIncrement)
			layerSet({ "n", "x" }, "<C-x>", mc.sequenceDecrement)

			-- Enable and clear cursors using escape.
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)
	end,
}
