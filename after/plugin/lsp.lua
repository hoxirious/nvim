-- local lsp_zero = require('lsp-zero')
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--     return
-- end
-- local check_backspace = function()
--     local col = vim.fn.col "." - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
--
-- local pid = vim.fn.getpid()
--
-- local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/Omnisharp"
-- require 'lspconfig'.omnisharp.setup {
--     cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll" }, -- Enables support for reading code style, naming convention and analyzer
--     -- settings from .editorconfig.
--     enable_editorconfig_support = true,
--
--     -- If true, MSBuild project system will only load projects for files that
--     -- were opened in the editor. This setting is useful for big C# codebases
--     -- and allows for faster initialization of code navigation features only
--     -- for projects that are relevant to code that is being edited. With this
--     -- setting enabled OmniSharp may load fewer projects and may thus display
--     -- incomplete reference lists for symbols.
--     enable_ms_build_load_projects_on_demand = false,
--
--     -- Enables support for roslyn analyzers, code fixes and rulesets.
--     enable_roslyn_analyzers = false,
--
--     -- Specifies whether 'using' directives should be grouped and sorted during
--     -- document formatting.
--     organize_imports_on_format = true,
--
--     -- Enables support for showing unimported types and unimported extension
--     -- methods in completion lists. When committed, the appropriate using
--     -- directive will be added at the top of the current file. This option can
--     -- have a negative impact on initial completion responsiveness,
--     -- particularly for the first few completion sessions after opening a
--     -- solution.
--     enable_import_completion = true,
--
--     -- Specifies whether to include preview versions of the .NET SDK when
--     -- determining which version to use for project loading.
--     sdk_include_prereleases = true,
--
--     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--     -- true
--     analyze_open_documents_only = false,
-- }
-- lsp_zero.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
--
--     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--
--     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--     vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--     vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--     vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--     vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--     vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
-- end)
-- local function organize_imports()
--     local params = {
--         command = "_typescript.organizeImports",
--         arguments = { vim.api.nvim_buf_get_name(0) },
--         title = ""
--     }
--     vim.lsp.buf.execute_command(params)
-- end
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = { 'lua_ls', 'clangd', 'docker_compose_language_service', 'pyright', 'ts_ls', 'rust_analyzer','intelephense',
--         'omnisharp', 'cssls', 'html' },
--     handlers = {
--         lsp_zero.default_setup,
--         lua_ls = function()
--             local lua_opts = lsp_zero.nvim_lua_ls()
--             require('lspconfig').lua_ls.setup(lua_opts)
--         end,
--         ts_ls = function()
--             require('lspconfig').ts_ls.setup {
--                 on_attach = on_attach,
--                 capabilities = capabilities,
--                 commands = {
--                     OrganizeImports = {
--                         organize_imports,
--                         description = "Organize Imports"
--                     }
--                 }
--             }
--         end,
--         clangd = function()
--             local cmp_nvim_lsp = require "cmp_nvim_lsp"
--
--             require("lspconfig").clangd.setup {
--                 on_attach = on_attach,
--                 capabilities = cmp_nvim_lsp.default_capabilities(),
--                 cmd = {
--                     "clangd",
--                     "--offset-encoding=utf-16",
--                 },
--             }
--         end
--
--     }
-- })
--
--
--
--
-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['omnisharp'].setup {
--     capabilities = capabilities
-- }
--
-- require('lspconfig')['ts_ls'].setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         client.resolved_capabilities.document_formatting = false
--         on_attach(client, bufnr)
--     end
-- }
--
-- require('lspconfig')['pyright'].setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         client.resolved_capabilities.document_formatting = false
--         on_attach(client, bufnr)
--     end
-- }


local lsp_zero = require('lsp-zero')
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

-- vim.lsp.handlers["textDocument/definition"] = function(err, result, ctx, config)
--     if err then
--         vim.notify("Error fetching definition: " .. err.message, vim.log.levels.ERROR)
--         return
--     end
--
--     if not result or vim.tbl_isempty(result) then
--         vim.notify("Definition not found", vim.log.levels.WARN)
--         return
--     end
--
--     -- Safely check for valid location before jumping
--     local location = result[1]
--     if location and location.range then
--         vim.lsp.util.jump_to_location(location)
--     else
--         vim.notify("Invalid location received from LSP server", vim.log.levels.ERROR)
--     end
-- end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'clangd', 'docker_compose_language_service', 'pyright', 'ts_ls', 'rust_analyzer', 'intelephense', 'omnisharp', 'cssls', 'html' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        ts_ls = function()
            require('lspconfig').ts_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                commands = {
                    OrganizeImports = {
                        function()
                            local params = {
                                command = "_typescript.organizeImports",
                                arguments = { vim.api.nvim_buf_get_name(0) },
                                title = ""
                            }
                            vim.lsp.buf.execute_command(params)
                        end,
                        description = "Organize Imports"
                    }
                }
            }
        end,
        clangd = function()
            require("lspconfig").clangd.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "clangd", "--offset-encoding=utf-16" },
            }
        end,
        omnisharp = function()
            require('lspconfig').omnisharp.setup {
                cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll" },
                on_attach = on_attach,
                -- capabilities = capabilities,
                enable_editorconfig_support = true,
                enable_import_completion = true,
                organize_imports_on_format = true,
                sdk_include_prereleases = true,
                enable_ms_build_load_projects_on_demand = false,
                enable_roslyn_analyzers = false,
                analyze_open_documents_only = false,
                enable_metadata_logging = true,
                handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler,
                    ['textDocument/type_definition'] = require('omnisharp_extended').handler,
                    ['textDocument/references'] = require('omnisharp_extended').handler,
                    ['textDocument/implementation'] = require('omnisharp_extended').handler
                }
            }
        end,
        -- Add other servers here as needed
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        -- Copilot Source
        { name = "copilot",  group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        { name = "path",     group_index = 2 },
        { name = "luasnip",  group_index = 2 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab><Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})
