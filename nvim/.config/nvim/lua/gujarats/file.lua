local M = {}

--- print the current buffer
function M.print_full_path()
  print(vim.api.nvim_buf_get_name(0))
end

return M
