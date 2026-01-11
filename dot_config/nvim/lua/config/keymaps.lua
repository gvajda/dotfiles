-- =============================================================================
-- Custom Keymaps
-- =============================================================================
-- LazyVim sets many keymaps by default. Add your customizations here.
-- Default keymaps: https://www.lazyvim.org/keymaps

local keymap = vim.keymap.set

-- -----------------------------------------------------------------------------
-- General
-- -----------------------------------------------------------------------------

-- Better escape (jk or jj to exit insert mode)
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Save with Ctrl+s (habit from other editors)
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

-- -----------------------------------------------------------------------------
-- Navigation
-- -----------------------------------------------------------------------------

-- Move between windows with Ctrl + hjkl
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep cursor centered when searching
keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- -----------------------------------------------------------------------------
-- Editing
-- -----------------------------------------------------------------------------

-- Move lines up/down in visual mode
keymap("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Stay in visual mode when indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Don't yank when pasting over selection
keymap("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- -----------------------------------------------------------------------------
-- TUI App Integration
-- -----------------------------------------------------------------------------

-- Open lazygit in a floating terminal
keymap("n", "<leader>gg", function()
  Snacks.terminal("lazygit", { cwd = LazyVim.root() })
end, { desc = "Lazygit (root dir)" })

-- Open yazi file manager
keymap("n", "<leader>fy", function()
  Snacks.terminal("yazi", { cwd = LazyVim.root() })
end, { desc = "Yazi file manager" })
