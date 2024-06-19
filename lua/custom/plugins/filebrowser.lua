return {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            extensions = {
                file_browser = {
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    auto_depth = true,
                    hide_parent_dir = true,
                },
            },
        }
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        require('telescope').load_extension 'file_browser'
        -- open file_browser with the path of the current buffer
        vim.keymap.set('n', '<leader>sb', '<cmd>silent! Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[S]earch File [B]rowser' })
    end,
}
