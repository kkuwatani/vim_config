return {
  -- language server protocol
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "single",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "pyright", "clangd" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("config.lsp").setup()

      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")

      vim.keymap.set("n", "<leader>lh", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
        vim.notify("Inlay hints " .. (enabled and "disabled" or "enabled"))
      end, { silent = true, desc = "Toggle inlay hints" })

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { silent = true })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })
    end,
  },
}
