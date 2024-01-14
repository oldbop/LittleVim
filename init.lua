--[[
        LittleVim: Minimal single-file Neovim configuration.
        oldbop
--]]

-- Vim options
local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.number = true

-- Leader key
vim.g.mapleader = " "

-- lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugin installation
require("lazy").setup({

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end
  }
})



--[[
  {
    "neovim/nvim-lspconfig"
  }
--]]
