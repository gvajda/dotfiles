-- =============================================================================
-- Neovim Options
-- =============================================================================
-- LazyVim sets sensible defaults. Add your customizations here.
-- Full options list: :help option-list

local opt = vim.opt

-- -----------------------------------------------------------------------------
-- UI
-- -----------------------------------------------------------------------------

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Keep cursor centered when scrolling
opt.scrolloff = 8

-- Show column at 100 characters
opt.colorcolumn = "100"

-- Better splits
opt.splitbelow = true
opt.splitright = true

-- -----------------------------------------------------------------------------
-- Editing
-- -----------------------------------------------------------------------------

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- -----------------------------------------------------------------------------
-- System
-- -----------------------------------------------------------------------------

-- Enable mouse
opt.mouse = "a"

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Faster completion
opt.updatetime = 250

-- Persistent undo
opt.undofile = true

-- Disable swap files (LazyVim default, but being explicit)
opt.swapfile = false
