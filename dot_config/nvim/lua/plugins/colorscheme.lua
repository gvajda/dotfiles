-- =============================================================================
-- Custom Plugin Configurations
-- =============================================================================
-- Add any custom plugin specs here

return {
  -- Colorscheme (catppuccin matches our tmux theme)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        mason = true,
        native_lsp = {
          enabled = true,
        },
      },
    },
  },

  -- Set catppuccin as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
