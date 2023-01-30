local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local startify = require("alpha.themes.startify")
local fortune = require("alpha.fortune")

local logo = {
    type = "text",

    val = {[[ ╭━━╮╱╭━━╮╱╱╭━━━╮╱╭╮╱╱╭╮╱╭━━╮╱╭━╮╭━╮╱╱ ]],
           [[╱╰┫┣╯╱┃╭╮┃╱╱┃╭━╮┃╱┃╰╮╭╯┃╱╰┫┣╯╱┃┃╰╯┃┃╱╱]],
           [[╱╱┃┃╱╱┃╰╯╰╮╱┃╰━╯┃╱╰╮┃┃╭╯╱╱┃┃╱╱┃╭╮╭╮┃╱╱]],
           [[╱╱┃┃╱╱┃╭━╮┃╱┃╭━━╯╱╱┃╰╯┃╱╱╱┃┃╱╱┃┃┃┃┃┃╱╱]],
           [[╱╭┫┣╮╱┃╰━╯┃╱┃┃╱╱╱╱╱╰╮╭╯╱╱╭┫┣╮╱┃┃┃┃┃┃╱╱]],
           [[╱╰━━╯╱╰━━━╯╱╰╯╱╱╱╱╱╱╰╯╱╱╱╰━━╯╱╰╯╰╯╰╯  ]]},
    opts = {
        position = "center",
        hl = "DevIconVim"
    }
}

local function info_value()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date(" %Y-%m-%d")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return "  " .. datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

local info = {
    type = "text",
    val = info_value(),
    opts = {
        hl = "DevIconVim",
        position = "center"
    }
}

local message = {
    type = "text",
    val = fortune({
        max_width = 60
    }),
    opts = {
        position = "center",
        hl = "Statement"
    }
}

local header = {
    type = "group",
    val = {logo, info}
}

local mru = {
    type = "group",
    val = {{
        type = "text",
        val = "Recent files",
        opts = {
            hl = "String",
            shrink_margin = false,
            position = "center"
        }
    }, {
        type = "padding",
        val = 1
    }, {
        type = "group",
        val = function()
            return {startify.mru(1, vim.fn.getcwd(), 5)}
        end
    }},
    position = "center"
}

local buttons = {
    type = "group",
    val = {{
        type = "text",
        val = "Actions",
        opts = {
            hl = "String",
            shrink_margin = false,
            position = "center"
        }
    }, {
        type = "padding",
        val = 1
    }, startify.button("e", "פּ  New file", ":ene <BAR> startinsert<CR>"),
           startify.button("f", "  Find file", "<cmd>lua require('telescope.builtin').find_files()<CR>"),
           startify.button("g", "縷 Live grep",
        "<cmd>lua require('telescope.builtin').live_grep({shorten_path=true})<CR>"),
           startify.button("d", "  Dotfiles",
        "<cmd>lua require('telescope.builtin').find_files({ search_dirs = { os.getenv('HOME') .. '/dotfiles' } })<CR>"),
           startify.button("c", "  NvimConfig", ":e ~/.config/nvim/init.lua <CR>"),
           startify.button("u", "  Update plugins", ":PackerSync<CR>"), startify.button("q", "ﰌ  Quit", ":qa<CR>")},
    opts = {
        position = "center"
    }
}

local config = {
    layout = {header, {
        type = "padding",
        val = 1
    }, mru, {
        type = "padding",
        val = 1
    }, buttons}
}

alpha.setup(config)
