--[[ local extension_path = vim.env.HOME .. '/.vscode-server-insiders/extensions/vadimcn.vscode-lldb-1.6.7/' ]]
--[[ local codelldb_path = extension_path .. 'adapter/codelldb' ]]
--[[ local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' ]]

return {
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
        on_initialized = function()
          vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
    },

    --[[ dap = { ]]
    --[[     adapter = require('rust-tools.dap').( ]]
    --[[         codelldb_path, liblldb_path) ]]
    --[[ }, ]]

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = require("witchcraft.lsp.handlers").on_attach,
        capabilities = require("witchcraft.lsp.handlers").capabilities,
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                },
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
