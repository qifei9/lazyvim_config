-- if true then
--   return {}
-- end

function get_lualine_colors(lualine, props, ft_color)
  local fg, bg, ifg, ibg
  local theme_name = lualine.get_config().options.theme
  local theme = require("lualine.themes." .. theme_name)
  local m = vim.api.nvim_get_mode().mode
  local helpers = require("incline.helpers")
  ifg = helpers.contrast_color(ft_color)
  ibg = ft_color

  if not props.focused then -- inactive window pane
    fg = theme.inactive.a.fg
    bg = theme.inactive.a.bg
    ifg = theme.inactive.a.fg
    ibg = theme.inactive.a.bg
  elseif m:match("n") then
    fg = theme.normal.a.fg
    bg = theme.normal.a.bg
  elseif m:match("i") then
    fg = theme.insert.a.fg
    bg = theme.insert.a.bg
  elseif m:match("R") then
    fg = theme.replace.a.fg
    bg = theme.replace.a.bg
  elseif m:match("v") or m:match("V") or m:match("") then
    fg = theme.visual.a.fg
    bg = theme.visual.a.bg
  else -- unknown mode!
    fg = "#000000"
    bg = "#FFFFFF"
  end

  return { fg = fg, bg = bg, ifg = ifg, ibg = ibg }
end

function get_fallback_colors(props, ft_color)
  local helpers = require("incline.helpers")
  -- set fallback colors here
  if not props.focused then -- inactive window pane
    return { fg = "#999999", bg = "#000000", ibg = "#000000", ifg = "#999999" }
  else -- active window pane
    local ft_contrast = helpers.contrast_color(ft_color)
    return { fg = ft_contrast, bg = ft_color, ifg = ft_contrast, ibg = ft_color }
  end
end

function get_colors(props, ft_color)
  if not ft_color then -- unknown filetypes have no color
    ft_color = "#000000"
  end
  local status, lualine = pcall(require, "lualine")
  if status then -- lualine detected
    return get_lualine_colors(lualine, props, ft_color)
  else -- lualine not detected
    return get_fallback_colors(props, ft_color)
  end
end

return {
  {
    "b0o/incline.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("incline").setup({
        ignore = {
          filetypes = { "neo-tree" },
        },
        hide = {
          only_win = true,
        },
        window = {
          padding = 0,
          overlap = { borders = true, tabline = true, winbar = true, statusline = true },
          margin = { vertical = 0, horizontal = 0 },
          placement = { vertical = "top" },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = ""
          end
          local devicons = require("nvim-web-devicons")
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified

          local colors = get_colors(props, ft_color)

          return {
            ft_icon and { " ", ft_icon, " ", guifg = colors.fg } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guifg = colors.fg,
            guibg = colors.bg,
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
