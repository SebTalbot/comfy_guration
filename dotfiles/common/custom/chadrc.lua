-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyonight",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.mappings = {
  misc = {
    close_buffer = nil,
  },
  test = {
    wow = '<leader>x',
  }
}

return M
