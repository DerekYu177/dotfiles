vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- This has to happen before vim-tmux-nagivator
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {})
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {})
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {})
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {})

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  'lewis6991/gitsigns.nvim',
  {
    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
      }
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_fix_on_save = 1
      vim.g.ale_lint_on_enter = 0
      vim.g.ale_lint_on_insert_leave = 0
      vim.g.ale_lint_on_filetype_changed = 0
      vim.g.ale_lint_on_text_changed = 'never'
      vim.g.ale_disable_lsp = 1
      vim.b.ale_linters = { ruby = 'rubocop' }
      vim.g.ale_fixers = {
        ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
        ['ruby'] = { 'rubocop' },
      }
    end,
  }
}, {})

vim.wo.relativenumber = true
vim.wo.number = true

-- neo-tree
vim.keymap.set('n', ',n', ":Neotree source=filesystem reveal=true position=left toggle=true<cr>")
require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
    }
  }
})

-- plenary
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, {})
