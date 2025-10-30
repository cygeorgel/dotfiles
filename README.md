# Dotfiles

A collection of configuration files for a modern development environment, optimized for PHP development and general terminal-based workflows.

## Overview

This repository contains configuration files for:
- **Neovim** - Modern Vim-based editor with NVChad framework
- **Kitty** - GPU-accelerated terminal emulator
- **tmux** - Terminal multiplexer
- **Various helper scripts** - Development utilities

## Prerequisites

- Linux/Unix-like operating system
- Neovim (v0.8+)
- Kitty terminal emulator
- tmux
- Git
- `fzf` (for tmux session management script)
- `xclip` (for clipboard integration)

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

   This script creates symlinks for:
   - `~/.config/kitty` ? `~/dotfiles/kitty`
   - `~/.config/nvim` ? `~/dotfiles/nvim`
   - `~/.tmux.conf` ? `~/dotfiles/tmux/tmux.conf`

3. **Neovim Setup**: On first launch, Neovim will automatically:
   - Bootstrap lazy.nvim plugin manager
   - Install all configured plugins
   - Set up LSP servers and tools via Mason

4. **Optional**: Install PHP tools manually:
   ```vim
   :MasonInstallAll
   ```

## Configuration Details

### Neovim

This configuration is based on [NVChad](https://nvchad.com/) v2.0, a fast Neovim framework with a beautiful UI.

#### Features

- **Language Server Protocol (LSP)**
  - Intelephense for PHP (autocompletion, go-to-definition, hover docs, formatting)
  - Extensible for other languages

- **Plugin Ecosystem**
  - `lazy.nvim` - Modern plugin manager
  - `nvim-treesitter` - Enhanced syntax highlighting
  - `telescope.nvim` - Fuzzy finder for files, buffers, grep, etc.
  - `nvim-tree` - File explorer
  - `nvim-cmp` - Autocompletion engine
  - `gitsigns.nvim` - Git integration
  - `Comment.nvim` - Smart commenting
  - `indent-blankline.nvim` - Indentation guides
  - And more...

- **PHP-Specific Configuration**
  - 4-space indentation (PSR-12 standard)
  - 120 character line length indicator
  - Format on save enabled
  - Comprehensive PHP snippets
  - PHP debugging support via php-debug-adapter
  - Static analysis tools (phpstan, psalm, phpcs)

- **Keybindings**
  - `<leader>` is mapped to `<Space>` by default
  - `<leader>fm` - Format code
  - `<leader>ps` - PHP syntax check
  - `<leader>pt` - Run PHPUnit tests
  - `<leader>ri` - Reinstall plugins
  - `gd` - Go to definition
  - `K` - Show documentation
  - And many more...

For detailed PHP development setup, see [nvim/PHP_README.md](nvim/PHP_README.md).

#### Reinstalling Neovim Plugins/Tools

Use the helper script:
```bash
./scripts/reinstall-nvim.sh
```

Or manually:
- Plugins: `<leader>ri` in Neovim, or remove `~/.local/share/nvim/lazy`
- Mason tools: `:Mason` UI, or remove `~/.local/share/nvim/mason`

### Kitty

A modern, GPU-accelerated terminal emulator with the Catppuccin Mocha theme.

#### Configuration Highlights

- **Font**: JetBrains Mono Nerd Font Complete (Regular, Bold, Italic variants)
- **Theme**: Catppuccin Mocha (dark theme)
- **Font Size**: 11pt
- **Window Padding**: 10px
- **Cursor**: No blink interval
- **Audio Bell**: Disabled

#### Changing Theme

Edit `kitty/current-theme.conf` or replace it with a different theme file. The theme is included from `kitty.conf`.

### tmux

Terminal multiplexer configuration optimized for vi-style navigation and seamless integration with Neovim.

#### Key Features

- **Vi Mode**: Copy mode uses vi keybindings
- **Smart Pane Navigation**: 
  - `<Ctrl-h/j/k/l>` - Navigate panes (works intelligently with Neovim splits)
  - `<prefix>h/j/k/l` - Navigate panes (repeatable)
- **Window Management**:
  - `<prefix>n/p` - Next/previous window (repeatable)
  - `<prefix>Space` - Switch to last used window
  - `<prefix>c` - New window (uses current pane path)
- **Session Management**:
  - `<prefix>F` - Quick project switcher (uses `t.sh`)
  - `<prefix>D` - Open dotfiles directory
- **Splitting**:
  - `<prefix>|` - Split horizontally
  - `<prefix>-` - Split vertically
- **Status Bar**: Customized with Catppuccin colors, shows session name and current command

#### Prefix Key

Default prefix is `<Ctrl-b>`. To send prefix to nested tmux sessions, use `<Ctrl-Space>`.

#### Reload Configuration

```bash
<prefix>r
```

### Helper Scripts

#### `scripts/t.sh`

Tmux session manager that:
- Uses `fzf` to select from projects in `~/Projects`
- Creates or switches to tmux sessions named after the project directory
- Handles `/tmp` directory for temporary sessions

**Usage**:
```bash
t.sh                    # Interactive selection
t.sh /path/to/project   # Direct session creation
```

Bound to `<prefix>F` in tmux.

#### `scripts/reinstall-nvim.sh`

Interactive script to reinstall Neovim components:
- Option 1: Reinstall plugins only (lazy.nvim)
- Option 2: Reinstall PHP tools only (Mason)
- Option 3: Clean everything (plugins + tools + cache)

## Directory Structure

```
dotfiles/
??? install.sh              # Installation script
??? kitty/                  # Kitty terminal configuration
?   ??? kitty.conf          # Main configuration
?   ??? current-theme.conf  # Theme (Catppuccin Mocha)
??? nvim/                   # Neovim configuration
?   ??? init.lua            # Entry point
?   ??? lua/
?   ?   ??? core/           # Core NVChad functionality
?   ?   ??? custom/         # Custom configuration
?   ?   ?   ??? chadrc.lua  # Theme and basic settings
?   ?   ?   ??? configs/    # Language-specific configs
?   ?   ??? plugins/        # Plugin configurations
?   ??? snippets/           # Code snippets
??? tmux/                   # tmux configuration
?   ??? tmux.conf           # Main tmux config
??? scripts/                # Helper scripts
?   ??? t.sh                # Tmux session manager
?   ??? reinstall-nvim.sh   # Neovim reinstall script
??? phpactor/               # PHP language server (submodule/included)
```

## Customization

### Neovim

- **Theme**: Edit `nvim/lua/custom/chadrc.lua` - change `theme = 'catppuccin'`
- **Keybindings**: Edit `nvim/lua/core/mappings.lua`
- **PHP Settings**: Edit `nvim/lua/custom/configs/php.lua`
- **Plugins**: Add to `nvim/lua/custom/plugins/` or modify existing configs

### Kitty

- **Theme**: Replace `kitty/current-theme.conf` with your preferred theme
- **Font**: Edit `font_family` in `kitty/kitty.conf`

### tmux

- **Status Bar**: Edit the `status-left` and `status-right` options in `tmux/tmux.conf`
- **Keybindings**: Modify bind commands in the Key Bindings section

## Maintenance

### Updating Plugins

In Neovim:
```vim
:Lazy update
```

Or use the keybinding: `<leader>ru`

### Updating Neovim Configuration

After pulling changes:
```bash
# Reload Neovim config
<leader>rc
```

Or restart Neovim.

### Cleaning Up

To remove all Neovim data:
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

Then restart Neovim to reinstall everything.

## Troubleshooting

### Neovim

- **Plugins not loading**: Run `<leader>ri` to reinstall, or check `:Lazy` status
- **LSP not working**: Verify tools are installed via `:Mason`, check `:LspLog`
- **PHP-specific issues**: See [nvim/PHP_README.md](nvim/PHP_README.md)

### tmux

- **Keybindings not working**: Ensure config is reloaded with `<prefix>r`
- **Colors look wrong**: Verify terminal supports 256 colors and truecolor

### Kitty

- **Font not displaying**: Ensure JetBrains Mono Nerd Font is installed
- **Theme not applied**: Check that `current-theme.conf` exists and is valid

## License

This repository contains personal configuration files. Some components may have their own licenses:
- NVChad: GPL-3.0
- Various plugins: See respective repositories

## Credits

- [NVChad](https://nvchad.com/) - Neovim framework
- [Catppuccin](https://github.com/catppuccin) - Color scheme
- Inspiration from ThePrimeagen for the tmux session script

## Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome!
