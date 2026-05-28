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
      local on_attach = require("config.lsp").on_attach

      vim.lsp.config("rust_analyzer", { on_attach = on_attach })
      vim.lsp.config("pyright", { on_attach = on_attach })
      vim.lsp.config("clangd", { on_attach = on_attach })

      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { silent = true })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })
    end,
  },
}
