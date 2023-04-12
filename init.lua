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
wk.register(require("core.mappings").bind_escape_term, { mode = "t" })


