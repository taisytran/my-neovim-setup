# My Neovim Setup

This repository contains my personal Neovim configuration.

## Installation

1. Clone the repository into your Neovim configuration directory:

```sh
git clone https://github.com/taisytran/my-neovim-setup.git ~/.config/nvim
```

2. Install the plugin manager (lazy.nvim):

```sh
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
```

3. Open Neovim and the plugins will be automatically installed by `lazy.nvim`.

4. Install TreeSitter parsers (optional but recommended):

```sh
nvim +TSUpdate
```

5. Install dependencies for certain plugins:

*Telescope FZF Native*: You need to have make installed. You can install it via your package manager:

For macOS: `xcode-select --install`

*Other dependencies*: Ensure you have the required tools and dependencies for Neovim and the plugins. You can install them using your package manager. For example:

*ripgrep*: `brew install ripgrep`
*fd*: `brew install fd`

6. Restart Neovim and enjoy your new configuration!

## Running Checkhealth

After installing everything, it's a good idea to run `:checkhealth` in Neovim to make sure all dependencies are properly installed and configured. To do this:

1. Open Neovim:

```sh
nvim
```

2. Run the `:checkhealth` command:

```vim
:checkhealth
```

This command will provide a report on the health of your Neovim setup, including any missing dependencies or configuration issues.

## Requirements

- Neovim >= 0.10.0
- `git` for cloning the repository
- A plugin manager (e.g., `lazy.nvim`)
- `make` for building certain plugins
- `ripgrep` for enhanced file searching
- `fd` for improved file finding

## Features

- File system explorer with nvim-tree
- Status line with lualine
- LSP configurations
- Autocompletion
- Syntax highlighting with TreeSitter
- Git integration with vim-fugitive and gitsigns
- Commenting utility
- EasyMotion with hop.nvim
- Nord color scheme
- Indentation with indent-blankline
- Notice management with noice.nvim
- Multi-line modification with vim-visual-multi

## Custom Keybindings

| Function                        | Keybinding         | Description                          |
|---------------------------------|--------------------|--------------------------------------|
| **General**                     |                    |                                      |
| Open Nvim Tree                  | `:`                | Open file explorer                   |
| Find current file in Nvim Tree  | `leader` + `Shift` + `n` | Locate current file in file explorer |
| Add/Rename/Delete file in Nvim Tree | `m` + `a/r/d/c/p`  | Manage files in file explorer        |
| **Telescope**                   |                    |                                      |
| Find files                      | `leader` + `p`     | Open file finder                     |
| Open buffer file                | `space` + `p`      | Open buffer file                     |
| Live grep                       | `space` + `f`      | Search for text in files             |

## Plugins

This configuration includes the following plugins:

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Core dependency
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Improve startup time
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - File system explorer
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Fuzzy Finder
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - Statusline
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git diff in sign column
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting utility
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [hop.nvim](https://github.com/phaazon/hop.nvim) - EasyMotion
- [nord.nvim](https://github.com/shaunsingh/nord.nvim) - Nord color scheme
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP Configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multi-line modification
- [noice.nvim](https://github.com/folke/noice.nvim) - Notice management
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Git diff view
- [vim-maximizer](https://github.com/szw/vim-maximizer) - Window maximizer

## Configuration Files

The configuration is organized into several files:

- `init.lua`: Main configuration file
- `config/basic.lua`: Basic settings
- `config/theme.lua`: Theme settings
- `config/zoom.lua`: Keymap for window maximizer
- `config/lualine.lua`: Statusline settings
- `config/comment.lua`: Commenting utility settings
- `config/hop.lua`: EasyMotion settings
- `config/nvim-tree.lua`: File explorer settings
- `config/telescope.lua`: Fuzzy finder settings
- `config/mason.lua`: LSP configuration
- `config/cmp.lua`: Autocompletion settings
- `config/nvim-treesitter.lua`: Syntax highlighting settings
- `config/gitsigns.lua`: Git diff settings
- `config/vim-fugitive.lua`: Git integration settings
- `config/diffview.lua`: Git diff view settings
- `config/noice.lua`: Notice management settings
