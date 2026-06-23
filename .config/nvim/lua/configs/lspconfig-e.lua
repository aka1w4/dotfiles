-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require("lspconfig.util")

-- local lspconfig = require "lspconfig"
local servers = { "gopls", "zls", "rust_analyzer", "nimls",  "jdtls", "clangd", "cmake-language-server"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- ganti blok asm_lsp kamu dengan ini
lspconfig.asm_lsp.setup{
  --cmd = { vim.fn.expand("~/.cargo/bin/asm-lsp") },
  --cmd = { "asm-lsp" },
  filetypes = { "asm", "s", "S" },
  root_dir = vim.fn.expand("%:p:h"),
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
   default_config = {
      --assembler = "nasm",
      --instruction_set = "x86-64",
      --compiler = "nasm -felf64",
    },
  }
}


-- lspconfig.pylsp.setup({
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           maxLineLength = 180
--         }
--       }
--     }
--   }
-- })

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    }
  }
})



lspconfig.clangd.setup({
  --cmd = { "/home/aka/.nix-profile/bin/clangd"},
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      --sfallbackFlags = { "--std=c++20" },
    },
  }
})

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,

  settings = {
    Lua = {
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  },
}
