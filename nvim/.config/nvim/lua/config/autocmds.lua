-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- Keymap for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" }, -- Trigger only for Go files
  callback = function()
    vim.keymap.set("n", "\\sb", function()
      require("gujarats.go").go_build_copen()
    end, { buffer = true, desc = "Go build" })
    vim.keymap.set("n", "\\sr", function()
      require("gujarats.go").go_run()
    end, { buffer = true, desc = "Go run" })
    vim.keymap.set("n", "\\st", function()
      require("gujarats.go").go_test()
    end)
  end,
})
