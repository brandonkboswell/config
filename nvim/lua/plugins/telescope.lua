return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "AckslD/nvim-neoclip.lua",
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "princejoogie/dir-telescope.nvim",
  },
  -- apply the config and additionally load fzf-native
  config = function(_)
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["<C-w>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          },
          i = {
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            ["<C-w>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          },
        },
        preview = {
          hide_on_startup = true,
        },
        sorting_strategy = "ascending",
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
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob !.spec" }),
              ["<C-c>"] = require("telescope-live-grep-args.actions").quote_prompt({
                postfix = ' --ignore-file "*.spec|*.test.js"',
              }),
            },
          },
        },
      },
    })

    telescope.load_extension("harpoon")
    telescope.load_extension("neoclip")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("dir")
  end,

  keys = {
    {
      "<leader>fg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Live Grep (args)",
    },
    {
      "<leader>sg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Live Grep (args)",
    },
    {
      "<leader>fc",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '\"model\" --ignore-file \"*.spec|*.test.js\"' })<CR>",
      desc = "Live Grep (code)",
    },
    { "<leader>fh", "<cmd>Telescope harpoon marks<CR>", desc = "Find Harpoon Marks" },
    { "<leader>fd", "<cmd>Telescope dir live_grep<CR>", desc = "Grep Directory" },
  },
}
