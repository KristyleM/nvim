local status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status then
    vim.notify('没有找到 mason-lspconfig')
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        'sumneko_lua',
        'rust_analyzer',
        'pyright',
        'gopls',
        'html',
        'cssls',
        'ement_ls',
        'jsonls',
        'tsserver',
        'codelldb',
        'sqlls',
    },
})
