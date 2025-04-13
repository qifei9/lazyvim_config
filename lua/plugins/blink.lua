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
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    -- use cmp-r for completion in R, add the following to ~/.Rprofile
    -- options(
    --   languageserver.server_capabilities =
    --     list(
    --       completionProvider = FALSE,
    --       completionItemResolve = FALSE
    --     )
    -- )
    "saghen/blink.cmp",
    dependencies = { "R-nvim/cmp-r" },
    opts = {
      keymap = {
        preset = "enter",
        -- fix tab do not work issue 2025-04-11
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
      },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer", "cmp_r" },
        providers = {
          -- create provider
          cmp_r = {
            -- IMPORTANT: use the same name as you would for nvim-cmp
            name = "cmp_r",
            module = "blink.compat.source",
          },
        },
      },
    },
  },
}
