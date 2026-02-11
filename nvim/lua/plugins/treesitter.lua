return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      local desired = { "rust", "python", "c", "cpp" }
      ts.install(desired)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
          if vim.treesitter.indentexpr then
            vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
