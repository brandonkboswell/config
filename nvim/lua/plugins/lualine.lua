return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(plugin)
    if plugin.override then
      require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
    end

    -- local icons = require("config.icons")
    --
    -- local diagnostics = {
    --   "diagnostics",
    --   sources = { "nvim_diagnostic" },
    --   sections = { "error", "warn", "info", "hint" },
    --   symbols = {
    --     error = icons.diagnostics.Error,
    --     hint = icons.diagnostics.Hint,
    --     info = icons.diagnostics.Info,
    --     warn = icons.diagnostics.Warn,
    --   },
    --   colored = true,
    --   update_in_insert = false,
    --   always_visible = false,
    -- }
    --
    -- local diff = {
    --   "diff",
    --   symbols = {
    --     added = icons.git.added .. " ",
    --     untracked = icons.git.added .. " ",
    --     modified = icons.git.changed .. " ",
    --     removed = icons.git.deleted .. " ",
    --   },
    --   colored = true,
    --   always_visible = false,
    -- }
    local git_blame = require('gitblame')
    -- This disables showing of the blame text next to the cursor
    vim.g.gitblame_display_virtual_text = 0

    return {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {'filename'},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        -- lualine_y = {'progress'},
        -- lualine_z = {'location'}
        lualine_y = {},
        lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
