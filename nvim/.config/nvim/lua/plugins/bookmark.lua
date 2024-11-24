return {
  {
    "gujarats/bookmarks.nvim",
    branch = "main",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local config = {
        border_style = "double", -- border style: "single", "double", "rounded"
      }
      require("bookmarks").setup(config)
      require("telescope").load_extension("bookmarks")
    end,
  },
}
