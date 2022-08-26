local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("LSP Error")
    return
end

require("witchcraft.lsp.lsp-install")
require("witchcraft.lsp.handlers").setup()

