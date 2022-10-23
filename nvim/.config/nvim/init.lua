print('lua.init loaded')
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('gujarats.base')
require('gujarats.highlights')
require('gujarats.maps')
require('gujarats.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('gujarats.macos')
end
if is_win then
  require('gujarats.windows')
end

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
