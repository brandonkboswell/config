return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "AckslD/nvim-neoclip.lua",
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-live-grep-args.nvim" ,
  },
  -- apply the config and additionally load fzf-native
  config = function(_)
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
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
        file_ignore_patterns = { ".git/", "node_modules", "vendor" },
        layout_config = {
          height = 0.90,
          width = 0.90,
          preview_cutoff = 0,
          horizontal = { preview_width = 0.60 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
          prompt_position = "top",
        },
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ['<C-c>'] = lga_actions.quote_prompt({ postfix = " --iglob !.spec"}),
              ['<C-i>'] = lga_actions.quote_prompt({ postfix = " --iglob !.spec"}),
            },
          },
        },
      },
    })

    telescope.load_extension("harpoon")
    telescope.load_extension("neoclip")
    telescope.load_extension("live_grep_args")
  end,

  keys = {
    { "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live Grep (args)" },
    { "<leader>sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live Grep (args)" },
    { "<leader>fc", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '\"model\" --ignore-file \"*.spec|*.test.js\"' })<CR>", desc = "Live Grep (code)" },
    -- { "<leader>*", "<cmd>lua require('telescope').extensions.live_grep_args.shortcuts.grep_word_under_cursor<CR>", desc = "Grep Word Under Cursor" },
    -- { "<leader>v*", "<cmd>lua require('telescope').extensions.live_grep_args.shortcuts.grep_visual_selection<CR>", desc = "Grep Word Visual Selection" },
    -- { "<leader>v*", "<cmd>Telescope grep_string<cr>", desc = "Grep Word Under Cursor" },
  },
}
