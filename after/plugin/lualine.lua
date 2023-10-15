local palette = require("catppuccin.palettes.init").get_palette()
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        section_separators = '',
        component_separators = '',
        ignore_focus = {},
    },
    sections = {
        lualine_a = {
            {
                "filename",
                path = 1,
                separator = { left = '', right = '' },
                color = { bg = palette.pink, fg = palette.base, gui = "bold" },
                padding = 0,
                shorting_target = 0,
            },
        },
        lualine_b = { {
            'branch',
        }, {
            'diff',
            separator = { right = '' },
        } },

        lualine_c = {},
        lualine_x = {},
        lualine_y = { {
            'progress',
            path = 1,
            separator = { left = '', right = '' },
            color = { bg = palette.pink, fg = palette.base, gui = "bold" },
            padding = 0,
            shorting_target = 0,
        } },
    },
    lualine_z = {
        {
            "%l/%L,%c",
            color = { bg = palette.mantle, fg = palette.text },
            padding = 1,
        },
        {
            "filetype",
            color = { bg = palette.mantle, fg = palette.text },
            padding = 0,
        },
    },
    inactive_sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
                color = { fg = palette.surface1 },
                padding = 1,
                shorting_target = 0,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                "%l/%L,%c",
                color = { fg = palette.surface1 },
                padding = 1,
            },
            {
                "filetype",
                color = { fg = palette.surface1 },
                padding = 0,
            },
        },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
