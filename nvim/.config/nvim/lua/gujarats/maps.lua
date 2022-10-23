local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 's', '') -- override s to do nothing

--copy current row
keymap.set('n', 'Y', '<Esc>^v$y')

vim.keymap.set('n', '<F2>', '<Cmd>NvimTreeToggle<CR>', {})
--keymap.set('n', '<F3>', ':VTerm<CR>')

-- telescope ignroe command for rerence in the futrue
--keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
--keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
--keymap.set("n", "<leader>f", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
--keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
--keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- GitSigns
keymap.set("n", "]n", "<cmd>Gitsigns next_hunk<cr>") -- go to next changes git
--keymap.set("n", "]p", "<cmd>Gitsigns prev_hunk<cr>") -- go to previous changes git // Comment for now due to p use for paste
keymap.set("n", "]u", "<cmd>Gitsigns reset_hunk<cr>") -- undo changes current lines git
keymap.set("n", "]U", "<cmd>Gitsigns reset_buffer<cr>") -- undo changes whole buffer / current open file
