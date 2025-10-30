local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Default on_attach function
local on_attach = function(client, bufnr)
  -- Enable format on save for certain file types
  local filetypes = { "php", "javascript", "typescript", "lua", "python", "go" }
  local ft = vim.bo[bufnr].filetype
  if vim.tbl_contains(filetypes, ft) then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- Use the new vim.lsp.config API for Neovim 0.11+
-- Syntax: vim.lsp.config(name, config_table)
-- Lua
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
})

-- PHP - Intelephense (best PHP LSP)
vim.lsp.config("intelephense", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php", "phtml" },
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000,
      },
      environment = {
        phpVersion = "8.2",
      },
      diagnostics = {
        enabled = true,
        run = "onType",
        undefinedTypes = true,
        undefinedFunctions = true,
        undefinedConstants = true,
        undefinedClassConstants = true,
        undefinedMethods = true,
        undefinedProperties = true,
        undefinedVariables = true,
      },
      format = {
        enable = true,
      },
      completion = {
        insertUseDeclaration = true,
        fullyQualifyGlobalConstantsAndFunctions = false,
        triggerParameterHints = true,
        maxItems = 100,
      },
      stubs = {
        "apache",
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "ctype",
        "curl",
        "date",
        "dba",
        "dom",
        "enchant",
        "exif",
        "FFI",
        "fileinfo",
        "filter",
        "fpm",
        "ftp",
        "gd",
        "gettext",
        "gmp",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "meta",
        "mysqli",
        "oci8",
        "odbc",
        "openssl",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_ibm",
        "pdo_mysql",
        "pdo_pgsql",
        "pdo_sqlite",
        "pgsql",
        "Phar",
        "posix",
        "pspell",
        "random",
        "readline",
        "Reflection",
        "session",
        "shmop",
        "SimpleXML",
        "snmp",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "sqlite3",
        "standard",
        "superglobals",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tidy",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlrpc",
        "xmlwriter",
        "xsl",
        "Zend OPcache",
        "zip",
        "zlib",
      },
    },
  },
})

-- TypeScript/JavaScript (use ts_ls instead of deprecated tsserver)
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Python
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Go
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Diagnostics configuration
vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

