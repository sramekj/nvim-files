local M = {}

M.register_lsp_servers = function()

-- LUA --

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
settings = {
  Lua = {
    completion = {
      callSnippet = "Replace"
    }
  }
}
})

-- ADD ANOTHER --

end

return M
