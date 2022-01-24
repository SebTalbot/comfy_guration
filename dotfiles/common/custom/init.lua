-- This is an example init file , its supposed to be placed in /lua/custom/

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", "<C-w>c")
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
   use {
      "williamboman/nvim-lsp-installer",
   }

   use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   }
end)


local utils = require "core.utils"
local config = utils.load_config()
local maps = config.mappings

map("n", maps.test.wow, "<C-w>v")

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
