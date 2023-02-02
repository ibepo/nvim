local options = {

    clipboard = "unnamedplus",
    mouse = "a",

    expandtab = true,
    smarttab = true,
    shiftwidth = 4,
    tabstop = 4,

    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,
    wrap = false,
    scrolloff = 8,

    fileencodings = "utf-8,gbk",
    termguicolors = true,

    number = true,
    numberwidth = 4,
    relativenumber = true,

    cursorline = true,
    cursorcolumn = false,

    hidden = true,
    list = false,

    undofile = true,
    showmode = false,
    showtabline = 2,
    smartindent = true,
    autoindent = true,
    swapfile = false,
    cmdheight = 1,
    updatetime = 50, -- faster completion (4000ms default)
    foldenable = false,
    foldlevel = 99
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
