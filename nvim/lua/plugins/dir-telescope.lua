return {
  { 
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        show_preview = true,
      })
    end
  },
}
