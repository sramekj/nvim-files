local M = {}

M.register_lsp_servers = function() 

-- RUST --
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

-- JAVA --
require'lspconfig'.java_language_server.setup{}

-- SCALA --
require'lspconfig'.metals.setup{}

-- ADD ANOTHER --
	
end


return M
