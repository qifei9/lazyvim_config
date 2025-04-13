return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      -- Create a table with the options to be passed to setup()
      R_args = { "--quiet", "--no-save" },
      -- pdfviewer = "",
      R_app = "radian",
      R_cmd = "R",
      Rout_more_colors = true,
      hl_term = false,
      bracketed_paste = true,
      rconsole_width = 133,
    },
  },
}
