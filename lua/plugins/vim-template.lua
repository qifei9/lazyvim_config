-- if true then
--   return {}
-- end

return {
  -- vim template
  {
    "aperezdc/vim-template",
    lazy = false,
    config = function()
      local templates_dir = vim.fn.stdpath("config") .. "/templates"
      vim.g.templates_directory = { templates_dir }
    end,
  },
}
