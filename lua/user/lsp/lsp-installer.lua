local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

local servers = {
  'lua_ls',
  'asm_lsp',
  'jsonls',
  'clangd',
  'pyright',
  'rust_analyzer',
  'tsserver',
  'gopls',
  'golangci_lint_ls'
}


lsp_installer.setup({
  ensure_installed = servers, -- ensure these servers are always installed
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    },
    keymaps = {
      -- Keymap to expand a server in the UI
      toggle_server_expand = "<CR>",
      -- Keymap to install the server under the current cursor position
      install_server = "i",
      -- Keymap to reinstall/update the server under the current cursor position
      update_server = "u",
      -- Keymap to check for new version for the server under the current cursor position
      check_server_version = "c",
      -- Keymap to update all installed servers
      update_all_servers = "U",
      -- Keymap to check which installed servers are outdated
      check_outdated_servers = "C",
      -- Keymap to uninstall a server
      uninstall_server = "X",
    },
  }
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end
  if server == "clangd" then
    local clangd_opts = require("user.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end
  if server == "lua_ls" then
    local sumneko_opts = require("user.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  if server == "gopls" then
    local gopls_opts = require("user.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end
  if server == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end
  lspconfig[server].setup(opts)
end
