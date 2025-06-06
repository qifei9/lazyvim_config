return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      -- Create a table with the options to be passed to setup()
      R_args = { "--quiet", "--no-save" },
      hook = {
        on_filetype = function()
          -- This function will be called at the FileType event
          -- of files supported by R.nvim. This is an
          -- opportunity to create mappings local to buffers.
          -- vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { buffer = true })
          -- vim.keymap.set("v", "<Enter>", "<Plug>RSendSelection", { buffer = true })

          vim.api.nvim_buf_set_keymap(0, "n", "<localleader>d", "<Plug>RDSendLine", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<localleader>pe", "<Plug>RSendParagraph", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<localleader>pa", "<Plug>RDSendParagraph", {})
          vim.api.nvim_buf_set_keymap(0, "v", "<localleader>se", "<Plug>RSendSelection", {})

          local wk = require("which-key")
          wk.add({
            buffer = true,
            mode = { "n", "v" },
            { "<localleader>a", group = "all" },
            { "<localleader>b", group = "between marks" },
            { "<localleader>c", group = "chunks" },
            { "<localleader>f", group = "functions" },
            { "<localleader>g", group = "goto" },
            { "<localleader>i", group = "install" },
            { "<localleader>k", group = "knit" },
            { "<localleader>p", group = "paragraph" },
            { "<localleader>q", group = "quarto" },
            { "<localleader>r", group = "r general" },
            { "<localleader>s", group = "split or send" },
            { "<localleader>t", group = "terminal" },
            { "<localleader>v", group = "view" },
          })
        end,
      },
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
