return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    on_attach = function (buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
    config = true
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function ()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end

      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" }
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enabled = true },
      ensure_installed = {
        "bash",
        "c",
        "css",
        "go",
        "gomod",
        "gosum",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "proto",
        "python",
        "query",
        "regex",
        "sql",
        "terraform",
        "typescript",
        "vim",
        "yaml",
      }
    },
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "stylua",
        "yaml-language-server",
      }
    },
    config = function (plugin, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
  }
}
