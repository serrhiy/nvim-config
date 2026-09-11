return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- also available: latte (light), frappe, macchiato
    integrations = {
      treesitter = true,
      native_lsp = { enabled = true },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
