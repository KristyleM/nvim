return {
    on_setup = function(server)
        local lspconfig = require('lspconfig')
        local util = require('lspconfig/util')

        lspconfig.gopls.setup({
            cmd = { 'gopls', 'serve' },
            filetypes = { 'go', 'gomod' },
            root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
            on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false

                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                require('keybindings').mapLSP(buf_set_keymap)
                vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
            end,
        })
        --     require('lspconfig').gopls.setup({})
        --     server:attach_buffers(opts)
    end,
}
