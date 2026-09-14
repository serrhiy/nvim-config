return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      ignore_whitespace = false,
      delay = 300,
    },
    current_line_blame_formatter = "  <author>, <author_time:%R> - <summary>",

    on_attach = function(buf)
      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
      end

      map("n", "]h", function() gs.nav_hunk("next") end, "Next git hunk")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Previous git hunk")

      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line (full popup)")
      map("n", "<leader>gB", gs.blame, "Blame whole file")
      map("n", "<leader>gt", gs.toggle_current_line_blame, "Toggle inline blame")

      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gd", gs.diffthis, "Diff against index")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff against last commit")

      map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
      map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selection")
      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selection")
    end,
  },
}
