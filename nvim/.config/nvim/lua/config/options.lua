-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- TODO: figure out where to put these gohtml detection somewhere
local function IsGoHtml()
  if vim.fn.expand("%:e") == "html" and vim.fn.search("{{") ~= 0 then
    return true
  end
  return false
end

local function DetectGoHtmlTmpl()
  if IsGoHtml() then
    vim.treesitter.language.register("html", { "gohtml", "gohtmltmpl" })
    vim.o.filetype = "gohtml"
  end
end

local goHtmlGroup = vim.api.nvim_create_augroup("filetypedetect", { clear = false })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.html",
  group = goHtmlGroup,
  callback = DetectGoHtmlTmpl,
})
