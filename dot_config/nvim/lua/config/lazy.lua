-- =============================================================================
-- LazyVim Bootstrap Configuration
-- =============================================================================
-- This file bootstraps lazy.nvim (plugin manager) and loads LazyVim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Import LazyVim and its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    
    -- ==========================================================================
    -- LazyVim Extras - Enable additional functionality
    -- ==========================================================================
    -- Full list: https://www.lazyvim.org/extras
    
    -- Language support
    { import = "lazyvim.plugins.extras.lang.omnisharp" },  -- C# support
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    
    -- Editor enhancements
    { import = "lazyvim.plugins.extras.editor.mini-files" },  -- File browser
    
    -- Coding helpers
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    
    -- Import any custom plugins from lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "catppuccin", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
