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

-- ADD ANOTHER --
	
end


return M