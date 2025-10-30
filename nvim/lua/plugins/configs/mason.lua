local options = {
  ensure_installed = {
    -- LSP servers
    "lua-language-server",
    "intelephense", -- PHP LSP
    "typescript-language-server",
    "pyright",
    "gopls",
    
    -- PHP tools
    "php-debug-adapter", -- PHP debugging
    "phpcs", -- PHP CodeSniffer
    "phpstan", -- PHP static analysis
    "psalm", -- PHP static analysis
  }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
