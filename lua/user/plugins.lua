local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "rcarriga/nvim-notify"  -- notify
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this

  -- lua development
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "christianchiarulli/lua-dev.nvim"

  -- editor enhance
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  -- use "mhartington/formatter.nvim" -- format

  use "akinsho/bufferline.nvim"
  use { "rhysd/accelerated-jk", opt = true, event = "BufReadPost" }
  use "famiu/bufdelete.nvim"
  use {
    "phaazon/hop.nvim",   -- like easymotion, but more powerful
    branch = "v1", -- optional but strongly recommended
  }

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use "projekt0n/github-nvim-theme"
  use "nvim-lualine/lualine.nvim" -- status line
  use "goolord/alpha-nvim"  -- welcome page

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file
  use "BurntSushi/ripgrep" -- ripgrep
  use "nvim-pack/nvim-spectre" -- search and replace pane
  use "terryma/vim-expand-region"  -- expand/shrink region by +/-
  use "tpope/vim-repeat"    --  . command enhance
  use "tpope/vim-surround"  -- vim surround
  use "nathom/filetype.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "b0o/SchemaStore.nvim"
  -- use "RRethy/vim-illuminate"
  use "kosayoda/nvim-lightbulb"  -- code action
  use "ray-x/lsp_signature.nvim"  -- show function signature when typing
  use "SmiteshP/nvim-navic"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Debugger
  use "ravenxrz/DAPInstall.nvim"   -- help us install several debuggers
  use "ravenxrz/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-raw.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-dap.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"  -- enhance texetobject selection
  use "romgrk/nvim-treesitter-context"  -- show class/function at the top
  use "andymass/vim-matchup"
  -- use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tanvirtin/vgit.nvim"

  -- Rust
  use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
  use "Saecki/crates.nvim"

  -- tools
  use "cdelledonne/vim-cmake"
  use "skanehira/preview-markdown.vim"    -- NOTE:: glow required : https://github.com/charmbracelet/glow
  use "voldikss/vim-translator"
  use "mtdl9/vim-log-highlighting"
  use "Pocco81/HighStr.nvim"
  use "dstein64/vim-startuptime"
  -- use "henriquehbr/nvim-startup.lua"
  use "AckslD/nvim-neoclip.lua"
  use "vim-test/vim-test"
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use { 'michaelb/sniprun', run = 'bash ./install.sh' }

  -- other
  use {
    "kevinhwang91/nvim-hlslens", -- highlight search
    disable = true,
  }
  use "kevinhwang91/nvim-bqf"     -- better quick fix, use trouble instead
  use "RRethy/vim-illuminate"     -- highlight undercursor word
  use "lewis6991/spellsitter.nvim" -- spell checker
  use "folke/todo-comments.nvim" -- todo comments
  -- use "liuchengxu/vista.vim"     -- outline
  -- use "simrat39/symbols-outline.nvim" -- outline
  use "stevearc/aerial.nvim"
  -- use "stevearc/aerial.nvim"
  use "norcalli/nvim-colorizer.lua" -- show color
  use "folke/trouble.nvim"
  use "arkav/lualine-lsp-progress" -- show lsp progress
  use "sindrets/winshift.nvim"    -- rerange window layout
  -- litee family
  use "ldelossa/litee.nvim"
  use "ldelossa/litee-calltree.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
