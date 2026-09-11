return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    -- Tab accepts the selected completion (and jumps forward through
    -- snippet placeholders); falls back to normal Tab/indent behavior
    -- when no menu is open. Unlike "default", <C-y> is NOT bound here.
    keymap = { preset = "super-tab" },
    completion = {
      documentation = { auto_show = true },
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
