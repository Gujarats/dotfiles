-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("Copilot disable")

-- to search text within the project root dir
-- however .git is still included even though the command specify it is excluded
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
