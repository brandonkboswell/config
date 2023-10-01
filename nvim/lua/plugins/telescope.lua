return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "AckslD/nvim-neoclip.lua",
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-live-grep-args.nvim" ,
  },
  -- apply the config and additionally load fzf-native
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- telescope.load_extension("harpoon")
    telescope.load_extension("neoclip")
    telescope.load_extension("live_grep_args")
  end,

  opts = {
    defaults = {
      mappings = {                                                                                                                                                                  
        i = {                                                                                                                                                                         
          ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
          ['<C-j>'] = require('telescope.actions').cycle_history_next,
          ['<C-k>'] = require('telescope.actions').cycle_history_prev,
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

  keys = {
    { "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live Grep (args)" },
    { "<leader>fc", '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec, test}" })<CR>', desc = "Live Grep (code)" },
  },
}
