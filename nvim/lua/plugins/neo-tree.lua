return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
        hide_by_name = {
          '.git',
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
        },
      },
    }
  }
}
