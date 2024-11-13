return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["html"] = { "prettier" },
        ["gohtml"] = { "prettier", "prettierd" },
        ["gohtmltmpl"] = { "prettier", "prettierd" },
      },
    },
  },
}
