local plugins = {
  -- core IDE
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({})
    end,
  },
  -- colorscheme
  { "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("vscode")
    end,
  },

  -- status line plugin
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { icons_enabled = true } })
    end,
  },

  -- file tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = { width = 30 },
        filesystem = { follow_current_file = { enabled = true } },
      })
    end,
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
  {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("aerial").setup({})
    end,
  },

  -- git tools
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup({})
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = true, auto_refresh = true },
      })
    end,
  },

  -- commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
      })
    end,
  },
}

vim.list_extend(plugins, require("plugins.treesitter"))
vim.list_extend(plugins, require("plugins.lsp"))

return plugins
