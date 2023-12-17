vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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


require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require'lspconfig'.clangd.setup{}
require('telekasten').setup({ home = vim.fn.expand("~/zettelkasten"), })
require('telescope').load_extension('media_files')

---- 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
