return {
    'NvChad/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup {
            filetypes = { 'html', 'css', 'javascript' },
        }
    end,
}