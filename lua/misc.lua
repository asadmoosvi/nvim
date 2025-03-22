-- Set indentation settings for YAML files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'yaml',
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = true
        vim.opt_local.autoindent = true
    end,
})

-- Set filetype to htmldjango if the html file is inside a templates directory.
-- This is usually the case for flask where templates are stored in the
-- templates directory. Filetype of htmldjango allows for additional completion
-- that is not available with just vanilla html files.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*/templates/*.html',
    callback = function()
        vim.bo.filetype = 'htmldjango'
    end,
})

-- Remove CSS auto formatting comments
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'css',
    command = 'setlocal formatoptions-=cro',
})
