require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html-lsp",
  --"cssls",
  "pyright",
  "gopls",
  "zls",
  "rust_analyzer",
  "clangd",
  "lua-language-server",
  "neocmakelsp",
  "glsl_analyzer",
  "vtsls",
  "arduino-language-server"
}

vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--query-driver=/home/aka/.espressif/tools/**/bin/*",
    "--compile-commands-dir=build",
  },
   
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

vim.lsp.config("arduino-language-server", {
  cmd = {
    "/usr/sbin/arduino-language-server",
    "-clangd", "/usr/sbin/clangd",
    "-cli", "/usr/sbin/arduino-cli",
    "-cli-config", vim.fn.expand("$HOME/.arduino15/arduino-cli.yaml"),
    "-fqbn", "esp32:esp32:esp32",
  },

  filetypes = { "arduino" },

  root_markers = { "sketch.yaml", ".git" },
})

vim.lsp.enable(servers)
