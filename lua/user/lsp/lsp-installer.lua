local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  flags = {
   debounce_text_changes = 150,
  }
}

lsp_installer.setup({
    ensure_installed = { "rust_analyzer", "sumneko_lua", "jsonls", "clangd", "gopls", "golangci_lint_ls" }, -- ensure these servers are always installed
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

for _, server in ipairs { "jsonls", "rust_analyzer", "sumneko_lua", "clangd", "gopls", "golangci_lint_ls" } do
  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end
  if server == "sumneko_lua" then
 	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  lspconfig[server].setup(opts)
end
