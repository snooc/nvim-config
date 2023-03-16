return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function ()
      return {
        options = {
          theme = "everforest"
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "diagnostics" },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          },

          lualine_x = {
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            "mode"
          }
        }
      }
    end,
    config = true,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "stevearc/oil.nvim",
    keys = {
      {
        "-",
        function ()
          require("oil").open_float()
        end,
        desc = "Open parent directory"
      }
    },
    opts = {
      float = {
        padding = 10
      }
    },
    config = true
  },
}
