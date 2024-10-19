--[[
        LittleVim: Minimal single-file Neovim configuration
        oldbop
--]]

-- Vim options
local set = vim.opt
set.autoindent = true
set.background = "dark"
set.clipboard = "unnamedplus"
set.expandtab = true
set.laststatus = 1
set.mouse = "a"
set.number = true
set.shiftwidth = 2
set.signcolumn = "number"
set.softtabstop = 2
set.tabstop = 2
set.termguicolors = true
set.wildoptions = "tagfile"

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggle-completion boolean
vim.g.togglecmp = true

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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "onsails/lspkind.nvim"
    }
  },
  {
    "tikhomirov/vim-glsl",
    lazy = false
  }
})

-- Set colorscheme
vim.cmd.colorscheme("novel")

-- Terminal mode autocmds
vim.api.nvim_create_augroup("term_mode", { clear = true })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = "term_mode",
  command = "setlocal nonumber norelativenumber"
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
  group = "term_mode",
  pattern = "term://*",
  command = "startinsert"
})

-- Keymaps
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, {})

vim.keymap.set("n", "<leader>t", ":bot 10sp +term<cr>", { silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>", { silent = true })

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

vim.keymap.set({ "i", "n" }, "<C-a>", function()
  vim.g.togglecmp = not vim.g.togglecmp
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.fn["vsnip#jumpable"](1) == 1 then
    return "<Plug>(vsnip-jump-next)"
  else
    return "<Tab>"
  end
end, { expr = true, remap = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  else
    return "<S-Tab>"
  end
end, { expr = true, remap = true })

-- Completion configuration
local kind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  enabled = function()
    return vim.g.togglecmp
  end,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "vsnip" }
    },
    {
      { name = "path" }
    },
    {
      { name = "buffer" }
    }
  ),
  formatting = {
    format = kind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = '...'
    })
  }
})

-- LSP configuration
vim.diagnostic.config({ virtual_text = false })

vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities
    }
  end,
  ["clangd"] = function()
    require("lspconfig").clangd.setup {
      capabilities = capabilities,
      cmd = { "clangd", "--header-insertion=never" }
    }
  end
}
