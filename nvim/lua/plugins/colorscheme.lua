return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "sainnhe/sonokai" },
  { "ChristianChiarulli/nvcode-color-schemes.vim" },
  { "mhartington/oceanic-next" },
  { "glepnir/zephyr-nvim" },
  { "folke/tokyonight.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
