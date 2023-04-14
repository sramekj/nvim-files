vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.expandtab = true

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so mappings are correct

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.keymap.set('i', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.keymap.set('i', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.keymap.set('i', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.keymap.set('i', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<d-l>', '<C-w>l', { noremap = true })

function delete_surround()
  local input = vim.fn.input("Surrounding character to delete: ")
  if input ~= "" then
    vim.cmd("normal ds" .. input)
  end
end

function add_surround()
  local input = vim.fn.input("Surrounding character to add: ")
  if input ~= "" then
    vim.cmd("normal ysiw" .. input)
  end
end

function replace_surround()
  local input1 = vim.fn.input("Surrounding character to replace: ")
  if input1 ~= "" then
    local input2 = vim.fn.input("Enter new surrounding character: ")
      if input2 ~= "" then
        vim.cmd("normal cs" .. input1 .. input2)
      end
  end
end

vim.keymap.set('n', 'ms', '<cmd>lua add_surround()<cr>', { noremap = true })
vim.keymap.set('n', 'mr', '<cmd>lua replace_surround()<cr>', { noremap = true })
vim.keymap.set('n', 'md', '<cmd>lua delete_surround()<cr>', { noremap = true })
-- LAZY SETUP --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")

require "plugins"


-- WHICH KEY SETUP --

local wk = require("which-key")
wk.register(require("core.mappings").bind_neotree)
wk.register(require("core.mappings").bind_telescope)
wk.register(require("core.mappings").bind_telescope_v, { mode = "v" })
wk.register(require("core.mappings").bind_surround)

-- RUST SETUP --
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- SCALA SETUP --

local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.init_options.statusBarProvider = "on"

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
