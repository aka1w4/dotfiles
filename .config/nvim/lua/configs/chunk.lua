require("hlchunk").setup {
  chunk = {
    enable = true,
    chunk_filetypes = { "*" },
    use_treesitter = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "┌",
      left_bottom = "└",
      right_arrow = "─",
    },
  },
}
