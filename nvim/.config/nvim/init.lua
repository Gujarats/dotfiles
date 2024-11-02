-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("Copilot disable")

require("telescope").setup({
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
    },
    grep_string = {
      additional_args = { "--hidden" },
    },
    live_grep = {
      additional_args = { "--hidden" },
    },
  },
})
