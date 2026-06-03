-- visuals / behavior
vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.hidden = true
vim.opt.history = 100

-- formatting
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- mouse
vim.opt.mouse = "a"

-- backspace in insert
vim.opt.backspace = { "indent", "eol", "start" }

-- completion
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
