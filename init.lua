--[[
        LittleVim: Minimal single-file Neovim configuration
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

-- Disable netrw, neo-tree is used instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
      "hrsh7th/vim-vsnip"
    }
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },
  {
    "akinsho/bufferline.nvim",
    config = true,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "float" }
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  }
})

-- Set colorscheme
vim.cmd.colorscheme("moonfly")

-- Keymaps
vim.keymap.set("n", "<leader>n", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<leader>c", ":bd<cr>", { silent = true })
vim.keymap.set("n", "<leader>s", ":wa<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>", { silent = true })

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})

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
local cmp = require("cmp")

cmp.setup({
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
  )
})

-- LSP configuration
vim.diagnostic.config({ virtual_text = false })

vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
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
  end
}
