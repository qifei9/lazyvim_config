-- if true then
--   return {}
-- end

return {
  -- switch true/false flag
  {
    "AndrewRadev/switch.vim",
    event = "VeryLazy",
    config = function()
      vim.g.switch_custom_definitions = { { "TRUE", "FALSE" } }
    end,
  },
}
