-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
            },
            git_placement = "after",
        },
    },
    filters = {
        dotfiles = true,
    },
})
vim.keymap.set("n", "<leader>e", "::NvimTreeFindFileToggle<cr>", {
    desc = "nvim tree find file toggle"
})

-- vim.keymap.set("n", "<leader>bb", ":bprev<cr>", {})
-- vim.keymap.set("n", "<leader>bn", ":bnext<cr>", {})
local tree = {}
tree.open = function()
    require 'bufferline.state'.set_offset(31, 'FileTree')
    require 'nvim-tree'.find_file(true)
end

tree.close = function()
    require 'bufferline.state'.set_offset(0)
    require 'nvim-tree'.close()
end

return tree
