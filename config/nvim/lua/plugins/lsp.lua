-- Symbols and misc config
local signs = { Error = " X", Warn = " !", Hint = " ?", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numthl = hl})
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "[^]",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

local lspconfig = require('lspconfig')

local M = {}
M.on_attach = function(client, _)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
  client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local servers = { "html", "clangd", "marksman", "cssls"}
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
end
lspconfig.lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      diagnostics = {
        globals = { "vim", "awesome", "client", "screen", "mouse", "tag" },
      },
    },
  }
}
return M
