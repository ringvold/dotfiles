local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

require'lspconfig'.elixirls.setup{
    -- Unix
    cmd = { "/Users/harald/code/tools/elixir-ls/language_server.sh" };
}
