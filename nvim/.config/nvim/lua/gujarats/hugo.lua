local M = {}

function M.hugo_publish()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "hugo")
  vim.fn.system(string.format(cmd))
end

function M.hugo_develop()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "hugo server --disableFastRender")
  vim.fn.system(string.format(cmd))
end

function M.setup()
  vim.api.nvim_create_user_command("Hugo", function()
    M.hugo_publish()
  end, {})
  vim.api.nvim_create_user_command("HugoDev", function()
    M.hugo_develop()
  end, {})
end

return M
