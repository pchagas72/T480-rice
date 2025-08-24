return {
  { -- plugin spec for catppuccin
    "catppuccin/nvim",
    config = function()
        require("catppuccin").setup()
        vim.cmd.colorscheme "catppuccin"
    end,

  },

  -- this belongs to no plugin spec and is ignored
  lazy = false,
  name = "catppuccin",
  opts = {
    transparent_background = true,
  },

  {
    "LazyVim/LazyVim",
  },

}
