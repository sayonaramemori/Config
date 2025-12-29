return {
  "folke/tokyonight.nvim",
  priority = 1000,
  -- enabled = true,
  enabled = false,
  config = function()
    require('tokyonight').setup{ }
    vim.cmd[[colorscheme tokyonight]]
  end,
  -- opts = {
    -- transparent = true,
    -- styles = {
      -- sidebars = "transparent",
      -- floats = "transparent",
    -- },
  -- },
}
