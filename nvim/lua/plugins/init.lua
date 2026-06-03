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
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function open_multi(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selections = picker:get_multi_selection()
        if #selections == 0 then
          actions.select_default(prompt_bufnr)
          return
        end

        actions.close(prompt_bufnr)
        for _, entry in ipairs(selections) do
          local filename = entry.path or entry.filename or entry[1]
          if filename then
            vim.cmd("edit " .. vim.fn.fnameescape(filename))
          end
        end
      end

      local function open_multi_vsplit(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selections = picker:get_multi_selection()
        if #selections == 0 then
          actions.select_vertical(prompt_bufnr)
          return
        end

        actions.close(prompt_bufnr)
        for _, entry in ipairs(selections) do
          local filename = entry.path or entry.filename or entry[1]
          if filename then
            vim.cmd("vsplit " .. vim.fn.fnameescape(filename))
          end
        end
      end

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = open_multi,
              ["<C-v>"] = open_multi_vsplit,
            },
            n = {
              ["<CR>"] = open_multi,
              ["<C-v>"] = open_multi_vsplit,
            },
          },
        },
      })
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
