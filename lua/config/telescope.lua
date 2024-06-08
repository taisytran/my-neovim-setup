-- telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_cutoff = 120,
        prompt_position = "bottom",
        preview_width = 0.5,
      },
      vertical = {
        mirror = false,
      },
      width = 0.9,
      height = 0.8,
      preview_cutoff = 120,
    },
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'|', '|', '-', '-', '+', '+', '+', '+'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.9,
        height = 0.8,
        preview_width = 0.5,
        prompt_position = "bottom",
      },
      sorting_strategy = "descending",
    },
    buffers = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.9,
        height = 0.8,
        preview_width = 0.5,
        prompt_position = "bottom",
      },
      sorting_strategy = "descending",
    },
    live_grep = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.9,
        height = 0.8,
        preview_width = 0.5,
        prompt_position = "bottom",
      },
      sorting_strategy = "descending",
    },
    help_tags = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.9,
        height = 0.8,
        preview_width = 0.5,
        prompt_position = "bottom",
      },
      sorting_strategy = "descending",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

-- Load the telescope-fzf-native extension
require('telescope').load_extension('fzf')


vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

