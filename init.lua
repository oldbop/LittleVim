--[[
        LittleVim: Minimal single-file Neovim configuration.
        oldbop
--]]

-- Vim options
local set = vim.opt
set.autoindent = true
set.clipboard = "unnamedplus"
set.expandtab = true
set.mouse = "a"
set.number = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Plugin installation
require("lazy").setup({

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim"
    }
  },
  {
    "ms-jpq/coq_nvim"
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  }
})

-- Set colorscheme
vim.cmd.colorscheme("moonfly")

-- Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- LSP configuration
vim.g.coq_settings = { clients = { lsp = { resolve_timeout = 0.1 }}}
local coq = require("coq")

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities{})
  end
}

vim.cmd("COQnow -s")
