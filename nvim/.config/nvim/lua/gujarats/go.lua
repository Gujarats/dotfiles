-- NOTE: using specifically zsh as shell it required to have zsh isntalled
--change zsh to bash if do not wish to use zsh

local M = {}

function M.go_build()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "go build")
  vim.fn.system(string.format(cmd))
end

---@param cmd (string) go build, go run . , go test
local function run_command_copen(cmd)
  if type(cmd) ~= "string" then
    error("cmd parameter musbe string : go build, go run ., go test")
  end

  -- Run the command and capture the output
  local command = string.format("%s 2>&1", cmd)
  local output = vim.fn.systemlist(command)

  -- Check if the command succeeded
  if vim.v.shell_error ~= 0 then
    -- Parse the output and populate the Quickfix list
    local qf_list = {}
    for _, line in ipairs(output) do
      -- Extract file, line, column, and message using a pattern (adjust as needed)
      local file, lnum, col, msg = line:match("([^:]+):(%d+):(%d+):%s*(.+)")
      if file and lnum and col and msg then
        table.insert(qf_list, {
          filename = file,
          lnum = tonumber(lnum),
          col = tonumber(col),
          text = msg,
        })
      else
        --||     main_test.go:12: Error actual = test1, Expected = test2
        file, lnum, msg = line:match("([%w_%.]+):(%d+):s*(.+)")
        if file and lnum and msg then
          table.insert(qf_list, {
            filename = file,
            lnum = tonumber(lnum),
            text = msg,
          })
        else
          -- If no match, treat it as a general error
          table.insert(qf_list, { text = line })
        end
      end
    end

    -- Set the Quickfix list and open the Quickfix window
    vim.fn.setqflist(qf_list, "r")
    vim.cmd("copen")
  else
    -- If no errors, notify the user
    vim.notify(string.format("%s succeeded!", cmd), vim.log.levels.INFO)
    vim.cmd("cclose")
  end
end

-- thanks to chat-gpt
function M.go_build_copen()
  run_command_copen("go build")
end

function M.go_run()
  local cmd = string.format("tmux split-window -v -l 10 zsh -i -c '%s; exec zsh'", "go run .")
  vim.fn.system(string.format(cmd))
end

function M.go_test()
  run_command_copen("go test")
end

return M
