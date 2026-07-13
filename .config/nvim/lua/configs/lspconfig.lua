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

vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--query-driver=/home/aka/.espressif/tools/**/bin/*",
    "--compile-commands-dir=build",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

vim.lsp.enable(servers)
