vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 250
-- vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"
vim.opt.statusline = table.concat({
  "%<%f",      -- Truncated filename
  " %h%m%r",   -- Flags for help, modified, readonly
  "%{FugitiveStatusline()}", -- Fugitive status
  "%=",        -- Right-align
  "%-14.(%l,%c%V%)", -- Line, column, and virtual column
  " %P",       -- Percentage through file
}, " ")

