require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'auto',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'moon',
    bold_vert_split = true,
    dim_nc_background = true,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
        -- or set all headings at once
        -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
        ColorColumn = { bg = 'rose' },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'love', bg = 'love', blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = 'gold', inherit = false },
    }
})
local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = latte,
        dark = mocha,
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
    term_colors = true,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        all = {
            text = "#ffffff",
        },
        latte = {
            base = "#ff0000",
            mantle = "#242424",
            crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = {
            text = "#F4CDE9",
            subtext1 = "#DEBAD4",
            subtext0 = "#C8A6BE",
            overlay2 = "#B293A8",
            overlay1 = "#9C7F92",
            overlay0 = "#866C7D",
            surface2 = "#705867",
            surface1 = "#5A4551",
            surface0 = "#44313B",
            base = "#352939",
            mantle = "#211924",
            crust = "#1a1016",
        },
    },
    custom_highlights = function(colors)
        return {
            -- custom
            PanelHeading = {
                fg = colors.lavender,
                bg = colors.none or colors.crust,
                style = { "bold", "italic" },
            },

            -- lazy.nvim
            LazyH1 = {
                bg = colors.none or colors.peach,
                fg = colors.lavender or colors.base,
                style = { "bold" },
            },
            LazyButton = {
                bg = colors.none,
                fg = colors.overlay0 or colors.subtext0,
            },
            LazyButtonActive = {
                bg = colors.none or colors.overlay1,
                fg = colors.lavender or colors.base,
                style = { " bold" },
            },
            LazySpecial = { fg = colors.sapphire },

            CmpItemMenu = { fg = colors.subtext1 },
            MiniIndentscopeSymbol = { fg = colors.overlay0 },

            FloatBorder = {
                fg = colors.overlay1 or colors.mantle,
                bg = colors.none or colors.mantle,
            },

            FloatTitle = {
                fg = colors.lavender or colors.base,
                bg = colors.none or colors.lavender,
            },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        telescope = {
            enabled = true,
            style = "nvchad"
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        markdown = true,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

function ColorMyPencils(color)
    color = color or "catppuccin" -- rose-pine OR 2076 OR aurora OR catppuccin
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
