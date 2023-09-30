return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "AckslD/nvim-neoclip.lua",
    "ThePrimeagen/harpoon",
  },
  -- apply the config and additionally load fzf-native
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- telescope.load_extension("harpoon")
    telescope.load_extension("neoclip")
  end,

  opts = {
    defaults = {
      mappings = {                                                                                                                                                                  
        i = {                                                                                                                                                                         
          ['<C-p>'] = require('telescope.actions.layout').toggle_preview                                                                                                            
        },
      },
      preview = {                                                                                                                                                                          
        hide_on_startup = true -- hide previewer when picker starts
      },
      file_ignore_patterns = { ".git/", "node_modules" },
      layout_config = {
        height = 0.90,
        width = 0.90,
        preview_cutoff = 0,
        horizontal = { preview_width = 0.60 },
        vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
        prompt_position = "top",
      },
    },
  },
  -- keys = function()
  --   return {
  --     { "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
  --   }
  -- end,
}
