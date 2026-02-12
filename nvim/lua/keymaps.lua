local map = vim.keymap.set
local opts = { silent = true }

-- clear search highlight
map("n", "\\", ":nohlsearch<CR>", opts)

-- jump to end of line
map({ "n", "v" }, "-", "$", opts)


-- split navigation
map({ "n", "v" }, "<C-h>", "<C-w>h", opts)
map({ "n", "v" }, "<C-j>", "<C-w>j", opts)
map({ "n", "v" }, "<C-k>", "<C-w>k", opts)
map({ "n", "v" }, "<C-l>", "<C-w>l", opts)

-- buffer navigation
map("n", "<C-m>", ":bnext<CR><C-g>", opts)
map("n", "<C-n>", ":bprevious<CR><C-g>", opts)
map("n", "<leader>d", ":confirm bdelete<CR>", opts)

-- buffer splits
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>s", ":split<CR>", opts)

-- faster scrolling
map({ "n", "v" }, "<C-e>", "10<C-e>", opts)
map({ "n", "v" }, "<C-y>", "10<C-y>", opts)

-- keep visual selection when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- search highlighted text
map("v", "//", 'y/\\V<C-R>"<CR>', opts)

-- toggle relative number
map("n", "<leader>nt", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, opts)

-- plugin managers
map("n", "<leader>L", "<cmd>Lazy<CR>", opts)
map("n", "<leader>M", "<cmd>Mason<CR>", opts)

-- paste without overwriting default register
map("x", "P", "pgvy", opts)

-- comment.nvim [leader+c]
map("n", "<leader>cc", function()
  require("Comment.api").toggle.linewise.current()
end, opts)
map("n", "<leader>cb", function()
  require("Comment.api").toggle.blockwise.current()
end, opts)
map("v", "<leader>cc", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)
map("v", "<leader>cb", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, opts)

-- Telescope [ctrl+p/f]
map("n", "<C-P>", function() require("telescope.builtin").git_files() end, opts)
map("n", "<leader>p", function() require("telescope.builtin").find_files() end, opts)
map("n", "<C-F>", function() require("telescope.builtin").live_grep() end, opts)
-- CtrlSF-like mappings (roughly equivalent)
map("n", "<leader>f", function() require("telescope.builtin").live_grep() end, opts)
map("v", "<leader>f", function()
  -- use visual selection as grep string
  require("telescope.builtin").grep_string({ search = vim.fn.getreg('"') })
end, opts)

-- Aerial (Tagbar replacement)
map("n", "<C-_>", function() vim.cmd("AerialToggle") end, opts)

-- Neo-tree (NERDTree replacement)
map("n", "<C-q>", "<cmd>Neotree toggle<CR>", opts)
map("n", "<leader>tq", "<cmd>Neotree filesystem reveal<CR>", opts)

-- DiffViewer [leader+g]
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
-- Fugitive (from old vimrc) [leader+g]
map("n", "<leader>gG", ":GBrowse<CR>", opts)
map("n", "<leader>gg", ":GBrowse!<CR>", opts)
map("n", "<leader>gb", ":Git blame<CR>", opts)
map("n", "<leader>gc", ":Copilot panel<CR>", opts)

-- LSP
map("n", "<leader>lc", vim.lsp.buf.rename, opts)
