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

--[[
vim.g.coq_settings = {
  auto_start = "shut-up",
  clients = {
    lsp = {
      resolve_timeout = ?
    }
  },
  display = {
    pum = {
      fast_close = true | false
    }
  },
  limits = {
    completion_auto_timeout = ?
  }
}
--]]

-- Coq.nvim settings
vim.g.coq_settings = {
  auto_start = "shut-up",
  clients = {
    tmux = {
      enabled = false
    }
  }
}

-- Plugin installation
require("lazy").setup({

  {
    "neovim/nvim-lspconfig"
  },
  {
    "ms-jpq/coq_nvim",
    dependencies = {
      "ms-jpq/coq.artifacts"
    }
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
local lsp = require("lspconfig")
local coq = require("coq")

lsp.clangd.setup(coq.lsp_ensure_capabilities{})
