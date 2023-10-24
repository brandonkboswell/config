return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- -- stylua: ignore
      -- close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- -- stylua: ignore
      -- right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = require("lazyvim.config").icons.diagnostics
      --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
      --     .. (diag.warning and icons.Warn .. diag.warning or "")
      --   return vim.trim(ret)
      -- end,

      max_name_length = 100,
      mode = "tabs",
      max_prefix_length = 100,
      truncate_names = false,
      -- show_tab_indicators = true,
      tab_size = 22,
      -- offsets = {
      --   {
      --     filetype = "neo-tree",
      --     text = "Neo-tree",
      --     highlight = "Directory",
      --     text_align = "left",
      --   },
      -- },
    },
  },
}
