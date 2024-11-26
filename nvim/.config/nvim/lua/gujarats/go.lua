local M = {}

function M.go_build()
  local cmd = string.format("tmux split-window -v -l 10 bash -c '%s; exec bash'", "go build")
  vim.fn.system(string.format(cmd))
end

-- thanks to chat-gpt
function M.go_build_copen()
  -- Run the `go build` command and capture the output
  local output = vim.fn.systemlist("go build 2>&1")

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
        -- If no match, treat it as a general error
        table.insert(qf_list, { text = line })
      end
    end

    -- Set the Quickfix list and open the Quickfix window
    vim.fn.setqflist(qf_list, "r")
    vim.cmd("copen")
  else
    -- If no errors, notify the user
    vim.notify("Build succeeded!", vim.log.levels.INFO)
  end
end

return M
