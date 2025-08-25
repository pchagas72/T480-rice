return {
  { -- plugin spec for catppuccin
    "catppuccin/nvim",
    config = function()
        require("catppuccin").setup({
            transparent_background = true
        })

    end,
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent=true
        },
    }

},
{
    "LazyVim/LazyVim",
  },

}
