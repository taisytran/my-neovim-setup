-- init.lua
vim.opt.runtimepath:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- Core dependencies
  "nvim-lua/plenary.nvim",

  -- Impatient plugin to improve startup time
  "lewis6991/impatient.nvim",

  -- 'kylechui/nvim-surround', -- Surround text objects easily
  -- File Explorer
  {
    "kyazdani42/nvim-tree.lua", -- File system explorer
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = "nvim-telescope/telescope.nvim",
  },

  -- {
  --   'pbogut/fzf-mru.vim',
  --   requires = { 'nvim-telescope/telescope-fzf-native.nvim' }
  -- },

  -- Statusline
  {
    "hoob3rt/lualine.nvim",
    event = "VeryLazy",
  },
  -- 'lewis6991/gitsigns.nvim', -- Git diff in sign column

  -- Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },

  {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },

  "numToStr/Comment.nvim", -- Commenting utility

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    enabled = true,
  },
  -- {
  --   'sheerun/vim-polyglot',
  --   init = function ()
  --     -- TODO: not working with treesitter
  --     -- vim.g.polyglot_disabled = { "regex", "bash", "css", "html", "javascript", "json", "lua", "python", "ruby", "typescript", "yaml" }
  --   end
  -- },
  -- Navigation - EasyMotion
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
  },
  -- Nord color scheme
  "shaunsingh/nord.nvim",

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
  },

  -- LSP Configuration
  {
    "mason-org/mason.nvim",
    -- { "mason-org/mason-lspconfig.nvim", version = "v1.32.0" },
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  -- Formatter
  {
    -- archived
    -- 'jose-elias-alvarez/null-ls.nvim'
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  -- 'glepnir/lspsaga.nvim',
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    commit = "b356f2c", --TODO: https://github.com/hrsh7th/nvim-cmp/issues/1877
    pin = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
    },
  },

  -- modify multiple lines
  {
    "mg979/vim-visual-multi",
    event = "BufRead", -- load when open file
  },

  -- notice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      -- {
      -- "rcarriga/nvim-notify",
      -- commit = "a5af69dc4866e85f2aeeccf309444eb811bb96cc",
      -- },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
  {
    "szw/vim-maximizer",
    event = { "BufRead", "BufNewFile" },
  },

  -- startup
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- marks
  -- {
  --   "chentoast/marks.nvim",
  -- },

  -- tab
  {
    "alvarosevilla95/luatab.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("luatab").setup({})
    end,
  },
  -- {
  --   'akinsho/bufferline.nvim',
  -- }
})

require("config.basic")
require("config.theme")
--
-- -- Set keymap for Ctrl-w o to toggle maximizer
require("config.zoom")
--
-- -- -- statusline
require("config.lualine")
--
-- -- Nerd comment
require("config.comment")
--
-- -- EasyMotion configuration for Hop.nvim
require("config.hop")
--
-- -- Nvim-tree settings - Nerd Tree
require("config.nvim-tree")
--
-- -- Telescope - find files
require("config.telescope")
--
-- -- LSP
require("config.mason")
require("config.cmp")
--
-- -- Syntax highlight
require("config.nvim-treesitter")
require("config.nvim-ts-autotag")
--
-- -- indent
require("config.ibl")
--
-- -- Git
require("config.gitsigns")
require("config.vim-fugitive")
require("config.diffview")
--
-- -- Notify
require("config.noice")

-- -- Formatter
-- -- require('config.null-ls')
require("config.conform")

-- -- Startup
require("config.alpha")

-- -- Bookmarks
-- require('config.marks')

-- require('config.bufferline')
