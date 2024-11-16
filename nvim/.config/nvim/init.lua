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


local clip = "/mnt/c/Windows/System32/clip.exe"
if vim.fn.executable(clip) then
  local opts = {
    callback = function()
      if vim.v.event.operator ~= "y" then
        return
      end
      vim.fn.system(clip, vim.fn.getreg(0))
    end
  }

  opts.group = vim.api.nvim_create_augroup("WSLYang", {})
  vim.api.nvim_create_autocmd("TextYankPost", { group = opts.group, callback = opts.callback })
end
