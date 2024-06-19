return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/noice.nvim' },
    config = function()
        local lualine = require 'lualine'
        local lazy_status = require 'lazy.status' -- to configure lazy pending updates count
        -- configure lualine
        lualine.setup {
            options = {
                theme = 'auto',
            },
            sections = {
                lualine_x = {
                    {
                        require('noice').api.status.mode.get,
                        cond = require('noice').api.status.mode.has,
                        color = { fg = '#ff9e64' },
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = '#ff9e64' },
                    },
                    { 'encoding' },
                    { 'fileformat' },
                    { 'filetype' },
                },
            },
        }
    end,
}
