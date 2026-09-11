return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>E", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current file in explorer" },
  },
  opts = {
    filters = { dotfiles = false },
    view = { width = 32 },
  },
}
