-- if true then
--   return {}
-- end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- -- add dracula
  -- {
  --   "Mofiqul/dracula.nvim",
  --   opts = {
  --     transparent_bg = true, -- default false
  --     -- set custom lualine background color
  --     -- lualine_bg_color = "#44475a", -- default nil
  --     -- overrides = {
  --     --   CursorColumn = { bg = "#544158" },
  --     -- },
  --   },
  -- },
  -- -- Configure LazyVim to load dracula
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "dracula",
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
