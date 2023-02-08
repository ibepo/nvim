local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end
local builtin = require('telescope.builtin')
telescope.load_extension("media_files")
telescope.load_extension("harpoon")
local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},
        color_devicons = true,
        sorting_strategy = "ascending",
        layout_config = {
            -- prompt_position = "top",
            -- horizontal = {
            --     width_padding = 0.04,
            --     height_padding = 0.1,
            --     preview_width = 0.6
            -- },
            vertical = {
                width_padding = 0.05,
                height_padding = 1,
                preview_height = 0.5
            }
        },
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                -- 关闭telescope
                ["<C-c>"] = actions.close,
                -- 搜索列表移动
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                -- 选中后的按tab.vspit,hsplit展示
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                -- 预览页翻页
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key
            }
        }
    },
    pickers = {
        lsp_code_actions = {
            theme = "cursor"
        },
        find_files = {
            theme = "dropdown"
        }
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf", "webm"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
})

-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({
--         search = vim.fn.input("Grep > ")
--     })
-- end)
