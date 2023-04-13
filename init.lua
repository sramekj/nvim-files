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

