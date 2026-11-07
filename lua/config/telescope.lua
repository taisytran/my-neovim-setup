-- telescope
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--follow',
      '--glob', '!**/node_modules/**',
      '--glob', '!**/.yarn/**',
      '--glob', '!package-lock.json',
      '--glob', '!**/.git/**',
      '--glob', '!**/.next/**',
      '--glob', '!**/.turbo/**',
      '--glob', '!**/coverage/**',
      '--glob', '!**/dist/**',
      '--glob', '!yarn.lock',
      '--glob', '!**/build/**',
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
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
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { "%.next/", "node_modules/", "%.git/" },
    tiebreak = function(current_entry, existing_entry, _)
      local function get_p(e)
        return e.path or e.filename or e.value or ""
      end
      local p1 = get_p(current_entry)
      local p2 = get_p(existing_entry)

      -- A tie-break returns true when the current entry should rank first,
      -- independently of the picker's display direction.
      local s1 = p1:match("^src/") or p1:match("/src/")
      local s2 = p2:match("^src/") or p2:match("/src/")
      if s1 and not s2 then return true end
      if s2 and not s1 then return false end

      local function is_junk(p)
        return p:match("%.md$") or p:match("%.txt$") or p:match("%.log$")
      end
      local j1 = is_junk(p1)
      local j2 = is_junk(p2)
      if not j1 and j2 then return true end
      if j1 and not j2 then return false end

      -- Prefer the shorter path when both entries are otherwise equivalent.
      return #p1 < #p2
    end,
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '|', '|', '-', '-', '+', '+', '+', '+' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--follow", "--glob", "!**/.git/*", "--glob", "!**/.next/*" },
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
      ignore_current_buffer = false,
      show_all_buffers = true,
      sort_lastused = true,
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
    marks = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.9,
        height = 0.8,
        preview_width = 0.5,
        prompt_position = "bottom",
      },
      sorting_strategy = "descending",
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<C-d>", function()
          require("telescope.actions").delete_mark(prompt_bufnr)
        end)
        return true -- Keep default mappings as well as the custom ones
      end,
    },
    oldfiles = {
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
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,     -- tie-breaking still applies when scores are equal
      case_mode = "ignore_case",      -- or "ignore_case" or "respect_case"
    }
  }
}

-- Load the telescope-fzf-native extension
require('telescope').load_extension('fzf')
