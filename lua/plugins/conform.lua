return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { "prettierd", "prettier" },
                c = { "clangd_format" },
                cpp = { "clangd_format" },
                typescript = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
                css = { "prettierd", "prettier" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_fallback = true, range = range, stop_after_first = true })
        end, { range = true })
    end,
}
