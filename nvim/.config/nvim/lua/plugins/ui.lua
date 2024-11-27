return {
  -- buffer line
  -- this make only tabs name showing at the top
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- logo show up on start-up
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
        ██████╗ ███████╗██████╗ ███████╗██╗   ██╗
       ██╔════╝ ██╔════╝██╔══██╗██╔════╝██║   ██║
       ██║  ███╗███████╗██║  ██║█████╗  ██║   ██║
       ██║   ██║╚════██║██║  ██║██╔══╝  ╚██╗ ██╔╝
       ╚██████╔╝███████║██████╔╝███████╗ ╚████╔╝ 
        ╚═════╝ ╚══════╝╚═════╝ ╚══════╝  ╚═══╝  
         ]],
        },
      },
    },
  },
}
