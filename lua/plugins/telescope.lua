local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

telescope.load_extension("media_files")
telescope.load_extension("harpoon")
telescope.load_extension("fzf")

telescope.setup({
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf", "webm"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
})

