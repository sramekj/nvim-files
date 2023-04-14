return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  { "folke/which-key.nvim", lazy = true},
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lua/plenary.nvim" },
  { "mfussenegger/nvim-dap" },
  { "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup()
    end,
  },
  { "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = { theme = "gruvbox" }
      })
    end,
  },
  { "MunifTanjim/nui.nvim" },
  { "neovim/nvim-lspconfig",  
    config = function()
      require("core.servers").register_lsp_servers()
    end,
  },
  { "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  { "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  { "NvChad/nvterm",
    config = function(_, opts)
      require("nvterm").setup(opts)
    end,
  },
  { "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/vim-vsnip",
      },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          }),
        })
        end,
  },
  { 
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require("neo-tree").setup()
      end,
  },
  {
    "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
      dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "scalameta/nvim-metals",
    dependencies = { 
      "nvim-lua/plenary.nvim", 
      "mfussenegger/nvim-dap"
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "stevanmilic/neotest-scala",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"){
            args = { "--no-capture" },
          },
          require("neotest-scala"){
            runner = "bloop",
          }
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
      	ensure_installed = require("core.parsers").treesitter_parsers,
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        }
      })
    end,
  }



}
