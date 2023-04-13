local M = {}

M.bind_neotree = {
  ["<leader>"] = {
    e = {
      name = "+tree", 
      e = { "<cmd>Neotree toggle<cr>", "toggle nvimtree" }, 
    },
  },
}

M.bind_telescope = {
  ["<leader>f"] = { name = "+file" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fg"] = { "<cmd>Telescope git_files<cr>", "Find Git File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<leader>b"] = { name = "+buffer" },
  ["<leader>bb"] = { "<cmd>Telescope buffers<cr>", "Open buffers" },
  ["<leader>ba"] = { "<cmd>badd unnamed<cr>", "Add buffer" },
  ["<leader>bd"] = { "<cmd>bd<cr>", "Delete buffer" },
  ["<leader>c"] = { name = "+code" },
  ["<leader>ca"] = { vim.lsp.buf.code_action, "Perform code action" },
  ["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", "Open diagnostics" },
  ["<leader>j"] = { "<cmd>Telescope jumplist<cr>", "Open jumplist" },
  ["<leader>k"] = { vim.lsp.buf.hover, "Show documentation" },
  ["<leader>s"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Open symbols" },
  ["<leader>S"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Open workspace symbols" },
  ["<leader>p"] = { '"+p', "Paste from clipboard" },
  ["<leader>r"] = { vim.lsp.buf.rename, "Rename symbol" },
  ["<leader>h"] = { "<cmd>Telescope lsp_references<cr>", "Symbol references" },
  ["<leader>t"] = { name = "+term" },
  ["<leader>tt"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal terminal" },
  ["<leader>tv"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical terminal" },
  ["<leader>w"] = { "<cmd>w<cr>", "Write" },
  ["<leader>q"] = { "<cmd>q<cr>", "Quit" },
  ["<leader>/"] = { "<cmd>Telescope live_grep<cr>", "Global search" },
  ["<leader>?"] = { "<cmd>Telescope commands<cr>", "List commands" },
  ["g"] = { name = "+goto" },
  ["gg"] = { "gg", "Goto file start" },
  ["ge"] = { "G", "Goto file end" },
  ["gh"] = { "0", "Goto line start" },
  ["gl"] = { "$", "Goto line end" },
  ["gs"] = { "^", "Goto first non-blank in line" },
  ["gd"] = { vim.lsp.buf.definition, "Goto definition" },
  ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
  ["gy"] = { vim.lsp.buf.type_definition, "Goto type definition" },
  ["gr"] = { vim.lsp.buf.references, "Goto references" },
  ["gi"] = { vim.lsp.buf.implementation, "Goto implementation" },
  ["gn"] = { "<cmd>bn<cr>", "Goto next buffer" },
  ["gp"] = { "<cmd>bp<cr>", "Goto previous buffer" },
  ["m"] = { name = "+match" },
  ["mm"] = { "%", "Goto matching bracket" },
  ["ma"] = { "viW", "Select around object" },
  ["mi"] = { "viw", "Select inside object" },
}

M.bind_surround = {
  ["ms"] = { name = "Surround add" },
  ["mr"] = { name = "Surround replace }" },
  ["md"] = { name = "Surround delete" },
}

M.bind_telescope_v = {
  ["<leader>y"] = { '"+y', "Copy to clipboard" },
  ["<leader>p"] = { '"+p', "Paste from clipboard" },
}

-- commenting: gcc/gbc - NORMAL line/block comment
--             gc/gb   - VISUAL line/block comment


return M
