require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "gopls",
  "zls",
  "rust_analyzer",
  "clangd",
  "lua-language-server",
  "cmake-language-server",
  "glsl_analyzer",
}

vim.lsp.enable(servers)
