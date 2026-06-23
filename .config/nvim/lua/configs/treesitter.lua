require("nvim-treesitter.configs").setup {
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc", "html", "css", "python", "cpp", "c"
    },
    highlight = {
      enable = true,
    },
  }
}
