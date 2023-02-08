local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", ";a", mark.add_file)
vim.keymap.set("n", ";h", ui.toggle_quick_menu)
vim.keymap.set("n", ";o", ui.nav_next)
vim.keymap.set("n", ";i", ui.nav_prev)
vim.keymap.set("n", ";<tab>", function()
	local toggle = true
	if toggle then
		ui.nav_prev()
		toggle = not toggle
	else
		toggle = not toggle
		ui.nav_prev()
	end
end)

vim.keymap.set("n", ";1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", ";2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", ";3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", ";4", function()
	ui.nav_file(4)
end)
