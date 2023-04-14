local M = {}

M.register_lsp_servers = function() 

  -- JAVA --
require'lspconfig'.java_language_server.setup{}

-- SCALA --
require'lspconfig'.metals.setup{}

-- ADD ANOTHER --
	
end


return M
