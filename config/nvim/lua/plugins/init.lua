local plugins = {
  -- LSP
  { "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    lazy = true,
    config = function ()
      require("plugins.lsp")
    end
  },
  { "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    config = function ()
      require("plugins.mason")
    end
  },
  -- CMP
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      { "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugins.luasnip")
        end,
      },
      { "windwp/nvim-autopairs",
        event = "InsertEnter",
        lazy = true,
        config = function()
          require("plugins.autopairs")
        end,
      },
      { "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
    },
    config = function()
      require("plugins.cmp")
    end,
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      lazy = true
    }
  },
  -- Indentline
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function ()
      require("plugins.indentline")
    end
  },
  -- File explorer
  { "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = "NvimTreeFocus",
    config = function ()
      require("plugins.nvimtree")
    end
  },
  -- Terminal
  { "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = "ToggleTerm",
    config = function ()
      require("plugins.terminal")
    end
  },
  -- Dashbord
  { "goolord/alpha-nvim",
    config = function ()
      require("plugins.alpha")
    end
  },
  -- Colorizer
  { "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    config = function ()
      require("plugins.colorizer")
    end
  },
  -- Gitsigns
  { "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufRead" },
    config = function ()
      require("plugins.gitsigns")
    end
  },
  -- Theme
  { "zrchx/abyss",
    init = function ()
      require("abyss")
      vim.cmd("colorscheme abyss")
    end
  },
}
require("lazy").setup({plugins})
