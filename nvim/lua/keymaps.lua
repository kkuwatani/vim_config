vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { silent = true }

-- clear search highlight
map("n", "\\", ":nohlsearch<CR>", opts)

-- split navigation
map({ "n", "v" }, "<C-h>", "<C-w>h", opts)
map({ "n", "v" }, "<C-j>", "<C-w>j", opts)
map({ "n", "v" }, "<C-k>", "<C-w>k", opts)
map({ "n", "v" }, "<C-l>", "<C-w>l", opts)

-- split line (your S mapping)
map("n", "S", "i<CR><Esc><Right>", opts)

-- buffer navigation
map("n", "<C-m>", ":bnext<CR><C-g>", opts)
map("n", "<C-n>", ":bprevious<CR><C-g>", opts)

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

-- paste without overwriting default register
map("x", "P", "pgvy", opts)

-- Telescope replacements for fzf/ctrlsf
map("n", "<C-P>", function() require("telescope.builtin").git_files() end, opts)
map("n", "<leader>p", function() require("telescope.builtin").find_files() end, opts)
map("n", "<C-F>", function() require("telescope.builtin").live_grep() end, opts)

-- CtrlSF-like mappings (roughly equivalent)
map("n", "<leader>ff", function() require("telescope.builtin").live_grep() end, opts)
map("v", "<leader>ff", function()
  -- use visual selection as grep string
  require("telescope.builtin").grep_string({ search = vim.fn.getreg('"') })
end, opts)

-- Aerial (Tagbar replacement)
map("n", "<C-_>", function() vim.cmd("AerialToggle") end, opts)

-- Neo-tree (NERDTree replacement)
map("n", "<C-q>", "<cmd>Neotree toggle<CR>", opts)

-- DiffViewer
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
