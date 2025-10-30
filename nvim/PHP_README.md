# Neovim/NVChad Configuration for PHP Development

This configuration is optimized for PHP development with the following features:

## Features

### LSP (Language Server Protocol)
- **Intelephense**: Full-featured PHP language server with:
  - Autocompletion
  - Go to definition/implementation
  - Hover documentation
  - Code actions
  - Formatting support
  - Comprehensive PHP stubs (all standard extensions)

### Treesitter
- PHP syntax highlighting
- Improved code navigation
- Better code folding

### Mason Tools
The following PHP tools are automatically installed:
- `intelephense` - PHP LSP server
- `php-debug-adapter` - PHP debugging support
- `phpcs` - PHP CodeSniffer for code quality
- `phpstan` - PHP static analysis tool
- `psalm` - Another PHP static analysis tool

### Snippets
Comprehensive PHP snippets including:
- Method definitions (public/protected/private)
- Class/Interface/Trait/Enum definitions
- PHPDoc blocks
- Common PHP patterns (if/else, foreach, try/catch, etc.)
- Laravel-specific snippets
- PHPUnit test snippets

### PHP-Specific Settings
- **Tab size**: 4 spaces (PSR-12 standard)
- **Line length**: 120 characters (color column indicator)
- **Format on save**: Enabled for PHP files
- **Auto-completion**: Enhanced with namespace support

### Keybindings

#### PHP-Specific Commands
- `<leader>ps` - PHP syntax check (`php -l`)
- `<leader>pd` - Generate PHPDoc block
- `<leader>pt` - Run PHPUnit tests
- `<leader>pf` - Run PHPUnit on current file

#### Maintenance Commands
- `<leader>ri` - Reinstall all plugins (cleans cache and reinstalls)
- `<leader>rc` - Clean lazy.nvim cache (requires restart)
- `<leader>ru` - Update all plugins
- `<leader>rp` - Open Mason UI (to reinstall PHP tools)
- `<leader>rm` - Install all Mason tools

#### LSP Commands (available for all languages)
- `gd` - Go to definition
- `gi` - Go to implementation
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>ra` - Rename symbol
- `gr` - Show references
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>fm` - Format code

## Installation

After cloning this dotfiles repository:

1. Run `install.sh` to symlink the configuration
2. Open Neovim - plugins will be automatically installed via lazy.nvim
3. Run `:Mason` to verify PHP tools are installed
4. Run `:MasonInstallAll` to install all configured tools

## Forcing Reinstallation

### Reinstall All Plugins

**Option 1: Using keybinding (recommended)**
1. Press `<leader>ri` (default: `<Space>ri`)
2. This will clean the cache and reinstall all plugins

**Option 2: Using commands**
```vim
:Lazy clean
:Lazy install
```

**Option 3: Manual (complete reset)**
```bash
# Close Neovim first, then:
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/plugin
# Restart Neovim - plugins will auto-install
```

### Reinstall PHP Tools (Mason)

**Option 1: Using keybinding**
1. Press `<leader>rp` (default: `<Space>rp`) to open Mason UI
2. Navigate to PHP tools (intelephense, php-debug-adapter, etc.)
3. Press `X` to uninstall, then `i` to install

**Option 2: Using commands**
```vim
:Mason                  " Open Mason UI
:MasonInstallAll        " Install all configured tools
:MasonUninstall <name>  " Uninstall specific tool
:MasonInstall <name>    " Install specific tool
```

**Option 3: Manual (complete reset)**
```bash
# Close Neovim first, then:
rm -rf ~/.local/share/nvim/mason
# Restart Neovim and run :MasonInstallAll
```

### Reinstall Everything

For a complete clean reinstall:

```bash
# Close Neovim first
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/plugin
rm -rf ~/.local/share/nvim/mason
rm -rf ~/.cache/nvim
# Restart Neovim - everything will reinstall automatically
```

## Configuration Files

- `lua/plugins/configs/lspconfig.lua` - LSP server configurations
- `lua/plugins/configs/mason.lua` - Mason tool installations
- `lua/plugins/configs/treesitter.lua` - Treesitter language support
- `lua/custom/configs/php.lua` - PHP-specific settings and autocmds
- `lua/core/mappings.lua` - Keybindings including PHP mappings
- `snippets/php.snippets` - PHP code snippets

## Customization

You can customize PHP settings by editing `lua/custom/configs/php.lua`. For example:
- Change tab size
- Adjust color column position
- Add additional filetype-specific settings

## Troubleshooting

### Intelephense not working
1. Check if Intelephense is installed: `:Mason`
2. Ensure PHP is in your PATH
3. Check LSP logs: `:LspLog`
4. Reinstall: `<leader>rp` then uninstall/reinstall intelephense

### Plugins not loading
1. Check plugin status: `:Lazy`
2. Clean and reinstall: `<leader>ri`
3. Check for errors: `:messages`

### Snippets not working
1. Ensure LuaSnip is installed (should be automatic)
2. Check snippet path in `lua/core/init.lua`: `g.snipmate_snippet_path`
3. Verify `snippets/php.snippets` exists
4. Reinstall plugins: `<leader>ri`

### Format on save not working
1. Ensure Intelephense has format enabled (default: enabled)
2. Check `lua/plugins/configs/lspconfig.lua` - format on save is configured for PHP files
3. Verify Intelephense is running: `:LspInfo`
