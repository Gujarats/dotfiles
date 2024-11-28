-- Function to find the project root directory
local function get_project_root()
  local root_patterns = { ".git", "Makefile", "package.json" } -- Add more root indicators if needed
  return vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
end

-- Function to execute a command in the root directory
function Exec_Command_root(cmd)
  local project_root = get_project_root()
  if not project_root then
    print("Project root not found!")
    return
  end

  -- Change to the project root directory
  vim.fn.chdir(project_root)
  print("Changed directory to: " .. project_root)

  -- Execute the command
  local output = vim.fn.system(cmd)
  print(output) -- Print the command output
end
