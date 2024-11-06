return {
  {
    "crusj/bookmarks.nvim",
    keys = {
      { "<tab><tab>", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },
}
