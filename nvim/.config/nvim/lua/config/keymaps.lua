-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprevious<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")
keymap.set("", "s", "") -- override s to do nothing

--copy current row
keymap.set("n", "Y", "<Esc>^v$y")

-- GitSigns
keymap.set("n", "]n", "<cmd>Gitsigns next_hunk<cr>") -- go to next changes git
--keymap.set("n", "]p", "<cmd>Gitsigns prev_hunk<cr>") -- go to previous changes git // Comment for now due to p use for paste
keymap.set("n", "]u", "<cmd>Gitsigns reset_hunk<cr>") -- undo changes current lines git
keymap.set("n", "]U", "<cmd>Gitsigns reset_buffer<cr>") -- undo changes whole buffer / current open file

--my-local-plugins
keymap.set("n", "\\sp", function()
  require("gujarats.file").print_full_path()
end, { expr = true, desc = "print the current buffer file path" })

keymap.set("n", "\\se", function()
  require("telescope.builtin").lsp_document_symbols({ symbols = "function" })
end, { desc = "show all functions in current buffer" })
