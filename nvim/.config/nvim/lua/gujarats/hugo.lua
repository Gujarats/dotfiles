require("gujarats/utils")

local M = {}

function M.hugo_publish_term()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "hugo")
  vim.fn.system(string.format(cmd))
end

function M.hugo_develop_term()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "hugo server --disableFastRender")
  vim.fn.system(string.format(cmd))
end

function M.hugo_publish()
  Exec_Command_root("hugo")
end

function M.setup()
  vim.api.nvim_create_user_command("Hugo", function()
    M.hugo_publish()
  end, {})
  vim.api.nvim_create_user_command("HugoTerm", function()
    M.hugo_publish_term()
  end, {})
  vim.api.nvim_create_user_command("HugoDev", function()
    M.hugo_develop_term()
  end, {})
end

return M
