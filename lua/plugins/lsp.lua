return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf = args.buf
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Goto definition")
        map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
        map("n", "gr", vim.lsp.buf.references, "Goto references")
        map("n", "K", vim.lsp.buf.hover, "Hover docs")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = buf })
        end
      end,
    })

    -- Tells clangd what completion features Neovim can actually render
    -- (snippets, doc previews, etc.) -- without this it falls back to a
    -- minimal built-in default, which is why completion looked so bare
    -- before blink.cmp was wired in here.
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "-j=4",
      },
      capabilities = capabilities,
    })
    vim.lsp.enable("clangd")
  end,
}
