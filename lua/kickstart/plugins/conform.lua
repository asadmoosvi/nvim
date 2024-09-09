return {
    { -- Autoformat
        'stevearc/conform.nvim',
        lazy = false,
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format { async = true, lsp_fallback = true }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = false, cpp = false, sql = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                -- Conform can also run multiple formatters sequentially
                python = { 'isort', 'black' },
                markdown = { 'prettier' },
                yaml = { 'yamlfmt' },
                json = { 'prettier' },
                sh = { 'shfmt' },
                html = { 'prettier' },
                htmldjango = { 'djlint' },
                css = { 'prettier' },
                -- You can use a sub-list to tell conform to run *until* a formatter
                -- is found.
                -- javascript = { { "prettierd", "prettier" } },
            },
            formatters = {
                -- # Example of using shfmt with extra args
                shfmt = {
                    prepend_args = { '-i', '4' },
                },
                prettier = {
                    prepend_args = { '--tab-width', '4' },
                },
                yamlfmt = {
                    prepend_args = { '-formatter', 'indent=4', '-formatter', 'retain_line_breaks_single=true' },
                },
            },
        },
    },
}
